package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.AttachFileDTO;
import com.itwillbs.domain.BookedSeatsDTO;
import com.itwillbs.domain.BookingDTO;
import com.itwillbs.domain.MusicalDTO;
import com.itwillbs.domain.PaymentDTO;
import com.itwillbs.domain.PerformanceDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.VenueDTO;

public interface MypageService {

	// 단수형 메서드
	Integer getMemberId(Integer userId);

	UserDTO getUser(Integer userId);

	BookingDTO getBooking(Integer bookingId, Integer memberId);

	MusicalDTO getMusical(Integer bookingId);

	AttachFileDTO getAttachFile(Integer bookingId);

	PerformanceDTO getPerformance(Integer bookingId);

	PaymentDTO getPayment(Integer bookingId);

	VenueDTO getVenue(Integer bookingId);
	
	List<BookedSeatsDTO> getBookedSeats(Integer bookingId);

	int getTotalBookingsCount(Integer memberId);

	int getTotalRefundsCount(Integer memberId);

	boolean processRefund(Integer bookingId, Integer userId);

	int getUserPoint(Integer userId);

	int getUsableTicketCount(Integer memberId);

	// 복수형 메서드
	List<BookingDTO> getBookings(Integer memberId, Integer bookingId, int page, int size);

	List<MusicalDTO> getMusicals(List<Integer> bookingIds);

	List<AttachFileDTO> getAttachFiles(List<Integer> bookingIds);

	List<PerformanceDTO> getPerformances(List<Integer> bookingIds);

	List<PaymentDTO> getPayments(List<Integer> bookingIds);

	Map<Integer, List<BookedSeatsDTO>> getBookedSeatss(List<Integer> bookingIds);
	
	List<VenueDTO> getVenues(List<Integer> bookingIds);

	List<BookingDTO> getRefundBookings(Integer memberId, int page, int size);

}
