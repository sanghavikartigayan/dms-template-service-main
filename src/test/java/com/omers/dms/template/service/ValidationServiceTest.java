package com.omers.dms.template.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.omers.dms.template.exception.DataFormatException;
import com.omers.dms.template.exception.InvalidTemplateException;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.util.StreamUtils;

import java.io.IOException;
import java.io.InputStream;

@SpringBootTest
class ValidationServiceTest {
    @Autowired
    DataService dataService;
    @Autowired
    ObjectMapper objectMapper;
    @Autowired
    ValidationService validationService;

    @Test
    void should_fail_on_bad_template_type() {
        String templateInfo = "{\"approvedBy\": \"Anton\",\n" +
                              "  \"isActive\": true,\n" +
                              "  \"processId\": \"DMS-P\",\n" +
                              "  \"templateFields\": [{\n" +
                              "      \"defaultValue\": \"123\",\n" +
                              "      \"fieldName\": \"anton\",\n" +
                              "      \"fieldType\": \"STRING\",\n" +
                              "      \"isRequired\": true\n" +
                              "    }],\n" +
                              "  \"templateName\": \"WelcomeLetter\",\n" +
                              "  \"templateType\": \"XXX\"\n" +
                              "}";

        Assert.assertThrows(DataFormatException.class, () -> validationService.validateTemplate(new byte[20], templateInfo));
    }

    @Test
    void should_validate_html_template() throws IOException {
        String templateInfo = "{\"approvedBy\": \"Anton\",\n" +
                              "  \"isActive\": true,\n" +
                              "  \"processId\": \"DMS-P\",\n" +
                              "  \"templateFields\": [{\n" +
                              "      \"defaultValue\": \"123\",\n" +
                              "      \"fieldName\": \"user\",\n" +
                              "      \"fieldType\": \"STRING\",\n" +
                              "      \"isRequired\": true\n" +
                              "    }],\n" +
                              "  \"templateName\": \"WelcomeLetter\",\n" +
                              "  \"templateType\": \"HTML\"\n" +
                              "}";

        try (InputStream stream = ValidationServiceTest.class.getResourceAsStream("/templates/basic.ftl")) {
            validationService.validateTemplate(StreamUtils.copyToByteArray(stream), templateInfo);
        }
    }

    @Test
    void should_validate_docx_template() throws IOException {
        String templateInfo = "{\"approvedBy\": \"Anton\",\n" +
                              "  \"isActive\": true,\n" +
                              "  \"processId\": \"DMS-P\",\n" +
                              "  \"templateFields\": [{\n" +
                              "      \"defaultValue\": \"123\",\n" +
                              "      \"fieldName\": \"user\",\n" +
                              "      \"fieldType\": \"STRING\",\n" +
                              "      \"isRequired\": true\n" +
                              "    }],\n" +
                              "  \"templateName\": \"WelcomeLetter\",\n" +
                              "  \"templateType\": \"DOCX\"\n" +
                              "}";

        try (InputStream stream = ValidationServiceTest.class.getResourceAsStream("/templates/coverLetterTemplate.docx")) {
            validationService.validateTemplate(StreamUtils.copyToByteArray(stream), templateInfo);
        }
    }

    @Test
    void should_fail_on_bad_docx_template() throws IOException {
        String templateInfo = "{\"approvedBy\": \"Anton\",\n" +
                              "  \"isActive\": true,\n" +
                              "  \"processId\": \"DMS-P\",\n" +
                              "  \"templateFields\": [{\n" +
                              "      \"defaultValue\": \"123\",\n" +
                              "      \"fieldName\": \"user\",\n" +
                              "      \"fieldType\": \"STRING\",\n" +
                              "      \"isRequired\": true\n" +
                              "    }],\n" +
                              "  \"templateName\": \"WelcomeLetter\",\n" +
                              "  \"templateType\": \"DOCX\"\n" +
                              "}";

        try (InputStream stream = ValidationServiceTest.class.getResourceAsStream("/templates/basic.ftl")) {
            var file = StreamUtils.copyToByteArray(stream);
            Assert.assertThrows(InvalidTemplateException.class, () ->
                    validationService.validateTemplate(file, templateInfo));
        }
    }


    @Test
    void should_fail_on_missing_template_info() throws IOException {
        String templateInfo = "{\"approvedBy\": \"Anton\",\n" +
                              "  \"isActive\": true,\n" +
                              "  \"processId\": \"DMS-P\",\n" +
                              "  \"templateFields\": [{\n" +
                              "      \"defaultValue\": \"123\",\n" +
                              "      \"fieldName\": \"user\",\n" +
                              "      \"fieldType\": \"STRING\",\n" +
                              "      \"isRequired\": true\n" +
                              "    }],\n" +
                              "}";

        try (InputStream stream = ValidationServiceTest.class.getResourceAsStream("/templates/coverLetterTemplate.docx")) {
            var file = StreamUtils.copyToByteArray(stream);
            Assert.assertThrows(DataFormatException.class, () ->
                    validationService.validateTemplate(file, templateInfo));
        }
    }


    @Test
    void should_fail_on_required_fields() {
        Authentication authentication = Mockito.mock(Authentication.class);
        SecurityContext securityContext = Mockito.mock(SecurityContext.class);
        Mockito.when(securityContext.getAuthentication()).thenReturn(authentication);
        SecurityContextHolder.setContext(securityContext);

        String templateInfo = "{\"approvedBy\": \"Mr Man\",\n" +
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
        Assert.assertThrows(DataFormatException.class, () ->
                validationService.validateTemplate(new byte[20], templateInfo));
    }

}
