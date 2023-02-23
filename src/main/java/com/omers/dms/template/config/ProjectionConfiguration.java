package com.omers.dms.template.config;

import com.omers.dms.template.projection.DmsTemplateProjectionHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.Message;

import java.util.function.Consumer;

@Configuration
public class ProjectionConfiguration {

    private final DmsTemplateProjectionHandler dmsTemplateProjectionHandler;

    public ProjectionConfiguration(
            DmsTemplateProjectionHandler dmsTemplateProjectionHandler) {
        this.dmsTemplateProjectionHandler = dmsTemplateProjectionHandler;
    }

    @Bean
    public Consumer<Message<String>> dmsTemplateProjection() {
        return dmsTemplateProjectionHandler::handle;
    }

}
