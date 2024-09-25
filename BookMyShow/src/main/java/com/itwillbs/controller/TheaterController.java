package com.itwillbs.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.nio.charset.StandardCharsets;
import java.util.Objects;

@RestController
@RequestMapping("/theater")
@Log4j2
public class TheaterController {

    private final String serviceKey;

    @Autowired
    public TheaterController(@Qualifier("serviceKey") String serviceKey) {
        this.serviceKey = serviceKey;
    }

    @GetMapping(value = "/theater-info", produces = "application/xml; charset=UTF-8")
    public ResponseEntity<String> getTheaterInfo(@RequestParam String theaterName) {

       log.info("theater: {}", theaterName);

        String url = "http://www.kopis.or.kr/openApi/restful/prfplc?service="
                + serviceKey + "&cpage=1&rows=30&shprfnmfct=" + theaterName;

        // 외부 API 요청
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<byte[]> response = restTemplate.getForEntity(url, byte[].class);  // byte 배열로 응답 받음

        String responseBody = new String(Objects.requireNonNull(response.getBody()), StandardCharsets.UTF_8);

        // MediaType을 수동으로 생성하고 UTF-8 인코딩을 명시
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.setContentType(new MediaType("application", "xml", StandardCharsets.UTF_8));  // Content-Type에 charset=UTF-8 설정

        return new ResponseEntity<>(responseBody, responseHeaders, HttpStatus.OK);
    }


}
