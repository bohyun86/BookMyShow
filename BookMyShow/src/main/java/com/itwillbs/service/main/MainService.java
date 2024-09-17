package com.itwillbs.service.main;

import com.itwillbs.domain.Performance.*;
import com.itwillbs.domain.main.MainNewCarouselDTO;
import com.itwillbs.repository.*;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class MainService {

    private MusicalRepository musicalRepository;
    private TicketPriceRepository ticketPriceRepository;
    private AttachFileRepository attachFileRepository;
    private PerformanceRepository performanceRepository;
    private VenueRepository venueRepository;
    private RegionRepository regionRepository;

    public List<MainNewCarouselDTO> findMusicalDTOSTop8ByOrderByCreatedAtDesc() {
        List<MusicalDTO> musicalDTOs = musicalRepository.findTop8ByApprovedOrderByCreatedAtDesc(true);

        List<MainNewCarouselDTO> mainNewCarouselDTOs = new ArrayList<>();
        String uploadFolder = System.getProperty("user.home") + File.separator + "upload";

        // 가격이 가장 낮은 티켓 가격을 가져온다.
        for (MusicalDTO musicalDTO : musicalDTOs) {
            MainNewCarouselDTO mainNewCarouselDTO = new MainNewCarouselDTO();
            AttachFileDTO attachFileDTO = attachFileRepository.findByMusicalIdAndPosterIsTrue(musicalDTO);

            int price = ticketPriceDTO.getPrice();
            String region = musicalDTO.getVenueId().getRegionId().getRegionName();

            // 기존에 저장된 파일경로가 리눅스, 맥, 윈도우 등 다를 수 있으므로 File.separator를 사용하여 경로를 조정한다.

            String uploadPath = attachFileDTO.getUploadPath();

            // 1. 윈도우에서 저장된 경로인 경우
            if (attachFileDTO.getUploadPath().contains("\\")) {
                uploadPath = uploadPath.replace("\\", File.separator);
                // 2. 리눅스, 맥에서 저장된 경로인 경우
            } else if (attachFileDTO.getUploadPath().contains("/")) {
                uploadPath = uploadPath.replace("/", File.separator);
            }

            mainNewCarouselDTO.setPostFilePath(uploadFolder + File.separator + attachFileDTO.getUploadPath() + File.separator + attachFileDTO.getUuid() + "_" + attachFileDTO.getFileName());
            mainNewCarouselDTO.setArea(musicalDTO.get);
        }


        return mainNewCarouselDTOs;
    }

}
