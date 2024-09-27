package com.itwillbs.domain;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;
import org.hibernate.annotations.CascadeType;

@Data
public class PartnerDTO2 {
	
	//소연쓰는중
	//user
	
	private int user_id;
	

	    private String user_name;

	    private String password;
	    private String email;

	    private String phone_number;
	    private String name;

	    private String user_role;

	    private boolean isEncoded;

	    private String tempPassword;

	    private Timestamp tempPasswordCreatedAt;
	    
	    
	    
	//파트너
	
	private int partner_id;
	
	private String company_name;
	
	private String business_id;
	
	private String account_number;
	 
	private String created_at;
	 
	private String updated_at;
	 
	private int partner_status;
	
	private String bank_name;
	
	private String account_owner;
	
	private int approved;
	
	
	//Performance
	private int performance_id;
	private Timestamp performance_date;
	private int musical_id;
	private int venue_id;
	
	//TicketPrice
	private int ticket_price_id;
	private int price;
	private int capacity;
	private int tickets_sold;
	private int revenue;
	private int fee;
	private int settlement_amo;
	private Timestamp settlement_date;
	private int seat_class_id;

	//Settlement
	private int settlement_id;
	private int total_revenue;
	private int settlement_amount;
	
	//뮤지컬
	
	private String title;
	
	
	

	@Override
	public String toString() {
		return "PartnerDTO2 [user_id=" + user_id + ", user_name=" + user_name + ", password=" + password + ", email="
				+ email + ", phone_number=" + phone_number + ", name=" + name + ", user_role=" + user_role
				+ ", isEncoded=" + isEncoded + ", tempPassword=" + tempPassword + ", tempPasswordCreatedAt="
				+ tempPasswordCreatedAt + ", partner_id=" + partner_id + ", company_name=" + company_name
				+ ", business_id=" + business_id + ", account_number=" + account_number + ", created_at=" + created_at
				+ ", updated_at=" + updated_at + ", partner_status=" + partner_status + ", bank_name=" + bank_name
				+ ", account_owner=" + account_owner + ", approved=" + approved + "]";
	}
	
	
	
	
	
	
	 
	
	
	
	
}//
