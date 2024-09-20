package com.itwillbs.domain.Performance;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;

import javax.persistence.*;

@Data
@Entity(name = "AttachFile")
public class AttachFileDTO {

    @Column(name = "file_name")
    private String fileName;

    @Column(name = "upload_path")
    private String uploadPath;

    @Id
    private String uuid;

    @Column(name = "is_poster")
    private boolean isPoster;

    @ManyToOne
    @JoinColumn(name = "musical_id")
    @JsonBackReference
    private MusicalDTO musicalId;

}
