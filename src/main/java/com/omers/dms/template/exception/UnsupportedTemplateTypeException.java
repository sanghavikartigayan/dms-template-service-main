package com.omers.dms.template.exception;

public class UnsupportedTemplateTypeException extends RuntimeException {
    public UnsupportedTemplateTypeException(String message, Exception e) {
        super(message, e);
    }

    public UnsupportedTemplateTypeException(String message) {
        super(message);
    }

    public UnsupportedTemplateTypeException() {
        super();
    }
}
