package com.itwillbs.controller;

import com.itwillbs.domain.Performance.AttachFileDTO;
import com.itwillbs.domain.Performance.PerformanceRegistrationDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.UserServiceImpl;
import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.awt.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

@Controller
@Log4j2
@RequestMapping("/partner/*")
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class PartnerController {

    private final UserServiceImpl userServiceImpl;

    public PartnerController(UserServiceImpl userServiceImpl) {
        this.userServiceImpl = userServiceImpl;
    }

    @GetMapping("/login")
    public String login() {
        return "/partner/login";
    }

    @PostMapping("/loginPro")
    public String loginPro(UserDTO userDTO, HttpSession session) {
        log.info("loginPro: {}", userDTO);
        UserDTO getUser = userServiceImpl.loginPro(userDTO);
        log.info(getUser);
        if (getUser == null) {
            return "redirect:/partner/login";
        } else {
            log.info(getUser);
            session.setAttribute("userId", getUser.getUserId());
            session.setAttribute("userRole", getUser.getUserRole());
            session.setAttribute("userName", getUser.getUserName());
            return "redirect:/partner/main/";
        }
    }


    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/partner/login";
    }


    @GetMapping("/write")
    public String write() {
        return "/partner/write";
    }

    @GetMapping("/status")
    public String status() {
        return "/partner/status";
    }

    @GetMapping("/edit")
    public String edit() {
        return "/partner//edit";
    }


    @GetMapping("/booking")
    public String booking() {
        return "/partner/booking";
    }

    @GetMapping("/settlement")
    public String settlement() {
        return "/partner/settlement";
    }

    @GetMapping("/review")
    public String review() {
        return "/partner/review";
    }

    @GetMapping("/qna")
    public String qna() {
        return "/partner/qna";
    }

    @GetMapping("/qna_write")
    public String qna_write() {
        return "/partner/qna_write";
    }

    @GetMapping("/main")
    public String partnerMain() {
        return "/partner/main";
    }


    @PostMapping(value = "/writePro")
    public void writePro(PerformanceRegistrationDTO performanceRegistrationDTO) {
        log.info("writePro: {}", performanceRegistrationDTO);

        List<AttachFileDTO> list = new ArrayList<>();
        String uploadFolder = System.getProperty("user.home") + File.separator + "upload";

        File uploadPath = new File(uploadFolder, getFolder());
        log.info("uploadPath: {}", uploadPath);
        
        if (!uploadPath.exists()) {
            uploadPath.mkdirs();
        }

        // 공연 상세정보 이미지 처리
        MultipartFile[] musicalImages = performanceRegistrationDTO.getMusicalImages();

        for (MultipartFile musicalImage : musicalImages) {
            uploadImages(musicalImage, uploadPath, list, false);
        }

        // 공연 포스터 이미지 처리
        MultipartFile musicalPost = performanceRegistrationDTO.getMusicalPost();
        uploadImages(musicalPost, uploadPath, list, true);

    }

    private void uploadImages(MultipartFile musicalImage, File uploadPath, List<AttachFileDTO> list, boolean isPoster) {
        AttachFileDTO attachFileDTO = new AttachFileDTO();

        log.info("musicalImage: {}", musicalImage);
        String musicalImageFileName = musicalImage.getOriginalFilename();
        log.info("musicalImageFilename: {}", musicalImageFileName);
        attachFileDTO.setFileName(musicalImageFileName);
        musicalImageFileName.substring(musicalImageFileName.lastIndexOf("\\") + 1);
        UUID uuids = UUID.randomUUID();
        musicalImageFileName = uuids + "_" + musicalImageFileName;

        log.info("only file name: {}", musicalImageFileName);

        try {
            File saveFile = new File(uploadPath, musicalImageFileName);
            musicalImage.transferTo(saveFile);

            attachFileDTO.setUuid(uuids.toString());
            attachFileDTO.setUploadPath(getFolder());
            attachFileDTO.setPoster(isPoster);

            list.add(attachFileDTO);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }




    private String getFolder() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Date date = new Date();

        String str = sdf.format(date);

        return str.replace("-", File.separator);
    }

}
