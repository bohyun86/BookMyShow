package com.itwillbs.repository;

import com.itwillbs.domain.Performance.GenreDTO;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GenreRepository extends JpaRepository<GenreDTO, Integer> {
    GenreDTO findGenreByGenreId(int genreId);
}
