package com.itwillbs.service;

import com.itwillbs.service.main.MainService;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@Log4j2
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MainServiceTests {

    @Autowired
    private MainService mainService;

    @Test
    public void testGetMainNewCarouselDTOs() {
        log.info("carouselDTOS: {}", mainService.getMainNewCarouselDTOs());
    }

}
