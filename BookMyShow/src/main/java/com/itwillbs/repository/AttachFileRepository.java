package com.itwillbs.repository;

import com.itwillbs.domain.Performance.AttachFileDTO;
import com.itwillbs.domain.Performance.MusicalDTO;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AttachFileRepository extends JpaRepository<AttachFileDTO, Integer> {

    AttachFileDTO findByMusicalIdAndIsPoster(MusicalDTO musicalId, boolean isPoster);

    List<AttachFileDTO> findAttachFileByMusicalId(MusicalDTO musicalId);

    void deleteAllByMusicalId(MusicalDTO musicalByMusicalId);
}
