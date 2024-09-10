package com.itwillbs.controller;

import lombok.extern.log4j.Log4j2;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.MemberDTO;

@Controller
@Log4j2
@RequestMapping("/admin")
public class AdminController {

    @GetMapping("/main")
    public String home() {
        log.info("admin main success");



        return "/admin/main";
    }


    @GetMapping("/search")
    public String search() {
    	log.info("admin search success");
    	return "/admin/search";
    }





    @GetMapping("/submit")
    public String submit() {
    	log.info("admin submit success");
    	return "/admin/submit";
    }





    @GetMapping("/edit")
    public String edit() {
    	log.info("admin edit success");
    	return "/admin/edit";
    }

    @GetMapping("/editPro")
    public String editPro() {
    	log.info("admin editPro success");


    	return "/admin/editPro";
    }





    @GetMapping("/partner")
    public String partner() {
    	log.info("admin partner success");
    	return "/admin/partner";
    }
    //寃��깋�쓣 �늻瑜대㈃ 諛묒뿉 �젙蹂닿� �뼚�빞�븿 由ъ뒪�듃以�  �꽑�깮�빐�빞 �뙆�듃�꼫 �닔�젙�럹�씠吏��뒗 �럹�씠吏�寃곌낵 �돺寃� 蹂대젮怨� �엫�떆濡� 寃쎈줈�꽕�젙
    //�옄諛붿뒪�겕由쏀듃 �뜥�빞�븷�벏

    @GetMapping("/partnerPro")
    public String partnerPro() {
    	log.info("admin partnerPro success");
    	return "/admin/partnerPro";
    }

    @GetMapping("/partner_qna")
    public String partner_qna() {
    	log.info("admin partner_qna success");
    	return "/admin/partner_qna";
    }

    @GetMapping("/partner_settlement")
    public String partner_settlement() {
    	log.info("admin partner_settlement success");
    	return "/admin/partner_settlement";
    }



    @GetMapping("/member")
    public String member() {
    	log.info("admin member success");
    	return "/admin/member";
    }

 //寃��깋�쓣 �늻瑜대㈃ 諛묒뿉 �젙蹂닿� �쑉怨� 由ъ뒪�듃以� �쉶�썝�쓣 �꽑�깮�빐�빞 �쉶�썝 �닔�젙�럹�씠吏��뒗 �럹�씠吏�寃곌낵 �돺寃� 蹂대젮怨� �엫�떆濡� 寃쎈줈�꽕�젙
  //�옄諛붿뒪�겕由쏀듃 �뜥�빞�븷�벏

    @GetMapping("/memberPro")
    public String memberPro() {
    	log.info("admin memberPro success");
    	return "/admin/memberPro";
    }

    @GetMapping("/booking")
    public String booking() {
    	log.info("admin booking success");
    	return "/admin/booking";
    }

    @GetMapping("/payment")
    public String payment() {
    	log.info("admin payment success");
    	return "/admin/payment";
    }



    @GetMapping("/support")
    public String support() {
    	log.info("admin support success");
    	return "/admin/support";
    }













}//
