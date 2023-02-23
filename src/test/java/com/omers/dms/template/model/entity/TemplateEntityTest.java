package com.omers.dms.template.model.entity;

import com.omers.dms.template.model.enums.TemplateType;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
class TemplateEntityTest {

    @Autowired
    TemplateMapper templateMapper;

    @Test
    void should_convert_to_dto() {
        var templateId = UUID.randomUUID();
        var entity = TemplateEntity.builder()
                                   .templateId(templateId)
                                   .templateData(new byte[20])
                                   .templateType(TemplateType.HTML)
                                   .templateFields(new ArrayList<>())
                                   .templateName("Test Template")
                                   .isActive(true)
                                   .processId("Test Process")
                                   .version(1)
                                   .build();

        var dto = templateMapper.toDTO(entity);
        assertEquals(TemplateType.HTML, dto.getTemplateType());
        assertEquals("Test Template", dto.getTemplateName());
        assertTrue(dto.getIsActive());
        assertEquals("Test Process", dto.getProcessId());
        assertEquals(1, dto.getVersion());
        assertEquals(0, dto.getTemplateFields().size());
    }
}
