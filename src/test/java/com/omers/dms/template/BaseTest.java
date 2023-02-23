package com.omers.dms.template;

import lombok.SneakyThrows;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.util.TestPropertyValues;
import org.springframework.context.ApplicationContextInitializer;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.transaction.annotation.Transactional;
import org.testcontainers.containers.PostgreSQLContainer;
import org.testcontainers.junit.jupiter.Testcontainers;

import java.lang.invoke.MethodHandles;
import java.util.Map;

@SpringBootTest
@Testcontainers
@ContextConfiguration(initializers = {BaseTest.Initializer.class})
@ActiveProfiles("e2e")
@Transactional
public abstract class BaseTest {

    private static final Map<String, String> ENV = Map.ofEntries(
            Map.entry("SPRING_PROFILES_ACTIVE", "e2e"),
            Map.entry("KAFKA_HOST", "broker:9092")
    );

    public static PostgreSQLContainer<?> postgreDBContainer = new PostgreSQLContainer<>("postgres:11.6");

    static {
        postgreDBContainer.withInitScript("init.sql");
        postgreDBContainer.start();
    }

    static class Initializer
            implements ApplicationContextInitializer<ConfigurableApplicationContext> {

        private static final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

        @SneakyThrows
        @Override
        public void initialize(ConfigurableApplicationContext applicationContext) {
            logger.info("Initializing e2e tests");
            TestPropertyValues.of(
                    "spring.datasource.url=" + postgreDBContainer.getJdbcUrl(),
                    "spring.datasource.username=" + postgreDBContainer.getUsername(),
                    "spring.datasource.password=" + postgreDBContainer.getPassword(),
                    "spring.datasource.hikari.minimum-idle=" + 5
            ).applyTo(applicationContext.getEnvironment());
        }
    }
}
