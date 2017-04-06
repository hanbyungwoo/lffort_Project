package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.domain.Todo;

public class ShowDetail extends HttpServlet {
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String num1 = request.getParameter("num");
        String usrId = request.getParameter("usrId");
        int num = Integer.parseInt(num1);
        System.out.println("num : " + num + "/usrId : " + usrId);
        
        Todo todos = null;
        
        try {
           todos = SelectInfo.SelectOne(usrId, num);
      } catch (SQLException e) {
         e.printStackTrace();
      }
        System.out.println("------------------- " + todos);
        request.setAttribute("todos", todos);
        request.getRequestDispatcher("jsp/ShowDetail.jsp").forward(request,response);
   }
}