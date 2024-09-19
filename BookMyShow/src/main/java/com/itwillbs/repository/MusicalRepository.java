package com.itwillbs.repository;


import com.itwillbs.domain.Performance.MusicalDTO;
import com.itwillbs.domain.partner.PartnerDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import java.time.LocalDate;
import java.util.List;

public interface MusicalRepository extends JpaRepository<MusicalDTO, Integer> {

    // findTop8ByApprovedAndOrderByCreatedAtDesc
    List<MusicalDTO> findTop8ByApprovedOrderByCreatedAtDesc(boolean approved);

    List<MusicalDTO> findTop8ByApprovedAndDiscountEndDateAfterOrderByDiscountEndDateDesc(boolean approved, LocalDate now);

    List<MusicalDTO> findMusicalsByPartnerIdOrderByCreatedAtDesc(PartnerDTO partnerId);

    Page<MusicalDTO> findMusicalsByPartnerId(PartnerDTO partnerDTO, Pageable pageable);
}
