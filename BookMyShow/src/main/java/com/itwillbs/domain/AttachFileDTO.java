package com.itwillbs.domain;

import lombok.Data;

@Data
public class AttachFileDTO {
	private String fileName;
	private String uploadPath;
	private String uuid;
	private Boolean isPoster;
	private Integer musicalId;
	
	// postFilePath = "resources" + File.separator + "upload" + File.separator + attachFileDTO.getUploadPath()
	// + File.separator + attachFileDTO.getUuid() + "_" + attachFileDTO.getFileName());
	private String postFilePath;
}
