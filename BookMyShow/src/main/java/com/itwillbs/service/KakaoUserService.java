package com.itwillbs.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.login.MemberDTO;
import com.itwillbs.repository.MemberRepository;
import com.itwillbs.repository.UserRepository;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Map;
import java.util.Random;

@Service
@AllArgsConstructor
@Log4j2
public class KakaoUserService {

    private UserRepository userRepository;
    private MemberRepository memberRepository;

    @PersistenceContext
    private EntityManager entityManager;

    // 사용자 정보 저장 또는 업데이트 메서드
    @Transactional
    public Map<String, Object> saveOrUpdateUser(JsonNode userInfo, String accessToken) {
        JsonNode kakaoAccount = userInfo.path("kakao_account");
        log.info("kakaoAccount: {}", kakaoAccount);
        String name = kakaoAccount.path("name").asText();
        String accountEmail = kakaoAccount.path("email").asText(null); // 선택 사항
        String phoneNumber = kakaoAccount.path("phone_number").asText(null);
        phoneNumber = phoneNumber.replace("-", "").replace("+82 ", "0");
        UserDTO user = userRepository.findByPhoneNumberOrEmail(phoneNumber, accountEmail);
        // 기존회원 여부 상태 저장

        if (user != null && user.getOauth().equals("kakao")) {
            userRepository.updateAccessToken(accessToken, user.getUserId());
            return Map.of("user", user, "isUser", true);
        } else {
            user = new UserDTO();
            user.setUserName(getUserName("kakao"));
            user.setPassword(""); // 비밀번호는 카카오 로그인 사용 시 공백 또는 임의 값
            user.setEmail(accountEmail);
            user.setPhoneNumber(phoneNumber);
            user.setName(name);
            user.setOauth("kakao");
            user.setUserRole("member");
            user.setAccessToken(accessToken);

            log.info("user: {}", user);
            return Map.of("user", user, "isUser", false);
        }
    }



    public String getUserName(String resourceSever) {

        Random random = new Random();
        String randomNum = String.valueOf(random.nextInt(999_999_999));
        String userName = resourceSever + "_" + randomNum;
        if (userRepository.findByUserName(userName) != null) {
            return getUserName(resourceSever);
        }
        return userName;
    }

    @Transactional
    public void save(UserDTO user) {
        userRepository.save(user);

        entityManager.flush();

        MemberDTO member = new MemberDTO();
        member.setUserDTO(user);
        memberRepository.save(member);

        entityManager.flush();
    }
}
