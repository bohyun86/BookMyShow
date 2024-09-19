package com.itwillbs.service;

import com.itwillbs.domain.Performance.AttachFileDTO;
import com.itwillbs.domain.Performance.MusicalDTO;
import com.itwillbs.repository.AttachFileRepository;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@ExtendWith(SpringExtension.class)
@Log4j2
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

public class AttachFileTests {

    @Autowired
    AttachFileRepository attachFileRepository;

    @Test
    @Transactional("jpaTransactionManager")
    @Rollback(false)
    public void insertAttachFileTest() {

        MusicalDTO musicalDTO = new MusicalDTO();
        musicalDTO.setMusicalId(10);

        List<AttachFileDTO> list = new ArrayList<>();

        for (int i = 0; i < 3; i++) {
            AttachFileDTO attachFileDTO = new AttachFileDTO();
            attachFileDTO.setFileName("testFile" + i);
            attachFileDTO.setPoster(true);
            attachFileDTO.setUuid("12345" + i);
            attachFileDTO.setUploadPath("C:\\upload");
            attachFileDTO.setMusicalId(musicalDTO);

            log.info("attachFileDTO: {}", attachFileDTO);

            list.add(attachFileDTO);
        }

        attachFileRepository.saveAll(list);

        log.info("list: {}", list);

    }
}
