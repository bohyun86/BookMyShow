package com.itwillbs.domain;

public class MusicalFileDTO {
	
	private String file_name;
	private String upload_path;
	private String uuid;

	/**
	 * @return the file_name
	 */
	public String getFile_name() {
		return file_name;
	}
	/**
	 * @param file_name the file_name to set
	 */
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	
	/**
	 * @return the uuid
	 */
	public String getUuid() {
		return uuid;
	}
	/**
	 * @param uuid the uuid to set
	 */
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	/**
	 * @return the upload_path
	 */
	public String getUpload_path() {
		return upload_path;
	}
	/**
	 * @param upload_path the upload_path to set
	 */
	public void setUpload_path(String upload_path) {
		this.upload_path = upload_path;
	}
}
