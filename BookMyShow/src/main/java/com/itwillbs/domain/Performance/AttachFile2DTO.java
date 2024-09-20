package com.itwillbs.domain.Performance;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;

import javax.persistence.*;

@Data
public class AttachFile2DTO {

    private String fileName;

    private String uploadPath;

    private String uuid;

    private boolean isPoster;

    private MusicalDTO musicalId;

    private String filePath;

}
