package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import model.domain.ToDoDTO;
import util.DBUtil;

public class ToDoDAO {
   public static boolean insert(String usrId, String todoType, Date sdate,
         Date edate, String todoDesc, int todoFlag, int todoCheck) throws SQLException {
      Connection con = null;
      PreparedStatement pstmt = null;
      boolean result = false;
      try {
         con = DBUtil.getConnection();
         pstmt = con.prepareStatement("insert into TODO values(?,?,?,?,?,?,?)");

         pstmt.setString(1, usrId);
         pstmt.setString(2, todoType);
         pstmt.setDate(3, new java.sql.Date(sdate.getTime()));
         pstmt.setDate(4,new java.sql.Date(edate.getTime()));
         pstmt.setString(5, todoDesc);
         pstmt.setInt(6, todoFlag);
         pstmt.setInt(7, todoCheck);

         int i = pstmt.executeUpdate();// *
         if (i == 1) {
            result = true;
         }
      } finally {
         DBUtil.close(con, pstmt);
      }
      return result;
   }

   public static ToDoDTO selectOne(String todoId) throws SQLException {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ToDoDTO d = null;
      try {
         con = DBUtil.getConnection();
         pstmt = con.prepareStatement("select * from todo where todoID=?");
         pstmt.setString(1, todoId);
         rset = pstmt.executeQuery();
         while (rset.next()) {
            if (rset != null) {
               d = new ToDoDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4)
                                  ,rset.getString(5), rset.getInt(6), rset.getInt(7));
            }
         }

      } finally {
         DBUtil.close(con, pstmt, rset);
      }
      return d;
   }

   /*public static ArrayList<ToDoDTO> selectAll() throws SQLException {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ArrayList<ToDoDTO> list = null;
      try {
         con = DBUtil.getConnection();
         pstmt = con.prepareStatement("select * from todo");
         rset = pstmt.executeQuery();
         list = new ArrayList<ToDoDTO>();
         while (rset.next()) {
            list.add(new ToDoDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4)
                   ,rset.getString(5), rset.getString(6), rset.getString(7)));
         }
      } finally {
         DBUtil.close(con, pstmt, rset);
      }
      return list;
   }
*/
   // update
   public static boolean update(String todoId, String todoPw, String todoName, String photo, 
                                    String todoGrade, String todoEmail, String userPhone) throws SQLException {
      Connection con = null;
      PreparedStatement pstmt = null;
      ToDoDTO d = null;
      boolean result = false;
      int ea = 0;
      try {
         con = DBUtil.getConnection();
         pstmt = con.prepareStatement("update todo set todoID=?, todoPW=?, todoNAME=?, PHOTO=? todoGRADE=? todoEMAIL=? USERPHONE=? where todoID=?");// oracle
         d = selectOne(todoId);
         
         pstmt.setString(1, todoId);
         pstmt.setString(2, todoPw);
         pstmt.setString(3, todoName);
         pstmt.setString(4, photo);
         pstmt.setString(5, todoGrade);
         pstmt.setString(6, todoEmail);
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
   public static boolean delete(String todoId) throws SQLException {
      Connection con = null;
      PreparedStatement pstmt = null;
      boolean result = false;
      try {
         con = DBUtil.getConnection();
         pstmt = con.prepareStatement("delete from todo where todoID=?");
         pstmt.setString(1, todoId);

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