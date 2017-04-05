<%@page import="controller.DateInformation"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@page import="model.domain.NewEvent, java.util.ArrayList, util.Crawling"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="msapplication-TileColor" content="#2b5797">
<meta name="msapplication-TileImage" content="https://fullcalendar.io/mstile-144x144.png">

 
<!-- Custom Fonts -->
<link href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel='stylesheet' href='https://fullcalendar.io/js/fullcalendar-3.3.0/fullcalendar.min.css' />
<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<script src='//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://fullcalendar.io/js/fullcalendar-3.3.0/fullcalendar.min.js'></script>
<!-- data -->
<script src="../js/memo.js"></script>

<script>
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-3534877-8', 'auto');
ga('send', 'pageview');
</script>





<link href="https://common.lotte.net/Content/images/16x	16.ico" rel="shortcut icon" type="image/x-icon" />
<!-- <link rel="stylesheet" href="https://common.lotte.net/Content/css/common/default.css?ver=2016_03_31_002" type="text/css"> -->
<link rel="stylesheet" href="../css/quickmenu.css" type="text/css">
<link rel="stylesheet" href="https://common.lotte.net/Content/css/portal/common.css?ver=2016_03_31_002" type="text/css">
<script type="text/javascript" src="https://common.lotte.net/Content/Scripts/portal/common.js?ver=2016_03_31_002"></script>

    

<title>!!!ddd!</title>
</head>
	<body>
<div id="quickMenu">
    <div class="quickW">
        <a href="#" class="btnQuick">퀵메뉴보기</a>
        <div class="quickarea" style="display:none;">
            <div class="bgQuick">
                <div class="memInfo">
                    <span class="photo s50"><img src="/files/Common/Orgchart/PersonalPicture/736B56CAFA8383A0489CB1889A15E80C10F80965.jpg" alt="" 
                                            onError="this.src = 'https://common.lotte.net/Content/images/portal/common/photo_50.png';"

                                                 alt=""></span>
                    <span class="name">한병우  님</span>
                    <button type="button" class="btn_logout" onclick="javascript:document.location.href='https://login.lotte.net/logout'">로그아웃</button>
                    <button type="button" class="btn_myset" onclick="javascript:fnWidgetMyUtilSettingPopup()">설정</button>	
                </div>
                <div class="team">
                    <div>21112</div>
                    <div>hanbang</div>
                    <div>롯데정보통신</div>
                    <div>IoT컨버전스팀 기술지원담당</div>
                </div>

                    <div class="outtimeInfo">
                        <span class="timeInfo">로그아웃까지남은시간</span>
                        <span class="time" id="loginCheckTimeDisp">00<i>h</i>00<i>m</i></span>
                        <button type="button" class="btn_logoutStay" onclick="javascript: fnBlankCall()">로그아웃연장</button>
                    </div>
                
            </div>

            <div class="box memSearch" id="widgetOrgSearchWrap">
                <div class="tit">임직원조회</div>
                <div class="memSearchW">
                    <input type="text" id="widgetOrgSearchWord" name="widgetOrgSearchWord" />
                    <button class="btn_search" onclick="javascript:fnWidgetOrgSearch()" type="submit">검색</button>
                </div>
            </div>

            <div class="box bookMarkW" id="widgetMenuBookmarkWrap"
                                  >
                <div class="tit line">
                    게시판 즐겨찾기
                    <a href="#none" class="btn_set">설정</a>
                </div>
                <ul class="listW"  id="widgetBoardBookmarkList">
                   
                     <li><a href="#">전자결재 </a><span class="arr"></span></li>
                    <li><a href="#">회의실 예약</a><span class="arr"></span></li>
                    <li><a href="#">공지사항</a><span class="arr"></span></li>
                    <li><a href="#">임직원 조회</a><span class="arr"></span></li>
                        
                </ul>
                <div class="pageWrap" id="widgetBoardBookmarkPager">
                   
                    <a href="#none" class="pagination-prev">이전</a>
                    <a href="#none" class="linkNo selected">1</a>
                    <a href="#none" class="linkNo">2</a>
                    <a href="#none" class="linkNo">3</a>
                    <a href="#none" class="linkNo">4</a>
                    <a href="#none" class="linkNo">5</a>
                    <a href="#none" class="pagination-next">다음</a>
                </div>

            </div>

            <div class="box membookMarkW" id="widgetOrgBookmarkWrap">
                <div class="tit line">
                    임직원 즐겨찾기
                    <a href="https://common.lotte.net/organization?ActionType=bookmark" class="btn_set">설정</a>
                </div>
                <ul class="listW" id="widgetOrgBookmarkList">
                    
                </ul>
                <div class="pageWrap" id="widgetOrgBookmarkPager">
                    
                </div>

            </div>

        </div>
    </div>
</div>
	
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-bar-chart-o fa-fw"></i> Area Chart Example
	
	
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<% 
	                        	String date = DateInformation.selectDate();
	                        	request.setAttribute("date", date);
	                        %>
	
	
				<!-- <div id="calendar"><script>input_data(${requestScope.date});</script></div> -->
				<div id="calendar">
					<script>input_data(${requestScope.date});</script>
				</div>
			</div>
			<!-- /.panel-body -->
		</div>

</body>
</html>