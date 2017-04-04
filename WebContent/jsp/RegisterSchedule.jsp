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
<script type="text/javascript">
   $('#fromDate').datetimepicker({
      language : 'ko', // 화면에 출력될 언어를 한국어로 설정한다. 
      pickTime : false, // 사용자로부터 시간 선택을 허용하려면 true를 설정하거나 pickTime 옵션을 생략한다. 
      defalutDate : new Date()
   // 기본값으로 오늘 날짜를 입력한다. 기본값을 해제하려면 defaultDate 옵션을 생략한다.
   });
   $('#toDate').datetimepicker({
      language : 'ko',
      pickTime : false,
      defalutDate : new Date()
   });}
</script>
</head>


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="css/datepicker.css">
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

<script src="/path/to/jquery.js"></script>
<!-- jQuery is required -->
<link href="/path/to/datepicker.css" rel="stylesheet">
<script src="/path/to/datepicker.js"></script>
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css"
   rel="stylesheet" />



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

      <!-- Navigation -->
      <nav class="navbar navbar-default navbar-static-top" role="navigation"
         style="margin-bottom: 0">
      <div class="navbar-header">
         <button type="button" class="navbar-toggle" data-toggle="collapse"
            data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span> <span
               class="icon-bar"></span> <span class="icon-bar"></span> <span
               class="icon-bar"></span>
         </button>
         <a class="navbar-brand" href="main.jsp" style="color: red">LFFORT</a>
      </div>
      <!-- /.navbar-header -->

      <ul class="nav navbar-top-links navbar-right">
         <li class="dropdown"><a class="dropdown-toggle"
            data-toggle="dropdown" href="#"> <i class="fa fa-envelope fa-fw"></i>
               <i class="fa fa-caret-down"></i>
         </a>
            <ul class="dropdown-menu dropdown-messages">
               <li><a href="#">
                     <div>
                        <strong>John Smith</strong> <span class="pull-right text-muted">
                           <em>Yesterday</em>
                        </span>
                     </div>
                     <div>Lorem ipsum dolor sit amet, consectetur adipiscing
                        elit. Pellentesque eleifend...</div>
               </a></li>
               <li class="divider"></li>
               <li><a href="#">
                     <div>
                        <strong>John Smith</strong> <span class="pull-right text-muted">
                           <em>Yesterday</em>
                        </span>
                     </div>
                     <div>Lorem ipsum dolor sit amet, consectetur adipiscing
                        elit. Pellentesque eleifend...</div>
               </a></li>
               <li class="divider"></li>
               <li><a href="#">
                     <div>
                        <strong>John Smith</strong> <span class="pull-right text-muted">
                           <em>Yesterday</em>
                        </span>
                     </div>
                     <div>Lorem ipsum dolor sit amet, consectetur adipiscing
                        elit. Pellentesque eleifend...</div>
               </a></li>
               <li class="divider"></li>
               <li><a class="text-center" href="#"> <strong>Read
                        All Messages</strong> <i class="fa fa-angle-right"></i>
               </a></li>
            </ul> <!-- /.dropdown-messages --></li>
         <!-- /.dropdown -->
         <li class="dropdown"><a class="dropdown-toggle"
            data-toggle="dropdown" href="#"> <i class="fa fa-tasks fa-fw"></i>
               <i class="fa fa-caret-down"></i>
         </a>
            <ul class="dropdown-menu dropdown-tasks">
               <li><a href="#">
                     <div>
                        <p>
                           <strong>Task 1</strong> <span class="pull-right text-muted">40%
                              Complete</span>
                        </p>
                        <div class="progress progress-striped active">
                           <div class="progress-bar progress-bar-success"
                              role="progressbar" aria-valuenow="40" aria-valuemin="0"
                              aria-valuemax="100" style="width: 40%">
                              <span class="sr-only">40% Complete (success)</span>
                           </div>
                        </div>
                     </div>
               </a></li>
               <li class="divider"></li>
               <li><a href="#">
                     <div>
                        <p>
                           <strong>Task 2</strong> <span class="pull-right text-muted">20%
                              Complete</span>
                        </p>
                        <div class="progress progress-striped active">
                           <div class="progress-bar progress-bar-info" role="progressbar"
                              aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
                              style="width: 20%">
                              <span class="sr-only">20% Complete</span>
                           </div>
                        </div>
                     </div>
               </a></li>
               <li class="divider"></li>
               <li><a href="#">
                     <div>
                        <p>
                           <strong>Task 3</strong> <span class="pull-right text-muted">60%
                              Complete</span>
                        </p>
                        <div class="progress progress-striped active">
                           <div class="progress-bar progress-bar-warning"
                              role="progressbar" aria-valuenow="60" aria-valuemin="0"
                              aria-valuemax="100" style="width: 60%">
                              <span class="sr-only">60% Complete (warning)</span>
                           </div>
                        </div>
                     </div>
               </a></li>
               <li class="divider"></li>
               <li><a href="#">
                     <div>
                        <p>
                           <strong>Task 4</strong> <span class="pull-right text-muted">80%
                              Complete</span>
                        </p>
                        <div class="progress progress-striped active">
                           <div class="progress-bar progress-bar-danger"
                              role="progressbar" aria-valuenow="80" aria-valuemin="0"
                              aria-valuemax="100" style="width: 80%">
                              <span class="sr-only">80% Complete (danger)</span>
                           </div>
                        </div>
                     </div>
               </a></li>
               <li class="divider"></li>
               <li><a class="text-center" href="#"> <strong>See
                        All Tasks</strong> <i class="fa fa-angle-right"></i>
               </a></li>
            </ul> <!-- /.dropdown-tasks --></li>
         <!-- /.dropdown -->
         <li class="dropdown"><a class="dropdown-toggle"
            data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
               <i class="fa fa-caret-down"></i>
         </a>
            <ul class="dropdown-menu dropdown-alerts">
               <li><a href="#">
                     <div>
                        <i class="fa fa-comment fa-fw"></i> New Comment <span
                           class="pull-right text-muted small">4 minutes ago</span>
                     </div>
               </a></li>
               <li class="divider"></li>
               <li><a href="#">
                     <div>
                        <i class="fa fa-twitter fa-fw"></i> 3 New Followers <span
                           class="pull-right text-muted small">12 minutes ago</span>
                     </div>
               </a></li>
               <li class="divider"></li>
               <li><a href="#">
                     <div>
                        <i class="fa fa-envelope fa-fw"></i> Message Sent <span
                           class="pull-right text-muted small">4 minutes ago</span>
                     </div>
               </a></li>
               <li class="divider"></li>
               <li><a href="#">
                     <div>
                        <i class="fa fa-tasks fa-fw"></i> New Task <span
                           class="pull-right text-muted small">4 minutes ago</span>
                     </div>
               </a></li>
               <li class="divider"></li>
               <li><a href="#">
                     <div>
                        <i class="fa fa-upload fa-fw"></i> Server Rebooted <span
                           class="pull-right text-muted small">4 minutes ago</span>
                     </div>
               </a></li>
               <li class="divider"></li>
               <li><a class="text-center" href="#"> <strong>See
                        All Alerts</strong> <i class="fa fa-angle-right"></i>
               </a></li>
            </ul> <!-- /.dropdown-alerts --></li>
         <!-- /.dropdown -->
         <li class="dropdown"><a class="dropdown-toggle"
            data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
               <i class="fa fa-caret-down"></i>
         </a>
            <ul class="dropdown-menu dropdown-user">
               <li><a href="#"><i class="fa fa-user fa-fw"></i> User
                     Profile</a></li>
               <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
               </li>
               <li class="divider"></li>
               <li><a href="Login.html"><i class="fa fa-sign-out fa-fw"></i>
                     Logout</a></li>
            </ul> <!-- /.dropdown-user --></li>
         <!-- /.dropdown -->
      </ul>
      <!-- /.navbar-top-links -->

      <div class="navbar-default sidebar" role="navigation">
         <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
               <li class="sidebar-search">
                  <div class="input-group custom-search-form">
                     <input type="text" class="form-control" placeholder="Search...">
                     <span class="input-group-btn">
                        <button class="btn btn-default" type="button">
                           <i class="fa fa-search"></i>
                        </button>
                     </span>
                  </div> <!-- /input-group -->
               </li>
               <li><a href="index.html"><i class="fa fa-dashboard fa-fw"></i>
                     Dashboard</a></li>
               <li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
                     Charts<span class="fa arrow"></span></a>
                  <ul class="nav nav-second-level">
                     <li><a href="flot.html">Flot Charts</a></li>
                     <li><a href="morris.html">Morris.js Charts</a></li>
                  </ul> <!-- /.nav-second-level --></li>
               <li><a href="tables.html"><i class="fa fa-table fa-fw"></i>
                     Tables</a></li>
               <li><a href="RegisterSchedule.jsp"><i
                     class="fa fa-edit fa-fw"></i> 일정 등록</a></li>
               <li><a href="#"><i class="fa fa-wrench fa-fw"></i> UI
                     Elements<span class="fa arrow"></span></a>
                  <ul class="nav nav-second-level">
                     <li><a href="panels-wells.html">Panels and Wells</a></li>
                     <li><a href="buttons.html">Buttons</a></li>
                     <li><a href="notifications.html">Notifications</a></li>
                     <li><a href="typography.html">Typography</a></li>
                     <li><a href="icons.html"> Icons</a></li>
                     <li><a href="grid.html">Grid</a></li>
                  </ul> <!-- /.nav-second-level --></li>
               <li><a href="#"><i class="fa fa-sitemap fa-fw"></i>
                     Multi-Level Dropdown<span class="fa arrow"></span></a>
                  <ul class="nav nav-second-level">
                     <li><a href="#">Second Level Item</a></li>
                     <li><a href="#">Second Level Item</a></li>
                     <li><a href="#">Third Level <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                           <li><a href="#">Third Level Item</a></li>
                           <li><a href="#">Third Level Item</a></li>
                           <li><a href="#">Third Level Item</a></li>
                           <li><a href="#">Third Level Item</a></li>
                        </ul> <!-- /.nav-third-level --></li>
                  </ul> <!-- /.nav-second-level --></li>
               <li><a href="#"><i class="fa fa-files-o fa-fw"></i> Sample
                     Pages<span class="fa arrow"></span></a>
                  <ul class="nav nav-second-level">
                     <li><a href="blank.html">Blank Page</a></li>
                     <li><a href="login.html">Login Page</a></li>
                  </ul> <!-- /.nav-second-level --></li>
            </ul>
         </div>
         <!-- /.sidebar-collapse -->
      </div>
      <!-- /.navbar-static-side --> </nav>

      <div id="page-wrapper">
         <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">
                  <i class="fa fa-edit fa-fw"></i>일정 등록
               </h1>
            </div>
            <!-- /.col-lg-12 -->

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
                     ㄴㅇㄹ
                     <input id="fromDate" type="text"> <input id="toDate" type="text">

                     <!-- /.panel-body -->
                  </div>
                  <!-- /.panel -->
                  <!-- /.panel -->
               </div>
               <!-- /.col-lg-8 -->

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
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://fengyuanchen.github.io/js/common.js"></script>
  <script
   src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script>
</body>
</html>

