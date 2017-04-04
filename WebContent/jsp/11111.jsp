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
<!-- 
<script src='https://fullcalendar.io/js/home.js?3.3.0-1.6.0-3'></script>
 -->
<script>
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-3534877-8', 'auto');
ga('send', 'pageview');
</script>
<title>?????????</title>
</head>
<body>
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
                            <div id="calendar"><script>input_data(${requestScope.date});</script></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>

</body>
</html>