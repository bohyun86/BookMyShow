package com.itwillbs.service;

import com.itwillbs.dao.MypageDAO;
import com.itwillbs.domain.AttachFileDTO;
import com.itwillbs.domain.BookedSeatsDTO;
import com.itwillbs.domain.BookingDTO;
import com.itwillbs.domain.MusicalDTO;
import com.itwillbs.domain.PaymentDTO;
import com.itwillbs.domain.PerformanceDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.Performance.VenueDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.io.File;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

@Service
@Log4j2
@AllArgsConstructor
public class MypageServiceImpl implements MypageService {

	private MypageDAO mypageDAO;

	@Override
	public Integer getMemberId(Integer userId) {
	    if (userId == null) {
	        return null;
	    }
	    return mypageDAO.getMemberId(userId);
	}

	@Override
	public UserDTO getUser(Integer userId) {
	    if (userId == null) {
	        return null;
	    }
	    return mypageDAO.getUser(userId);
	}

	@Override
	public List<BookingDTO> getBookings(Integer memberId, Integer bookingId, int page, int size) {
	    if (memberId == null) {
	        return Collections.emptyList();
	    }
	    return mypageDAO.getBookings(memberId, bookingId, page * size, size);
	}

	@Override
	public List<MusicalDTO> getMusicals(List<Integer> bookingIds) {
		if (bookingIds == null || bookingIds.isEmpty()) {
			return Collections.emptyList();
		}
		return mypageDAO.getMusicals(bookingIds);
	}

	@Override
	public List<AttachFileDTO> getAttachFiles(List<Integer> bookingIds) {
		if (bookingIds == null || bookingIds.isEmpty()) {
			return Collections.emptyList();
		}
		List<AttachFileDTO> attachFiles = mypageDAO.getAttachFiles(bookingIds);
		attachFiles.forEach(this::processAttachFilePath);
		return attachFiles;
	}

	@Override
	public List<PerformanceDTO> getPerformances(List<Integer> bookingIds) {
	    if (bookingIds == null || bookingIds.isEmpty()) {
	        return Collections.emptyList();
	    }
	    return mypageDAO.getPerformances(bookingIds);
	}


	@Override
	public List<PaymentDTO> getPayments(List<Integer> bookingIds) {
	    if (bookingIds == null || bookingIds.isEmpty()) {
	        return Collections.emptyList();
	    }
	    return mypageDAO.getPayments(bookingIds);
	}

	@Override
	public Map<Integer, List<BookedSeatsDTO>> getBookedSeats(List<Integer> bookingIds) {
	    if (bookingIds == null || bookingIds.isEmpty()) {
	        return Collections.emptyMap();
	    }
	    List<BookedSeatsDTO> allSeats = mypageDAO.getBookedSeats(bookingIds);
	    return allSeats.stream().collect(Collectors.groupingBy(BookedSeatsDTO::getBookingId));
	}

	@Override
	public List<VenueDTO> getVenues(List<Integer> bookingIds) {
	    if (bookingIds == null || bookingIds.isEmpty()) {
	        return Collections.emptyList();
	    }
	    return mypageDAO.getVenues(bookingIds);
	}


	@Override
	public int getTotalBookingsCount(Integer memberId) {
		return mypageDAO.getTotalBookingsCount(memberId);
	}

	private void processAttachFilePath(AttachFileDTO attachFile) {
		String uploadPath = attachFile.getUploadPath();
		if (uploadPath.contains("\\")) {
			uploadPath = uploadPath.replace("\\", File.separator);
		} else if (uploadPath.contains("/")) {
			uploadPath = uploadPath.replace("/", File.separator);
		}
		attachFile.setPostFilePath("resources" + File.separator + "upload" + File.separator + uploadPath
				+ File.separator + attachFile.getUuid() + "_" + attachFile.getFileName());
	}

	@Override
	public List<BookingDTO> getRefundBookings(Integer memberId, int page, int size) {
	    if (memberId == null) {
	        return Collections.emptyList();
	    }
	    return mypageDAO.getRefundBookings(memberId, page * size, size);
	}

	@Override
	public int getTotalRefundsCount(Integer memberId) {
		return mypageDAO.getTotalRefundsCount(memberId);
	}

	@Override
	public boolean processRefund(Integer bookingId, Integer userId) {
	    if (bookingId == null || userId == null) {
	        return false;
	    }
		// 환불 처리 로직 구현
		// 1. 예매 정보 확인
		// 2. 환불 가능 여부 확인
		// 3. 환불 처리
		// 4. 예매 상태 업데이트
		// 5. 결제 정보 업데이트
		// 구체적인 로직은 비즈니스 요구사항에 따라 구현
		return mypageDAO.processRefund(bookingId, userId);
	}

	@Override
	public int getUserPoint(Integer userId) {
		return mypageDAO.getUserPoint(userId);
	}

	@Override
	public int getUsableTicketCount(Integer userId) {
		return mypageDAO.getUsableTicketCount(userId);
	}
}
