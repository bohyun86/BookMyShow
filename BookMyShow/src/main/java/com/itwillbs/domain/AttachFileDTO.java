package com.itwillbs.domain;

import lombok.Data;

@Data
public class AttachFileDTO {
	private String fileName;
	private String uploadPath;
	private String uuid;
	private Boolean isPoster;
	private Integer musicalId;
}
