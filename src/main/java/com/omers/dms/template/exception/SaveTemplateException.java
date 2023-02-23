package com.omers.dms.template.exception;

public class SaveTemplateException extends RuntimeException {
    public SaveTemplateException(String message, Exception e) {
        super(message, e);
    }

    public SaveTemplateException() {
        super();
    }
}
