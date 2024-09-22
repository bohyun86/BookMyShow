

package com.itwillbs.domain;


import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class MusicalDTO {


	
	private Integer musicalId;
    private String title;
    private String description;
    private LocalDate startDate;
    private LocalDate endDate;
    private Integer ageLimit;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private Integer partnerId;
    private Integer genreId;
    private Integer venueId;
    private Integer totalDuration;
    private Integer intervalDuration;
    private String musicalSponsor;
    private Boolean approved;
    private LocalDate discountStartDate;
    private LocalDate discountEndDate;
    private BigDecimal discountRate;
    private String request;
    private Boolean reserved;
    private Integer ticketsPerPerson;
	public Integer getMusicalId() {
		return musicalId;
	}
	public void setMusicalId(Integer musicalId) {
		this.musicalId = musicalId;
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
	public LocalDate getStartDate() {
		return startDate;
	}
	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}
	public LocalDate getEndDate() {
		return endDate;
	}
	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}
	public Integer getAgeLimit() {
		return ageLimit;
	}
	public void setAgeLimit(Integer ageLimit) {
		this.ageLimit = ageLimit;
	}
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}
	public Integer getPartnerId() {
		return partnerId;
	}
	public void setPartnerId(Integer partnerId) {
		this.partnerId = partnerId;
	}
	public Integer getGenreId() {
		return genreId;
	}
	public void setGenreId(Integer genreId) {
		this.genreId = genreId;
	}
	public Integer getVenueId() {
		return venueId;
	}
	public void setVenueId(Integer venueId) {
		this.venueId = venueId;
	}
	public Integer getTotalDuration() {
		return totalDuration;
	}
	public void setTotalDuration(Integer totalDuration) {
		this.totalDuration = totalDuration;
	}
	public Integer getIntervalDuration() {
		return intervalDuration;
	}
	public void setIntervalDuration(Integer intervalDuration) {
		this.intervalDuration = intervalDuration;
	}
	public String getMusicalSponsor() {
		return musicalSponsor;
	}
	public void setMusicalSponsor(String musicalSponsor) {
		this.musicalSponsor = musicalSponsor;
	}
	public Boolean getApproved() {
		return approved;
	}
	public void setApproved(Boolean approved) {
		this.approved = approved;
	}
	public LocalDate getDiscountStartDate() {
		return discountStartDate;
	}
	public void setDiscountStartDate(LocalDate discountStartDate) {
		this.discountStartDate = discountStartDate;
	}
	public LocalDate getDiscountEndDate() {
		return discountEndDate;
	}
	public void setDiscountEndDate(LocalDate discountEndDate) {
		this.discountEndDate = discountEndDate;
	}
	public BigDecimal getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(BigDecimal discountRate) {
		this.discountRate = discountRate;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public Boolean getReserved() {
		return reserved;
	}
	public void setReserved(Boolean reserved) {
		this.reserved = reserved;
	}
	public Integer getTicketsPerPerson() {
		return ticketsPerPerson;
	}
	public void setTicketsPerPerson(Integer ticketsPerPerson) {
		this.ticketsPerPerson = ticketsPerPerson;
	}

	
	
  
	
	
}

