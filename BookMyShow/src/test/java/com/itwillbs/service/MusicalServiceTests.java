package com.itwillbs.service;

import com.itwillbs.domain.PartnerDTO;
import com.itwillbs.domain.Performance.GenreDTO;
import com.itwillbs.domain.Performance.MusicalDTO;
import com.itwillbs.domain.Performance.VenueDTO;
import com.itwillbs.repository.MusicalRepository;
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
import java.sql.Date;
import java.time.LocalDate;

@ExtendWith(SpringExtension.class)
@Log4j2
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MusicalServiceTests {

    @Autowired
    private MusicalRepository musicalRepository;

    @PersistenceContext
    private EntityManager entityManager;  // EntityManager 주입

    @Test
    @Transactional("jpaTransactionManager")
    @Rollback(false)  // 테스트가 끝난 후 롤백 방지
    public void insertMusicalTest() {

        MusicalDTO musicalDTO = new MusicalDTO();
        PartnerDTO partnerDTO = new PartnerDTO();
        partnerDTO.setPartnerId(1);
        GenreDTO genreDTO = new GenreDTO();
        genreDTO.setGenreId(1);
        VenueDTO venueDTO = new VenueDTO();
        venueDTO.setVenueId(16);

        musicalDTO.setPartnerId(partnerDTO);
        musicalDTO.setTitle("썸데이");
        musicalDTO.setDescription("썸데이 뮤지컬");
        musicalDTO.setStartDate(LocalDate.of(2024, 9, 20));
        musicalDTO.setEndDate(LocalDate.of(2024, 10, 5));
        musicalDTO.setAgeLimit(7);
        musicalDTO.setTotalTime("100");
        musicalDTO.setIntervalTime("0");
        musicalDTO.setGenreId(genreDTO);
        musicalDTO.setVenueId(venueDTO);
        musicalDTO.setTicketsPerPerson(10);
        musicalDTO.setDiscountStartDate(LocalDate.of(2024, 9, 20));
        musicalDTO.setDiscountEndDate(LocalDate.of(2024, 9, 30));
        musicalDTO.setDiscountRate("0.30");
        musicalDTO.setMusicalSponsor("극단 무하");
        musicalDTO.setRequest("");
        musicalDTO.setReserved(false);

        musicalRepository.save(musicalDTO);
        entityManager.flush();

        log.info("MusicalDTO: {}", musicalDTO);


    }
}
