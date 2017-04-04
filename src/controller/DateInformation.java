package controller;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import util.DBUtil;

public class DateInformation {
	
	public static String selectDate() throws SQLException {
		Connection con = null;
		Statement stmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();				// oracle db와 접속
			stmt = con.createStatement();	// oracle db에 sql문장 실행 객체
			int i = stmt.executeUpdate("select * from todo");
			
			if( i==1) {
				result = true;
			}
		} finally {
			DBUtil.close(con, stmt);	
		}
		return result;
	}
	
	
}