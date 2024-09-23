package com.itwillbs.controller;

import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.UserServiceImpl;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@Log4j2
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {

    private UserServiceImpl userServiceImpl;

    @PostMapping("/joinPro")
    public String join(UserDTO userDTO) {
        log.info("join: {}", userDTO);

        if (userServiceImpl.insertUser(userDTO)) {
            return "redirect:/main/main";
        } else {
            return "redirect:/login/join";
        }
    }


}
