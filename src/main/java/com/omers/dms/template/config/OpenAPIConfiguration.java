package com.omers.dms.template.config;

import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.builders.RequestParameterBuilder;
import springfox.documentation.schema.ScalarType;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.ParameterStyle;
import springfox.documentation.service.RequestParameter;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@Profile({"local", "dev", "dev2", "sit2", "openapi"})
@Configuration
@NoArgsConstructor
public class OpenAPIConfiguration {

    @Value("${openapi.auth_token}")
    private String token;
    @Value("${openapi.base-path}")
    private String basePath;
    @Bean
    public Docket api() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .pathMapping(basePath)
                .globalRequestParameters(requestParameters())
                .directModelSubstitute(LocalDateTime.class, Date.class)
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.omers"))
                .paths(PathSelectors.any())
                .build();
    }

    private List<RequestParameter> requestParameters() {
        return Collections.singletonList(new RequestParameterBuilder().name("Authorization")
                                                                      .description("Authorization token")
                                                                      .in("header")
                                                                      .required(true)
                                                                      .query(q -> q.style(ParameterStyle.FORM)
                                                                                   .defaultValue("Bearer " + token)
                                                                                   .model(m -> m.scalarModel(ScalarType.STRING)))
                                                                      .build());
    }

    @Bean
    public ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("DMS Template")
                .build();
    }
}
