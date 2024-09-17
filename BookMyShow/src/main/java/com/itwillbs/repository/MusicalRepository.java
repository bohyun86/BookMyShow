package com.itwillbs.repository;


import com.itwillbs.domain.Performance.MusicalDTO;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MusicalRepository extends JpaRepository<MusicalDTO, Integer> {

}
