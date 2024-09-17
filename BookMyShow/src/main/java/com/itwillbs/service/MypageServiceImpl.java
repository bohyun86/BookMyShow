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
    
//    @Override
//    public AttachFileDTO getAttachFile(Integer bookingId) {
//        return mypageDAO.getAttachFile(bookingId);
//    }

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
