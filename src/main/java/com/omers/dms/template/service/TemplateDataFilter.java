package com.omers.dms.template.service;


import com.omers.dms.template.model.entity.TemplateEntity;
import com.omers.dms.template.model.enums.TemplateType;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;

import java.util.UUID;

@Component
public class TemplateDataFilter {

    public Specification<TemplateEntity> templateIdFilter(String value) {
        if (value == null || value.isEmpty()) return null;
        return (root, query, cb) -> cb.equal(root.get("templateId"), UUID.fromString(value));
    }

    public Specification<TemplateEntity> processIdFilter(String value) {
        if (value == null || value.isEmpty()) return null;
        return (root, query, cb) -> cb.like(root.get("processId"), value + "%");
    }

    public Specification<TemplateEntity> templateTypeFilter(TemplateType value) {
        if (value == null) return null;
        return (root, query, cb) -> cb.equal(root.get("templateType"), value);
    }

    public Specification<TemplateEntity> activeFilter(Boolean value) {
        if (value == null) return null;
        return (root, query, cb) -> cb.equal(root.get("isActive"), value);
    }

    public Specification<TemplateEntity> templateNameFilter(String value) {
        if (value == null || value.isEmpty()) return null;
        return (root, query, cb) -> cb.equal(root.get("templateName"), value);
    }

}
