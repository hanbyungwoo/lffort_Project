<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
  
<%@page
   import="model.domain.NewEvent, java.util.ArrayList, util.Crawling, controller.DateInformation, controller.ToDoDAO, javax.servlet.http.HttpServletRequest"%>
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
<!-- <script   src="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/jquery/jquery.min.js"></script>  -->

<!-- Metis Menu Plugin JavaScript -->
<script   src="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
 <script src="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/dist/js/sb-admin-2.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<script src="https://fengyuanchen.github.io/js/common.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script> 

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css"/>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
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
                  <i class="fa fa-edit fa-fw"></i>상세 일정 확인
               </h1>
            </div>
            <!-- /.col-lg-12 -->

         </div>
         <font size="5">${sessionScope.usrId}</font>님 환영합니다!
      
         <!-- /.row -->
         <div class="row">
            <div class="col-lg-8">

               <div class="panel panel-default">
                  
                  <div class="panel-heading">
                     <i class="fa fa-bar-chart-o fa-fw"></i> 상세 일정 확인
                  </div>
                  <!-- /.panel-heading -->
                  <table class="table">
               <tbody>
                  <tr>
                     <td width="15%" bgcolor="#febebe" align="center"><b>일정 시작 시간</b></td>
                     <td>${requestScope.todos.start}</td>
                  </tr>
                  <tr>
                     <td width="15%" bgcolor="#febebe" align="center"><b>일정 종료 시간</b></td>
                     <td>${requestScope.todos.end}</td>
                  </tr>
                  <tr>
                     <td width="15%" bgcolor="#febebe" align="center"><b>업무 종류</b></td>
                     <td>${requestScope.todos.todoType}</td>
                  </tr>
                  <tr>
                     <td width="15%" bgcolor="#febebe" align="center"><b>업무 상세 내용</b></td>
                     <td>${requestScope.todos.desc}</td>
                  </tr>
                  <tr>
                     <td width="15%" bgcolor="#febebe" align="center"><b>업무 달성량</b></td>
                     <td>${requestScope.todos.percent}</td>
                  </tr>
                  <tr>
                     <td width="15%" bgcolor="#febebe" align="center"><b>공개여부</b></td>
                     <td>
                        <c:if test="${requestScope.todos.flag != 1}">비공개</c:if>
                        <c:if test="${requestScope.todos.flag != 0}">공개</c:if>
                     </td>
                  </tr>
               </tbody>
            </table>   
                        <!-- /.panel-body -->
                     </div>
                     <div class="button" align="center">
                        <button id="edit" class="btn btn-success" onclick="edit();">수정</button>
                        <button id="delete" class="btn btn-danger" onclick="del();">삭제</button>
                     </div>
                  <div class="panel-body">
                  
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
</body>

<script type="text/javascript">
   function edit() {
      
   }
   function del() {
      var usrId = "${sessionScope.usrId}";
      var todoType = "${requestScope.todos.todoType}";
      var desc = "${requestScope.todos.desc}";
      var percent = ${requestScope.todos.percent};
      
      ajaxCall(usrId, todoType, desc, percent);
   }
     function ajaxCall(usrId, todoType, desc, percent) {
        <%String url= request.getContextPath() + "/"; %>
            $.ajax({
               url : "<%=url%>charData",
               data : {
                  command : "del",
                  usrId : usrId,
                  todoType : todoType,
                  desc : desc,
                  percent : percent
               },
               type : "post",
               dataType : "html",
               success : function() {
                  alert("삭제되었습니다.");
               
               }
            });
     }
    
</script>
</html>