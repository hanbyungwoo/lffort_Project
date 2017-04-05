package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DetailWork extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String page = request.getParameter("page");
		  String usrid = request.getParameter("usrid");
		  
		  System.out.println(page +  " : " + usrid);
	      
		  response.sendRedirect("DetailWork.jsp");
//		  SelectInfo.SelectTodo(page);
		  
		  
	      

	}
}
