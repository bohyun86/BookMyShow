package com.itwillbs.repository;

import com.itwillbs.domain.Performance.PerformanceDTO;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PerformanceRepository extends JpaRepository<PerformanceDTO, Integer> {
}
