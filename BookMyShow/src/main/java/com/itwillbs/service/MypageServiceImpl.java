package com.itwillbs.service;

import com.itwillbs.dao.MypageDAO;
import com.itwillbs.domain.AttachFileDTO;
import com.itwillbs.domain.BookedSeatsDTO;
import com.itwillbs.domain.BookingDTO;
import com.itwillbs.domain.MusicalDTO;
import com.itwillbs.domain.PaymentDTO;
import com.itwillbs.domain.PerformanceDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.VenueDTO;

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

	// 단수형 메서드
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
	public BookingDTO getBooking(Integer bookingId, Integer memberId) {
		if (bookingId == null || memberId == null) {
			return null;
		}
		return mypageDAO.getBooking(bookingId, memberId);
	}

	@Override
	public MusicalDTO getMusical(Integer bookingId) {
		if (bookingId == null) {
			return null;
		}
		return mypageDAO.getMusical(bookingId);
	}

	@Override
	public AttachFileDTO getAttachFile(Integer bookingId) {
		if (bookingId == null) {
			return null;
		}
		AttachFileDTO attachFile = mypageDAO.getAttachFile(bookingId);
		if (attachFile != null) {
			processAttachFilePath(attachFile);
		}
		return attachFile;
	}

	@Override
	public PerformanceDTO getPerformance(Integer bookingId) {
		if (bookingId == null) {
			return null;
		}
		return mypageDAO.getPerformance(bookingId);
	}

	@Override
	public PaymentDTO getPayment(Integer bookingId) {
		if (bookingId == null) {
			return null;
		}
		return mypageDAO.getPayment(bookingId);
	}

	@Override
	public VenueDTO getVenue(Integer bookingId) {
		if (bookingId == null) {
			return null;
		}
		return mypageDAO.getVenue(bookingId);
	}

	@Override
	public List<BookedSeatsDTO> getBookedSeats(Integer bookingId) {
		if (bookingId == null) {
			return Collections.emptyList();
		}
		return mypageDAO.getBookedSeats(bookingId);
	}

	@Override
	public int getTotalBookingsCount(Integer memberId) {
		if (memberId == null) {
			return 0;
		}
		return mypageDAO.getTotalBookingsCount(memberId);
	}

	@Override
	public int getTotalRefundsCount(Integer memberId) {
		if (memberId == null) {
			return 0;
		}
		return mypageDAO.getTotalRefundsCount(memberId);
	}

	@Override
	public boolean processRefund(Integer bookingId, Integer userId) {
		if (bookingId == null || userId == null) {
			return false;
		}
		return mypageDAO.processRefund(bookingId, userId);
	}

	@Override
	public int getUserPoint(Integer userId) {
		if (userId == null) {
			return 0;
		}
		return mypageDAO.getUserPoint(userId);
	}

	@Override
	public int getUsableTicketCount(Integer userId) {
		if (userId == null) {
			return 0;
		}
		return mypageDAO.getUsableTicketCount(userId);
	}

	// 복수형 메서드
	@Override
	public List<BookingDTO> getBookings(Integer memberId, Integer bookingId, int page, int size) {
		if (memberId == null) {
			return Collections.emptyList();
		}
		return mypageDAO.getBookings(memberId, page * size, size);
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
	public Map<Integer, List<BookedSeatsDTO>> getBookedSeatss(List<Integer> bookingIds) {
		if (bookingIds == null || bookingIds.isEmpty()) {
			return Collections.emptyMap();
		}
		List<BookedSeatsDTO> allSeats = mypageDAO.getBookedSeatss(bookingIds);
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
	public List<BookingDTO> getRefundBookings(Integer memberId, int page, int size) {
		if (memberId == null) {
			return Collections.emptyList();
		}
		return mypageDAO.getRefundBookings(memberId, page * size, size);
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

}
