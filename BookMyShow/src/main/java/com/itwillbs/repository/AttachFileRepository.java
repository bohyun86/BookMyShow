package com.itwillbs.repository;

import com.itwillbs.domain.Performance.AttachFileDTO;
import com.itwillbs.domain.Performance.MusicalDTO;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AttachFileRepository extends JpaRepository<AttachFileDTO, Integer> {

    AttachFileDTO findByMusicalIdAndPosterIsTrue(MusicalDTO musicalId);

}
