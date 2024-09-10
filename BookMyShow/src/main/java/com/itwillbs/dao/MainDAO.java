package com.itwillbs.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MainDAO {

    final SqlSession sqlSession;

    String namespace = "com.itwillbs.mapper.BoardMapper";

    public MainDAO(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public int getMaxNum() {
        System.out.println("BoardDAO getMaxNum()");

        return sqlSession.selectOne(namespace + ".getMaxNum");

    }
}
