package com.itwillbs.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.PartnerDAO;
import com.itwillbs.domain.PartnerDTO;
import com.itwillbs.domain.PartnerQnaDTO;
import com.itwillbs.domain.UserDTO;


@Service
public class PartnersServiceAdmin {

	@Autowired
	private PartnerDAO partnerDAO;
	
	
	
    public UserDTO getPartnersy(String id, String email, String phoneNumber, String name, String password,String createdAt, String user_role) {
		System.out.println("partnersServiceAdmin getPartnersy::"+id);
		System.out.println("partnersServiceAdmin getPartnersy id::"+id);
		System.out.println("partnersServiceAdmin getPartnersy email::"+email);
		System.out.println("partnersServiceAdmin getPartnersy phone_number::"+phoneNumber);
		System.out.println("partnersServiceAdmin getPartnersy name::"+name);
		System.out.println("partnersServiceAdmin getPartnersy password::"+password);
		System.out.println("partnersServiceAdmin getPartnersy createdAt::"+createdAt);
		System.out.println("partnersServiceAdmin getPartnersy user_role::"+user_role);
		return partnerDAO.getPartnersy(id,email,phoneNumber,name,password,createdAt,user_role);
	}


	public PartnerDTO getPartnersy(String id) {
		return partnerDAO.getPartnersy(id);
	} //파트너검색
	
	public List<PartnerQnaDTO> getPartneQna(String id) {
	    System.out.println("PartnersServiceAdmin::" +  id);
	    return partnerDAO.getPartneQna(id); 
	}

//	파트너문의
	 public List<PartnerQnaDTO> selectAllPartnerQnaList() {
		    return partnerDAO.selectAllPartnerQnaList();
		}


	public List<PartnerQnaDTO> PartnerQnaAnser(int inquiryId) {
		// TODO Auto-generated method stub
		return partnerDAO.PartnerQnaAnser(inquiryId);
	}//문의내용


	public void qnaAnswerOK(int inquiryId) {
		 System.out.println("PartnersServiceAdmin"+inquiryId);
		  partnerDAO.qnaAnswerOK(inquiryId);
	}









	


	

		

	
    
	
	
	
}
