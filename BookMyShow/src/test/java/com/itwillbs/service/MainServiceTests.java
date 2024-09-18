package com.itwillbs.service;

import com.itwillbs.service.main.MainService;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import static org.junit.jupiter.api.Assertions.assertNotNull;

@ExtendWith(SpringExtension.class)
@Log4j2
@ContextConfiguration(locations = {
        "file:src/main/webapp/WEB-INF/spring/root-context.xml" // XML 설정 파일 경로가 올바른지 확인
})
public class MainServiceTests {

    @Autowired
    private MainService mainService;

    @Test
    public void testGetMainNewCarouselDTOs() {
        // mainService가 null이 아닌지 확인 (주입 확인)
        assertNotNull(mainService, "mainService should not be null");

        // Carousel DTOs 로드
        var carouselDTOs = mainService.getMainNewCarouselDTOs();

        // 데이터가 올바르게 로드되었는지 확인
        assertNotNull(carouselDTOs, "carouselDTOs should not be null");

        log.info("carouselDTOs: {}", carouselDTOs);
    }

    @Test
    public void testTimeSaleCarouselDTO() {
        // mainService가 null이 아닌지 확인 (주입 확인)
        assertNotNull(mainService, "mainService should not be null");

        // Time Sale Carousel DTOs 로드
        var timeSaleCarouselDTOs = mainService.timeSaleCarouselDTOs();

        // 데이터가 올바르게 로드되었는지 확인
        assertNotNull(timeSaleCarouselDTOs, "timeSaleCarouselDTOs should not be null");

        log.info("timeSaleCarouselDTOs: {}", timeSaleCarouselDTOs);
    }
}
