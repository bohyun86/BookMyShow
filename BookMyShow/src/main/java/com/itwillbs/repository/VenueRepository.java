package com.itwillbs.repository;

import com.itwillbs.domain.Performance.MusicalDTO;
import com.itwillbs.domain.Performance.VenueDTO;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VenueRepository extends JpaRepository<VenueDTO, Integer> {

    VenueDTO findByVenueId(int venueId);
}
