package com.itwillbs.repository;


import com.itwillbs.domain.Performance.MusicalDTO;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MusicalRepository extends JpaRepository<MusicalDTO, Integer> {

    // findTop8ByApprovedAndOrderByCreatedAtDesc
    List<MusicalDTO> findTop8ByApprovedOrderByCreatedAtDesc(boolean approved);
}
