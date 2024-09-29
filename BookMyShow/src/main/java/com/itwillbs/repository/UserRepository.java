package com.itwillbs.repository;

import com.itwillbs.domain.UserDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface UserRepository extends JpaRepository<UserDTO, Integer> {
    UserDTO findUserByUserId(int userId);

    UserDTO findByPhoneNumberOrEmail(String phoneNumber, String email);

    UserDTO findByUserName(String userName);

    @Modifying
    @Transactional
    @Query("UPDATE User u SET u.accessToken = :accessToken WHERE u.userId = :userId")
    void updateAccessToken(@Param("accessToken") String accessToken, @Param("userId") int userId);

    UserDTO findAccessTokenByUserId(int userId);

    UserDTO findByPhoneNumber(String phoneNumber);

    UserDTO findByEmail(String email);
}
