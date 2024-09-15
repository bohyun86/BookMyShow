package com.itwillbs.domain.Performance;

import lombok.Data;

@Data
public class AttachFileDTO {

    private String fileName;
    private String uploadPath;
    private String uuid;
    private boolean isPoster;
    private int musicalId;

}
