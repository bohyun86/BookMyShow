package com.itwillbs.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.KakaoLoginService;
import com.itwillbs.service.KakaoUserService;
import com.itwillbs.service.UserServiceImpl;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@Log4j2
@AllArgsConstructor
public class OauthLoginController {

    /* 카카오 간편 로그인 */

    private KakaoLoginService kakaoLoginService;

    private KakaoUserService kakaoUserService;

    private UserServiceImpl userServiceImpl;

    @Value("#{kakaoProperties['kakao.restApiKey']}")
    private String restApiKey;

    @Value("#{kakaoProperties['kakao.redirectUri']}")
    private String redirectUri;


    @GetMapping("/kakao/login")
    public String kakaoLogin() {
        String kakaoAuthUrl = "https://kauth.kakao.com/oauth/authorize" +
                "?client_id=" + restApiKey +
                "&redirect_uri=" + redirectUri +
                "&response_type=code" +
                "&scope=account_email,name,phone_number";

        return "redirect:" + kakaoAuthUrl;
    }

    @GetMapping("/oauth/kakao/callback")
    public String kakaoCallback(@RequestParam("code") String code, HttpSession session) {
        String accessToken = kakaoLoginService.getAccessToken(code);
        JsonNode userInfo = kakaoLoginService.getUserInfo(accessToken);
        Map<String, Object> getUser = kakaoUserService.saveOrUpdateUser(userInfo, accessToken);
        Boolean isUser = (Boolean) getUser.get("isUser");
        UserDTO user = (UserDTO) getUser.get("user");

        if (isUser) {
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("userRole", user.getUserRole());
            session.setAttribute("userName", user.getUserName());
            session.setAttribute("name", user.getName());
            session.setAttribute("oauth", user.getOauth());
            return "redirect:/main/main";
        } else {
            session.setAttribute("user", user);
            return "/login/oauth_newUser";
        }
    }

    @PostMapping("/oauth/kakao/joinPro")
    @Transactional
    public String kakaoJoinPro(HttpSession session) {

        UserDTO user = (UserDTO) session.getAttribute("user");
        kakaoUserService.save(user);

        session.setAttribute("userId", user.getUserId());
        session.setAttribute("userRole", user.getUserRole());
        session.setAttribute("userName", user.getUserName());
        session.setAttribute("name", user.getName());
        session.setAttribute("oauth", user.getOauth());

        // 세션에 저장된 user 삭제
        session.removeAttribute("user");

        return "redirect:/main/main"; // 로그인 후 메인 페이지로 이동

    }

    @GetMapping(value = "/oauth/kakao/checkEmailAndPhoneNumber", produces = "application/json")
    @ResponseBody
    public ResponseEntity<Map<String, UserDTO>> checkEmailAndPhoneNumber(@RequestParam String email, @RequestParam String phoneNumber) {
        log.info("checkEmailAndPhoneNumber");

        UserDTO userDTO = new UserDTO();
        userDTO.setEmail(email);
        userDTO.setPhoneNumber(phoneNumber);

        UserDTO emailUser = userServiceImpl.checkEmailJPA(userDTO);
        UserDTO phoneUser = userServiceImpl.checkPhoneNumber(userDTO);

        if (emailUser == null) {
            emailUser = new UserDTO();
        }
        if (phoneUser == null) {
            phoneUser = new UserDTO();
        }

        log.info("emailUser: {}", emailUser);
        log.info("phoneUser: {}", phoneUser);

        Map<String, UserDTO> resultMap = Map.of("emailUser", emailUser, "phoneUser", phoneUser);
        return ResponseEntity.ok(resultMap);
    }

    /* naver 간편 로그인*/
    private NaverLoginService naverLoginService;

    private NaverUserService naverUserService;

    @Value("#{naverProperties['naver.restApiKey']}")
    private String naverRestApiKey;

    @Value("#{naverProperties['naver.redirectUri']}")
    private String naverRedirectUri;

    @GetMapping("/kakao/login")
    public String kakaoLogin() {
        String naverAuthUrl = "https://nid.naver.com/oauth2.0/authorize" +
                "?client_id=" + restApiKey +
                "&redirect_uri=" + redirectUri +
                "&response_type=code" +
                "&scope=account_email,name,phone_number";

        return "redirect:" + naverAuthUrl;
    }
}
