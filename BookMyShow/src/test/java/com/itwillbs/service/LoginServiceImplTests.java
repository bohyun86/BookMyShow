package com.itwillbs.service;

import com.itwillbs.domain.UserDTO;
import com.itwillbs.mapper.UserMapper;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@Log4j2
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class LoginServiceImplTests {

    @Autowired
    private UserMapper userMapper;


    @Test
    public void testLoginPro() {
        UserDTO userDTO = new UserDTO();
        userDTO.setUserName("admin");
        userDTO.setPassword("test");

        log.info(userDTO);

        UserDTO getUser = userMapper.loginPro(userDTO);

        log.info(getUser);
    }
}
