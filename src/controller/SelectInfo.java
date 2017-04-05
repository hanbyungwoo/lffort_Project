package controller;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import model.domain.UsrDTO;
import util.DBUtil;

public class SelectInfo {
	public static int HowMany(String id) throws SQLException, UnsupportedEncodingException {
		System.out.println("selectInfo-_- : " + id);
		id = "MANAGER";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int toWork=0;
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select count(*) from todo where usrid=? and todocheck<100");
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				toWork = rset.getInt(1);
			}
			
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		
		return toWork;
		
	}
	
}