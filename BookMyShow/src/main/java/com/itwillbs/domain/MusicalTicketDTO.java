package com.itwillbs.domain;

import java.math.BigDecimal;

public class MusicalTicketDTO {

	private int musical_id;
	private String dateValue;
	private String class_name;
	private int capacity;
	private BigDecimal discount_rate;
	private String price;
	
	
	/**
	 * @return the musical_id
	 */
	public int getMusical_id() {
		return musical_id;
	}
	/**
	 * @param musical_id the musical_id to set
	 */
	public void setMusical_id(int musical_id) {
		this.musical_id = musical_id;
	}
	/**
	 * @return the dateValue
	 */
	public String getDateValue() {
		return dateValue;
	}
	/**
	 * @param dateValue the dateValue to set
	 */
	public void setDateValue(String dateValue) {
		this.dateValue = dateValue;
	}
	
	/**
	 * @return the class_name
	 */
	public String getClass_name() {
		return class_name;
	}
	/**
	 * @param class_name the class_name to set
	 */
	public void setClass_name(String class_name) {
		this.class_name = class_name;
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
	 * @return the discount_rate
	 */
	public BigDecimal getDiscount_rate() {
		return discount_rate;
	}
	/**
	 * @param discount_rate the discount_rate to set
	 */
	public void setDiscount_rate(BigDecimal discount_rate) {
		this.discount_rate = discount_rate;
	}
	/**
	 * @return the price
	 */
	public String getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(String price) {
		this.price = price;
	}
}
