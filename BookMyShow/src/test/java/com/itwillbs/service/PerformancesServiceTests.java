package com.itwillbs.service;

import com.itwillbs.domain.Performance.*;
import com.itwillbs.repository.PerformanceRepository;
import com.itwillbs.repository.TicketPriceRepository;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.time.LocalDate;

@ExtendWith(SpringExtension.class)
@Log4j2
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

public class PerformancesServiceTests {

    @Autowired
    private PerformanceRepository performanceRepository;

    @Autowired
    private TicketPriceRepository ticketPriceRepository;

    @Test
    @Transactional("jpaTransactionManager")
    @Rollback(false)
    public void insertPerformanceTest() {

        MusicalDTO musicalDTO = new MusicalDTO();
        musicalDTO.setMusicalId(4);

        VenueDTO venueDTO = new VenueDTO();
        venueDTO.setVenueId(11);


        Date startDate = Date.valueOf("2024-09-16");
        Date endDate = Date.valueOf("2024-10-09");
        LocalDate startDateLocale = startDate.toLocalDate();
        LocalDate endDateLocale = endDate.toLocalDate();

        for (LocalDate date = startDateLocale; date.isBefore(endDateLocale); date = date.plusDays(1)) {
            PerformanceDTO performanceDTO = new PerformanceDTO();
            performanceDTO.setMusicalId(musicalDTO);
            performanceDTO.setPerformanceDate(date);
            performanceDTO.setVenueId(venueDTO);
            performanceRepository.save(performanceDTO);
            log.info("performanceDTO: {}", performanceDTO);

            int[] seatClassId = {1, 2, 3, 4};
            int[] price = {10000, 20000, 30000, 40000};
            int[] numberOfSeats = {100, 200, 300, 400};

            for (int i = 0; i < seatClassId.length; i++) {
                // 각 티켓가격별로 저장 로직 추가
                TicketPriceDTO ticketPrice = new TicketPriceDTO();
                ticketPrice.setPerformanceId(performanceDTO);
                ticketPrice.setSeatClassId(seatClassId[i]);
                ticketPrice.setPrice(price[i]);
                ticketPrice.setCapacity(numberOfSeats[i]);

                // 티켓가격 정보를 DB에 저장 (Repository 또는 다른 로직 사용)
                ticketPriceRepository.save(ticketPrice);
                log.info("ticketPrice: {}", ticketPrice);
            }
        }



    }



}
