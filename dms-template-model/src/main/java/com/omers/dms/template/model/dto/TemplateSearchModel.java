package com.omers.dms.template.model.dto;

import com.omers.dms.template.model.enums.TemplateType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TemplateSearchModel {
    private String templateId;
    private String processId;
    private TemplateType templateType;
    private Boolean isActive;
    private String templateName;
}
