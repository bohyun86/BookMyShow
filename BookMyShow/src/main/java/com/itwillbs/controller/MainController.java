package com.itwillbs.controller;

import lombok.extern.log4j.Log4j2;
import org.aspectj.lang.annotation.Before;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Log4j2
@RequestMapping("/main/*")
public class MainController {

    @GetMapping("/main")
    public String home() {
        log.info("main success");

        return "/main/main";
    }

    @GetMapping(value = "/newCarousel", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody()
    public String newCarousel() {
        log.info("newCarousel success");


        return "newCarousel";
    }
}
