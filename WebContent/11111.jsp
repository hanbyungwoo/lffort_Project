<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@page import="model.domain.NewEvent, java.util.ArrayList, util.Crawling"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>?????????</title>
</head>
<body>

<%
	ArrayList<NewEvent> list = new ArrayList<NewEvent>();	
	list = Crawling.NewEvent();
	request.setAttribute("list", list);
%>
	
	<c:forEach items="${requestScope.list}" var="data">
	${data.name} : ${data.url}<br>
<a href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/pages/index.html#" class="list-group-item">
	<i class="fa fa-comment fa-fw"></i> New Comment
	<span class="pull-right text-muted small"><em>4 minutes ago</em>
	</span>
</a>
</c:forEach>
<head>
</head>
</html>