package com.itwillbs.domain;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;
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
	
	
	
	
	
	


}


