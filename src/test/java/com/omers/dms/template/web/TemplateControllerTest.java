package com.omers.dms.template.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.omers.dms.template.model.dto.TemplateDto;
import com.omers.dms.template.model.entity.TemplateEntity;
import com.omers.dms.template.model.enums.TemplateType;
import com.omers.dms.template.service.TemplateService;
import com.omers.dms.template.service.ValidationService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.domain.PageImpl;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Optional;
import java.util.UUID;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
@WebMvcTest(TemplateController.class)
@AutoConfigureMockMvc(addFilters = false)
class TemplateControllerTest {
    static final String BASE_URL = "/v1/template/";

    @MockBean
    TemplateService templateService;
    @MockBean
    ValidationService validationService;

    @Autowired
    ObjectMapper mapper;
    @Autowired
    private MockMvc mvc;

    @BeforeEach
    void setup() throws IOException {
        doNothing().when(validationService).validateTemplate(any(),any());
    }

    @Test
    @WithMockUser(value = "spring")
    void should_get_template_by_id_call() throws Exception {
        var templateId = UUID.randomUUID();
        when(templateService.getTemplateById(any())).thenReturn(Optional.of(TemplateDto.builder().templateId(templateId).build()));
        mvc.perform(get(BASE_URL + "/" + templateId))
           .andExpect(status().isOk())
           .andExpect(jsonPath("$.result.data.templateId").value(templateId.toString()));
    }

    @Test
    @WithMockUser(value = "spring")
    void should_get_template_list() throws Exception {
        var templates = new ArrayList();
        templates.add(TemplateEntity.builder().templateId(UUID.randomUUID()).build());
        when(templateService.getTemplatesByFilter(any(), any())).thenReturn(new PageImpl<>(templates));

        mvc.perform(get(BASE_URL + "/list"))
           .andExpect(status().isOk())
           .andExpect(jsonPath("$.result.success").value(true));
    }

    @Test
    @WithMockUser(value = "spring")
    void should_get_template_file() throws Exception {
        var templateId = UUID.randomUUID();
        when(templateService.getTemplateById(any())).thenReturn(Optional.of(TemplateDto.builder()
                                                                                          .templateId(templateId)
                                                                                          .templateType(TemplateType.DOCX)
                                                                                          .templateName("testFile")
                                                                                          .build()));

        mvc.perform(get(BASE_URL + "/file/" + templateId))
           .andExpect(status().isOk());
    }
}