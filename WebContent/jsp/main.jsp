<%@page import="controller.SelectInfo"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.domain.NewEvent, util.Crawling, controller.DateInformation"%>
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
<style>
	.list-group-items:first-child {
	    border-top-left-radius: 4px;
	    border-top-right-radius: 4px;
	}
	a.list-group-items, button.list-group-items {
	    color: #555;
	}
	.list-group-items {
	    position: relative;
	    padding: 10px 15px;
	    display : block;
	    margin-bottom: -1px;
	    background-color: #fff;
	    border: 1px solid #ddd;
	}
</style>
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
						<a href="<%=url%>/DetailWork?page=1&usrid=${sessionScope.usrId}">
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
						<a href="<%=url%>jsp/RegisterSchedule.jsp">
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
						<a href="<%=url%>jsp/flot.jsp">
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

							
							<div id="calendar">
								<script>input_data(${requestScope.date});</script>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-8 -->
				<div class="col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bell fa-fw"></i> <font color="red">롯데</font> 소식
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
							<a
								href="http://www.enewstoday.co.kr/news/articleView.html?idxno=1038789"
								class="list-group-item"> <i class="fa fa-comment fa-fw"></i>
								'벚꽃시즌' 맞은 롯데월드, 다양한 혜택으로 봄나들이객 유혹
							</a>
							<a
								href="http://news.tf.co.kr/read/economy/1685073.htm"
								class="list-group-item"> <i class="fa fa-envelope fa-fw"></i>
								롯데월드타워, 연간 1억명 유혹할 매력 포인트 6
							</a>
							<a
								href="http://m.post.naver.com/viewer/postView.nhn?volumeNo=6449022&memberNo=9028903&vType=VERTICAL"
								class="list-group-item"> <i class="fa fa-tasks fa-fw"></i>
								롯데 그룹 2017년 상반기 신입/경력 채용 시작!
							</a>  
							<a
								href="http://www.upkorea.net/news/articleView.html?idxno=109982"
								class="list-group-item"> <i class="fa fa-upload fa-fw"></i>
								롯데와 석촌호수 벚꽃축제 2017
							</a>  
							<a
								href="http://blog.naver.com/whwls9639/220974150062"
								class="list-group-item"> <i class="fa fa-bolt fa-fw"></i>
								월드타워 불꽃놀이 장관을 이루다!
							</a>   
							<a
								href="http://www.kukinews.com/news/article.html?no=444650"
								class="list-group-item"> <i class="fa fa-warning fa-fw"></i>
								롯데월드타워, 그랜드 오픈 첫날…전국에서 온 관광객으로 북새통
							</a>
							<a
								href="http://www.inews24.com/php/news_view.php?g_serial=1015187&g_menu=020200&rrf=nv"
								class="list-group-item"> <i class="fa fa-shopping-cart fa-fw"></i>
								롯데정보통신, 모바일 개발 플랫폼 '램프' 출시
							</a>
							<a
								href="http://view.asiae.co.kr/news/view.htm?idxno=2017040609565448282"
								class="list-group-item"> <i class="fa fa-money fa-fw"></i>
								롯데제과, 창립 50주년 기념 '빼빼로 50만 갑' 기부
							</a>
							
							<br>
							<a href="http://www.lotte.co.kr/04_promote/bbs_list_news.jsp"
								class="btn btn-default btn-block">View All Alerts</a>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
					
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-comments fa-fw"></i> <font color="red">LOTTE</font> Group
							
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<font color="red">LOTTE</font> Group Menu
							<br><br>
							<div style="float: left; width: 50%;">
								<a
									href="http://www.lotte.co.kr/index.jsp"  target="_black"
									class="list-group-items"> <i class="fa fa-home fa-fw"></i>
									롯데그룹 홈페이지
								</a>
							</div>
							<div style="float: left; width: 50%;">
								<a
									href="http://www.lotte.co.kr/04_promote/magazine_current.jsp"  target="_black"
									class="list-group-items"> <i class="fa fa-book fa-fw"></i>
									롯데그룹 사보
								</a>
							</div>
							<div style="float: left; width: 50%;">
								<a
									href="http://blog.lotte.co.kr/"  target="_black"
									class="list-group-items"> <i class="fa fa-bookmark fa-fw"></i>
									LOTTE Group BLOG
								</a>
							</div>
							<div style="float: left; width: 50%;">
								<a
									href="https://ko-kr.facebook.com/lotte"  target="_black"
									class="list-group-items"> <i class="fa fa-facebook fa-fw"></i>
									LOTTE 페이스북
								</a>
							</div>
							<div style="float: left; width: 50%;">
								<a
									href="https://secupolicy.net"  target="_black"
									class="list-group-items"> <i class="fa fa-user-secret fa-fw"></i>
									롯데그룹 정보보호 포털
								</a>
							</div>
							<div style="float: left; width: 50%;">
								<a
									href="https://www.lottecompliance.com"  target="_black"
									class="list-group-items"> <i class="fa fa-heart fa-fw"></i>
									롯데그룹 윤리경영 사이트
								</a>
							</div>
							<div style="float: left; width: 50%;">
								<a
									href="http://www.lotteleague.com"  target="_black"
									class="list-group-items"> <i class="fa fa-soccer-ball-o fa-fw"></i>
									롯데 자이언츠 배 야구대
								</a>
							</div>
							<div style="float: left; width: 50%;">
								<a
									href="http://www.lotteconcerthall.com/"  target="_black"
									class="list-group-items"> <i class="fa fa-music fa-fw"></i>
									<img src="https://common.lotte.net/Content/images/portal/main/logo_lotteconsert.png">롯데콘서트홀
								</a>
							</div>
							
							<br><br><br><br><br><br>
							<font color="red">LOTTE</font> Education Menu
							<br><br>
		
							<div style="float: left; width: 50%;">
								<a href="http://www.lotteconcerthall.com/"
									class="list-group-items" target="_black"> <i class="fa fa-book fa-fw"></i>
									롯데 ez-Leaming
								</a>
							</div>


					</div>
						<!-- /.panel-body -->
						
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


     