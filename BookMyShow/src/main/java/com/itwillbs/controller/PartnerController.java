package com.itwillbs.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.domain.Performance.AttachFile2DTO;
import com.itwillbs.domain.Performance.AttachFileDTO;
import com.itwillbs.domain.Performance.PerformanceTempDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.partner.PartnerDTO;
import com.itwillbs.domain.partner.PartnerStatusDTO;
import com.itwillbs.service.PartnerService;
import com.itwillbs.service.UserServiceImpl;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@Log4j2
@RequestMapping("/partner/*")
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class PartnerController implements ServletContextAware {

    private final UserServiceImpl userServiceImpl;
    private final PartnerService partnerService;
    private ServletContext servletContext;
    private ObjectMapper objectMapper;

    @Autowired
    public PartnerController(UserServiceImpl userServiceImpl, PartnerService partnerService) {
        this.userServiceImpl = userServiceImpl;
        this.partnerService = partnerService;
    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }


    @GetMapping("/login")
    public String login() {
        return "/partner/login";
    }

    @PostMapping("/loginPro")
    public String loginPro(UserDTO userDTO, HttpSession session) {
        log.info("loginPro: {}", userDTO);
        UserDTO getUser = userServiceImpl.loginPro(userDTO);
        log.info("getUser: {}", getUser);
        if (getUser == null) {
            return "redirect:/partner/login";
        } else {
            log.info(getUser);
            session.setAttribute("userId", getUser.getUserId());
            session.setAttribute("userRole", getUser.getUserRole());
            session.setAttribute("userName", getUser.getUserName());
            PartnerDTO partnerDTO = partnerService.getPartner2(getUser.getUserId());
            log.info("partner {}", partnerDTO);
            session.setAttribute("partnerId", partnerDTO.getPartnerId());
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
    public String status(HttpSession session, Model model,
                         @RequestParam(defaultValue = "1") int page,
                         @RequestParam(defaultValue = "5") int size) {

        int partnerId = (int) session.getAttribute("partnerId");

        Page<PartnerStatusDTO> musicalPage = partnerService.getMusicalsByPartnerId(partnerId, page - 1, size);
        model.addAttribute("musicalPage", musicalPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", musicalPage.getTotalPages());


        return "/partner/status";
    }

    @GetMapping("/edit")
    public String edit(@RequestParam int musicalId, Model model) {
        PerformanceTempDTO performanceTempDTO = partnerService.getPerformanceTemp(musicalId);
        List<AttachFile2DTO> attachFileDTO = partnerService.getAttachFileByMusicalId(musicalId);

        log.info("attachFileDTO: {}", attachFileDTO);

        model.addAttribute("performanceTempDTO", performanceTempDTO);
        model.addAttribute("attachFileDTO", attachFileDTO);

        return "/partner/edit";
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

    @GetMapping("/deletePro")
    public String deletePro(@RequestParam int musicalId) {
        log.info("deletePro: {}", musicalId);
        partnerService.deletePerformance(musicalId);
        return "redirect:/partner/status";
    }


    @PostMapping(value = "/writePro")
    public String writePro(PerformanceTempDTO performancetempDTO) {
        log.info("writePro: {}", performancetempDTO);

        List<AttachFileDTO> list = new ArrayList<>();
        String uploadFolder = servletContext.getRealPath("/resources/upload");

        File uploadPath = new File(uploadFolder, getFolder());
        log.info("uploadPath: {}", uploadPath);
        
        if (!uploadPath.exists()) {
            uploadPath.mkdirs();
        }

        // 공연 상세정보 이미지 처리
        MultipartFile[] musicalImages = performancetempDTO.getMusicalImages();

        for (MultipartFile musicalImage : musicalImages) {
            uploadImages(musicalImage, uploadPath, list, false);
        }

        // 공연 포스터 이미지 처리
        MultipartFile musicalPost = performancetempDTO.getMusicalPost();
        uploadImages(musicalPost, uploadPath, list, true);

        // 임시 공연 등록

        partnerService.registerPerformance(performancetempDTO, list);

        return "redirect:/partner/status";
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
