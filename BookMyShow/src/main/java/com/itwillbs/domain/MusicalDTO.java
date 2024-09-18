package com.itwillbs.domain;

import java.util.Date;

public class MusicalDTO {



		private int musical_id;
		private String title;
		private String description;
		private Date start_date;
		private Date end_date;
		private int age_limit;
		private int partner_id;
		private int genre_id;
		private String genre_name;
		private int venue_id;
		private int total_duration;
		private int interverl_duration;
		private String muscial_sponsor;
		private int approved;
		private Date discount_start_date;
		private Date discount_end_date;
		private float discount_rate;
		private int reserved;
		private int tickets_per_person;
		private String file_name;
		private String upload_path;
		private String uuid;
		
		
		
		public String getGenre_name() {
			return genre_name;
		}
		public void setGenre_name(String genre_name) {
			this.genre_name = genre_name;
		}
		public String getFile_name() {
			return file_name;
		}
		public void setFile_name(String file_name) {
			this.file_name = file_name;
		}
		public String getUpload_path() {
			return upload_path;
		}
		public void setUpload_path(String upload_path) {
			this.upload_path = upload_path;
		}
		public String getUuid() {
			return uuid;
		}
		public void setUuid(String uuid) {
			this.uuid = uuid;
		}
		public int getMusical_id() {
			return musical_id;
		}
		public void setMusical_id(int musical_id) {
			this.musical_id = musical_id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public Date getStart_date() {
			return start_date;
		}
		public void setStart_date(Date start_date) {
			this.start_date = start_date;
		}
		public Date getEnd_date() {
			return end_date;
		}
		public void setEnd_date(Date end_date) {
			this.end_date = end_date;
		}
		public int getAge_limit() {
			return age_limit;
		}
		public void setAge_limit(int age_limit) {
			this.age_limit = age_limit;
		}
		public int getPartner_id() {
			return partner_id;
		}
		public void setPartner_id(int partner_id) {
			this.partner_id = partner_id;
		}
		public int getGenre_id() {
			return genre_id;
		}
		public void setGenre_id(int genre_id) {
			this.genre_id = genre_id;
		}
		public int getVenue_id() {
			return venue_id;
		}
		public void setVenue_id(int venue_id) {
			this.venue_id = venue_id;
		}
		public int getTotal_duration() {
			return total_duration;
		}
		public void setTotal_duration(int total_duration) {
			this.total_duration = total_duration;
		}
		public int getInterverl_duration() {
			return interverl_duration;
		}
		public void setInterverl_duration(int interverl_duration) {
			this.interverl_duration = interverl_duration;
		}
		public String getMuscial_sponsor() {
			return muscial_sponsor;
		}
		public void setMuscial_sponsor(String muscial_sponsor) {
			this.muscial_sponsor = muscial_sponsor;
		}
		public int getApproved() {
			return approved;
		}
		public void setApproved(int approved) {
			this.approved = approved;
		}
		public Date getDiscount_start_date() {
			return discount_start_date;
		}
		public void setDiscount_start_date(Date discount_start_date) {
			this.discount_start_date = discount_start_date;
		}
		public Date getDiscount_end_date() {
			return discount_end_date;
		}
		public void setDiscount_end_date(Date discount_end_date) {
			this.discount_end_date = discount_end_date;
		}
		public float getDiscount_rate() {
			return discount_rate;
		}
		public void setDiscount_rate(float discount_rate) {
			this.discount_rate = discount_rate;
		}
		public int getReserved() {
			return reserved;
		}
		public void setReserved(int reserved) {
			this.reserved = reserved;
		}
		public int getTickets_per_person() {
			return tickets_per_person;
		}
		public void setTickets_per_person(int tickets_per_person) {
			this.tickets_per_person = tickets_per_person;
		}
		
		
		
	}


