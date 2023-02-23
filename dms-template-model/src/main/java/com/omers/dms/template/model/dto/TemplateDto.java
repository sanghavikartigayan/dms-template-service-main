package com.omers.dms.template.model.dto;

import com.omers.dms.template.model.enums.TemplateType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.OffsetDateTime;
import java.util.List;
import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TemplateDto implements Serializable {

    private UUID templateId;

    @NotNull(message = "Process id is required")
    private String processId;

    @NotNull(message = "Template name is required")
    private String templateName;

    @NotNull(message = "Template type is required")
    private TemplateType templateType;

    private String approvedBy;

    @NotNull(message = "Template Fields are required")
    private List<TemplateField> templateFields;

    @NotNull(message = "Active is required")
    private Boolean isActive;

    private TemplateStamp templateStamp;

    private int version;

    private String modifiedBy;

    private OffsetDateTime modifiedOn;

    private byte[] templateData;

    private String createdBy;

    private OffsetDateTime createdOn;
}

