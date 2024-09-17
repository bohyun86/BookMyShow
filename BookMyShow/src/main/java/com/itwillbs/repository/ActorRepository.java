package com.itwillbs.repository;

import com.itwillbs.domain.Performance.ActorDTO;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ActorRepository extends JpaRepository<ActorDTO, Integer> {
}
