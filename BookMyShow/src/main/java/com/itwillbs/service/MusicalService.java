
package com.itwillbs.service;

import java.time.LocalDate;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.MusicalDAO;
import com.itwillbs.domain.MusicalDTO;
import com.itwillbs.domain.MusicalDetatilDTO;
import com.itwillbs.domain.MusicalFileDTO;
import com.itwillbs.domain.MusicalMainDTO;
import com.itwillbs.domain.PerformanceDetailDTO;


@Service
public class MusicalService {

	@Autowired
	private MusicalDAO musicalDAO;
	
	
	public List<MusicalMainDTO> getMusical_Page(MusicalMainDTO musicalMainDTO) {
		
		
		return  musicalDAO.getMusical_Page(musicalMainDTO);
			
	}


	public com.itwillbs.domain.Performance.MusicalDTO getMusicalByTitle(String findKeyword) {
		System.out.println("MusicalService getMusicalByTitle::"+findKeyword);
		return musicalDAO.getMusicalByTitle(findKeyword);
	}
//��Ʈ���ʾ��̵�� �˻�
	public List<com.itwillbs.domain.Performance.MusicalDTO> getMusicalByPartnerId(String findKeyword) {
		System.out.println("MusicalService getMusicalByPartnerId::"+findKeyword);
		return musicalDAO.getMusicalByPartnerId(findKeyword);
	}
	public void updateMusicalApproval(int approved) {
		// TODO Auto-generated method stub
		System.out.println("MusicalService updateMusicalApproval::"+approved);
		 musicalDAO.updateMusicalApproval(approved);
	}
	public com.itwillbs.domain.Performance.MusicalDTO getMusical(String title) {
		// TODO Auto-generated method stub
		System.out.println("MusicalService getMusical::"+title);
		return musicalDAO.getMusical(title);
	}

	public MusicalDetatilDTO getMusicalDetail(String musical_id) {
		
		return musicalDAO.getMusicalDetail(musical_id);
		
	}

	public List<PerformanceDetailDTO> getPerformance_date(String musical_id) {
		
		return musicalDAO.getPerformance_date(musical_id);
	}


	public List<MusicalFileDTO> getMusicalFile(String musical_id) {
		
		return musicalDAO.getMusicalFile(musical_id);
	}


	public List<String> getSelectableDates(String musical_id) {
		 List<PerformanceDetailDTO> performanceList = musicalDAO.getPerformance_date(musical_id);

	        // performance_date를 yyyy-MM-dd 형식으로 변환하여 List<String>으로 반환
	        return performanceList.stream()
	                .map(performance -> performance.getPerformance_date().toLocalDate().toString())  // LocalDate로 변환 후 yyyy-MM-dd 포맷으로 반환
	                .collect(Collectors.toList());
	}

	
	
}


