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
public class NaverLoginService {

    private final RestTemplate restTemplate;
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Autowired
    private UserRepository userRepository;

    // 애플리케이션의 REST API 키와 Redirect URI를 주입받습니다.
    @Value("#{naverProperties['naver.restApiKey']}")
    private String restApiKey;

    @Value("#{naverProperties['naver.redirectUri']}")
    private String redirectUri;

    @Value("#{naverProperties['naver.clientSecret']}")
    private String clientSecret;

    public NaverLoginService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    // 액세스 토큰 발급 메서드
    public String getAccessToken(String authorizationCode, String state) {
        log.info("authorizationCode: {}", authorizationCode);
        String tokenUrl = "https://nid.naver.com/oauth2.0/token";

        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("grant_type", "authorization_code");
        parameters.add("client_id", restApiKey);
        parameters.add("redirect_uri", redirectUri);
        parameters.add("code", authorizationCode);
        parameters.add("state", state);
        parameters.add("client_secret", clientSecret);

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
        String url = "https://openapi.naver.com/v1/nid/me";

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

        // 네이버 연동 해제 URL 생성
        String url = "https://nid.naver.com/oauth2.0/token"
                + "?grant_type=delete"
                + "&client_id=" + restApiKey
                + "&client_secret=" + clientSecret
                + "&access_token=" + accessToken;

        // 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED); // POST 요청 시 헤더에 ContentType 설정
        HttpEntity<String> entity = new HttpEntity<>(headers);

        // 요청 전송 및 응답 받기
        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);

        // 응답 결과 로그 출력
        log.info("logout response: {}", response);
    }
}

