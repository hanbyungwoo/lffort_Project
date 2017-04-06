package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.ResourceBundle;
import java.util.Set;
import java.util.TreeMap;

import util.DBUtil;

public class statDAO {

	private static ResourceBundle bundle;

	static {
		bundle = ResourceBundle.getBundle("conf/sql");
	}

	//달성량
	public static HashMap<String, Object> getPercent(String usrID, String sDate, String eDate) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		ResultSet set = null; 
		
		HashMap<String, Object> map = null;
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(bundle.getString("percent"));
			
			pstmt.setString(1, usrID); //ID
			pstmt.setString(2, sDate); //일정타입
			pstmt.setString(3, eDate); //S_DATE

			set = pstmt.executeQuery();
			map = new HashMap<String, Object>();
			// list = new ArrayList<DeptDTO>();
			
			while (set.next()) {
				map.put(set.getString(1), set.getDouble(2));
				//System.out.println(set.getString(1) + " , " + set.getDouble(2));
			}
		} finally {
			DBUtil.close(conn, pstmt);
		}
		return map;
	}
	
	
	
	//업무별 통계 쿼리 수정해야함
	public static HashMap<String, Object> getWokrStat(String usrId, String sDate, String eDate) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet set = null; 
		HashMap<String, Object> map = null;
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(bundle.getString("getWorkStat"));
			
			map = new HashMap<String, Object>();
			
			pstmt.setString(1, usrId); //ID
			pstmt.setString(2, sDate); //S_DATE
			pstmt.setString(3, eDate); //E_DATE
			
			
			//검색되지 않게
			pstmt.setString(4, "출근"); //E_DATE
			pstmt.setString(5, "퇴근"); //E_DATE
		
			set = pstmt.executeQuery();

			while (set.next()) {
				map.put(set.getString(1), set.getInt(2));
			}
		} finally {
			DBUtil.close(conn, pstmt);
		}
		return map;
	}

	// 퇴근
	public static HashMap<String, Object> getDayStat(String usrId, String sDate, String eDate) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		HashMap<String, Object> map = null;

		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(bundle.getString("getDayStat"));

			map = new HashMap<String, Object>();

			pstmt.setString(1, usrId); // ID
			pstmt.setString(2, sDate); // S_DATE
			pstmt.setString(3, eDate); // E_DATE

			// 퇴근만 검색!
			pstmt.setString(4, "퇴근"); // E_DATE


			set = pstmt.executeQuery();

			while (set.next()) {
				map.put(set.getString(1), set.getInt(2));
				//System.out.println(set.getString(1)+" , "+ set.getInt(2));
			}
		} finally {
			DBUtil.close(conn, pstmt);
		}
		return map;
	}

	// 퇴근
	public static ArrayList<String> selectAllTodo(String sDate, String eDate) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		ArrayList<String> list = null;

		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(bundle.getString("selectAllTodo"));
			pstmt.setString(1, sDate);
			pstmt.setString(2, eDate);
			list = new ArrayList<String>();

			set = pstmt.executeQuery();

			while (set.next()) {
				list.add(set.getString(1) 
						+ "/" + set.getString(2)
						+ "/" + set.getString(3)
						+ "/" + set.getString(4)
						+ "/" + set.getString(5)
						+ "/" + set.getString(6)
						+ "/" + set.getString(7));
				
				/*System.out.println(set.getString(1) 
						+ "-" + set.getString(2)
						+ "-" + set.getString(3)
						+ "-" + set.getString(4)
						+ "-" + set.getString(5)
						+ "-" + set.getString(6)
						+ "-" + set.getString(7));*/
			}
		} finally {
			DBUtil.close(conn, pstmt);
		}
		return list;
	}
}
