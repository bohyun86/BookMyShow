package com.itwillbs.service;

import com.itwillbs.domain.PartnerDTO;
import com.itwillbs.domain.Performance.*;
import com.itwillbs.mapper.PartnerMapper;
import com.itwillbs.repository.*;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.sql.Date;
import java.time.LocalDate;
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
    public void registerPerformance(PerformanceRegistrationDTO performanceRegistrationDTO, List<AttachFileDTO> list) {

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

            int[] seatClassId = performanceRegistrationDTO.getClasses();
            int[] price = performanceRegistrationDTO.getPrice();
            int[] numberOfSeats = performanceRegistrationDTO.getNumberOfSeats();

            for (int i = 0; i < seatClassId.length; i++) {
                // 각 티켓가격별로 저장 로직 추가
                TicketPriceDTO ticketPrice = new TicketPriceDTO();
                ticketPrice.setPerformanceId(performance);
                ticketPrice.setSeatClassId(seatClassId[i]);
                ticketPrice.setPrice(price[i]);
                ticketPrice.setCapacity(numberOfSeats[i]);

                // 티켓가격 정보를 DB에 저장 (Repository 또는 다른 로직 사용)
                ticketPriceRepository.save(ticketPrice);
            }

            // 콘솔 출력 (테스트용)
            System.out.println("Saved performance for date: " + date);
        }

        // 6. 배우 테이블 저장
        String[] actorNames = performanceRegistrationDTO.getActorList();
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

