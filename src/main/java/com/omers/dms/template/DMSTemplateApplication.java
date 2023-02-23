package com.omers.dms.template;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@SpringBootApplication
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class DMSTemplateApplication {

    public static void main(String[] args) {
        SpringApplication.run(DMSTemplateApplication.class, args);
    }
}
