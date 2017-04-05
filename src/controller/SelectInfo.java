package controller;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.domain.Todo;
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
	
	public static ArrayList<Todo> SelectTodo(String id) throws SQLException, UnsupportedEncodingException {
		System.out.println("selectTodo-_- : " + id);
		id = "MANAGER";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Todo> todos = new ArrayList<Todo>();
		
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("SELECT * FROM( SELECT ROWNUM AS rn, todo.*, count(*) over() as totcnt from todo where usrid=? ) todo where rn BETWEEN ? AND ?");
//			pstmt = con.prepareStatement("select usrid, todotype, todosdate, todoedate, tododesc, todoflag, todocheck, rownum from todo where usrid=?");
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				todos.add(new Todo(rset.getString(1), rset.getString(2), rset.getDate(3), rset.getDate(4), rset.getString(5), rset.getInt(6), rset.getInt(7)));
			}
			
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		
		System.out.println("bBbB" + todos);
		return todos;
	}
	
}