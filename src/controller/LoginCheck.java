package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.domain.UsrDTO;

public class LoginCheck extends HttpServlet {
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String usrId = request.getParameter("id");
      String usrPw = request.getParameter("pw");
      
      try {
         UsrDTO d = UsrDAO.selectOne(usrId);
         //usr 정보가 일치한다면
         if(d.getUsrId().equals(usrId) && d.getUsrPw().equals(usrPw)) {
            response.sendRedirect("logincomplete?usrId=" + usrId);
         }
         //usr 정보가 일치하지 않는다면
         else {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            
            PrintWriter out = response.getWriter();
            out.println("<script language='javascript'>");
            out.println("alert('ID 혹은 PW 입력이 틀렸습니다.');");
            out.println("</script>");
            out.close();
            
            response.sendRedirect("Login.html");
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }

}