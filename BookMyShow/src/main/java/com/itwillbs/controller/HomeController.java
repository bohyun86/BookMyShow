package com.itwillbs.controller;

import jdk.jfr.Label;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/", method = RequestMethod.GET)
@Log4j2
public class HomeController {

    @GetMapping("")
    public String home() {
       
        log.info("home 호출");
        return "/main/main";
    }

}
