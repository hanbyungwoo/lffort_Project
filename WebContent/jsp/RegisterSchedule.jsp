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

<!-- Custom Theme JavaScript -->
<script src="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/dist/js/sb-admin-2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://fengyuanchen.github.io/js/common.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script>


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
						<i class="fa fa-edit fa-fw"></i>일정 등록
					</h1>
				</div>
				<!-- /.col-lg-12 -->

			</div>
			----------------------> > > > > >> > > >${sessionScope.usrId}

			<!-- /.row -->
			<div class="row">
				<div class="col-lg-8">

					<div class="panel panel-default">
						
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> 일정 등록
						</div>
						<!-- /.panel-heading -->
						<% String url=request.getContextPath() + "/"; %>
	                  <form action="<%=url%>TodoController">
						<div class="panel-body">
							<div class="hero-unit">
								<b>일정 시작 시간</b> <input type="text" placeholder="시작 시간을 입력해주세요."	id="startDate" class="form-control" />
								<b>일정 종료 시간</b> <input type="text" placeholder="종료 시간을 입력해주세요." id="endDate" class="form-control" />
							</div>
						<div class="form-group">
                           <label for="sel1">업무 종류</label>
                           <select class="form-control" name="todoSelect">
                            <option>출,퇴근</option>
                            <option>교육</option>
                            <option>회의</option>
                            <option>프로젝트</option>
                            <option>운영</option>
                            <option>기타</option>
                           </select>
                        </div>
                        <br>
                        <div class="form-group">
                          <label for="comment">업무 상세 내용</label>
                          <textarea class="form-control" rows="5" name="descTodo" placeholder="업무 상세내용을 기술해주세요."></textarea>
                        </div>
                        <!-- /.panel-body -->
                     </div>
                     <div class="button" align="center">
                        <button type="submit" class="btn btn-login">저장</button>
                     </div>
                  </form>
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
</html>