package com.itwillbs.service;

import com.itwillbs.domain.UserDTO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.Random;

@Service
@Log4j2
@AllArgsConstructor
public class EmailService {

    private JavaMailSender mailSender;
    private UserServiceImpl userServiceImpl;

    public boolean sendTempPasswordEmail(UserDTO userDTO) {
        // 임시 비밀번호 생성
        String tempPassword = generateRandomPassword();

        log.info("임시 비밀번호: {}", tempPassword);

        // 이메일 내용 생성
        String subject = "[예매하다] 임시 비밀번호";
        String content = String.format("안녕하세요,\n임시비밀번호는 %s입니다.\n" +
                "로그인 후 비밀번호를 반드시 변경해주세요.", tempPassword);

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");

            helper.setFrom("itwillemailtest@gmail.com");
            helper.setTo(userDTO.getEmail());
            helper.setSubject(subject);
            helper.setText(content);

            mailSender.send(message);

            // 임시 비밀번호를 암호화하여 DB에 저장
            userDTO.setTempPassword(tempPassword);
            boolean result = userServiceImpl.updateUserTempPw(userDTO);

            log.info("EmailService: {}, result: {}", userDTO, result);

            return true;

        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 임시 비밀번호 생성 로직 (6자리 난수)
    private String generateRandomPassword() {
        Random random = new Random();
        return String.valueOf(100000 + random.nextInt(900000));
    }
}
