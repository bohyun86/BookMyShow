package com.itwillbs.service;

import com.itwillbs.domain.partner.PartnerDTO;
import com.itwillbs.domain.Performance.*;
import com.itwillbs.domain.partner.PartnerStatusDTO;
import com.itwillbs.mapper.PartnerMapper;
import com.itwillbs.repository.*;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
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
    private final AttachFIleTempRepository attachFIleTempRepository;

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
    public void registerPerformance(PerformanceTempDTO performanceRegistrationDTO, List<AttachFileDTO> list) {

        log.info("performanceRegistrationDTO: {}", performanceRegistrationDTO);

        // 1. 공연장 테이블 저장 (먼저 venue 저장 후 venueId 사용)
        VenueDTO venueDTO = new VenueDTO();
        venueDTO.setVenueName(performanceRegistrationDTO.getVenueTitle());
        venueDTO.setRegionId(regionRepository.findRegionByRegionName(performanceRegistrationDTO.getRegionName()));
        venueDTO.setPostalCode(performanceRegistrationDTO.getPostCode());
        venueDTO.setAddress(performanceRegistrationDTO.getBasicAddress());
        venueDTO.setDetailAddress(performanceRegistrationDTO.getDetailAddress());
        venueDTO.setTotalSeat(performanceRegistrationDTO.getTotalSeat());

        // Venue 저장 후 venueId 반환
        venueRepository.save(venueDTO);

        entityManager.flush();

        log.info("venueDTO: {}", venueDTO);

        // 2. 뮤지컬 테이블 저장 (저장된 venueId 사용)
        MusicalDTO musicalDTO = new MusicalDTO();
        musicalDTO.setPartnerId(partnerRepository.findPartnerByPartnerId(performanceRegistrationDTO.getPartnerId()));
        musicalDTO.setTitle(performanceRegistrationDTO.getTitle());
        musicalDTO.setDescription(performanceRegistrationDTO.getDescription());
        musicalDTO.setStartDate(performanceRegistrationDTO.getStartDate());
        musicalDTO.setEndDate(performanceRegistrationDTO.getEndDate());
        musicalDTO.setAgeLimit(performanceRegistrationDTO.getAgeLimit());
        musicalDTO.setTotalTime(performanceRegistrationDTO.getTotalTime());
        musicalDTO.setIntervalTime(performanceRegistrationDTO.getIntervalTime());
        musicalDTO.setGenreId(genreRepository.findGenreByGenreId(performanceRegistrationDTO.getGenreId()));
        musicalDTO.setVenueId(venueDTO); // 생성된 venueId 설정
        musicalDTO.setTicketsPerPerson(performanceRegistrationDTO.getTicketsPerPerson());
        musicalDTO.setDiscountStartDate(performanceRegistrationDTO.getDiscountStartDate());
        musicalDTO.setDiscountEndDate(performanceRegistrationDTO.getDiscountEndDate());
        musicalDTO.setDiscountRate(performanceRegistrationDTO.getDiscountRate());
        musicalDTO.setMusicalSponsor(performanceRegistrationDTO.getMusicalSponsor());
        musicalDTO.setRequest(performanceRegistrationDTO.getRequest());
        musicalDTO.setReserved(performanceRegistrationDTO.isReserved());

        // Musical 저장 후 musicalId 반환
        musicalRepository.save(musicalDTO);

        entityManager.flush();

        // 이후 테이블 수정시 사용할 임시저장
        performanceRegistrationDTO.setMusicalId(musicalDTO.getMusicalId());
        performanceTempRepository.save(performanceRegistrationDTO);

        entityManager.flush();

        log.info("musicalDTO: {}", musicalDTO);

        log.info("list: {}", list);

        // 3. 첨부파일 테이블 저장
        for (AttachFileDTO attachFileDTO : list) {
            attachFileDTO.setMusicalId(musicalDTO);
        }

        attachFileRepository.saveAll(list);



        // 4. 공연일정, start_date ~ end_date 까지 날짜별로 저장
        // 5. 티켓가격 테이블 저장

        // startDate와 endDate를 LocalDate로 변환
        LocalDate startDate = performanceRegistrationDTO.getStartDate();
        LocalDate endDate = performanceRegistrationDTO.getEndDate();


        // 공연 일정을 하루씩 증가시키면서 저장
        for (LocalDate date = startDate; date.isBefore(endDate); date = date.plusDays(1)) {
            // 각 날짜별로 공연 저장 로직 추가
            PerformanceDTO performance = new PerformanceDTO();
            performance.setPerformanceDate(date); // 날짜 설정
            performance.setMusicalId(musicalDTO); // 저장된 musicalId 사용
            performance.setVenueId(venueDTO); // 저장된 venueId 사용

            // 공연 정보를 DB에 저장 (Repository 또는 다른 로직 사용)
            performanceRepository.save(performance);

            entityManager.flush();

            String[] seatClassId = Arrays.stream(performanceRegistrationDTO.getClasses().split(",")).map(String::trim).toArray(String[]::new);
            String[] price = Arrays.stream(performanceRegistrationDTO.getPrice().split(",")).map(String::trim).toArray(String[]::new);
            String[] numberOfSeats = Arrays.stream(performanceRegistrationDTO.getNumberOfSeats().split(",")).map(String::trim).toArray(String[]::new);

            for (int i = 0; i < seatClassId.length; i++) {
                // 각 티켓가격별로 저장 로직 추가
                TicketPriceDTO ticketPrice = new TicketPriceDTO();
                ticketPrice.setPerformanceId(performance);
                ticketPrice.setSeatClassId(Integer.parseInt(seatClassId[i]));
                ticketPrice.setPrice(Integer.parseInt(price[i]));
                ticketPrice.setCapacity(Integer.parseInt(numberOfSeats[i]));

                // 티켓가격 정보를 DB에 저장 (Repository 또는 다른 로직 사용)
                ticketPriceRepository.save(ticketPrice);
            }

            // 콘솔 출력 (테스트용)
            System.out.println("Saved performance for date: " + date);
        }

        // 6. 배우 테이블 저장
        String[] actorNames = Arrays.stream(performanceRegistrationDTO.getActorList().split(",")).map(String::trim).toArray(String[]::new);
        List<ActorDTO> actorList = new ArrayList<>();

        for (String actor : actorNames) {
            ActorDTO actorDTO = new ActorDTO();
            actorDTO.setName(actor);
            actorDTO.setMusicalId(musicalDTO);

            actorList.add(actorDTO);
        }

        actorRepository.saveAll(actorList);
    }


    public Page<PartnerStatusDTO> getMusicalsByPartnerId(int partnerId, int page, int size) {
        PartnerDTO partnerDTO = partnerRepository.findPartnerByPartnerId(partnerId);

        // Pageable 객체 생성: 페이지 번호와 크기, 정렬 기준을 설정
        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());

        // 페이지네이션된 MusicalDTO 리스트 가져오기
        Page<MusicalDTO> musicalDTOPage = musicalRepository.findMusicalsByPartnerId(partnerDTO, pageable);

        // PartnerStatusDTO 리스트 생성
        List<PartnerStatusDTO> partnerStatusDTOList = new ArrayList<>();

        // musicalNumber 계산: 전체 개수에서 현재 페이지의 첫 번째 항목 번호 계산
        int totalElements = (int) musicalDTOPage.getTotalElements();
        int musicalNumber = totalElements - (page * size); // 현재 페이지의 시작 번호 계산

        // 페이지 내의 MusicalDTO 데이터를 PartnerStatusDTO로 변환
        for (MusicalDTO musicalDTO : musicalDTOPage.getContent()) {
            PartnerStatusDTO partnerStatusDTO = new PartnerStatusDTO();
            partnerStatusDTO.setMusicalId(musicalDTO.getMusicalId());
            partnerStatusDTO.setMusicalNumber(musicalNumber--);
            partnerStatusDTO.setMusicalName(musicalDTO.getTitle());
            partnerStatusDTO.setStartDate(musicalDTO.getStartDate());
            partnerStatusDTO.setEndDate(musicalDTO.getEndDate());

            // createdAt 포맷팅 처리
            String createdAt = musicalDTO.getCreatedAt().toString();
            String formattedCreatedAt = createdAt.substring(0, createdAt.length() - 2);
            partnerStatusDTO.setCreatedAt(formattedCreatedAt);

            partnerStatusDTO.setApprovalStatus(musicalDTO.isApproved());

            // 리스트에 추가
            partnerStatusDTOList.add(partnerStatusDTO);
        }

        // PartnerStatusDTO 리스트를 페이지 객체로 변환
        Page<PartnerStatusDTO> partnerStatusDTOPage = new PageImpl<>(partnerStatusDTOList, pageable, musicalDTOPage.getTotalElements());

        return partnerStatusDTOPage;
    }

}

