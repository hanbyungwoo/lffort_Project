package session;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginComplete extends HttpServlet {
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String usrId = request.getParameter("usrId");
      
      //세션 생성: client당 1씩 생성, 관리는 서버가 함
      HttpSession session = request.getSession();
      
      //생성된 세션에 데이터 저장: server 메모리에 저장
      session.setAttribute("usrId", usrId);
      
      //메인페이지로 이동해야함!!!
      response.sendRedirect("sessionEndView");

   }
}