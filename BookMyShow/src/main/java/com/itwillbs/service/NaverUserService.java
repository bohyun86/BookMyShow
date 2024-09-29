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
public class NaverUserService {

    private UserRepository userRepository;
    private MemberRepository memberRepository;

    @PersistenceContext
    private EntityManager entityManager;

    // 사용자 정보 저장 또는 업데이트 메서드
    @Transactional
    public Map<String, Object> saveOrUpdateUser(JsonNode userInfo, String accessToken) {
        JsonNode naverAccount = userInfo.path("response");
        log.info("naverAccount: {}", naverAccount);
        String name = naverAccount.path("name").asText();
        String accountEmail = naverAccount.path("email").asText(null); // 선택 사항
        String phoneNumber = naverAccount.path("mobile").asText(null);
        phoneNumber = phoneNumber.replace("-", "");
        UserDTO user = userRepository.findByPhoneNumberOrEmail(phoneNumber, accountEmail);
        // 기존회원 여부 상태 저장

        if (user != null && user.getOauth().equals("naver")) {
            userRepository.updateAccessToken(accessToken, user.getUserId());
            return Map.of("user", user, "isUser", true);
        } else {
            user = new UserDTO();
            user.setUserName(getUserName("naver"));
            user.setPassword("");
            user.setEmail(accountEmail);
            user.setPhoneNumber(phoneNumber);
            user.setName(name);
            user.setOauth("naver");
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
