package com.omers.dms.template.exception;

public class DataFormatException extends RuntimeException {
    public DataFormatException(String message) {
        super(message);
    }

    public DataFormatException() {
        super();
    }
}
