package com.omers.dms.template.config;

import lombok.NoArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@NoArgsConstructor
public class WebConfiguration {

    @Value("${cors.origin:}")
    private String corsOrigin;

    @Bean
    @ConditionalOnProperty(
            value = "cors.enabled",
            havingValue = "true")
    public WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurer() {

            @Override
            public void addCorsMappings(CorsRegistry registry) {
                var corsRegistration = registry.addMapping("/**");

                if (!StringUtils.isEmpty(corsOrigin)) {
                    corsRegistration.allowedOrigins(corsOrigin);
                }
            }
        };
    }
}
