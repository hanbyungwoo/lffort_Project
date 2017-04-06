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


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Custom Fonts -->
<link href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script   src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>

<!-- jQuery -->
<script   src="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/jquery/jquery.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script   src="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/metisMenu/metisMenu.min.js"></script>



<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="../js/bootstrap-datepicker.js"></script>

<title>LFFORT</title>
<script type="text/javascript">
    $(document).ready(function () {
        $('#startDate').datepicker({
            format: "yyyy/mm/dd"
        });
        $('#endDate').datepicker({
            format: "yyyy/mm/dd"
        });
    });
</script>
</head>

<!-- Bootstrap Core CSS -->
<link href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
   
   
   
   
<!--  <link href="../css/bootstrap.min.css" rel="stylesheet"> -->
<!--  <link href="../css/dashboard.css" rel="stylesheet"> -->
 <!-- Bootstrap theme -->
<!--  <link href="../css/bootstrap-theme.min.css" rel="stylesheet"> -->
 <link href="../css/faq.css" rel="stylesheet">
 <script src="../js/jquery-3.1.1.min.js"> </script>
 <!-- Custom styles for this template -->
<!--  <link href="../css/theme.css" rel="stylesheet"> -->
<!--  <link href="../css/free_board.css" rel="stylesheet"> -->
 <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
 <!--[if lt IE 9]><script src="/dist/js/ie8-responsive-file-warning.js"></script><![endif]-->
 <script src="../js/ie-emulation-modes-warning.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!--  <script src="../js/bootstrap.min.js"></script> -->
 <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
 <script src="../js/ie10-viewport-bug-workaround.js"></script>
 
 
 
 
<body>
   <div id="wrapper">

      <jsp:include page="../header.jsp" flush="false" />

      <div id="page-wrapper">
      
      	<div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">
                  <i class="fa fa-edit fa-fw"></i>FAQ
               </h1>
            </div>
            <!-- /.col-lg-12 -->

         </div>
        
        <div id="code_origin" class="code_tmpl">
          <!-- UI Object -->
          <div class="faq">
          
            <ul>
              <li class="article">
                <p class="q"><a href="#a1" class="trigger">LFFORT는 무엇을 하는 사이트인가요?</a></p>
                <p class="a">롯데인들이 업무를 효율적으로 관리할 수 있도록 만든 사이트입니다.</p>
              </li>
            </ul>
            <ul>
              <li class="article">
                <p class="q"><a href="#a1" class="trigger">무슨 기능을 가지고 있나요?</a></p>
                <p class="a">일정공유 및 관리와 내가 진행한 업무에 대해 분석을 해주므로 업무의 효율성을 증가시킵니다.</p>
              </li>
            </ul>
            <ul>
              <li class="article">
                <p class="q"><a href="#a1" class="trigger">LFFORT짱</a></p>
                <p class="a">정말 간편하고 좋아요!</p>
              </li>
              <li class="article">
                <p class="q"><a href="#a1" class="trigger">만든사람은 누구인가요?</a></p>
                <p class="a">박형수! 권도영! 한병우! 소현욱!</p>
              </li>
            </ul>
          
          </div>
          <!-- //UI Object -->
        </div>
        <div id="code_origin2" class="code_tmpl">
         <script src="../js/faq.js"> </script>
       </div>

     
     </div>
      <!-- /#wrapper -->


      
</body>
</html>