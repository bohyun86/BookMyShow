package com.itwillbs.controller;


import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.Map;
import java.util.Objects;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@ExtendWith(SpringExtension.class)
@Log4j2
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@WebAppConfiguration
@RequiredArgsConstructor
public class UserControllerTests {

    private final WebApplicationContext ctx;

    private MockMvc mockMvc;

    @BeforeEach
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    }

    @Test
    public void testExist() {
        log.info(ctx);
    }

    @Test
    public void testInsertUser() throws Exception {
        String resultPage = mockMvc.perform(
                MockMvcRequestBuilders.post("/user/joinPro")
                        .param("userId", "0")
                        .param("password", "test")
                        .param("email", "test")
                        .param("name", "test")
                        .param("userRole", "member")
                        .param("phoneNumber", "test"))
                .andReturn().getModelAndView().getViewName();

        log.info(resultPage);
    }

    @Test
    public void testGetUser() throws Exception {
        // GET 요청을 보내고 JSON 응답을 받음
        String responseContent = mockMvc.perform(
                        MockMvcRequestBuilders.get("/login/checkUserId")
                                .param("userName", "admin")
                                .accept(MediaType.APPLICATION_JSON))  // JSON 형식의 응답을 기대
                .andExpect(status().isOk())  // 상태 코드 200 확인
                .andExpect(content().contentType(MediaType.APPLICATION_JSON))  // 응답의 Content-Type 확인
                .andReturn().getResponse().getContentAsString();  // 응답 본문을 문자열로 가져옴

        log.info(responseContent);  // 응답 내용을 로깅

        // JSON 응답이 {"result":true}인지 확인
        assertEquals("{\"result\":true}", responseContent);
    }



}
