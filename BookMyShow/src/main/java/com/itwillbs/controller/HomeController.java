package com.itwillbs.controller;

import com.itwillbs.service.main.MainService;
import jdk.jfr.Label;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Log4j2
@AllArgsConstructor
public class HomeController {

    private MainService mainService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Model model) {

        log.info("main 호출");

        model.addAttribute("newCarouselDTOS", mainService.getMainNewCarouselDTOs());
        model.addAttribute("timeSaleCarouselDTOS", mainService.timeSaleCarouselDTOs());

        return "main/main";
    }

}
