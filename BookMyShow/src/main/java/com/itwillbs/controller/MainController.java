package com.itwillbs.controller;

import com.itwillbs.service.main.MainService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequestMapping("/main/*")
@AllArgsConstructor
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class MainController {

    private MainService mainService;

    @GetMapping("/main")
    public String home(Model model) {
        log.info("main success");

        model.addAttribute("newCarouselDTOS", mainService.getMainNewCarouselDTOs());

        return "/main/main";
    }

//    @GetMapping(value = "/newCarousel", produces = MediaType.APPLICATION_JSON_VALUE)
//    public List<MainNewCarouselDTO> newCarousel() {
//        try {
//            log.info("newCarousel success");
//            return mainService.getMainNewCarouselDTOs();
//        } catch (Exception e) {
//            log.error("Error while fetching new carousel data", e);
//            // 예외 처리 (예: 빈 리스트 반환 또는 적절한 에러 응답 처리)
//            return new ArrayList<>();
//        }
//    }
}
