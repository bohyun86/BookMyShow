package com.itwillbs.repository;

import com.itwillbs.domain.Performance.PerformanceTempDTO;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PerformanceTempRepository extends JpaRepository<PerformanceTempDTO, Integer> {
    PerformanceTempDTO findByMusicalId(int musicId);

    void deleteByMusicalId(int musicalId);
}
