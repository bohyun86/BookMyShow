package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.AttachFileDTO;
import com.itwillbs.domain.BookedSeatsDTO;
import com.itwillbs.domain.BookingDTO;
import com.itwillbs.domain.MusicalDTO;
import com.itwillbs.domain.PaymentDTO;
import com.itwillbs.domain.PerformanceDTO;

public interface MypageService {

	BookingDTO getBooking(Integer bookingId);
    MusicalDTO getMusical(Integer bookingId);
//    AttachFileDTO getAttachFile(Integer bookingId);
    PerformanceDTO getPerformance(Integer bookingId);
    PaymentDTO getPayment(Integer bookingId);
    List<BookedSeatsDTO> getBookedSeats(Integer bookingId);
    
}
