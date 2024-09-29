package com.itwillbs.repository;

import com.itwillbs.domain.login.MemberDTO;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<MemberDTO, Integer> {
}
