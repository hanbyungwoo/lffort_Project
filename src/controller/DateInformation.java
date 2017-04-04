package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBUtil;

public class DateInformation {
	

	
	public static String selectDate() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String date = "[";
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select usrid, todotype, todosdate, todoedate,  todocheck from todo where todoflag = 1");
			rset = pstmt.executeQuery();
			
			// #e2480b 빨
			// #efd62f 노
			// #44e56a 초
			while(rset.next()) {
				date = date + "{title : '" + rset.getString(1) + "님 " + rset.getString(2) + "', start : '" + rset.getDate(3) + "', end : '" + rset.getDate(4) +
						"', constraint: 'availableForMeeting',";
				if(rset.getInt(5) < 33) {
					date = date + " color: '#e2480b'}";
				} else if(rset.getInt(5) < 66) {
					date = date + " color: '#efd62f'}";
				} else if(rset.getInt(5) < 99){
					date = date + " color: '#13f749'}";
				} else {
					date = date + " color: '#0094ff'}";
				}
				
				if(rset.next()) {
					date = date + ",";
				}
			}
			date = date + "]";
			
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		System.out.println(date);
		return date;
	}
	
}