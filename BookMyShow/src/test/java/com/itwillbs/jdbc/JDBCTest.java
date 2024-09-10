package com.itwillbs.jdbc;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;


import javax.sql.DataSource;
import java.sql.Connection;

@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2
public class JDBCTest {

    @Autowired
    private DataSource dataSource;

    @Test
    public void testConnection() {
        try (Connection con = dataSource.getConnection()) {
            log.info(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
