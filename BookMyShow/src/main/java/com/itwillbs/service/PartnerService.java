package com.itwillbs.service;

import com.itwillbs.domain.Partner;
import com.itwillbs.mapper.PartnerMapper;
import com.itwillbs.repository.PartnerRepository;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

@Service
@Log4j2
@AllArgsConstructor
public class PartnerService implements PartnerMapper {

    private final PartnerMapper partnerMapper;
    private final PartnerRepository partnerRepository;

    @Override
    public Partner getPartner(Partner partner) {
        log.info("getPartner: {}", partner);
        return partnerMapper.getPartner(partner);
    }

    public Partner getPartner2(int userId) {
        log.info("userId: {}", userId);
        return partnerRepository.findPartnerByUserId(userId);
    }

}
