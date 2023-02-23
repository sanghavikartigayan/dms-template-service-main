package com.omers.dms.template.projection;

import com.omers.platform.notification.NotificationSender;
import com.omers.platform.projections.ProjectionHandler;
import com.omers.platform.routers.ProjectionRouter;
import org.springframework.stereotype.Service;

@Service
public class DmsTemplateProjectionHandler extends ProjectionHandler {

    private final NotificationSender notificationSender;

    public DmsTemplateProjectionHandler(
            ProjectionRouter router,
            NotificationSender notificationSender
    ) {
        super(router);
        this.notificationSender = notificationSender;
    }
}
