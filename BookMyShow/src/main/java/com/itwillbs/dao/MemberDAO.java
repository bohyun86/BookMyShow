package com.itwillbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;
import com.mysql.cj.xdevapi.Result;



@Repository
public class MemberDAO {
	
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	DataSource ds;
	
	
	///--회원 정보 검색
	public List<MemberDTO> findUser(String type, String keyword)
	throws SQLException{
		try {
			String colName="";
			switch(type) {
				case "1": colName="name";
					break;
				case "2": colName="userid";
					break;
				case "3": colName="hp1||hp2||hp3";
					break;
			}
			
			con = ds.getConnection();
			
			String sql="select * from member where "+colName+" like ?";
			System.out.println(sql);
			ps=con.prepareStatement(sql);
			ps.setString(1, "%"+keyword+"%");
			rs=ps.executeQuery();
			
			return makeList(rs);
			
			
		}finally {
		}
	}

	//--회원 정보 리스트
	private List<MemberDTO> makeList(ResultSet rs) throws SQLException{
		List<MemberDTO> arr = new ArrayList<>();
		while(rs.next()) {
			int id = rs.getInt("user_id");
			String name = rs.getString("username");
			String userid=rs.getString("password");
			String pwd=rs.getString("email");
			String phone=rs.getString("phone");
			String addr1=rs.getString("addr1");
			
			
			MemberDTO user = new MemberDTO();
			arr.add(user);
		}//while----
		return arr;
		}
}

	
