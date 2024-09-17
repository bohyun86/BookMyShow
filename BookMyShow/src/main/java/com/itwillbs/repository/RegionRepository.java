package com.itwillbs.repository;

import com.itwillbs.domain.Performance.RegionDTO;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RegionRepository extends JpaRepository<RegionDTO, Integer> {

    RegionDTO findRegionByRegionName(String regionName);
    RegionDTO findByRegionId(String regionId);

}
