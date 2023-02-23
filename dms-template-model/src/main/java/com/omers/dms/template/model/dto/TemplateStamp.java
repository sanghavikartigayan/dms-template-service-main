package com.omers.dms.template.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TemplateStamp implements Serializable {

    private float x;
    private float y;
    private int rotation;
}
