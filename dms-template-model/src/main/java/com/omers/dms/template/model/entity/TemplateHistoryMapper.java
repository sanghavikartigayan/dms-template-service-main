package com.omers.dms.template.model.entity;

import com.omers.dms.template.model.dto.TemplateDto;
import org.mapstruct.InheritInverseConfiguration;
import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

@Component
@Mapper(componentModel ="spring")
public interface TemplateHistoryMapper {
    TemplateDto toDTO(TemplateHistoryEntity entity);

    @InheritInverseConfiguration
    TemplateHistoryEntity toEntity(TemplateDto dto);
}
