package com.omers.dms.template.web;

import com.omers.dms.template.config.Constants;
import com.omers.dms.template.web.common.HeaderUtils;
import com.omers.dms.template.web.response.ApplicationError;
import com.omers.dms.template.web.response.ApplicationError.Error;
import com.omers.donna.web.response.ClientResponse;
import com.omers.donna.web.response.ResultError;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;


@ControllerAdvice
public class GlobalExceptionHandler extends ResponseEntityExceptionHandler {

    private final Logger exceptionLogger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @ExceptionHandler(Exception.class)
    protected ResponseEntity<ApplicationError> handleConflict(Exception exception, WebRequest request) {
        logException(exception, request);
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(ApplicationError.of(Error.ERROR_GENERIC,
                Constants.APPLICATION_DESCRIPTION_FORMAT,
                exception.getMessage(),
                exception.getCause(),
                "-1"));
    }

    @ExceptionHandler(AccessDeniedException.class)
    public ResponseEntity<Object> handleAccessDeniedException(AccessDeniedException ex, WebRequest request) {
        logException(ex, request);
        return ResponseEntity
                .status(HttpStatus.UNAUTHORIZED)
                .body(ClientResponse.builder()
                                    .requestId(HeaderUtils.getRequestId())
                                    .errors(ResultError.of(ex.getMessage(), ((ServletWebRequest) request).getRequest()
                                                                                                         .getRequestURI(), Error.ERROR_GENERIC
                                            .toString()))
                                    .build());
    }

    @ExceptionHandler(RuntimeException.class)
    public ResponseEntity<Object> handleException(RuntimeException ex, WebRequest request) {
        logException(ex, request);
        return ResponseEntity
                .status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(ClientResponse.builder()
                                    .requestId(HeaderUtils.getRequestId())
                                    .errors(ResultError.of(ex.getMessage(), ((ServletWebRequest) request).getRequest()
                                                                                                         .getRequestURI(), Error.ERROR_GENERIC
                                            .toString()))
                                    .build());
    }

    protected void logException(Exception ex, WebRequest request) {
        String requestUri = ((ServletWebRequest) request).getRequest().getRequestURI();
        exceptionLogger.error("Uncaught exception in document generation for path {}", requestUri, ex);
    }
}
