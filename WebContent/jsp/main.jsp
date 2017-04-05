<%@page import="controller.SelectInfo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@page
	import="model.domain.NewEvent, java.util.ArrayList, util.Crawling, controller.DateInformation"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="msapplication-TileColor" content="#2b5797">
<meta name="msapplication-TileImage"
	content="https://fullcalendar.io/mstile-144x144.png">
<link rel='stylesheet'
	href='https://fullcalendar.io/js/fullcalendar-3.3.0/fullcalendar.min.css' />
<title>LFFORT</title>
</head>


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- Custom Fonts -->
<link
	href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel='stylesheet'
	href='https://fullcalendar.io/js/fullcalendar-3.3.0/fullcalendar.min.css' />
<script
	src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<script src='//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script
	src='https://fullcalendar.io/js/fullcalendar-3.3.0/fullcalendar.min.js'></script>

<!-- Bootstrap Core CSS -->
<link	href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/bootstrap/css/bootstrap.min.css"	rel="stylesheet">
<!-- MetisMenu CSS -->
<link	href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link	href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/dist/css/sb-admin-2.css"	rel="stylesheet">
<!-- Morris Charts CSS -->
<link	href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/morrisjs/morris.css"	rel="stylesheet">
<!-- Custom Fonts -->
<link href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">



<%
	String url = application.getContextPath() + "/";
%>

<%-- 	<script src="<%=url%>/js/memo.js"></script> --%>
<script src="../js/memo.js"></script>


