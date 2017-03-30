package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.domain.UsrDTO;
import util.DBUtil;

public class UsrDAO {
	public static boolean insert(UsrDTO usr) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("insert into USR values(?,?,?,?,?,?,?)");

			pstmt.setString(1, usr.getUsrId());
			pstmt.setString(2, usr.getUsrPw());
			pstmt.setString(3, usr.getUsrName());
			pstmt.setString(4, usr.getPhoto());
			pstmt.setString(5, usr.getUsrGrade());
			pstmt.setString(6, usr.getUsrEmail());
			pstmt.setString(7, usr.getUserPhone());

			int i = pstmt.executeUpdate();// *
			if (i == 1) {
				result = true;
			}
		} finally {
			DBUtil.close(con, pstmt);
		}
		return result;
	}

	public static UsrDTO selectOne(String usrId) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		UsrDTO d = null;
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from USR where USRID=?");
			pstmt.setString(1, usrId);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				if (rset != null) {
					d = new UsrDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4)
											 ,rset.getString(5), rset.getString(6), rset.getString(7));
				}
			}

		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return d;
	}

	/*public static ArrayList<UsrDTO> selectAll() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<UsrDTO> list = null;
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from USR");
			rset = pstmt.executeQuery();
			list = new ArrayList<UsrDTO>();
			while (rset.next()) {
				list.add(new UsrDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4)
						 ,rset.getString(5), rset.getString(6), rset.getString(7)));
			}
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return list;
	}
*/
	// update
	public static boolean update(String usrId, String usrPw, String usrName, String photo, 
												String usrGrade, String usrEmail, String userPhone) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		UsrDTO d = null;
		boolean result = false;
		int ea = 0;
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("update USR set USRID=?, USRPW=?, USRNAME=?, PHOTO=? USRGRADE=? USREMAIL=? USERPHONE=? where USRID=?");// oracle
			d = selectOne(usrId);
			
			pstmt.setString(1, usrId);
			pstmt.setString(2, usrPw);
			pstmt.setString(3, usrName);
			pstmt.setString(4, photo);
			pstmt.setString(5, usrGrade);
			pstmt.setString(6, usrEmail);
			pstmt.setString(7, userPhone);

			int i = pstmt.executeUpdate();// *
			if (i == 1) {
				result = true;
			}	
		} finally {
			DBUtil.close(con, pstmt);
		}
		return result;
	}

	// delete
	public static boolean delete(String usrId) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("delete from USR where USRID=?");
			pstmt.setString(1, usrId);

			int i = pstmt.executeUpdate();// *
			if (i == 1) {
				result = true;
			}
		} finally {
			DBUtil.close(con, pstmt);
		}
		return result;
	}

}
