package com.itwillbs.controller;

import com.itwillbs.service.PartnerService;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;


@ExtendWith(SpringExtension.class)
@Log4j2
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@WebAppConfiguration
public class PartnerControllerTests {

    @Autowired
    private PartnerService partnerService;

    @Test
    public void getPartnerTest() {
        log.info(partnerService.getPartner2(2));
    }


}
