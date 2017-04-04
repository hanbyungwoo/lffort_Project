<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	session.setAttribute("usrId", null);
	session.invalidate();
	response.sendRedirect("../Login.html");
%>		
