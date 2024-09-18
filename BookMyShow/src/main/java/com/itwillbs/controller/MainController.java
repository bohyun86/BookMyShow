package com.itwillbs.controller;

import com.itwillbs.domain.main.MainNewCarouselDTO;
import com.itwillbs.service.main.MainService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

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
        model.addAttribute("timeSaleCarouselDTOS", mainService.timeSaleCarouselDTOs());

        return "/main/main";
    }
}
