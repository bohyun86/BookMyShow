package com.itwillbs.service;

import com.itwillbs.domain.Performance.*;
import com.itwillbs.domain.partner.PartnerStatusDTO;
import com.itwillbs.repository.*;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Slf4j
@Service
@AllArgsConstructor
public class AdminService {

    private final MusicalRepository musicalRepository;
    private final UserRepository userRepository;
    private final EntityManager entityManager;
    private final PerformanceRepository performanceRepository;
    private final TicketPriceRepository ticketPriceRepository;
    private final ActorRepository actorRepository;
    private final PerformanceTempRepository performanceTempRepository;


    public Page<PartnerStatusDTO> getMusicals(int page, int size) {

        // Pageable 객체 생성: 페이지 번호와 크기, 정렬 기준을 설정
        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());

        // 페이지네이션된 MusicalDTO 리스트 가져오기
        Page<MusicalDTO> musicalDTOPage = musicalRepository.findAll(pageable);

        // PartnerStatusDTO 리스트 생성
        List<PartnerStatusDTO> partnerStatusDTOList = new ArrayList<>();

        return getMusicalStatus(page, size, musicalDTOPage, partnerStatusDTOList, pageable);
    }

    // MusicalDTO 리스트를 Page로 나타낼 수 있도록 변환
    public Page<PartnerStatusDTO> getMusicalStatus(int page, int size, Page<MusicalDTO> musicalDTOPage, List<PartnerStatusDTO> partnerStatusDTOList, Pageable pageable) {
        // musicalNumber 계산: 전체 개수에서 현재 페이지의 첫 번째 항목 번호 계산
        int totalElements = (int) musicalDTOPage.getTotalElements();
        int musicalNumber = totalElements - (page * size); // 현재 페이지의 시작 번호 계산

        log.info("totalElements: {}", totalElements);
        log.info("musicalNumber: {}", musicalNumber);

        // 페이지 내의 MusicalDTO 데이터를 PartnerStatusDTO로 변환
        for (MusicalDTO musicalDTO : musicalDTOPage.getContent()) {
            PartnerStatusDTO partnerStatusDTO = new PartnerStatusDTO();
            partnerStatusDTO.setMusicalId(musicalDTO.getMusicalId());
            partnerStatusDTO.setMusicalNumber(musicalNumber--);
            partnerStatusDTO.setMusicalName(musicalDTO.getTitle());
            partnerStatusDTO.setStartDate(musicalDTO.getStartDate());
            partnerStatusDTO.setEndDate(musicalDTO.getEndDate());
            partnerStatusDTO.setPartnerId(userRepository.findUserByUserId(musicalDTO.getPartnerId().getUserId()).getUserName());
            partnerStatusDTO.setPartnerName(userRepository.findUserByUserId(musicalDTO.getPartnerId().getUserId()).getName());
            partnerStatusDTO.setPhoneNumber(userRepository.findUserByUserId(musicalDTO.getPartnerId().getUserId()).getPhoneNumber());

            // createdAt 포맷팅 처리
            String createdAt = musicalDTO.getCreatedAt().toString();
            String formattedCreatedAt = createdAt.substring(0, createdAt.length() - 2);
            partnerStatusDTO.setCreatedAt(formattedCreatedAt);

            partnerStatusDTO.setApprovalStatus(musicalDTO.isApproved());

            // 리스트에 추가
            partnerStatusDTOList.add(partnerStatusDTO);
        }

        // PartnerStatusDTO 리스트를 페이지 객체로 변환

        return new PageImpl<>(partnerStatusDTOList, pageable, musicalDTOPage.getTotalElements());
    }

    @Transactional("jpaTransactionManager")
    public void approveMusical(int musicalId) {
        MusicalDTO musicalDTO = musicalRepository.findMusicalByMusicalId(musicalId);
        musicalDTO.setApproved(true);

        entityManager.flush();

        PerformanceTempDTO performanceTempDTO = performanceTempRepository.findByMusicalId(musicalId);

        // 4. 공연일정, start_date ~ end_date 까지 날짜별로 저장
        // 5. 티켓가격 테이블 저장

        // startDate와 endDate를 LocalDate로 변환
        LocalDate startDate = performanceTempDTO.getStartDate();
        LocalDate endDate = performanceTempDTO.getEndDate();


        // 공연 일정을 하루씩 증가시키면서 저장
        for (LocalDate date = startDate; date.isBefore(endDate); date = date.plusDays(1)) {
            // 각 날짜별로 공연 저장 로직 추가
            PerformanceDTO performance = new PerformanceDTO();
            performance.setPerformanceDate(date); // 날짜 설정
            performance.setMusicalId(musicalDTO); // 저장된 musicalId 사용
            performance.setVenueId(musicalDTO.getVenueId()); // 저장된 venueId 사용

            // 공연 정보를 DB에 저장 (Repository 또는 다른 로직 사용)
            performanceRepository.save(performance);

            entityManager.flush();

            String[] seatClassId = Arrays.stream(performanceTempDTO.getClasses().split(",")).map(String::trim).toArray(String[]::new);
            String[] price = Arrays.stream(performanceTempDTO.getPrice().split(",")).map(String::trim).toArray(String[]::new);
            String[] numberOfSeats = Arrays.stream(performanceTempDTO.getNumberOfSeats().split(",")).map(String::trim).toArray(String[]::new);

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
        String[] actorNames = Arrays.stream(performanceTempDTO.getActorList().split(",")).map(String::trim).toArray(String[]::new);
        List<ActorDTO> actorList = new ArrayList<>();

        for (String actor : actorNames) {
            ActorDTO actorDTO = new ActorDTO();
            actorDTO.setName(actor);
            actorDTO.setMusicalId(musicalDTO);

            actorList.add(actorDTO);
        }

        actorRepository.saveAll(actorList);
    }
}
