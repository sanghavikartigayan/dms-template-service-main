package com.omers.dms.template.repository;

import com.omers.dms.template.model.entity.TemplateAuditView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.UUID;


public interface TemplateAuditViewRepository extends JpaRepository<TemplateAuditView, UUID>, JpaSpecificationExecutor<TemplateAuditView> {
}
