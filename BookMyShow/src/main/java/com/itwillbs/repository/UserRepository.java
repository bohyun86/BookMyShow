package com.itwillbs.repository;

import com.itwillbs.domain.UserDTO;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserDTO, Integer> {
    UserDTO findUserByUserId(int userId);
}
