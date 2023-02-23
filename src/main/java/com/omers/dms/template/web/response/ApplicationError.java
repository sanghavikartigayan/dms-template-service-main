package com.omers.dms.template.web.response;

import lombok.Getter;

import java.io.Serializable;

public class ApplicationError implements Serializable {

    private static final long serialVersionUID = 1050122333426183452L;
    private static final String PREFIX = "DMS_TEMPLATE-";
    private final Error code;
    private final String desc;

    private ApplicationError(Error code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public static ApplicationError of(Error code, String format, Object... args) {
        return new ApplicationError(code, String.format(format, args));
    }

    public Error getError() {
        return code;
    }
    public String getDesc() {
        return desc;
    }
    public String getPrefix() {
        return PREFIX;
    }

    @Override
    public String toString() {
        return String.format("%s-%d: %s", PREFIX, code.getCode(), desc);
    }

    @Getter
    public enum Error {

        ERROR_GENERIC(1019, "ERROR_GENERIC");

        private final int code;

        private final String reasonPhrase;

        Error(int code, String reasonPhrase) {
            this.code = code;
            this.reasonPhrase = reasonPhrase;
        }

        public int getCode() {
            return this.code;
        }

        public String getReasonPhrase() {
            return this.reasonPhrase;
        }
    }
}