<body>
	<div id="wrapper">

		<!-- Navigation -->
		<jsp:include page="../header.jsp" flush="false" />

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Dashboard -${sessionScope.usrId}-</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-comments fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">
										<%
											int toWork = SelectInfo.HowMany((String)session.getAttribute("usrId"));
											request.setAttribute("work", toWork);
										%>
										${requestScope.work}
									</div>
									<div>진행해야할 업무</div>
								</div>
							</div>
						</div>
						<a href="../DetailWork?page=1&usrid=${sessionScope.usrId}">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-green">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-tasks fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">New Task</div>
									<div>일정 등록</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">Register</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-yellow">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-shopping-cart fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">124</div>
									<div>통계확인</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-red">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-support fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">13</div>
									<div>일정 공유</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-8">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> 일정 관리


						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<%
								String date = DateInformation.selectDate();
								request.setAttribute("date", date);
							%>

							<div id="calendar"></div>
							<div id="calendar">
								<script>input_data(${requestScope.date});</script>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->

























					<!-- /.panel -->
				</div>
				<!-- /.col-lg-8 -->
				<div class="col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bell fa-fw"></i> 롯데 소식
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<!-- <div class="list-group">
                            
                            	<%//	ArrayList<NewEvent> event = new ArrayList<NewEvent>();
			//	event = Crawling.NewEvent();
			//	request.setAttribute("list", event);%>
                                <c:forEach items="${requestScope.list}" var="data">
									 <a href="${data.url}" class="list-group-item">
	                                    <i class="fa fa-comment fa-fw"></i> ${data.name}
                                	</a>
								</c:forEach>
								
                            </div> -->
							<!-- /.list-group -->
							<a href="http://www.lotte.co.kr/04_promote/bbs_list_news.jsp"
								class="btn btn-default btn-block">View All Alerts</a>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> Donut Chart Example
						</div>
						<div class="panel-body">
							<div id="morris-donut-chart"></div>
							<a href="#" class="btn btn-default btn-block">View Details</a>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
					<div class="chat-panel panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-comments fa-fw"></i> Chat
							<div class="btn-group pull-right">
								<button type="button"
									class="btn btn-default btn-xs dropdown-toggle"
									data-toggle="dropdown">
									<i class="fa fa-chevron-down"></i>
								</button>
								<ul class="dropdown-menu slidedown">
									<li><a href="#"> <i class="fa fa-refresh fa-fw"></i>
											Refresh
									</a></li>
									<li><a href="#"> <i class="fa fa-check-circle fa-fw"></i>
											Available
									</a></li>
									<li><a href="#"> <i class="fa fa-times fa-fw"></i>
											Busy
									</a></li>
									<li><a href="#"> <i class="fa fa-clock-o fa-fw"></i>
											Away
									</a></li>
									<li class="divider"></li>
									<li><a href="#"> <i class="fa fa-sign-out fa-fw"></i>
											Sign Out
									</a></li>
								</ul>
							</div>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<ul class="chat">
								<li class="left clearfix"><span class="chat-img pull-left">
										<img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar"
										class="img-circle" />
								</span>
									<div class="chat-body clearfix">
										<div class="header">
											<strong class="primary-font">Jack Sparrow</strong> <small
												class="pull-right text-muted"> <i
												class="fa fa-clock-o fa-fw"></i> 12 mins ago
											</small>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit. Curabitur bibendum ornare dolor, quis ullamcorper
											ligula sodales.</p>
									</div></li>
								<li class="right clearfix"><span
									class="chat-img pull-right"> <img
										src="http://placehold.it/50/FA6F57/fff" alt="User Avatar"
										class="img-circle" />
								</span>
									<div class="chat-body clearfix">
										<div class="header">
											<small class=" text-muted"> <i
												class="fa fa-clock-o fa-fw"></i> 13 mins ago
											</small> <strong class="pull-right primary-font">Bhaumik
												Patel</strong>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit. Curabitur bibendum ornare dolor, quis ullamcorper
											ligula sodales.</p>
									</div></li>
								<li class="left clearfix"><span class="chat-img pull-left">
										<img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar"
										class="img-circle" />
								</span>
									<div class="chat-body clearfix">
										<div class="header">
											<strong class="primary-font">Jack Sparrow</strong> <small
												class="pull-right text-muted"> <i
												class="fa fa-clock-o fa-fw"></i> 14 mins ago
											</small>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit. Curabitur bibendum ornare dolor, quis ullamcorper
											ligula sodales.</p>
									</div></li>
								<li class="right clearfix"><span
									class="chat-img pull-right"> <img
										src="http://placehold.it/50/FA6F57/fff" alt="User Avatar"
										class="img-circle" />
								</span>
									<div class="chat-body clearfix">
										<div class="header">
											<small class=" text-muted"> <i
												class="fa fa-clock-o fa-fw"></i> 15 mins ago
											</small> <strong class="pull-right primary-font">Bhaumik
												Patel</strong>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit. Curabitur bibendum ornare dolor, quis ullamcorper
											ligula sodales.</p>
									</div></li>
							</ul>
						</div>
						<!-- /.panel-body -->
						<div class="panel-footer">
							<div class="input-group">
								<input id="btn-input" type="text" class="form-control input-sm"
									placeholder="Type your message here..." /> <span
									class="input-group-btn">
									<button class="btn btn-warning btn-sm" id="btn-chat">
										Send</button>
								</span>
							</div>
						</div>
						<!-- /.panel-footer -->
					</div>
					<!-- /.panel .chat-panel -->
				</div>
				<!-- /.col-lg-4 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script
		src="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script
		src="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/raphael/raphael.min.js"></script>
	<script
		src="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/morrisjs/morris.min.js"></script>
	<script
		src="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/data/morris-data.js"></script>

	<!-- Custom Theme JavaScript -->
	<script
		src="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/dist/js/sb-admin-2.js"></script>



	<script
		src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
	<script
		src='//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='https://fullcalendar.io/js/fullcalendar-3.3.0/fullcalendar.min.js'></script>
	<!-- 	<script src='https://fullcalendar.io/js/home.js?3.3.0-1.6.0-3'></script> -->























	<script>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	ga('create', 'UA-3534877-8', 'auto');
	ga('send', 'pageview');
	</script>
</body>
</html>


     