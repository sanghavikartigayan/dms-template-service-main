package com.omers.dms.template.model.dto;

import java.io.Serializable;

import com.omers.dms.template.model.enums.FieldType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TemplateField implements Serializable {

    private String fieldName;
    private FieldType fieldType;
    private String defaultValue;
    private Boolean isRequired;
}
