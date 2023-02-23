package com.omers.dms.template.web;

import com.omers.dms.template.exception.NoSuchTemplateException;
import com.omers.dms.template.model.dto.TemplateAuditSearchModel;
import com.omers.dms.template.model.dto.TemplateDto;
import com.omers.dms.template.model.dto.TemplateSearchModel;
import com.omers.dms.template.model.entity.TemplateAuditView;
import com.omers.dms.template.model.enums.TemplateType;
import com.omers.dms.template.service.TemplateService;
import com.omers.dms.template.service.ValidationService;
import com.omers.donna.web.response.ClientResponse;
import com.omers.donna.web.response.ResultError;
import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Locale;
import java.util.Optional;
import java.util.UUID;

@RestController
@RequestMapping("/v1/template")
@RequiredArgsConstructor
public class TemplateController {
    private final TemplateService templateService;
    private final ValidationService validationService;

    @PostMapping(consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
	@Operation(summary = "Create template")
	public ResponseEntity<String> createTemplate(@RequestPart("file") MultipartFile file,
                                                 @RequestPart String templateJsonString) throws IOException {

        validationService.validateTemplate(file.getBytes(), templateJsonString);
        var template = templateService.saveTemplate(file.getBytes(), templateJsonString);
        return ResponseEntity.status(HttpStatus.CREATED).body("Template Saved Successfully! with id:" + template.getTemplateId());
	}

    @PutMapping(value = "/{templateId}", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE })
    @Operation(summary = "Update template")
    public ResponseEntity<String> updateTemplate(@RequestPart("file") MultipartFile file,
                                                 @RequestPart String templateJsonString, @PathVariable UUID templateId) throws IOException {

        validationService.validateTemplate(file.getBytes(), templateJsonString);
        var template = templateService.updateTemplate(templateId, file.getBytes(), templateJsonString);
        return ResponseEntity.status(HttpStatus.CREATED).body("Template Updated Successfully! for id:" + template.getTemplateId());
    }

    @GetMapping("/{templateId}")
    @Operation(summary = "Get template information by template id and version")
    public ResponseEntity<ClientResponse<TemplateDto>> getTemplateInformationByIdAndVersion(@PathVariable UUID templateId, Integer version) {

        final ClientResponse.ClientResponseBuilder<TemplateDto> builder = ClientResponse.builder();
        Optional<TemplateDto> templateInfo = version != null ?
                                             templateService.getTemplateHistoryByTemplateIdAndVersion(templateId, version) :
                                             templateService.getTemplateById(templateId);

        return templateInfo
                .map(template -> ResponseEntity
                        .status(HttpStatus.OK)
                        .body(builder.result(it -> it.data(template).success(true)).build())
                ).orElseGet(() -> ResponseEntity
                        .status(HttpStatus.NOT_FOUND)
                        .body(null)
                );
    }

    @GetMapping("/list")
    @Operation(summary = "Retrieves all templates metadata by filter")
    public ResponseEntity<ClientResponse<Page<TemplateDto>>> listProcesses(
            TemplateSearchModel searchModel, @PageableDefault(size = 20) Pageable pageable
    ) {
        final ClientResponse.ClientResponseBuilder<Page<TemplateDto>> builder = ClientResponse
                .<Page<TemplateDto>>builder()
                .requestId(UUID.randomUUID().toString());

        Page<TemplateDto> templates = templateService.getTemplatesByFilter(searchModel, pageable);
        if (templates == null || templates.isEmpty()) {
            return ResponseEntity
                    .status(HttpStatus.OK)
                    .body(builder.errors(ResultError.of(
                            "No templates found", "", ""))
                                 .build());
        }

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(builder.result(it -> it.data(templates).success(true)).build());
    }

    @GetMapping("/audit")
    @Operation(summary = "Retrieves all templates audit records by filter")
    public ResponseEntity<ClientResponse<Page<TemplateAuditView>>> listProcesses(
            TemplateAuditSearchModel searchModel, @PageableDefault(size = 20) Pageable pageable
    ) {
        final ClientResponse.ClientResponseBuilder<Page<TemplateAuditView>> builder = ClientResponse
                .<Page<TemplateAuditView>>builder()
                .requestId(UUID.randomUUID().toString());

        Page<TemplateAuditView> templates = templateService.getTemplateAuditByFilter(searchModel, pageable);
        if (templates == null || templates.isEmpty()) {
            return ResponseEntity
                    .status(HttpStatus.OK)
                    .body(builder.errors(ResultError.of(
                            "No templates found", "", ""))
                                 .build());
        }

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(builder.result(it -> it.data(templates).success(true)).build());
    }

    @GetMapping("/file/{templateId}")
    public ResponseEntity<byte[]> getTemplateFile(@PathVariable("templateId") UUID templateId)
    {
        TemplateDto template = templateService.getTemplateById(templateId).orElseThrow(NoSuchTemplateException::new);
        var headers = new HttpHeaders();

        var mediaType = TemplateType.DOCX == template.getTemplateType() ?
                          "application/vnd.openxmlformats-officedocument.wordprocessingml.document" :
                          MediaType.TEXT_HTML_VALUE;
        headers.set("Content-Type", mediaType);

        var fileName = template.getTemplateName() + "." + template.getTemplateType().name().toLowerCase(Locale.ROOT);
        headers.setContentDispositionFormData(fileName, fileName);
        headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");

        return new ResponseEntity<>(template.getTemplateData(), headers, HttpStatus.OK);
    }

}
