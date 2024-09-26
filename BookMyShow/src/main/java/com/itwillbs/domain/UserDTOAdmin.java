package com.itwillbs.domain;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Data
public class UserDTOAdmin {
	
	//소연쓰는중

    private int user_id;

    private String user_name;

    private String password;
    private String email;

    private String phone_number;
    private String name;

    private String user_role;

    private String created_at;

    private String updated_at;

    private boolean isEncoded;

    private String tempPassword;

    private Timestamp tempPasswordCreatedAt;
    
    
    
    //파트너
private int partner_id;
	
	private String company_name;
	
	private String business_id;
	
	private String account_number;
	 
	 
	private int partner_status;
	
	private String bank_name;
	
	private String account_owner;
	
	private int approved;
	
	//partnerqna
	
	private int inquiry_id;
	
	private String inquiry_type;
	
	private String title;
	
	private String content;
	
	
	
	private int answered;
	
	private String answer_content;
	
	
	//booking
	private int booking_id;
	private Timestamp booking_date;
	private String status;
	private int musical_id;
	private int member_id;
	private int ticket_count;
	private int performance_id;
	
	
	
//bookseat
	private int booked_seat_id;
	private String seat_number;
	private int seat_class_id;
	
	//reivew
	
	private int review_id;
	private double rating;
	
	//musical
	private String musical_sponsor;
	private String venue_id;
	
	private int total_duration;
	private int interval_duration;
	
	private BigDecimal discount_rate;
	private Date discount_start_date;
	private Date discount_end_date;
	private String price;

	private int review_count;
	
	private Integer reserved;
	
	//PerformanceTemp

	private String description;
	private Timestamp start_date;
	private Timestamp end_date;
	private int age_limit;
	private String total_time;
	private Timestamp interval_time;
	private int genre_id;
	private int tickets_per_person;
	private String venue_title;
	
	
	//Venue
	private String venue_name;
	private String address;
	private int capacity;
	private String region_id;
	private String postal_code;
	private String detail_address;
	private String public_venue_id;
	
	
	//payment
	private int payment_id;
	private Timestamp payment_date;
	private String payment_method;
	private int payment_amount;
	private double refund_amount;
	private int used_points;
	private String refund_type;
	
	
	@Override
	public String toString() {
		return "UserDTOAdmin [user_id=" + user_id + ", user_name=" + user_name + ", password=" + password + ", email="
				+ email + ", phone_number=" + phone_number + ", name=" + name + ", user_role=" + user_role
				+ ", created_at=" + created_at + ", updated_at=" + updated_at + ", isEncoded=" + isEncoded
				+ ", tempPassword=" + tempPassword + ", tempPasswordCreatedAt=" + tempPasswordCreatedAt
				+ ", partner_id=" + partner_id + ", company_name=" + company_name + ", business_id=" + business_id
				+ ", account_number=" + account_number + ", partner_status=" + partner_status + ", bank_name="
				+ bank_name + ", account_owner=" + account_owner + ", approved=" + approved + ", inquiry_id="
				+ inquiry_id + ", inquiry_type=" + inquiry_type + ", title=" + title + ", content=" + content
				+ ", answered=" + answered + ", answer_content=" + answer_content + ", booking_id=" + booking_id
				+ ", booking_date=" + booking_date + ", status=" + status + ", musical_id=" + musical_id
				+ ", member_id=" + member_id + ", ticket_count=" + ticket_count + ", performance_id=" + performance_id
				+ ", booked_seat_id=" + booked_seat_id + ", seat_number=" + seat_number + ", seat_class_id="
				+ seat_class_id + ", review_id=" + review_id + ", rating=" + rating + ", musical_sponsor="
				+ musical_sponsor + ", venue_id=" + venue_id + ", total_duration=" + total_duration
				+ ", interval_duration=" + interval_duration + ", discount_rate=" + discount_rate
				+ ", discount_start_date=" + discount_start_date + ", discount_end_date=" + discount_end_date
				+ ", price=" + price + ", review_count=" + review_count + ", reserved=" + reserved + ", description="
				+ description + ", start_date=" + start_date + ", end_date=" + end_date + ", age_limit=" + age_limit
				+ ", total_time=" + total_time + ", interval_time=" + interval_time + ", genre_id=" + genre_id
				+ ", tickets_per_person=" + tickets_per_person + ", venue_title=" + venue_title + ", venue_name="
				+ venue_name + ", address=" + address + ", capacity=" + capacity + ", region_id=" + region_id
				+ ", postal_code=" + postal_code + ", detail_address=" + detail_address + ", public_venue_id="
				+ public_venue_id + ", payment_id=" + payment_id + ", payment_date=" + payment_date
				+ ", payment_method=" + payment_method + ", payment_amount=" + payment_amount + ", refund_amount="
				+ refund_amount + ", used_points=" + used_points + ", refund_type=" + refund_type + "]";
	}
	
	
	

	
	
	

	
	
	




	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


}


