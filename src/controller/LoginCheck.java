package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.domain.UsrDTO;

public class LoginCheck extends HttpServlet {
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String usrId = request.getParameter("id");
      String usrPw = request.getParameter("pw");
      try {
         UsrDTO d = UsrDAO.selectOne(usrId);
         //usr 정보가 일치한다면
         if(d.getUsrId().equals(usrId) && d.getUsrPw().equals(usrPw)) {
          //세션 생성: client당 1씩 생성, 관리는 서버가 함
            HttpSession session = request.getSession();
            
            //생성된 세션에 데이터 저장: server 메모리에 저장
            session.setAttribute("usrId", usrId);
            
            System.out.println("usrId: " + usrId);
            //메인페이지로 이동해야함!!!
            response.sendRedirect("main.html");
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