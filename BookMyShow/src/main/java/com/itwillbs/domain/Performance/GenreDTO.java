package com.itwillbs.domain.Performance;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Data
@Entity(name = "Genre")
public class GenreDTO {

    @Id
    @Column(name = "genre_id")
    private int genreId;

    @Column(name = "genre_name")
    private String genreName;

}
