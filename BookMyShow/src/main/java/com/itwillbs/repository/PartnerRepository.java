package com.itwillbs.repository;


import com.itwillbs.domain.Partner;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PartnerRepository extends JpaRepository<Partner, Integer> {
     Partner findPartnerByUserId(int userId);
}
