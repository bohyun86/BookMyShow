package com.itwillbs.domain;

import java.math.BigDecimal;
import java.util.Date;


public class MusicalDetatilDTO {

	private int musical_id;
	private String title;
	private int age_limit;
	private String musical_sponsor;
	private String venue_id;
	
	private Date start_date;
	private Date end_date;
	private int total_duration;
	private int interval_duration;
	
	private BigDecimal discount_rate;
	private Date discount_start_date;
	private Date discount_end_date;
	private String price;
	private int tickets_per_person;

	private int review_count;
	private float rating;
	
	private Integer reserved;
	
	
	/**
	 * @return the discount_start_date
	 */
	public Date getDiscount_start_date() {
		return discount_start_date;
	}
	/**
	 * @param discount_start_date the discount_start_date to set
	 */
	public void setDiscount_start_date(Date discount_start_date) {
		this.discount_start_date = discount_start_date;
	}
	/**
	 * @return the discount_end_date
	 */
	public Date getDiscount_end_date() {
		return discount_end_date;
	}
	/**
	 * @param discount_end_date the discount_end_date to set
	 */
	public void setDiscount_end_date(Date discount_end_date) {
		this.discount_end_date = discount_end_date;
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
	 * @return the reserved
	 */
	public Integer getReserved() {
		return reserved;
	}
	/**
	 * @param reserved the reserved to set
	 */
	public void setReserved(Integer reserved) {
		this.reserved = reserved;
	}
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
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the age_limit
	 */
	public int getAge_limit() {
		return age_limit;
	}
	/**
	 * @param age_limit the age_limit to set
	 */
	public void setAge_limit(int age_limit) {
		this.age_limit = age_limit;
	}
	/**
	 * @return the musical_sponsor
	 */
	public String getMusical_sponsor() {
		return musical_sponsor;
	}
	/**
	 * @param musical_sponsor the musical_sponsor to set
	 */
	public void setMusical_sponsor(String musical_sponsor) {
		this.musical_sponsor = musical_sponsor;
	}

	/**
	 * @return the venue_id
	 */
	public String getVenue_id() {
		return venue_id;
	}
	/**
	 * @param venue_id the venue_id to set
	 */
	public void setVenue_id(String venue_id) {
		this.venue_id = venue_id;
	}
	/**
	 * @return the start_date
	 */
	public Date getStart_date() {
		return start_date;
	}
	/**
	 * @param start_date the start_date to set
	 */
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	/**
	 * @return the end_date
	 */
	public Date getEnd_date() {
		return end_date;
	}
	/**
	 * @param end_date the end_date to set
	 */
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	/**
	 * @return the total_duration
	 */
	public int getTotal_duration() {
		return total_duration;
	}
	/**
	 * @param total_duration the total_duration to set
	 */
	public void setTotal_duration(int total_duration) {
		this.total_duration = total_duration;
	}
	/**
	 * @return the interval_duration
	 */
	public int getInterval_duration() {
		return interval_duration;
	}
	/**
	 * @param interval_duration the interval_duration to set
	 */
	public void setInterval_duration(int interval_duration) {
		this.interval_duration = interval_duration;
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
	/**
	 * @return the tickets_per_person
	 */
	public int getTickets_per_person() {
		return tickets_per_person;
	}
	/**
	 * @param tickets_per_person the tickets_per_person to set
	 */
	public void setTickets_per_person(int tickets_per_person) {
		this.tickets_per_person = tickets_per_person;
	}
	
	/**
	 * @return the review_count
	 */
	public int getReview_count() {
		return review_count;
	}
	/**
	 * @param review_count the review_count to set
	 */
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	/**
	 * @return the rating
	 */
	public float getRating() {
		return rating;
	}
	/**
	 * @param rating the rating to set
	 */
	public void setRating(float rating) {
		this.rating = rating;
	}

}
