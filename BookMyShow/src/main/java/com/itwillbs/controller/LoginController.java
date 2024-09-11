package com.itwillbs.controller;

import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.UserServiceImpl;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@Log4j2
@RequestMapping("/login/*")
@EnableAspectJAutoProxy(proxyTargetClass = true)
@AllArgsConstructor
public class LoginController {

    private UserServiceImpl userServiceImpl;

    @GetMapping("")
    public String login() {
        return "/login/login";
    }

    @PostMapping("/loginPro")
    public String loginPro(UserDTO userDTO, HttpSession session) {
        log.info("loginPro: {}", userDTO);
        UserDTO getUser = userServiceImpl.loginPro(userDTO);
        if (getUser == null) {
            return "redirect:/login/";
        } else {
            log.info(getUser);
            session.setAttribute("userId", getUser.getUserId());
            session.setAttribute("userRole", getUser.getUserRole());
            session.setAttribute("userName", getUser.getUserName());
            return "redirect:/main/";
        }
    }

    @GetMapping("/join")
    public void join() {
    }

    @PostMapping("/JoinPro")
    public void newUserPro(UserDTO userDTO) {
        userServiceImpl.insertUser(userDTO);
    }

    @GetMapping("/newUser")
    public void newUser() {
    }



    @GetMapping(value="/checkUserId", produces= MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<Map<String, Boolean>> getUser(@RequestParam String userName) {
        log.info("getUser");

        UserDTO userDTO = new UserDTO();
        userDTO.setUserName(userName);

        Boolean result = userServiceImpl.checkId(userDTO) != null;
        Map<String, Boolean> resultMap = Map.of("result", result);  // JSON 형식으로 변환될 Map 반환
        return ResponseEntity.ok(resultMap);
    }

    @GetMapping("/checkUserEmail")
    @ResponseBody
    public ResponseEntity<Map<String, Boolean>> checkUserEmail(@RequestParam String email) {
        log.info("checkUserEmail");

        UserDTO userDTO = new UserDTO();
        userDTO.setEmail(email);

        Boolean result = userServiceImpl.checkEmail(userDTO) != null;
        Map<String, Boolean> resultMap = Map.of("result", result);  // JSON 형식으로 변환될 Map 반환
        return ResponseEntity.ok(resultMap);
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        log.info("logout success");
        session.invalidate();
        return "redirect:/main/";
    }


}
