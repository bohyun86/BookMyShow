package com.itwillbs.service;

import com.itwillbs.domain.PartnerDTO;
import com.itwillbs.mapper.PartnerMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

@Service
@Log4j2
@AllArgsConstructor
public class PartnerService implements PartnerMapper {

    private final PartnerMapper partnerMapper;

    @Override
    public PartnerDTO getPartner(PartnerDTO partnerDTO) {
        log.info("getPartner: {}", partnerDTO);
        return partnerMapper.getPartner(partnerDTO);
    }


}
