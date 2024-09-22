package com.itwillbs.controller;

import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.EmailService;
import com.itwillbs.service.UserServiceImpl;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
    private EmailService emailService;


    @GetMapping("")
    public String login() {
        return "/login/login";
    }

    @PostMapping(value = "/loginPro", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<Map<String, Object>> loginPro(@RequestBody UserDTO userDTO, HttpSession session) {
        log.info("loginPro: {}", userDTO);
        UserDTO getUser = userServiceImpl.loginPro(userDTO);
        if (getUser == null) {
            return ResponseEntity.ok(Map.of("success", false));
        } else {
            log.info("controller user: {}:", getUser);
            if (getUser.getTempPassword() != null) {
                log.info("tempPassword true");
                session.setAttribute("userId", getUser.getUserId());
                session.setAttribute("userRole", getUser.getUserRole());
                session.setAttribute("userName", getUser.getUserName());
                session.setAttribute("name", getUser.getName());
                return ResponseEntity.ok(Map.of("success", true, "tempPassword", true));
            } else {
                session.setAttribute("userId", getUser.getUserId());
                session.setAttribute("userRole", getUser.getUserRole());
                session.setAttribute("userName", getUser.getUserName());
                session.setAttribute("name", getUser.getName());
                return ResponseEntity.ok(Map.of("success", true, "tempPassword", false));
            }
        }
    }

    @GetMapping("/join")
    public void join() {
    }

    @GetMapping("/findidpw")
    public void findidpw() {
    }

    @PostMapping(value = "/findIdPro", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<Map<String, Object>> findIdPro(@RequestBody UserDTO userDTO) {
        log.info("findIdPro: {}", userDTO);
        UserDTO getUser = userServiceImpl.findIdPro(userDTO);
        if (getUser == null) {
            return ResponseEntity.ok(Map.of("success", false));
        } else {
            log.info("controller user: {}:", getUser);
            return ResponseEntity.ok(Map.of("success", true, "userId", getUser.getUserName()));
        }
    }

    @PostMapping(value = "/findPwPro", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<Map<String, Object>> findPwPro(@RequestBody UserDTO userDTO) {
        log.info("findPwPro: {}", userDTO);
        UserDTO getUser = userServiceImpl.findPwPro(userDTO);
        if (getUser == null) {
            return ResponseEntity.ok(Map.of("success", false));
        } else {
            log.info("controller user: {}:", getUser);

            if (emailService.sendTempPasswordEmail(getUser)) {

                return ResponseEntity.ok(Map.of("success", true));
            } else {
                return ResponseEntity.ok(Map.of("success", false));
            }
        }
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
        return "redirect:/main/main";
    }


}
