<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@page
   import="model.domain.NewEvent, java.util.ArrayList, util.Crawling, controller.DateInformation, controller.SelectInfo, model.domain.Todo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Custom Fonts -->
<link href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script   src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>

<!-- jQuery -->
<script   src="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/jquery/jquery.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/dist/js/sb-admin-2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://fengyuanchen.github.io/js/common.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script>


<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<title>LFFORT</title>

</head>

<!-- Bootstrap Core CSS -->
<link
   href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">
<!-- MetisMenu CSS -->
<link
   href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/metisMenu/metisMenu.min.css"
   rel="stylesheet">
<!-- Custom CSS -->
<link
   href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/dist/css/sb-admin-2.css"
   rel="stylesheet">
<!-- Morris Charts CSS -->
<link
   href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/morrisjs/morris.css"
   rel="stylesheet">
<!-- Custom Fonts -->
<link
   href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/font-awesome/css/font-awesome.min.css"
   rel="stylesheet" type="text/css">   

<body>
   <div id="wrapper">

      <jsp:include page="../header.jsp" flush="false" />

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">
						<i class="fa fa-edit fa-fw"></i>상세 업무 현황
					</h1>
				</div>
				<!-- /.col-lg-12 -->

			</div>
			--------------------- > > > >> > > >${sessionScope.usrId}

			<br><br>
			<!-- /.row -->
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<th>No.</th>
							<th>분류</th>
							<th width="150">설명</th>
							<th>완성도(%)</th>
							<th>공개여부</th>
							<th>시작일</th>
							<th>마감일</th>
						</tr>
					</thead>
					<tbody>
					<%
						int num=1;
						ArrayList<Todo> list = SelectInfo.SelectTodo((String)session.getAttribute("usrId"));
						request.setAttribute("todos", list);
					%>
					<c:forEach items="${requestScope.todos}" var="data">
						<tr>
							<td>
								<%=num++%>
							</td>
							<td>
								${data.todoType}
							</td>
							<td>
								${data.desc}
							</td>
							<td>
								${data.percent}
							</td>
							<td>
								<c:choose>
									<c:when test="${data.flag==1}">
										Y
									</c:when>
									<c:otherwise>
										 N
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								${data.start}
							</td>
							<td>
								${data.end}
							</td>
						</tr>
					</c:forEach>
						<!-- <?php endforeach; ?> -->
					</tbody>
				</table>
			</div>

		</div>
		<!-- /#wrapper -->

      
</body>
</html>

