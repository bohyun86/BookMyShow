package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminPaymentDTO {
	
	private int payment_id;
	private Timestamp payment_date;
	private String payment_method;
	private int payment_amount;
	private String status;
	private Timestamp created_at;
	private Timestamp updated_at;
	private double refund_amount;
	private int used_points;
	private  String refund_type;
	

}
