package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	/* 개인 IP상에 내장된 DB에 접속
	 * ID: SCOTT/ PW: TIGER */
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection( "jdbc:oracle:thin:@lfforttest.c6sjtqkwhpik.us-west-2.rds.amazonaws.com:1521/TEST","MANAGER","LFFORT1234");
	}
	
	//자원반환 - DML용
	public static void close(Connection con, Statement stmt) {
		try {
			if(stmt != null) {
				stmt.close();
				stmt = null;
			}
			if(con != null) {
				con.close();
				con = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//자원반환 - select용
	public static void close(Connection con, Statement stmt, ResultSet rset) {
		try {
			if(stmt != null) {
				stmt.close();
				stmt = null;
			}
			if(con != null) {
				con.close();
				con = null;
			}
			if(rset != null) {
				rset.close();
				rset = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
