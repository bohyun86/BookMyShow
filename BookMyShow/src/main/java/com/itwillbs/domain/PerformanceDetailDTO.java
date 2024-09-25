package com.itwillbs.domain;

import java.time.LocalDateTime;

public class PerformanceDetailDTO {
	
	private int performance_id;
	private LocalDateTime performance_date;
	private Integer musical_id;
	private Integer venue_id;
	private int capacity;
	//capacity = capacity - tickets_sold
	private int seat_class_id;
	
	
	/**
	 * @return the seat_class_id
	 */
	public int getSeat_class_id() {
		return seat_class_id;
	}
	/**
	 * @param seat_class_id the seat_class_id to set
	 */
	public void setSeat_class_id(int seat_class_id) {
		this.seat_class_id = seat_class_id;
	}
	/**
	 * @return the capacity
	 */
	public int getCapacity() {
		return capacity;
	}
	/**
	 * @param capacity the capacity to set
	 */
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	/**
	 * @return the performance_id
	 */
	public int getPerformance_id() {
		return performance_id;
	}
	/**
	 * @param performance_id the performance_id to set
	 */
	public void setPerformance_id(int performance_id) {
		this.performance_id = performance_id;
	}
	/**
	 * @return the performance_date
	 */
	public LocalDateTime getPerformance_date() {
		return performance_date;
	}
	/**
	 * @param performance_date the performance_date to set
	 */
	public void setPerformance_date(LocalDateTime performance_date) {
		this.performance_date = performance_date;
	}
	/**
	 * @return the musical_id
	 */
	public Integer getMusical_id() {
		return musical_id;
	}
	/**
	 * @param musical_id the musical_id to set
	 */
	public void setMusical_id(Integer musical_id) {
		this.musical_id = musical_id;
	}
	/**
	 * @return the venue_id
	 */
	public Integer getVenue_id() {
		return venue_id;
	}
	/**
	 * @param venue_id the venue_id to set
	 */
	public void setVenue_id(Integer venue_id) {
		this.venue_id = venue_id;
	}
	
	
	
	
}
