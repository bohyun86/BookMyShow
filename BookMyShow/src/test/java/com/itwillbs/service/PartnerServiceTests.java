package com.itwillbs.service;

import com.itwillbs.domain.Performance.AttachFileDTO;
import com.itwillbs.domain.Performance.PerformanceRegistrationDTO;
import com.itwillbs.domain.Performance.RegionDTO;
import com.itwillbs.domain.Performance.VenueDTO;
import com.itwillbs.repository.VenueRepository;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.sql.Timestamp;


@ExtendWith(SpringExtension.class)
@Log4j2
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class PartnerServiceTests {

    @Autowired
    private PartnerService partnerService;

    @Autowired
    private VenueRepository venueRepository;


    @PersistenceContext
    private EntityManager entityManager;  // EntityManager 주입

    @Test
    @Transactional("jpaTransactionManager")
    @Rollback(false)  // 테스트가 끝난 후 롤백 방지
    public void saveVenueTest() {

        VenueDTO venueDTO = new VenueDTO();
        RegionDTO regionDTO = new RegionDTO();

        regionDTO.setRegionId("UNI");
        regionDTO.setRegionName("대학로");

        venueDTO.setVenueName("testVenue");
        venueDTO.setRegionId(regionDTO);
        venueDTO.setPostalCode("12345");
        venueDTO.setAddress("서울시 /**/종로구 대학로 123");
        venueDTO.setDetailAddress("2층");
        venueDTO.setPublicVenueId("12345");
        venueDTO.setTotalSeat(164);
        venueDTO.setCreatedAt(Timestamp.valueOf("2021-09-01 00:00:00"));

        venueRepository.save(venueDTO);

        log.info("venueDTO: {}", venueDTO);


    }

    @Test
    @Transactional("jpaTransactionManager")
    public void erollMusicalTest() {

        /*DTO(musicalId=0, partnerId=1, title=썸데이, description=null, startDate=2024-09-16, endDate=2024-10-09, ageLimit=7, createdAt=null, updatedAt=null, totalTime=100, intervalTime=0, genreId=3, ticketsPerPerson=10, discountStartDate=2024-09-20, discountEndDate=2024-10-05, discountRate=0.30, musicalSponsor=극단 무하, request=, reserved=false, musicalPost=MultipartFile[field="musicalPost", filename=썸데이_포스터.jpg, contentType=image/jpeg, size=16246], musicalImages=[MultipartFile[field="musicalImages", filename=상세설명1.jpg, contentType=image/jpeg, size=64083], MultipartFile[field="musicalImages", filename=상세설명2.jpg, contentType=image/jpeg, size=1298194]], actorId=0, actorList=[김서별, 김여진, 윤환호, 윤진웅, 고샛별, 김지후, 임재혁, 박중리], ticketPriceId=0, classes=[2], price=[15000], numberOfSeats=[164], performanceId=0, performanceDate=null, venueId=null, venueTitle=대학로 무하아트센터, publicVenueId=FC003868, postCode=03088, basicAddress=서울 종로구 이화장길 72, detailAddress=, regionName=대학로, totalSeat=164)*/

        java.util.List<AttachFileDTO> list = new java.util.ArrayList<>();
        AttachFileDTO attachFileDTO = new AttachFileDTO();

        attachFileDTO.setFileName("썸데이_포스터.jpg");
        attachFileDTO.setUploadPath("C:\\upload");
        attachFileDTO.setUuid("12345");

        list.add(attachFileDTO);


        PerformanceRegistrationDTO performanceRegistrationDTO = new PerformanceRegistrationDTO();
        performanceRegistrationDTO.setMusicalId(0);
        performanceRegistrationDTO.setPartnerId(1);
        performanceRegistrationDTO.setTitle("썸데이");
        performanceRegistrationDTO.setStartDate(java.sql.Date.valueOf("2024-09-16"));
        performanceRegistrationDTO.setEndDate(java.sql.Date.valueOf("2024-10-09"));
        performanceRegistrationDTO.setAgeLimit(7);
        performanceRegistrationDTO.setTotalTime("100");
        performanceRegistrationDTO.setGenreId(3);
        performanceRegistrationDTO.setTicketsPerPerson(10);
        performanceRegistrationDTO.setDiscountStartDate(java.sql.Date.valueOf("2024-09-20"));
        performanceRegistrationDTO.setDiscountEndDate(java.sql.Date.valueOf("2024-10-05"));
        performanceRegistrationDTO.setDiscountRate("0.30");
        performanceRegistrationDTO.setMusicalSponsor("극단 무하");
        performanceRegistrationDTO.setActorList(new String[]{"김서별", "김여진", "윤환호", "윤진웅", "고샛별", "김지후", "임재혁", "박중리"});
        performanceRegistrationDTO.setClasses(new int[]{2});
        performanceRegistrationDTO.setPrice(new int[]{15000});
        performanceRegistrationDTO.setNumberOfSeats(new int[]{164});
        performanceRegistrationDTO.setVenueTitle("대학로 무하아트센터");
        performanceRegistrationDTO.setPublicVenueId("FC003868");
        performanceRegistrationDTO.setPostCode("03088");
        performanceRegistrationDTO.setBasicAddress("서울 종로구 이화장길 72");
        performanceRegistrationDTO.setRegionName("대학로");
        performanceRegistrationDTO.setTotalSeat(164);
        performanceRegistrationDTO.setMusicalPost(null);
        performanceRegistrationDTO.setMusicalImages(null);

        partnerService.registerPerformance(performanceRegistrationDTO, list);


    }
}
