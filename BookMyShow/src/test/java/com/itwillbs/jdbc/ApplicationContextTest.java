package com.itwillbs.jdbc;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:BookMyShow/src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2
@RequiredArgsConstructor
public class ApplicationContextTest {

    private final ApplicationContext ctx;

    @Test
    public void testExist() {
        log.info(ctx);
    }

}
