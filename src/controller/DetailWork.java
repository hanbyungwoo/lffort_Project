package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.domain.Todo;

public class DetailWork extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String page = request.getParameter("page");
		  String usrid = request.getParameter("usrid");
		  
		  System.out.println(page +  " : " + usrid);
	      

		  ArrayList<Todo> todos = new ArrayList<Todo>();
		  
		  try {
			  todos = SelectInfo.SelectTodo(usrid, page);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		  request.setAttribute("page", page);
		  request.setAttribute("todos", todos);
		  request.getRequestDispatcher("jsp/DetailWork.jsp").forward(request,response);
				

	}
}
