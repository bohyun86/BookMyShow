package com.itwillbs.service;

import com.itwillbs.domain.Performance.AttachFileDTO;
import com.itwillbs.domain.Performance.PerformanceRegistrationDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@AllArgsConstructor
public class PerformanceRegistrationService {



    @Transactional
    public void registerPerformance(PerformanceRegistrationDTO performanceRegistrationDTO
    , AttachFileDTO attachFileDTO) {


    }

}
