package com.omers.dms.template.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.omers.dms.template.model.dto.TemplateDto;
import com.omers.dms.template.model.entity.TemplateEntity;
import com.omers.dms.template.model.entity.TemplateHistoryEntity;
import com.omers.dms.template.model.enums.TemplateType;
import com.omers.dms.template.repository.TemplateHistoryRepository;
import com.omers.dms.template.repository.TemplateRepository;
import com.omers.web.core.model.UserInfo;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.ArrayList;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

@SpringBootTest
class TemplateServiceTest {

    @MockBean
    TemplateRepository repository;
    @MockBean
    TemplateHistoryRepository historyRepository;
    @MockBean
    Authentication authentication;
    @MockBean
    SecurityContext securityContext;
    @Autowired
    TemplateService templateService;
    @Autowired
    ObjectMapper objectMapper;

    @BeforeEach
    void init() {
        Mockito.when(securityContext.getAuthentication()).thenReturn(authentication);
        SecurityContextHolder.setContext(securityContext);
        UserInfo userInfo = new UserInfo();
        userInfo.setName("Diego");
        Mockito.when(authentication.getDetails()).thenReturn(userInfo);
    }

    @Test
    void should_create_template_from_input() {
        when(repository.save(any())).thenReturn(null);
        when(historyRepository.save(any())).thenReturn(null);
        String templateInfo = "{\"approvedBy\": \"Mr Man\",\n" +
                              "  \"isActive\": true,\n" +
                              "  \"processId\": \"DMS-P\",\n" +
                              "  \"templateFields\": [\n" +
                              "    {\n" +
                              "      \"defaultValue\": \"123\",\n" +
                              "      \"fieldName\": \"Name\",\n" +
                              "      \"fieldType\": \"TEXT\",\n" +
                              "      \"isRequired\": true\n" +
                              "    }\n" +
                              "  ],\n" +
                              "  \"templateName\": \"WelcomeLetter\",\n" +
                              "  \"templateType\": \"DOCX\",\n" +
                              "  \"version\": 1\n" +
                              "}";

        TemplateEntity templateEntity = templateService.saveTemplate(new byte[20], templateInfo);

        assertEquals("Mr Man", templateEntity.getApprovedBy());
        assertEquals("DMS-P", templateEntity.getProcessId());
        assertEquals(1, templateEntity.getTemplateFields().size());
        assertEquals("Name", templateEntity.getTemplateFields().get(0).getFieldName());
        assertEquals("WelcomeLetter", templateEntity.getTemplateName());
        assertEquals(TemplateType.DOCX, templateEntity.getTemplateType());
    }

    @Test
    void should_update_template() {
        var templateId = UUID.randomUUID();
        when(repository.save(any())).thenReturn(null);
        when(historyRepository.save(any())).thenReturn(null);
        when(repository.findById(templateId)).thenReturn(Optional.of(TemplateEntity.builder()
                                                                                    .templateId(templateId)
                                                                                    .templateData(new byte[20])
                                                                                    .templateType(TemplateType.HTML)
                                                                                    .templateFields(new ArrayList<>())
                                                                                    .templateName("Test Template")
                                                                                    .isActive(true)
                                                                                    .processId("Test Process")
                                                                                    .version(1)
                                                                                    .build()));

        String templateInfo = "{\"approvedBy\": \"Mr Man\",\n" +
                              "  \"isActive\": true,\n" +
                              "  \"processId\": \"DMS-P\",\n" +
                              "  \"templateFields\": [\n" +
                              "    {\n" +
                              "      \"defaultValue\": \"123\",\n" +
                              "      \"fieldName\": \"Name\",\n" +
                              "      \"fieldType\": \"TEXT\",\n" +
                              "      \"isRequired\": true\n" +
                              "    }\n" +
                              "  ],\n" +
                              "  \"templateName\": \"WelcomeLetter\",\n" +
                              "  \"templateType\": \"DOCX\",\n" +
                              "  \"version\": 1\n" +
                              "}";

        TemplateEntity templateEntity = templateService.updateTemplate(templateId, new byte[20], templateInfo);

        assertEquals("Mr Man", templateEntity.getApprovedBy());
        assertTrue(templateEntity.getIsActive());
        assertEquals("DMS-P", templateEntity.getProcessId());
        assertEquals(1, templateEntity.getTemplateFields().size());
        assertEquals("Name", templateEntity.getTemplateFields().get(0).getFieldName());
        assertEquals("WelcomeLetter", templateEntity.getTemplateName());
        assertEquals(TemplateType.DOCX, templateEntity.getTemplateType());
        assertEquals(2, templateEntity.getVersion());
    }

    @Test
    void should_get_template_by_id() {
        var templateId = UUID.randomUUID();
        when(repository.findById(templateId)).thenReturn(Optional.of(TemplateEntity.builder()
                                                                                   .templateId(templateId)
                                                                                   .templateData(new byte[20])
                                                                                   .templateType(TemplateType.HTML)
                                                                                   .templateFields(new ArrayList<>())
                                                                                   .templateName("Test Template")
                                                                                   .isActive(true)
                                                                                   .processId("Test Process")
                                                                                   .version(1)
                                                                                   .build()));
        Optional<TemplateDto> template = templateService.getTemplateById(templateId);
        assertTrue(template.isPresent());
        assertEquals(templateId, template.get().getTemplateId());
    }

    @Test
    void should_get_template_by_id_and_version() {
        var templateId = UUID.randomUUID();
        when(historyRepository.findByTemplateIdAndVersion(any(), any())).thenReturn(Optional.of(TemplateHistoryEntity
                .builder()
                .templateId(templateId)
                .templateData(new byte[20])
                .templateType(TemplateType.HTML)
                .templateFields(new ArrayList<>())
                .templateName("Test Template")
                .isActive(true)
                .processId("Test Process")
                .version(1)
                .build()));
        Optional<TemplateDto> template = templateService.getTemplateHistoryByTemplateIdAndVersion(templateId, 1);
        assertTrue(template.isPresent());
        assertEquals(templateId, template.get().getTemplateId());
    }
}
