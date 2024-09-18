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
		return mypageDAO.getMemberId(userId);
	}

	@Override
	public UserDTO getUser(Integer userId) {
		return mypageDAO.getUser(userId);
	}

	@Override
	public List<BookingDTO> getBookings(Integer memberId, Integer bookingId, int page, int size) {
		return mypageDAO.getBookings(memberId, bookingId, page * size, size);
	}

	public List<MusicalDTO> getMusicals(List<Integer> bookingIds) {
		return mypageDAO.getMusicals(bookingIds);
	}

	@Override
	public List<AttachFileDTO> getAttachFiles(List<Integer> bookingIds) {
		List<AttachFileDTO> attachFiles = mypageDAO.getAttachFiles(bookingIds);
		attachFiles.forEach(this::processAttachFilePath);
		return attachFiles;
	}

	@Override
	public List<PerformanceDTO> getPerformances(List<Integer> bookingIds) {
		return mypageDAO.getPerformances(bookingIds);
	}

	@Override
	public List<PaymentDTO> getPayments(List<Integer> bookingIds) {
		return mypageDAO.getPayments(bookingIds);
	}

	@Override
	public Map<Integer, List<BookedSeatsDTO>> getBookedSeats(List<Integer> bookingIds) {
		List<BookedSeatsDTO> allSeats = mypageDAO.getBookedSeats(bookingIds);
		return allSeats.stream().collect(Collectors.groupingBy(BookedSeatsDTO::getBookingId));
	}

	@Override
	public List<VenueDTO> getVenues(List<Integer> bookingIds) {
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

}
