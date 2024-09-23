package com.itwillbs.dao;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PartnerDTO;
import com.itwillbs.domain.PartnerQnaDTO;
import com.itwillbs.domain.UserDTO;
import com.mysql.cj.x.protobuf.MysqlxCrud.Update;

@Repository
public class PartnerDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.PartnerAdminMapper";
	
	public UserDTO getPartnersy(String company_name,String id, String email, String phoneNumber, String name, String password, String createdAt,String user_role) {
		System.out.println("PartnerDAO getPartnersy Id :::" + id);
		System.out.println("PartnerDAO getPartnersy email :::" + email);
		System.out.println("PartnerDAO getPartnersy phone_number :::" + phoneNumber);
		System.out.println("PartnerDAO getPartnersy name :::" + name);
		System.out.println("PartnerDAO getPartnersy password :::" + password);
		System.out.println("PartnerDAO getPartnersy created_at :::" + createdAt);
		System.out.println("PartnerDAO getPartnersy user_role :::" + user_role);
		return sqlSession.selectOne(namespace+ ".getPartnersy", id);
	}

	
	public PartnerDTO getPartnersy(String id, String password,String company_name, String name,String business_id, String account_number,String bankName, String email,String createdAt) {
		System.out.println("PartnerDAO"+id);
		return sqlSession.selectOne(namespace+".getPartnersy", id);
	}
	
	public List<PartnerQnaDTO> getPartneQna(String  id) {
	    System.out.println("PartnerDAO::" +  id);
	    List<PartnerQnaDTO> result = sqlSession.selectList(namespace + ".getPartneQna", id);
	    System.out.println("Retrieved PartnerQnaDTO List: " + result);

	    return result;
	}
	
	
//	파트너문의
	public List<PartnerQnaDTO> selectAllPartnerQnaList() {
		return sqlSession.selectList(namespace + ".selectPartnerQnaList");
	}




	public void qnaAnswerOK(int inquiryId) {
		sqlSession.update(namespace + ".qnaAnswerOK", inquiryId);
	} 
	
	public void qnaAnswerContentOK(String answerContent ,int inquiryId) {
		 Map<String, Object> params = new HashMap<>();
		    params.put("answerContent", answerContent);  // 답변 내용
		    params.put("inquiryId", inquiryId);  // inquiryId
		    sqlSession.update(namespace + ".qnaAnswerContentOK", params);

	} 


	public List<PartnerQnaDTO> PartnerQnaAnser(int inquiryId,String answerContent) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".PartnerQnaAnser",inquiryId);
	}






	
	

}
;