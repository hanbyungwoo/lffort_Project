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
			
			
			while(rset.next()) {
				date = date + "{title : '" + rset.getString(1) + "님 " + rset.getString(2) + "', start : '" + rset.getDate(3) + "', end : '" + rset.getDate(4) +
						"', constraint: 'availableForMeeting',  color: '#606060'}";
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