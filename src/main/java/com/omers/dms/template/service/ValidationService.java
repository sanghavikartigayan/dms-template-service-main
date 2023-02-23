package com.omers.dms.template.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.omers.dms.template.exception.DataFormatException;
import com.omers.dms.template.exception.InvalidTemplateException;
import com.omers.dms.template.exception.UnsupportedTemplateTypeException;
import com.omers.dms.template.model.dto.TemplateDto;
import com.omers.dms.template.model.enums.TemplateType;
import lombok.RequiredArgsConstructor;
import org.docx4j.Docx4J;
import org.docx4j.openpackaging.exceptions.Docx4JException;
import org.docx4j.openpackaging.packages.WordprocessingMLPackage;
import org.opendope.answers.Answer;
import org.opendope.answers.Answers;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import java.io.ByteArrayInputStream;
import java.util.Set;
import java.util.stream.Collectors;


@Service
@RequiredArgsConstructor
public class ValidationService {
    private static final String TEMPLATE_NAME = "name.ftl";
    private final DataService dataService;
    private final ObjectMapper objectMapper;
    private final Logger logger = LoggerFactory.getLogger(ValidationService.class);


    public void validateTemplate(byte[] file, String templateJsonString){

        TemplateDto templateInfo = parseTemplateInfoString(templateJsonString);
        var templateType = templateInfo.getTemplateType() != null ? templateInfo.getTemplateType() : TemplateType.UNKNOWN;
        switch (templateType) {
            case DOCX:
                validateDOCXTemplate(file, templateInfo);
                break;
            case HTML:
                break;
            default:
                throw new UnsupportedTemplateTypeException("template type " + templateType.name() + " is not supported!");
        }
    }



    private void validateDOCXTemplate(byte[] file, TemplateDto templateInfo) {

        try {
            WordprocessingMLPackage template = Docx4J.load(new ByteArrayInputStream(file));
            var answers = new Answers();
            templateInfo.getTemplateFields().forEach(templateField ->
                    answers.getAnswerOrRepeat().add(addAnswer(templateField.getFieldName(),
                            String.valueOf(dataService.getMockDataByFieldType(templateField.getFieldType())))));
            Docx4J.bind(template, answers, Docx4J.FLAG_NONE);
        } catch (Docx4JException e) {
            throw new InvalidTemplateException("Provided template is invalid!", e);
        }
    }

    private static Answer addAnswer(String key, String value) {
        final var answer = new Answer();
        answer.setId(key);
        answer.setValue(value);
        return answer;
    }

    private TemplateDto parseTemplateInfoString(String templateJsonString){
        TemplateDto templateInfo;
        try {
            templateInfo = objectMapper.readValue(templateJsonString, TemplateDto.class);
        } catch (JsonProcessingException e) {
            throw new DataFormatException("Template info JSON is invalid!");
        }

        var factory = Validation.buildDefaultValidatorFactory();
        var validator = factory.getValidator();
        Set<ConstraintViolation<TemplateDto>> violations = validator.validate(templateInfo);

        if (!violations.isEmpty()){
            var message = violations.stream().map(ConstraintViolation::getMessage).sorted().collect(Collectors.joining(" , "));
            throw new DataFormatException(message);
        }

        return templateInfo;
    }
    
}

