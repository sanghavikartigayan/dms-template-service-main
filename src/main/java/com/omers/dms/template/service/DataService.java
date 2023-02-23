package com.omers.dms.template.service;

import com.omers.dms.template.model.enums.FieldType;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;

@Service
@AllArgsConstructor
public class DataService {

    public Object getMockDataByFieldType(FieldType type){
        switch (type) {
            case BOOLEAN:
                return true;
            case DATE:
                return new Date();
            case ARRAY:
                return new ArrayList<>();
            case NUMBER:
                return 1L;
            default:
                return "default string value";
        }
    }

}
