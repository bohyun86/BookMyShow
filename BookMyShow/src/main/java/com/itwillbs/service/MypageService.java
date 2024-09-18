package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.AttachFileDTO;
import com.itwillbs.domain.BookedSeatsDTO;
import com.itwillbs.domain.BookingDTO;
import com.itwillbs.domain.MusicalDTO;
import com.itwillbs.domain.PaymentDTO;
import com.itwillbs.domain.PerformanceDTO;

public interface MypageService {

	Integer getMemberId(Integer userId);
	
	List<BookingDTO> getBookings(Integer memberId, Integer bookingId, int page, int size);

	List<MusicalDTO> getMusicals(List<Integer> bookingIds);

	List<AttachFileDTO> getAttachFiles(List<Integer> bookingIds);

	List<PerformanceDTO> getPerformances(List<Integer> bookingIds);

	List<PaymentDTO> getPayments(List<Integer> bookingIds);

	Map<Integer, List<BookedSeatsDTO>> getBookedSeats(List<Integer> bookingIds);

	int getTotalBookingsCount(Integer memberId);

}
