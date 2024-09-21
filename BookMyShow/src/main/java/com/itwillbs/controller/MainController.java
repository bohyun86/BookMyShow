package com.itwillbs.controller;

import com.itwillbs.service.main.MainService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    @GetMapping("/terms")
    public String term() {
        log.info("term success");

        return "/main/terms";
    }

    @GetMapping("/privacy")
    public String privacy() {
        log.info("privacy success");

        return "/main/privacy";
    }

    @GetMapping("/about")
    public String about() {
        log.info("about success");

        return "/main/about";
    }

    @GetMapping("/partnership")
    public String partnership() {
        log.info("partnership success");

        return "/main/partnership";
    }

    @GetMapping("/search")
    public String search(@RequestParam(required = false) String searching, Model model) {
        log.info("search request success");

        if (searching != null && !searching.isEmpty()) {
            model.addAttribute("searchingResult", mainService.getSearchingCards(searching));
        }

        return "/main/search";
    }

    @GetMapping("/time_sale")
    public String timeSale(Model model) {
        log.info("timeSale success");

        model.addAttribute("timeSaleCarouselDTOS", mainService.getTimeSaleCarouselDTOs());

        return "/main/time_sale";
    }

    @GetMapping("/new_musical")
    public String newMusical(Model model) {
        log.info("new_musical success");

        model.addAttribute("newMusical", mainService.getNewMusical());

        return "/main/new_musical";
    }

    @GetMapping("/event")
    public String event() {
        log.info("event success");

        return "/main/event";
    }
}
