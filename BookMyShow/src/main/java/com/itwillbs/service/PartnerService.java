package com.itwillbs.service;

import com.itwillbs.domain.Performance.*;
import com.itwillbs.domain.partner.PartnerDTO;
import com.itwillbs.domain.partner.PartnerStatusDTO;
import com.itwillbs.mapper.PartnerMapper;
import com.itwillbs.repository.*;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.io.File;
import java.util.ArrayList;
import java.util.List;



@Service
@Log4j2
@AllArgsConstructor
public class PartnerService implements PartnerMapper {

    private final PartnerMapper partnerMapper;
    private final PartnerRepository partnerRepository;
    private final RegionRepository regionRepository;
    private final VenueRepository venueRepository;
    private final MusicalRepository musicalRepository;
    private final GenreRepository genreRepository;
    private final AttachFileRepository attachFileRepository;
    private final PerformanceRepository performanceRepository;
    private final TicketPriceRepository ticketPriceRepository;
    private final ActorRepository actorRepository;
    private final PerformanceTempRepository performanceTempRepository;
    private final AdminService adminService;

    @PersistenceContext
    private EntityManager entityManager;  // EntityManager 주입

    @Override
    public PartnerDTO getPartner(PartnerDTO partnerDTO) {
        log.info("getPartner: {}", partnerDTO);
        return partnerMapper.getPartner(partnerDTO);
    }

    // JPA 사용
    public PartnerDTO getPartner2(int userId) {
        log.info("userId: {}", userId);
        PartnerDTO partnerDTO = partnerRepository.findPartnerByUserId(userId);
        return partnerDTO;
    }

    @Transactional("jpaTransactionManager")
    public void registerPerformance(PerformanceTempDTO performanceTempDTO, List<AttachFileDTO> list) {

        log.info("performanceTempDTO: {}", performanceTempDTO);

        // 1. 공연장 테이블 저장 (먼저 venue 저장 후 venueId 사용)
        VenueDTO venueDTO = new VenueDTO();
        venueDTO.setVenueName(performanceTempDTO.getVenueTitle());
        venueDTO.setRegionId(regionRepository.findRegionByRegionName(performanceTempDTO.getRegionName()));
        venueDTO.setPostalCode(performanceTempDTO.getPostCode());
        venueDTO.setAddress(performanceTempDTO.getBasicAddress());
        venueDTO.setDetailAddress(performanceTempDTO.getDetailAddress());
        venueDTO.setTotalSeat(performanceTempDTO.getTotalSeat());
        venueDTO.setPublicVenueId(performanceTempDTO.getPublicVenueId());

        if (performanceTempDTO.getVenueId() != 0 ) {
            log.info("존재하는 venueId: {}", performanceTempDTO.getVenueId());
            venueDTO.setVenueId(performanceTempDTO.getVenueId());
        }

        // Venue 저장 후 venueId 반환
        venueRepository.save(venueDTO);

        entityManager.flush();

        performanceTempDTO.setVenueId(venueDTO.getVenueId());

        log.info("venueDTO: {}", venueDTO);

        // 2. 뮤지컬 테이블 저장 (저장된 venueId 사용)
        MusicalDTO musicalDTO = new MusicalDTO();
        if (performanceTempDTO.getMusicalId() != 0) {
            musicalDTO.setMusicalId(performanceTempDTO.getMusicalId());
        }
        musicalDTO.setPartnerId(partnerRepository.findPartnerByPartnerId(performanceTempDTO.getPartnerId()));
        musicalDTO.setTitle(performanceTempDTO.getTitle());
        musicalDTO.setDescription(performanceTempDTO.getDescription());
        musicalDTO.setStartDate(performanceTempDTO.getStartDate());
        musicalDTO.setEndDate(performanceTempDTO.getEndDate());
        musicalDTO.setAgeLimit(performanceTempDTO.getAgeLimit());
        musicalDTO.setTotalTime(performanceTempDTO.getTotalTime());
        musicalDTO.setIntervalTime(performanceTempDTO.getIntervalTime());
        musicalDTO.setGenreId(genreRepository.findGenreByGenreId(performanceTempDTO.getGenreId()));
        musicalDTO.setVenueId(venueDTO); // 생성된 venueId 설정
        musicalDTO.setTicketsPerPerson(performanceTempDTO.getTicketsPerPerson());
        musicalDTO.setDiscountStartDate(performanceTempDTO.getDiscountStartDate());
        musicalDTO.setDiscountEndDate(performanceTempDTO.getDiscountEndDate());
        musicalDTO.setDiscountRate(performanceTempDTO.getDiscountRate());
        musicalDTO.setMusicalSponsor(performanceTempDTO.getMusicalSponsor());
        musicalDTO.setRequest(performanceTempDTO.getRequest());
        musicalDTO.setReserved(performanceTempDTO.isReserved());

        // Musical 저장 후 musicalId 반환
        musicalRepository.save(musicalDTO);

        entityManager.flush();

        // 이후 테이블 수정시 사용할 임시테이블 저장
        performanceTempDTO.setMusicalId(musicalDTO.getMusicalId());
        performanceTempRepository.save(performanceTempDTO);

        entityManager.flush();

        log.info(list.isEmpty());

        // 3. 첨부파일 테이블 저장
        if (!list.isEmpty()) {
            if (attachFileRepository.findAttachFileByMusicalId(musicalDTO) != null) {
                attachFileRepository.deleteAllByMusicalId(musicalDTO);
            }
            for (AttachFileDTO attachFileDTO : list) {
                attachFileDTO.setMusicalId(musicalDTO);
            }

            attachFileRepository.saveAll(list);

            entityManager.flush();
        }
    }


