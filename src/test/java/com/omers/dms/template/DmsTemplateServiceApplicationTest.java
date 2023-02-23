package com.omers.dms.template;

import com.omers.platform.notification.NotificationSender;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.ActiveProfiles;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@ActiveProfiles("test")
class DmsTemplateServiceApplicationTest {

    @MockBean
    private NotificationSender notificationSender;

    @Test
    void contextLoads() {
        assertThat(notificationSender).isNotNull();
    }
}
