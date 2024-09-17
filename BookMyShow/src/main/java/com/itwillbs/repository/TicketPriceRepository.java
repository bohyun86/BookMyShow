package com.itwillbs.repository;

import com.itwillbs.domain.Performance.TicketPriceDTO;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TicketPriceRepository extends JpaRepository<TicketPriceDTO, Integer> {

}
