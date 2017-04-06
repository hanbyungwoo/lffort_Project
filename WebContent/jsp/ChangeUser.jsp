<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@page
   import="model.domain.NewEvent, java.util.ArrayList, util.Crawling, controller.DateInformation, controller.SelectInfo, model.domain.Todo, model.domain.UsrDTO, controller.UsrDAO"%>
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
<script>
$(document).ready(function(){
   $('table td').mouseover(function(){ 
      $(this).css("backgroundColor","#ccc"); 
   }); 
   $('table td').mouseout(function(){ 
      $(this).css("backgroundColor","#fff"); 
   });
   
});

function del(v) {
	var a = $("#user").val();
	alert(a);
	location.href="delete?userid="+a;
	
}
</script>
)
<style>
th {
    text-align: center;
}
</style>
<body>
	<div id="wrapper">

		<jsp:include page="../header.jsp" flush="false" />

		<div id="page-wrapper">
			<%String url=request.getContextPath()+"/"; %>
			<%
				UsrDTO user = (UsrDTO)request.getAttribute("user");
			%>
			
			<!-- /.row -->
			<div class="row">
			<br>
            <div class="col-lg-12">

               <div class="panel panel-default">
                  
                  <div class="panel-heading">
                     <i class="fa fa-bar-chart-o fa-fw"></i> User Profile
                  </div>
                  <!-- /.panel-heading -->
                  <table class="table">
               <tbody>
               	   <tr>
               	   	
                     <th height="100px" width="15%" bgcolor="#febebe" align="center"><b>사진</b></th>
                     <td width="35%"><image src="<%=application.getContextPath()%>/img/nouser.png"></td>
                     
                  </tr>
                  <tr>
                     <th width="15%" bgcolor="#febebe" align="center"><b>ID</b></th>
                     <td width="35%">${user.usrId}</td>
                     <th width="15%" bgcolor="#febebe" align="center"><b>이름</b></th>
                     <td width="35%">${user.usrName}</td>
                  </tr>
                  <tr>
                  	<th width="15%" bgcolor="#febebe" align="center"><b>직급</b></th>
                     <td width="35%">${user.usrGrade}</td>
                     <th width="15%" bgcolor="#febebe" align="center"><b>이메일</b></th>
                     <td width="35%">${user.usrEmail}</td>
                  </tr>
                  <tr>
                  	<th width="15%" bgcolor="#febebe" align="center"><b>phone</b></th>
                    <td>${user.userPhone}</td>
                     
                  </tr>
                  
               </tbody>
            </table>   
                        <!-- /.panel-body -->
                     </div>
                     <div class="button" align="center">
                     	<input type="hidden" id="user" name="user" value="${sessionScope.usrId}"/>
                        <button class="btn btn-success" onclick="edit();">수정</button>
                        <button class="btn btn-danger" onclick="del();">회원탈퇴</button>
                     </div>
                  <div class="panel-body">
                  
                  </div>
                  <!-- /.panel -->
               </div>
            </div>
			<br>
		</div>
	</div>
</body>
</html>

