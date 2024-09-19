package com.itwillbs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.PartnerDAO;
import com.itwillbs.domain.UserDTO;

@Service
public class PartnersServiceAdmin {

	@Autowired
	private PartnerDAO partnerDAO;
	
	
    public UserDTO getPartnersy(String id, String email, String phoneNumber, String name, String password, String createdAt) {
		System.out.println("partnersServiceAdmin getPartnersy::"+id);
		System.out.println("partnersServiceAdmin getPartnersy id::"+id);
		System.out.println("partnersServiceAdmin getPartnersy email::"+email);
		System.out.println("partnersServiceAdmin getPartnersy phone_number::"+phoneNumber);
		System.out.println("partnersServiceAdmin getPartnersy name::"+name);
		System.out.println("partnersServiceAdmin getPartnersy password::"+password);
		System.out.println("partnersServiceAdmin getPartnersy createdAt::"+createdAt);
		PartnerDAO partnerDAO = new PartnerDAO();
		return partnerDAO.getPartnersy(id,email,phoneNumber,name,password,createdAt);
	}
	
	
	
	
}
