<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="controller.Controller"%>
<%@page import="java.util.TreeMap"%>

<%@page import="java.util.Iterator"%>
<%String url= request.getContextPath() + "/"; %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chart</title>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>차트</title>

<!-- Bootstrap Core CSS -->
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


<script language="javascript" type="text/javascript"
	src="<%=url%>chartLib/jquery/jquery.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=url%>chartLib/flot/jquery.flot.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=url%>chartLib/flot/jquery.flot.categories.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=url%>chartLib/flot/jquery.flot.time.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=url%>chartLib/flot/jquery.flot.selection.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=url%>chartLib/flot/jquery.flot.resize.js"></script>

</head>

<body>
	<div id="wrapper">

		<jsp:include page="../header.jsp" flush="false" />

		<!-- 여기부터 그래프 시작 -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Flot</h1>
					<h4>
						기간 : <input type="date" id="sdate" value="2017-02-02"> ~
						<input type="date" id="edate" value="2017-12-31">
						<button onclick="gridAll()">확인</button>
					</h4>
					<br>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">


				<script type="text/javascript">
               var keyArr = [];// key x좌표값들
               var valArr = [];// y좌표값들

               //전체 그래프 그리기
               function gridAll(){
               	ajaxCall();
               	ajaxCall1();
               	ajaxCall2();
               }

               function ajaxCall() {
               	keyArr = []; // key 초기화
               	valArr = []; // val 초기화
               	$.ajax({
               		url : "<%=url%>charData",
               		data : {
               			command : "getPercent",
               			usrId : "MANAGER",
               			sDate : $("#sdate").val(),
               			eDate : $("#edate").val()
               		},
               		type : "post",
               		dataType : "html",
               		success : function(resData) {
               			resData = JSON.parse(resData);

               			$.each(resData, function(key, value) {
               				keyArr.push(key);
               				valArr.push(value);
               				// console.log('key:'+key+"---"+ value);
               				// console.log('key:'+keyArr+"---"+ valArr);
               			});
               			grid1(keyArr, valArr); // 차트그리기
               		}
               	})

               }
               function grid1(keyArr, valArr) {
               	$(function() {

               		var leng = keyArr.length;
               		var d = new Array(leng); // Array(Array(x,y))
               		var date;
               		var dateArr1 = [];

               		for (var i = 0; i < leng; i++) {
               			date = keyArr[i];
               			dateArr1 = date.split("-");
               			date = dateArr1[1] + "," + dateArr1[2] + "," + dateArr1[0];
               			// /d[i] = [new Date(date).getTime() , valArr[i].toString()];
               			d[i] = [ date, valArr[i].toString() ];
               		}
               		// 솔트정렬
               		d.sort(function(a1, a2) {
               			var idx = 0; // key
               			return (a1[idx] < a2[idx]) ? -1 : ((a1[idx] > a2[idx]) ? 1 : 0);
               		});

               		for (var i = 0; i < d.length; ++i) {
               			d[i][0] = new Date(d[i][0]).getTime();
               			d[i][0] += 60 * 60 * 1000;
               		}
               		var options = {
               			xaxis : {
               				mode : "time",
               				timeformat : "%y/%m/%d",
               				tickLength : 5
               			},
               			selection : {
               				mode : "x"
               			}
               		};
               		$.plot("#flot-line-chart-day", [ d ], options);
               	});
               }

               function ajaxCall1() {
               	keyArr = []; // key 초기화
               	valArr = []; // val 초기화
               	$.ajax({
               		url : "<%=url%>charData",
               		data : {
               			command : "getDayStat",
               			usrId : "MANAGER",
               			sDate : $("#sdate").val(),
               			eDate : $("#edate").val()
               		},
               		type : "post",
               		dataType : "html",
               		success : function(resData) {
               			resData = JSON.parse(resData);

               			$.each(resData, function(key, value) {
               				keyArr.push(key);
               				valArr.push(value);
               				// console.log('key:'+key+"---"+ value);
               				// console.log('key:'+keyArr+"---"+ valArr);
               			});
               			grid2(keyArr, valArr); // 차트그리기
               		}
               	})
               }

               function grid2(keyArr, valArr) {
               	$(function() {
               		var leng = keyArr.length;
               		var d = new Array(leng); // Array(Array(x,y))
               		var date = "";
               		var dateArr = [];

               		for (var i = 0; i < leng; i++) {
               			date = keyArr[i];

               			dateArr = date.split("-");
               			date = dateArr[1] + "," + dateArr[2] + "," + dateArr[0];

               			d[i] = [ date, valArr[i].toString() ];
               		}
               		// 솔트정렬
               		d.sort(function(a1, a2) {
               			var idx = 0; // key
               			return (a1[idx] < a2[idx]) ? -1 : ((a1[idx] > a2[idx]) ? 1 : 0);
               		});
               		for (var i = 0; i < d.length; ++i) {
               			d[i][0] = new Date(d[i][0]).getTime();
               			d[i][0] += 60 * 60 * 1000;
               		}

               		var options = {
               			xaxis : {
               				mode : "time",
               				timeformat : "%y/%m/%d",
               				tickLength : 5
               			},
               			selection : {
               				mode : "x"
               			}
               		};
               		var plot = $.plot("#flot-line-chart-home", [ d ], options);

               	});
               }

               function ajaxCall2() {
               	keyArr = []; // key 초기화
               	valArr = []; // val 초기화
               	$.ajax({
               		url : "<%=url%>charData",
               		data : {
               			command : "getWokrStat",
               			usrId : "MANAGER",
               			sDate : $("#sdate").val(),
               			eDate : $("#edate").val()
               		},
               		type : "post",
               		dataType : "html",
               		success : function(resData) {
               			resData = JSON.parse(resData);

               			$.each(resData, function(key, value) {
               				keyArr.push(key);
               				valArr.push(value);
               				// console.log('key:'+key+"---"+ value);
               				// console.log('key:'+keyArr+"---"+ valArr);
               			});
               			grid3(keyArr, valArr); // 차트그리기
               		}
               	})

               }
               function grid3(keyArr, valArr) {
               	$(function() {
               		var leng = keyArr.length;
               		var data = new Array(leng); // Array(Array(x,y))

               		for (var i = 0; i < leng; i++) {
               			data[i] = [ keyArr[i], valArr[i].toString() ];
               		}

               		$.plot("#flot-bar", [ data ], {
               			series : {
               				bars : {
               					show : true,
               					barWidth : 0.6,
               					align : "center"
               				}
               			},
               			xaxis : {
               				mode : "categories",
               				tickLength : 0
               			}
               		});

               	});
               }

               
               </script>




				<!-- 일별 통계(Line Chart) -->
				<!-- /.col-lg-6 -->
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<b>일별 업무 달성량</b>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="flot-chart">
								<div class="flot-chart-content" id="flot-line-chart-day"></div>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>



				<!-- LINE CHART -->
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<b>일별 퇴근시간</b>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="flot-chart">
								<div class="flot-chart-content" id="flot-line-chart-home"></div>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>

				<!-- 업무유형별 통계 차트(Bar Chart) -->
				<!-- /.col-lg-6 -->
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<b>업무유형별 통계</b>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="flot-chart">
								<!--  <div class="flot-chart-content" id="flot-bar-chart"></div>-->
								<div class="flot-chart-content" id="flot-bar"></div>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>






				<!-- FOOTTER -->
				<!-- /.col-lg-6 -->
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Flot Charts Usage</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<p>
								여기다가할말써, <a target="_blank" href="http://www.flotcharts.org/">http://www.lotte.net/</a>.
							</p>
							<a target="_blank" class="btn btn-default btn-lg btn-block"
								href="http://www.lotte.net/">View MOIN</a>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-6 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->



</body>

</html>
