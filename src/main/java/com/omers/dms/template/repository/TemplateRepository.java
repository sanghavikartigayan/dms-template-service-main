package com.omers.dms.template.repository;

import com.omers.dms.template.model.entity.TemplateEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.UUID;


public interface TemplateRepository extends JpaRepository<TemplateEntity, UUID> , JpaSpecificationExecutor<TemplateEntity> {
}
