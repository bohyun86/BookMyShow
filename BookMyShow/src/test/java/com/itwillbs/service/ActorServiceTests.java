package com.itwillbs.service;


import com.itwillbs.domain.Performance.ActorDTO;
import com.itwillbs.domain.Performance.MusicalDTO;
import com.itwillbs.repository.ActorRepository;
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

@Log4j2
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@ExtendWith(SpringExtension.class)
public class ActorServiceTests {

    @Autowired
    private ActorRepository actorRepository;

    @Test
    @Transactional("jpaTransactionManager")
    @Rollback(false)
    public void insertActorTest() {

        MusicalDTO musicalDTO = new MusicalDTO();
        musicalDTO.setMusicalId(4);
        List<ActorDTO> ac = new ArrayList<>();

        String[] actorList = {"장동건", "김희선", "김수현", "송혜교", "이종석", "박신혜", "김우빈", "박보검", "송중기", "한지민"};
        for (String actor: actorList) {
            ActorDTO actorDTO = new ActorDTO();
            actorDTO.setName(actor);
            actorDTO.setMusicalId(musicalDTO);
            ac.add(actorDTO);
            log.info("actorDTO: {}", actorDTO);
        }

        actorRepository.saveAll(ac);

    }
}
