package com.itwillbs.service;

import com.itwillbs.dao.MypageDAO;
import com.itwillbs.domain.AttachFileDTO;
import com.itwillbs.domain.BookedSeatsDTO;
import com.itwillbs.domain.BookingDTO;
import com.itwillbs.domain.MusicalDTO;
import com.itwillbs.domain.PaymentDTO;
import com.itwillbs.domain.PerformanceDTO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.io.File;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
@Log4j2
@AllArgsConstructor
public class MypageServiceImpl implements MypageService {

	private MypageDAO mypageDAO;

	@Override
    public BookingDTO getBooking(Integer bookingId) {
		return mypageDAO.getBooking(bookingId);
    }

    @Override
    public MusicalDTO getMusical(Integer bookingId) {
        return mypageDAO.getMusical(bookingId);
    }
    
    @Override
    public AttachFileDTO getAttachFile(Integer bookingId) {
    	AttachFileDTO attachFileDTO = mypageDAO.getAttachFile(bookingId);
    	
    	String uploadPath = attachFileDTO.getUploadPath();
        log.info("uploadPath: {}", uploadPath);

        // 1. 윈도우에서 저장된 경로인 경우
        if (attachFileDTO.getUploadPath().contains("\\")) {
            uploadPath = uploadPath.replace("\\", File.separator);
            // 2. 리눅스, 맥에서 저장된 경로인 경우
        } else if (attachFileDTO.getUploadPath().contains("/")) {
            uploadPath = uploadPath.replace("/", File.separator);
        }

        attachFileDTO.setPostFilePath("resources" + File.separator + "upload" + File.separator + attachFileDTO.getUploadPath() + File.separator + attachFileDTO.getUuid() + "_" + attachFileDTO.getFileName());

        return attachFileDTO;
    }

    @Override
    public PerformanceDTO getPerformance(Integer bookingId) {
        return mypageDAO.getPerformance(bookingId);
    }

    @Override
    public PaymentDTO getPayment(Integer bookingId) {
        return mypageDAO.getPayment(bookingId);
    }

    @Override
    public List<BookedSeatsDTO> getBookedSeats(Integer bookingId) {
        return mypageDAO.getBookedSeats(bookingId);
    }


}
