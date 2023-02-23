package com.omers.dms.template.web;

import com.omers.dms.template.service.TemplateService;
import com.omers.dms.template.service.ValidationService;
import com.omers.donna.Constants;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import java.io.IOException;
import java.util.UUID;

import static org.hamcrest.CoreMatchers.is;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.doNothing;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
@WebMvcTest({GlobalExceptionHandler.class, TemplateController.class})
@AutoConfigureMockMvc(addFilters = false)
class GlobalExceptionHandlerTest {

    static final String BASE_URL = "/v1/template/";

    private static final String REQUEST_ID = UUID.randomUUID().toString();

    @Autowired
    private MockMvc mockMvc;
    @MockBean
    TemplateService templateService;
    @MockBean
    ValidationService validationService;

    @BeforeEach
    void setup() throws IOException {
        doNothing().when(validationService).validateTemplate(any(),any());
    }

    @Test
    @WithMockUser(value = "spring")
    void should_handle_run_time_exception() throws Exception {
        given(templateService.getTemplateById(any()))
                .willThrow(new RuntimeException("Run Time Error"));

        mockMvc.perform(get(BASE_URL + "/" + UUID.randomUUID()).header(Constants.HEADER_REQUEST_ID, REQUEST_ID))
               .andExpect(jsonPath("$.requestId", is(REQUEST_ID)))
               .andExpect(status().isInternalServerError());

    }

    @Test
    @WithMockUser(value = "spring")
    void should_handle_generic_exception() throws Exception {
        given(templateService.getTemplateById(any()))
                .willThrow(new ArithmeticException("Generic Error"));

        mockMvc.perform(get(BASE_URL + "/" + UUID.randomUUID()).header(Constants.HEADER_REQUEST_ID, REQUEST_ID))
               .andExpect(jsonPath("$.requestId", is(REQUEST_ID)))
               .andExpect(status().isInternalServerError());

    }

    @Test
    @WithMockUser(value = "spring")
    void should_handle_access_denied_exception() throws Exception {
        given(templateService.getTemplateById(any()))
                .willThrow(new AccessDeniedException("Access Denied Error"));

        mockMvc.perform(get(BASE_URL + "/" + UUID.randomUUID()).header(Constants.HEADER_REQUEST_ID, REQUEST_ID))
               .andExpect(jsonPath("$.requestId", is(REQUEST_ID)))
               .andExpect(status().isUnauthorized());

    }

}
