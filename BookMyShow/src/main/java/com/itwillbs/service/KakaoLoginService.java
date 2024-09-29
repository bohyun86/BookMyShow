package com.itwillbs.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.repository.UserRepository;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;

@Service
@Log4j2
public class KakaoLoginService {

    private final RestTemplate restTemplate;
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Autowired
    private UserRepository userRepository;

    // 애플리케이션의 REST API 키와 Redirect URI를 주입받습니다.
    @Value("#{kakaoProperties['kakao.restApiKey']}")
    private String restApiKey;

    @Value("#{kakaoProperties['kakao.redirectUri']}")
    private String redirectUri;

    @Value("${kakao.clientSecret}")
    private String clientSecret; // 선택 사항

    public KakaoLoginService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    // 액세스 토큰 발급 메서드
    public String getAccessToken(String authorizationCode) {
        log.info("authorizationCode: {}", authorizationCode);
        String tokenUrl = "https://kauth.kakao.com/oauth/token";

        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("grant_type", "authorization_code");
        parameters.add("client_id", restApiKey);
        parameters.add("redirect_uri", redirectUri);
        parameters.add("code", authorizationCode);
        if (clientSecret != null && !clientSecret.isEmpty()) {
            parameters.add("client_secret", clientSecret);
        }

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(parameters, headers);

        ResponseEntity<String> response = restTemplate.postForEntity(tokenUrl, request, String.class);

        try {
            JsonNode jsonNode = objectMapper.readTree(response.getBody());
            return jsonNode.get("access_token").asText();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // 사용자 정보 가져오기 메서드
    public JsonNode getUserInfo(String accessToken) {
        log.info("accessToken: {}", accessToken);
        String url = "https://kapi.kakao.com/v2/user/me";

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + accessToken);

        HttpEntity<String> entity = new HttpEntity<>(headers);

        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);

        try {
            return objectMapper.readTree(response.getBody());
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void logout(HttpSession session) {
        int userId = (int) session.getAttribute("userId");
        UserDTO getUser = userRepository.findAccessTokenByUserId(userId);
        String accessToken = getUser.getAccessToken();
        String url = "https://kapi.kakao.com/v1/user/unlink";

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + accessToken);

        HttpEntity<String> entity = new HttpEntity<>(headers);

        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);

        log.info("logout response: {}", response);
    }
}

