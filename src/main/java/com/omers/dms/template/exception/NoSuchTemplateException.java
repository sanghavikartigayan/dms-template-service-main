package com.omers.dms.template.exception;

public class NoSuchTemplateException extends RuntimeException {
    public NoSuchTemplateException(String message, Exception e) {
        super(message, e);
    }

    public NoSuchTemplateException() {
        super();
    }
}
