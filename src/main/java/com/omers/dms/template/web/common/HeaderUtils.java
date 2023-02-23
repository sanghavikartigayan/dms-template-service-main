package com.omers.dms.template.web.common;

import org.apache.logging.log4j.util.Strings;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.UUID;

import static com.omers.donna.Constants.HEADER_REQUEST_ID;

public class HeaderUtils {

    private HeaderUtils() {

    }

    public static String getRequestId() {
        var requestAttributes = RequestContextHolder.getRequestAttributes();
        if (requestAttributes != null) {
            HttpServletRequest req = ((ServletRequestAttributes) requestAttributes).getRequest();
            if (!Strings.isEmpty(req.getHeader(HEADER_REQUEST_ID))) {
                return req.getHeader(HEADER_REQUEST_ID);
            }
        }
        return UUID.randomUUID().toString();
    }


}
