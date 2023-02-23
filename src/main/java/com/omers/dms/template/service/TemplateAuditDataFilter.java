package com.omers.dms.template.service;


import com.omers.dms.template.model.entity.TemplateAuditView;
import com.omers.dms.template.model.enums.TemplateType;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;

import java.util.UUID;

@Component
public class TemplateAuditDataFilter {

    public Specification<TemplateAuditView> templateIdFilter(String value) {
        if (value == null || value.isEmpty()) return null;
        return (root, query, cb) -> cb.equal(root.get("templateId"), UUID.fromString(value));
    }

    public Specification<TemplateAuditView> processIdFilter(String value) {
        if (value == null || value.isEmpty()) return null;
        return (root, query, cb) -> cb.like(root.get("processId"), value + "%");
    }

    public Specification<TemplateAuditView> templateTypeFilter(TemplateType value) {
        if (value == null) return null;
        return (root, query, cb) -> cb.equal(root.get("templateType"), value);
    }

    public Specification<TemplateAuditView> activeFilter(Boolean value) {
        if (value == null) return null;
        return (root, query, cb) -> cb.equal(root.get("isActive"), value);
    }

    public Specification<TemplateAuditView> versionFilter(Integer value) {
        if (value == null) return null;
        return (root, query, cb) -> cb.equal(root.get("version"), value);
    }

}
