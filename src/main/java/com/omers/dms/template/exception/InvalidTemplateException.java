package com.omers.dms.template.exception;

public class InvalidTemplateException extends RuntimeException {
    public InvalidTemplateException(String message, Exception e) {
        super(message, e);
    }

    public InvalidTemplateException(String message) {
        super(message);
    }

    public InvalidTemplateException() {
        super();
    }
}
