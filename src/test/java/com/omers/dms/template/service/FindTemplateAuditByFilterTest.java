package com.omers.dms.template.service;

import com.omers.dms.template.BaseTest;
import com.omers.dms.template.model.dto.TemplateAuditSearchModel;
import com.omers.dms.template.model.enums.TemplateType;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest
@Transactional
@Sql("classpath:db/template_data.sql")
class FindTemplateAuditByFilterTest extends BaseTest {

    @Autowired
    TemplateService templateService;

    @Test
    void should_return_all_templates_with_no_filter() {
        var searchModel = TemplateAuditSearchModel.builder()
                                             .build();
        var page = templateService.getTemplateAuditByFilter(searchModel, PageRequest.of(0, 20));
        assertNotNull(page);
        assertEquals(6, page.getContent().size());
    }

    @Test
    void should_return_by_template_id_filter() {
        var searchModel = TemplateAuditSearchModel.builder()
                                                  .templateId("414846b4-ec59-497e-9e28-bcc7d7ac678c")
                                                  .build();
        var page = templateService.getTemplateAuditByFilter(searchModel, PageRequest.of(0, 20));
        assertNotNull(page);
        assertEquals(2, page.getContent().size());
        assertEquals("WelcomeLetter1", page.getContent().get(0).getTemplateName());
    }

    @Test
    void should_return_by_process_id_filter() {
        var searchModel = TemplateAuditSearchModel.builder()
                                                  .processId("TEST_PROCESS")
                                                  .build();
        var page = templateService.getTemplateAuditByFilter(searchModel, PageRequest.of(0, 20));
        assertNotNull(page);
        assertEquals(1, page.getContent().size());
        assertEquals("WelcomeLetter3", page.getContent().get(0).getTemplateName());
    }

    @Test
    void should_return_by_template_type_filter() {
        var searchModel = TemplateAuditSearchModel.builder()
                                                  .templateType(TemplateType.HTML)
                                                  .build();
        var page = templateService.getTemplateAuditByFilter(searchModel, PageRequest.of(0, 20));
        assertNotNull(page);
        assertEquals(1, page.getContent().size());
        assertEquals("WelcomeLetter4", page.getContent().get(0).getTemplateName());
    }

    @Test
    void should_return_by_active_filter() {
        var searchModel = TemplateAuditSearchModel.builder()
                                                  .isActive(false)
                                                  .build();
        var page = templateService.getTemplateAuditByFilter(searchModel, PageRequest.of(0, 20));
        assertNotNull(page);
        assertEquals(1, page.getContent().size());
        assertEquals("WelcomeLetter5", page.getContent().get(0).getTemplateName());
    }

    @Test
    void should_return_by_version_filter() {
        var searchModel = TemplateAuditSearchModel.builder()
                                                  .version(2)
                                                  .build();
        var page = templateService.getTemplateAuditByFilter(searchModel, PageRequest.of(0, 20));
        assertNotNull(page);
        assertEquals(1, page.getContent().size());
        assertEquals("WelcomeLetter1", page.getContent().get(0).getTemplateName());
    }

}
