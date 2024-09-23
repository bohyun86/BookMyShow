package com.itwillbs.service;

import com.itwillbs.dao.MypageDAO;
import com.itwillbs.domain.AttachFileDTO;
import com.itwillbs.domain.BookedSeatsDTO;
import com.itwillbs.domain.BookingDTO;
import com.itwillbs.domain.MusicalDTO;
import com.itwillbs.domain.PaymentDTO;
import com.itwillbs.domain.PerformanceDTO;
import com.itwillbs.domain.PointDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.VenueDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.io.File;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

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
    @Transactional
    public boolean processRefund(Integer bookingId, String refundType, BigDecimal refundAmount, Integer userId) {
        Integer memberId = mypageDAO.getMemberId(userId);
        PaymentDTO payment = mypageDAO.getPayment(bookingId);
        BookingDTO booking = mypageDAO.getBooking(bookingId, memberId);

//        // 결제 정보 업데이트
//        payment.setStatus("환불완료");
//        payment.setRefundType(refundType);
//        payment.setRefundAmount(refundAmount);
//        mypageDAO.updatePayment(payment);
//
//        // 포인트 처리
//        int usedPoints = payment.getUsedPoints();
//        int earnedPoints = payment.getPaymentAmount().intValue() / 100; // 1% 적립 가정
//        mypageDAO.addPointsRef(userId, usedPoints, usedPoints, "환불반환", payment.getPaymentId());
//        mypageDAO.addPointsRef(userId, -earnedPoints, 0, "예매취소", payment.getPaymentId());
//
//        // 사용한 포인트 차감
//        usePoints(userId, earnedPoints);

        // 예매 상태 업데이트
        booking.setStatus("환불완료");
        mypageDAO.updateBooking(booking);

//        // 좌석 상태 업데이트
//        mypageDAO.updateBookedSeatsStatus(bookingId, "unreserved");

        return true;
    }

	  @Override
	    public void usePoints(Integer userId, int amountToUse) {
	        List<PointDTO> availablePoints = mypageDAO.getAvailablePoints(userId);
	        int remainingAmount = amountToUse;
	        for (PointDTO point : availablePoints) {
	            if (remainingAmount <= 0) break;
	            if (point.getCurrentAmount() <= remainingAmount) {
	                remainingAmount -= point.getCurrentAmount();
	                mypageDAO.updatePointUsage(point.getPointId(), point.getCurrentAmount());
	            } else {
	                mypageDAO.updatePointUsage(point.getPointId(), remainingAmount);
	                remainingAmount = 0;
	            }
	        }
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
