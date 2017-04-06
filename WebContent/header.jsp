<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="controller.SelectInfo, java.util.ArrayList, model.domain.Todo"%>

<c:if test="${empty sessionScope.usrId}">
	<script>
		alert("비정상적인 접근입니다.");
		location.href="<%=request.getContextPath()%>/Login.html";
	</script>		
</c:if>

<style>
.navbar-brand>img  {
	display : inline;
	border-radius: 10px;
}
</style>
<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			
			<a class="navbar-brand" href="<%=request.getContextPath()%>/jsp/main.jsp"><font color="red">LFFORT</font>&nbsp;&nbsp;&nbsp;
			
<%-- 				<img class="not_block" src="<%=request.getContextPath()%>/img/dongwon.jpg" style="width:30px; height:30px;"> --%>
				<img class="not_block" src="<%=request.getContextPath()%>/img/nouser.png" style="width:30px; height:30px;">
				&nbsp;&nbsp;
				<b>${sessionScope.usrId}</b>님 환영합니다!</a>
			
		</div>
		<!-- /.navbar-header -->

		<ul class="nav navbar-top-links navbar-right">
			
			
			
			<%
				ArrayList<Todo> four = SelectInfo.SelectFour((String)session.getAttribute("usrId"));
				request.setAttribute("four", four);
			%>
			
			
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-tasks fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-tasks">
					<c:if test="${not empty requestScope.four[0] }">
					<li><a href="#">
							<div>
								<p>
									<strong>${requestScope.four[0].desc}</strong> <span class="pull-right text-muted">${requestScope.four[0].percent}%
										Complete</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-success"
										role="progressbar" aria-valuenow="${requestScope.four[0].percent}" aria-valuemin="0"
										aria-valuemax="100" style="width: ${requestScope.four[0].percent}%">
										<span class="sr-only">${requestScope.four[0].percent}% Complete (success)</span>
									</div>
								</div>
							</div>
					</a></li>
					<li class="divider"></li>
					</c:if>
					<c:if test="${not empty requestScope.four[1] }">
					<li><a href="#">
							<div>
								<p>
									<strong>${requestScope.four[1].desc}</strong> <span class="pull-right text-muted">${requestScope.four[1].percent}%
										Complete</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-info" role="progressbar"
										aria-valuenow="${requestScope.four[1].percent}" aria-valuemin="0" aria-valuemax="100"
										style="width: ${requestScope.four[1].percent}%">
										<span class="sr-only">${requestScope.four[1].percent}% Complete</span>
									</div>
								</div>
							</div>
					</a></li>
					<li class="divider"></li>
					</c:if>
					<c:if test="${not empty requestScope.four[2] }">
					<li><a href="#">
							<div>
								<p>
									<strong>${requestScope.four[2].desc}</strong> <span class="pull-right text-muted">${requestScope.four[2].percent}%
										Complete</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-warning"
										role="progressbar" aria-valuenow="${requestScope.four[2].percent}" aria-valuemin="0"
										aria-valuemax="100" style="width: ${requestScope.four[2].percent}%">
										<span class="sr-only">${requestScope.four[2].percent}% Complete (warning)</span>
									</div>
								</div>
							</div>
					</a></li>
					</c:if>
					<c:if test="${not empty requestScope.four[3] }">
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<p>
									<strong>${requestScope.four[3].desc}</strong> <span class="pull-right text-muted">${requestScope.four[3].percent}%
										Complete</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-danger"
										role="progressbar" aria-valuenow="${requestScope.four[3].percent}" aria-valuemin="0"
										aria-valuemax="100" style="width: ${requestScope.four[3].percent}%">
										<span class="sr-only">${requestScope.four[3].percent}% Complete (danger)</span>
									</div>
								</div>
							</div>
					</a></li>
					<li class="divider"></li>
					</c:if>
					<li><a class="text-center" href="<%=request.getContextPath()%>/DetailWork?page=1&usrid=${sessionScope.usrId}"> <strong>See
								All Tasks</strong> <i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-tasks --></li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-user">
					<li><a href="<%=request.getContextPath()%>/UserChange?usrid=${sessionScope.usrId}"><i class="fa fa-user fa-fw"></i> User
							Profile</a></li>
					<li class="divider"></li>
					<li><a href="<%=request.getContextPath()%>/jsp/logout.jsp"><i class="fa fa-sign-out fa-fw"></i>
							Logout</a></li>
				</ul> <!-- /.dropdown-user --></li>
			<!-- /.dropdown -->
		</ul>
		<!-- /.navbar-top-links -->

		
		<jsp:include page="leftside.jsp" flush="false" />

		<!-- /.navbar-static-side --> </nav>