package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.SupportDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SupportNoticeDTO;

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
		return supportDAO.getNoticeList(pageDTO);
	}
	
}
