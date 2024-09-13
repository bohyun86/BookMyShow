package com.itwillbs.controller;

import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.UserServiceImpl;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@Log4j2
@RequestMapping("/partner/*")
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class PartnerController {

    private final UserServiceImpl userServiceImpl;

    public PartnerController(UserServiceImpl userServiceImpl) {
        this.userServiceImpl = userServiceImpl;
    }

    @GetMapping("/login")
    public String login() {
        return "/partner/login";
    }

    @PostMapping("/loginPro")
    public String loginPro(UserDTO userDTO, HttpSession session) {
        log.info("loginPro: {}", userDTO);
        UserDTO getUser = userServiceImpl.loginPro(userDTO);
        log.info(getUser);
        if (getUser == null) {
            return "redirect:/partner/login";
        } else {
            log.info(getUser);
            session.setAttribute("userId", getUser.getUserId());
            session.setAttribute("userRole", getUser.getUserRole());
            session.setAttribute("userName", getUser.getUserName());
            return "redirect:/partner/main/";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/partner/login";
    }
 
    
    @GetMapping("/write")
    public String write() {
        return "/partner/write";
    }
    
    @GetMapping("/status")
    public String status() {
        return "/partner/status";
    }

    @GetMapping("/edit")
    public String edit() {
        return "/partner//edit";
    }

    
    @GetMapping("/booking")
    public String booking() {
        return "/partner/booking";
    }
    
    @GetMapping("/settlement")
    public String settlement() {
        return "/partner/settlement";
    }
    
    @GetMapping("/review")
    public String review() {
        return "/partner/review";
    }
    
    @GetMapping("/qna")
    public String qna() {
        return "/partner/qna";
    }
    
    @GetMapping("/qna_write")
    public String qna_write() {
        return "/partner/qna_write";
    }
    
    @GetMapping("/main")
    public String main() {
        return "/partner/main";
    }

}
