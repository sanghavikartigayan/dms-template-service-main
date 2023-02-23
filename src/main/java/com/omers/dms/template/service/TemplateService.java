package com.omers.dms.template.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.omers.dms.template.exception.DataFormatException;
import com.omers.dms.template.exception.NoSuchTemplateException;
import com.omers.dms.template.model.dto.TemplateAuditSearchModel;
import com.omers.dms.template.model.dto.TemplateDto;
import com.omers.dms.template.model.dto.TemplateSearchModel;
import com.omers.dms.template.model.entity.*;
import com.omers.dms.template.repository.TemplateAuditViewRepository;
import com.omers.dms.template.repository.TemplateHistoryRepository;
import com.omers.dms.template.repository.TemplateRepository;
import com.omers.web.core.util.WebSecurityUtil;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.OffsetDateTime;
import java.util.Arrays;
import java.util.Objects;
import java.util.Optional;
import java.util.UUID;


@Service
@AllArgsConstructor
@Transactional
public class TemplateService {

    private final TemplateRepository repository;
    private final TemplateHistoryRepository templateHistoryRepository;
    private final TemplateAuditViewRepository auditViewRepository;
    private final TemplateDataFilter templateDataFilter;
    private final TemplateAuditDataFilter templateAuditFilter;
    private final ObjectMapper objectMapper;
    private final TemplateMapper templateMapper;
    private final TemplateHistoryMapper templateHistoryMapper;

    public TemplateEntity saveTemplate(byte[] file, String templateJsonString) {


        TemplateDto templateInfo;
        try {
            templateInfo = objectMapper.readValue(templateJsonString, TemplateDto.class);
        } catch (JsonProcessingException e) {
            throw new DataFormatException("Template Info Data is invalid!");
        }
        var token = WebSecurityUtil.fetchUserInfoFromSecurityContext().orElseThrow();
        var template = TemplateEntity.builder()
                                     .templateId(UUID.randomUUID())
                                     .processId(templateInfo.getProcessId())
                                     .templateName(templateInfo.getTemplateName())
                                     .templateType(templateInfo.getTemplateType())
                                     .approvedBy(templateInfo.getApprovedBy())
                                     .templateData(file)
                                     .templateFields(templateInfo.getTemplateFields())
                                     .modifiedBy(token.getName())
                                     .modifiedOn(OffsetDateTime.now())
                                     .createdBy(token.getName())
                                     .createdOn(OffsetDateTime.now())
                                     .version(1)
                                     .isActive(true)
                                     .build();
        repository.save(template);
        templateHistoryRepository.save(TemplateHistoryEntity.of(template));
        return template;
    }

    public TemplateEntity updateTemplate(UUID templateId, byte[] file, String templateJsonString) {


        TemplateDto templateInfo;
        try {
            templateInfo = objectMapper.readValue(templateJsonString, TemplateDto.class);
        } catch (JsonProcessingException e) {
            throw new DataFormatException("Template Info Data is invalid!");
        }
        var token = WebSecurityUtil.fetchUserInfoFromSecurityContext().orElseThrow();
        var templateEntity = repository.findById(templateId).orElseThrow(NoSuchTemplateException::new);
        templateEntity.setProcessId(templateInfo.getProcessId());
        templateEntity.setTemplateName(templateInfo.getTemplateName());
        templateEntity.setTemplateType(templateInfo.getTemplateType());
        templateEntity.setApprovedBy(templateInfo.getApprovedBy());
        templateEntity.setTemplateData(file);
        templateEntity.setTemplateFields(templateInfo.getTemplateFields());
        templateEntity.setIsActive(templateInfo.getIsActive());
        templateEntity.setModifiedBy(token.getName());
        templateEntity.setCreatedBy(token.getName());
        templateEntity.setModifiedOn(OffsetDateTime.now());
        templateEntity.setVersion(templateEntity.getVersion() + 1);
        repository.save(templateEntity);
        templateHistoryRepository.save(TemplateHistoryEntity.of(templateEntity));
        return templateEntity;
    }

    public Optional<TemplateDto> getTemplateById(UUID templateId) {
        return repository.findById(templateId).map(templateMapper::toDTO);
    }

    public Optional<TemplateDto> getTemplateHistoryByTemplateIdAndVersion(UUID templateId, int version) {
        return templateHistoryRepository.findByTemplateIdAndVersion(templateId, version)
                                        .map(templateHistoryMapper::toDTO);
    }

    public Page<TemplateDto> getTemplatesByFilter(TemplateSearchModel searchModel,
                                                  Pageable pageable) {
        var specifications = Arrays.asList(
                templateDataFilter.templateIdFilter(searchModel.getTemplateId()),
                templateDataFilter.processIdFilter(searchModel.getProcessId()),
                templateDataFilter.templateTypeFilter(searchModel.getTemplateType()),
                templateDataFilter.activeFilter(searchModel.getIsActive()),
                templateDataFilter.templateNameFilter(searchModel.getTemplateName())
        );

        return specifications.stream()
                             .filter(Objects::nonNull)
                             .reduce(Specification::and)
                             .map(
                                     specification -> repository.findAll(Specification.where(specification), pageable)
                             ).orElseGet(() -> repository.findAll(pageable))
                             .map(entity -> {
                                 var dto = templateMapper.toDTO(entity);
                                 dto.setTemplateData(null);
                                 return dto;
                             });
    }

    public Page<TemplateAuditView> getTemplateAuditByFilter(TemplateAuditSearchModel searchModel,
                                                            Pageable pageable) {
        var specifications = Arrays.asList(
                templateAuditFilter.templateIdFilter(searchModel.getTemplateId()),
                templateAuditFilter.processIdFilter(searchModel.getProcessId()),
                templateAuditFilter.templateTypeFilter(searchModel.getTemplateType()),
                templateAuditFilter.activeFilter(searchModel.getIsActive()),
                templateAuditFilter.versionFilter(searchModel.getVersion())
        );

        return specifications.stream()
                             .filter(Objects::nonNull)
                             .reduce(Specification::and)
                             .map(
                                     specification -> auditViewRepository.findAll(Specification.where(specification), pageable)
                             ).orElseGet(() -> auditViewRepository.findAll(pageable));
    }

}

