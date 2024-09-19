package com.itwillbs.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequestMapping("/support/*")
public class SupportController {

    @GetMapping("/notice")
    public String notice() {
        log.info("notice success");

        return "/support/notice";
    }
    
    @GetMapping("/faq")
    public String faq() {
        log.info("faq success");

        return "/support/faq";
    }
    
    @GetMapping("/qna")
    public String qna() {
        log.info("qna success");

        return "/support/qna";
    }
    
    @GetMapping("/qna_write")
    public String qna_write() {
        log.info("qna_write success");

        return "/support/qna_write";
    }
    
    @GetMapping("/faq_answer1")
    public String faq_answer1() {
        log.info("faq_answer1 success");

        return "/support/faq_answer1";
    }
    
    @GetMapping("/faq_answer2")
    public String faq_answer2() {
        log.info("faq_answer2 success");

        return "/support/faq_answer2";
    }
    
    @GetMapping("/faq_answer3")
    public String faq_answer3() {
        log.info("faq_answer3 success");

        return "/support/faq_answer3";
    }
    
    

//    @GetMapping("/notice/")
//    public String notice() {
//        log.info("notice success");
//
//        return "/notice/notice";
//    }
}
