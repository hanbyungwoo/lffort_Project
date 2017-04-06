package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.domain.UsrDTO;
public class ChangeProfile extends HttpServlet {
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usrid =request.getParameter("usrid");
		UsrDTO newOne = null;
		try {
			newOne = UsrDAO.selectOne(usrid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println("changeProfile : " + usrid);
		
		
		  request.setAttribute("user", newOne);
		  request.getRequestDispatcher("jsp/ChangeUser.jsp").forward(request,response);
				
		  
		  
	}

}