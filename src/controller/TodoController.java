package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TodoController extends HttpServlet {
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("-----------------------");
      HttpSession session = request.getSession();
      
      String usrId = (String)session.getAttribute("usrId");
      String todoSelect = request.getParameter("todoSelect");
      String startDate = request.getParameter("startDate");
      String endDate = request.getParameter("endDate");
      String descTodo = request.getParameter("descTodo");
      
      try {
         System.out.println(usrId + " " + todoSelect + " " + startDate);
         ToDoDAO.insert(usrId, todoSelect, startDate, endDate, descTodo, 0, 0);
      } catch (SQLException e) {
         e.printStackTrace();
      }
      System.out.println("++++++++++++++++++++++");
      response.sendRedirect("jsp/main.jsp");
   }
}