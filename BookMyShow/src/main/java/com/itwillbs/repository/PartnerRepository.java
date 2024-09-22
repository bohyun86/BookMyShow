package com.itwillbs.repository;


import com.itwillbs.domain.partner.PartnerDTO;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PartnerRepository extends JpaRepository<PartnerDTO, Integer> {
     PartnerDTO findPartnerByUserId(int userId);

     PartnerDTO findPartnerByPartnerId(int partnerId);
}
