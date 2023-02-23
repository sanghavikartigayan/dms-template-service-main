package com.omers.dms.template.model.entity;

import com.omers.dms.template.model.dto.TemplateField;
import com.omers.dms.template.model.dto.TemplateStamp;
import com.omers.dms.template.model.enums.TemplateType;
import com.vladmihalcea.hibernate.type.json.JsonBinaryType;
import lombok.*;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;

import javax.persistence.*;
import java.io.Serializable;
import java.time.OffsetDateTime;
import java.util.List;
import java.util.UUID;

@Entity
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@NoArgsConstructor
@AllArgsConstructor
@Builder
@TypeDefs({
    @TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)
})
@Table(name = "template")
public class TemplateEntity implements Serializable {

    @Id
    @Column(name = "template_id",  nullable = false)
    @EqualsAndHashCode.Include
    private UUID templateId;

    @Column(name = "process_id")
    @EqualsAndHashCode.Include
    private String processId;

    @Column(name = "template_name")
    private String templateName;

    @Column(name = "template_type")
    @Enumerated(EnumType.STRING)
    private TemplateType templateType;
    
    @Column(name = "approved_by")
    private String approvedBy;

    @Column(name = "template_fields", columnDefinition = "jsonb")
    @Type(type = "jsonb")
    private List<TemplateField> templateFields;

    @Column(name = "template_stamp", columnDefinition = "jsonb")
    @Type(type = "jsonb")
    private TemplateStamp templateStamp;
    
    @Column(name = "template_data")
    @Lob
    @Type(type="org.hibernate.type.BinaryType")
    private byte[] templateData;
    
    @Column(name = "is_active")
    private Boolean isActive;
    
    @Column(name = "version")
    private int version;

    @Column(name = "modified_by")
    private String modifiedBy;

    @Column(name = "modified_on")
    private OffsetDateTime modifiedOn;

    @Column(name = "created_by")
    private String createdBy;

    @Column(name = "created_on")
    private OffsetDateTime createdOn;

}