    public Page<PartnerStatusDTO> getMusicalsByPartnerId(int partnerId, int page, int size) {
        PartnerDTO partnerDTO = partnerRepository.findPartnerByPartnerId(partnerId);

        // Pageable 객체 생성: 페이지 번호와 크기, 정렬 기준을 설정
        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());

        // 페이지네이션된 MusicalDTO 리스트 가져오기
        Page<MusicalDTO> musicalDTOPage = musicalRepository.findMusicalsByPartnerId(partnerDTO, pageable);

        // PartnerStatusDTO 리스트 생성
        List<PartnerStatusDTO> partnerStatusDTOList = new ArrayList<>();

        return adminService.getMusicalStatus(page, size, musicalDTOPage, partnerStatusDTOList, pageable);
    }

    public PerformanceTempDTO getPerformanceTemp(int musicalId) {
        log.info("getPerformanceTemp: {}", musicalId);
        return performanceTempRepository.findByMusicalId(musicalId);
    }

    @Transactional
    public List<AttachFile2DTO> getAttachFileByMusicalId(int musicalId) {
        log.info("getAttachFileByMusicalId: {}", musicalId);

        List<AttachFileDTO> attachFileDTOList = musicalRepository.findMusicalByMusicalId(musicalId).getAttachFileDTOList();
        // 1. 윈도우에서 저장된 경로인 경우

        List<AttachFile2DTO> attachFile2DTOList = new ArrayList<>();

        for (AttachFileDTO attachFile: attachFileDTOList) {
            String uploadPath = attachFile.getUploadPath();
            if (attachFile.getUploadPath().contains("\\")) {
                uploadPath = uploadPath.replace("\\", File.separator);
                // 2. 리눅스, 맥에서 저장된 경로인 경우
            } else if (attachFile.getUploadPath().contains("/")) {
                uploadPath = uploadPath.replace("/", File.separator);
            }
            AttachFile2DTO attachFile2DTO = new AttachFile2DTO();
            if (attachFile.isPoster()) {
                attachFile2DTO.setUuid("poster");
            } else {
                attachFile2DTO.setUuid("description");
            }
            attachFile2DTO.setFileName(attachFile.getFileName());
            attachFile2DTO.setFilePath("resources" + File.separator + "upload" + File.separator + attachFile.getUploadPath() + File.separator + attachFile.getUuid() + "_" + attachFile.getFileName());
            attachFile2DTOList.add(attachFile2DTO);
        }
        return attachFile2DTOList;
    }

    @Transactional("jpaTransactionManager")
    public void deletePerformance(int musicalId) {

        // 1. 첨부파일 삭제
        attachFileRepository.deleteAllByMusicalId(musicalRepository.findMusicalByMusicalId(musicalId));

        entityManager.flush();

        // 2. 뮤지컬 삭제
        MusicalDTO musicalDTO = musicalRepository.findMusicalByMusicalId(musicalId);
        int venueId = musicalDTO.getVenueId().getVenueId();
        musicalRepository.deleteById(musicalId);

        entityManager.flush();

        // 3. 공연장 삭제
        venueRepository.deleteById(venueId);

        entityManager.flush();

        // 4. 임시저장 삭제
        performanceTempRepository.deleteByMusicalId(musicalId);

        entityManager.flush();
    }
}

