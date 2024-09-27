package com.itwillbs.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.dao.PartnerDAO;
import com.itwillbs.domain.PartnerDTO;
import com.itwillbs.domain.PartnerDTO2;
import com.itwillbs.domain.PartnerQnaDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.UserDTOAdmin;


@Service
public class PartnersServiceAdmin {

	@Autowired
	private PartnerDAO partnerDAO;
	
	
	
	
	
	
    public UserDTOAdmin getPartnersy(String company_name,String id, String email, String phoneNumber, String name, String password,String createdAt, String user_role) {
		System.out.println("partnersServiceAdmin getPartnersy::"+id);
		System.out.println("partnersServiceAdmin getPartnersy id::"+id);
		System.out.println("partnersServiceAdmin getPartnersy email::"+email);
		System.out.println("partnersServiceAdmin getPartnersy phone_number::"+phoneNumber);
		System.out.println("partnersServiceAdmin getPartnersy name::"+name);
		System.out.println("partnersServiceAdmin getPartnersy password::"+password);
		System.out.println("partnersServiceAdmin getPartnersy createdAt::"+createdAt);
		System.out.println("partnersServiceAdmin getPartnersy user_role::"+user_role);
		return partnerDAO.getPartnersy(company_name,id,email,phoneNumber,name,password,createdAt,user_role);
	} //회원검색


	public PartnerDTO2 getPartnersy(String id, String password,String company_name, String name,String business_id, String account_number,String bankName, String email,String createdAt) {
		System.out.println();
		return partnerDAO.getPartnersy(id,password,company_name,name,business_id,account_number,bankName,email,createdAt);
	} //파트너검색
	
	
//	public List<PartnerQnaDTO> getPartneQna(String id) {
//	    System.out.println("PartnersServiceAdmin::" +  id);
//	    return partnerDAO.getPartneQna(id); 
//	}


	
	//	파트너문의
	 public List<PartnerQnaDTO> selectAllPartnerQnaList() {
		    return partnerDAO.selectAllPartnerQnaList();
		}

// 파트너 문의 답변완료 0->1 표시
	 public List<PartnerQnaDTO> PartnerQnaAnser(int inquiry_id,String answer_content) {
		 
		 return partnerDAO.PartnerQnaAnser(inquiry_id,answer_content);
	 } 

	 
	//답변 저장
	public void qnaAnswerOK(int inquiryId) {
		 System.out.println("PartnersServiceAdmin"+inquiryId);
		  partnerDAO.qnaAnswerOK(inquiryId);
	} 

	 public void qnaAnswerContentOK(String answerContent,int inquiryId) {

		 partnerDAO.qnaAnswerContentOK(answerContent,inquiryId);
	} 




//	public List<PartnerDTO2> partnersumbitList() {
//		// TODO Auto-generated method stub
//		return partnerDAO.partnersumbitList();
//	} //파트너 승인페이지 리스트
//	
	public List<PartnerDTO2> partnersumbitList() {
		// TODO Auto-generated method stub
		return partnerDAO.partnersumbitList();
	} //파트너 승인페이지 리스트



	public List<PartnerDTO2> partnersumbitConfirm(int partner_id) {
		// TODO Auto-generated method stub
		return partnerDAO.partnersumbitConfirm(partner_id);
	} 
	//파트너 승인대기 상세정보


	public void partnerConfirm(int partner_id) {
		// TODO Auto-generated method stub
		partnerDAO.partnerConfirm(partner_id);
	}
	//파트너승인수락


	public void partner_delete(int partner_id) {
		// TODO Auto-generated method stub
		partnerDAO.partner_delete(partner_id);
	}
	//파트너 삭제


	public List<UserDTOAdmin> memberQnaList() {
		// TODO Auto-generated method stub
		return partnerDAO.memberQnaList();
	}
	//회원문의


	public List<UserDTOAdmin> memberQnaAnser(int inquiry_id, String answer_content) {
		// TODO Auto-generated method stub
		return partnerDAO.memberQnaAnser(inquiry_id,answer_content);
	}
	//회원문의 답변


	public List<PartnerDTO2> partner_settlement(int user_id) {
		// TODO Auto-generated method stub
		return partnerDAO.partner_settlement(user_id);
	}
//파트너 정산


	
	
	public void editPartner(int user_id) {
		// TODO Auto-generated method stub
		 partnerDAO.editPartner(user_id);
	}




	

	










	


	

		

	
    
	
	
	
}
