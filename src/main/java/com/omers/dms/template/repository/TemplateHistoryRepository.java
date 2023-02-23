package com.omers.dms.template.repository;

import com.omers.dms.template.model.entity.TemplateHistoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;


public interface TemplateHistoryRepository extends JpaRepository<TemplateHistoryEntity, UUID>{
    Optional<TemplateHistoryEntity> findByTemplateIdAndVersion(UUID templateId, Integer version);
}
