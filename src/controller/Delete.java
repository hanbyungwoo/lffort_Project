package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Delete extends HttpServlet {
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("userid");
		//<%id%>=aaa;
		try {
			if(UsrDAO.delete(user)) {
				// 삭제 성공
				response.sendRedirect("Login.html");
			} else {
				// 삭제 실패
				System.out.println("실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
