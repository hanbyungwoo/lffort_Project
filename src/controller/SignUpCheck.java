package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.domain.UsrDTO;
import util.AES256;

public class SignUpCheck extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usrId = request.getParameter("usrId");
		String usrPw = request.getParameter("usrPw");
		String usrName = request.getParameter("name");
		//String photo = request.getParameter("usrId");
		String photo = "nouser.png";
		String usrGrade = request.getParameter("usrGrade");
		String usrEmail = request.getParameter("usrEmail");
		String userPhone = request.getParameter("usrPhone");
		
		try {
			System.out.println("------------------------------");
			UsrDTO d = UsrDAO.selectOne(usrId);
			System.out.println("++++++++++++++++");
			//해당 usrId가 존재하는 경우, 회원가입 불가능
			if(d != null) {
				//회원가입 불가능하다고 alert창 띄우고, 다시 회원가입 페이지로 가기
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				 
				PrintWriter out = response.getWriter();
				out.println("<script language='javascript'>");
				out.println("alert('ID가 중복됩니다.');");
				out.println("</script>");
				out.close();
				
//				response.sendRedirect("SignUp.html");
			}
			//해당 usrId가 존재하지 않는 경우, 회원가입 가능
			else {

				AES256 a = new AES256(AES256.key);
				
				String new_pw = null;
				try {
					new_pw = a.aesEncode(usrPw);
				} catch (InvalidKeyException | NoSuchAlgorithmException | NoSuchPaddingException
						| InvalidAlgorithmParameterException | IllegalBlockSizeException | BadPaddingException e) {
					e.printStackTrace();
				}
				
				UsrDTO d1 = new UsrDTO(usrId, new_pw, usrName,photo, usrGrade, usrEmail,userPhone);
				UsrDAO.insert(d1);
				//로그인 페이지로 바로 넘어가기
				response.sendRedirect("Login.html");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
