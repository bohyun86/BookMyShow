package com.itwillbs.service.main;

import com.itwillbs.domain.Performance.*;
import com.itwillbs.domain.main.MainNewCarouselDTO;
import com.itwillbs.repository.*;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.ServletContext;
import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

@Service
@Log4j2
@AllArgsConstructor
public class MainService {

    private MusicalRepository musicalRepository;
    private AttachFileRepository attachFileRepository;


    @Transactional
    public List<MainNewCarouselDTO> getMainNewCarouselDTOs() {
        List<MusicalDTO> musicalDTOs = musicalRepository.findTop8ByApprovedOrderByCreatedAtDesc(true);

        List<MainNewCarouselDTO> mainNewCarouselDTOs = new ArrayList<>();

        // 가격이 가장 낮은 티켓 가격을 가져온다.
        for (MusicalDTO musicalDTO : musicalDTOs) {
            MainNewCarouselDTO mainNewCarouselDTO = new MainNewCarouselDTO();
            AttachFileDTO attachFileDTO = attachFileRepository.findByMusicalIdAndIsPoster(musicalDTO, true);

            int price = musicalDTO.getPerformances().get(0).getTicketPriceList().stream().map(TicketPriceDTO::getPrice).min(Integer::compareTo).orElse(0);
            String region = musicalDTO.getVenueId().getRegionId().getRegionName();
            log.info("price, region: {}, {}", price, region);
            double discountRate = Double.parseDouble(musicalDTO.getDiscountRate());
            int intDiscountRate = (int) (discountRate * 100);
            // 100원 단위로 반올림하여 반환한다.
            int discountPrice = (int) Math.round(price * (1 - discountRate) / 100) * 100;
            DecimalFormat formatter = new DecimalFormat("#,###");
            String formattedPrice = formatter.format(discountPrice);

            // 기존에 저장된 파일경로가 리눅스, 맥, 윈도우 등 다를 수 있으므로 File.separator를 사용하여 경로를 조정한다.

            String uploadPath = attachFileDTO.getUploadPath();
            log.info("uploadPath: {}", uploadPath);

            // 1. 윈도우에서 저장된 경로인 경우
            if (attachFileDTO.getUploadPath().contains("\\")) {
                uploadPath = uploadPath.replace("\\", File.separator);
                // 2. 리눅스, 맥에서 저장된 경로인 경우
            } else if (attachFileDTO.getUploadPath().contains("/")) {
                uploadPath = uploadPath.replace("/", File.separator);
            }

            mainNewCarouselDTO.setPostFilePath("resources" + File.separator + "upload" + File.separator + attachFileDTO.getUploadPath() + File.separator + attachFileDTO.getUuid() + "_" + attachFileDTO.getFileName());
            mainNewCarouselDTO.setArea(region);
            mainNewCarouselDTO.setCategory(musicalDTO.getGenreId().getGenreName());
            mainNewCarouselDTO.setTitle(musicalDTO.getTitle());
            mainNewCarouselDTO.setDiscountRate(intDiscountRate + "");
            mainNewCarouselDTO.setPrice(formattedPrice);

            log.info("mainNewCarouselDTO: {}", mainNewCarouselDTO);
            mainNewCarouselDTOs.add(mainNewCarouselDTO);
        }


        return mainNewCarouselDTOs;
    }

}