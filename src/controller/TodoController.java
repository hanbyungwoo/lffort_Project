package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TodoController extends HttpServlet {
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("-----------------------");
      HttpSession session = request.getSession();
      Date sdate = null, edate = null;
      String usrId = (String)session.getAttribute("usrId");
      String todoSelect = request.getParameter("todoSelect");
      String startDate = request.getParameter("startDate");
      String endDate = request.getParameter("endDate");
      SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
      try {
       System.out.println("+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_");
      sdate = transFormat.parse(startDate);
      edate= transFormat.parse(endDate);
      System.out.println(sdate + " " + edate);
   } catch (ParseException e1) {
      e1.printStackTrace();
   }
      String descTodo = request.getParameter("descTodo");
      String optradio = request.getParameter("optradio");
      int opra = Integer.parseInt(optradio);
      String percent = request.getParameter("progress");
      int per = Integer.parseInt(percent);
      try {
         System.out.println(usrId + " " + todoSelect + " " + endDate);
         ToDoDAO.insert(usrId, todoSelect, sdate, edate, descTodo, opra, per);
      } catch (SQLException e) {
         e.printStackTrace();
      }
      response.sendRedirect("jsp/main.jsp");
   }
}