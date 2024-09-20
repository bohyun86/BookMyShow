package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.SupportDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SupportNoticeDTO;
import com.itwillbs.domain.SupportinquiryDTO;
import com.itwillbs.domain.SupportqnaDTO;

@Service
public class SupportService {
	
	@Autowired
	private SupportDAO supportDAO;
	
	public void insertNotice(SupportNoticeDTO supportNoticeDTO) {
		System.out.println("SupportService insertNotice()");
		if (supportDAO.getMaxNum() == null) {
			supportNoticeDTO.setNotice_id(1);	
		}else {
			supportNoticeDTO.setNotice_id(supportDAO.getMaxNum() + 1);
		}				
		supportNoticeDTO.setCreated_at(new Timestamp(System.currentTimeMillis()));
		supportDAO.insertNotice(supportNoticeDTO);
	}

	public List<SupportNoticeDTO> getNoticeList(PageDTO pageDTO) {
		System.out.println("SupportService getNoticeList()");
		
		int startRow = (pageDTO.getCurrentPage()-1) * pageDTO.getPageSize() + 1;

		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return supportDAO.getNoticeList(pageDTO);
	}
	
    public int getNoticeCount(PageDTO pageDTO) {
		
		return supportDAO.getNoticeCount(pageDTO);
	} 
	
	public void insertQna(SupportqnaDTO supportqnaDTO) {
		System.out.println("SupportService insertQna()");
		if (supportDAO.getMaxNum1() == null) {
			supportqnaDTO.setFaq_id(1);	
		}else {
			supportqnaDTO.setFaq_id(supportDAO.getMaxNum1() + 1);
		}				
		supportqnaDTO.setCreated_at(new Timestamp(System.currentTimeMillis()));
		supportDAO.insertQna(supportqnaDTO);
	}

	public List<SupportqnaDTO> getQnaList(PageDTO pageDTO) {
		System.out.println("SupportService getQnaList()");
		return supportDAO.getQnaList(pageDTO);
	}
	
	public void insertInquiry(SupportinquiryDTO supportinquiryDTO) {
		System.out.println("SupportService insertQna()");
		if (supportDAO.getMaxNum1() == null) {
			supportinquiryDTO.setInquiry_id(1);	
		}else {
			supportinquiryDTO.setInquiry_id(supportDAO.getMaxNum1() + 1);
		}				
		supportinquiryDTO.setCreated_at(new Timestamp(System.currentTimeMillis()));
		supportDAO.insertInquiry(supportinquiryDTO);
	}

	public List<SupportinquiryDTO> getInList(PageDTO pageDTO) {
		System.out.println("SupportService getInList()");
		return supportDAO.getInList(pageDTO);
	}
	
}
