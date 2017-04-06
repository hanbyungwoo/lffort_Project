<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- 스타일CSS -->
<link rel="stylesheet" href="<%=url%>cardLib/style.css" media="screen" />
<script src="<%=url%>cardLib/blocksit.js"></script>
<!-- 리사이즈 -->
<%-- <script src="<%=url%>cardLib/resize.js"></script>
 --%>
 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/themes/base/jquery-ui.css">

</head>

<body>

	<script type="text/javascript">

		ajaxCall("03/06/2017", "03/11/2017");
		
		$(function() {
		    var startDate;
		    var endDate;
		    
		    var selectCurrentWeek = function() {
		        window.setTimeout(function () {
		            $('.week-picker').find('.ui-datepicker-current-day a').addClass('ui-state-active')
		        }, 1);
		    }
		    
		    $('.week-picker').datepicker( {
		        showOtherMonths: true,
		        selectOtherMonths: true,
		        onSelect: function(dateText, inst) { 
		            var date = $(this).datepicker('getDate');
		            startDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay());
		            endDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() + 6);
		            var dateFormat = inst.settings.dateFormat || $.datepicker._defaults.dateFormat;
		            $('#sDate').text($.datepicker.formatDate( dateFormat, startDate, inst.settings ));
		            $('#eDate').text($.datepicker.formatDate( dateFormat, endDate, inst.settings ));
		            
		            selectCurrentWeek();
		        },
		        beforeShowDay: function(date) {
		            var cssClass = '';
		            if(date >= startDate && date <= endDate)
		                cssClass = 'ui-datepicker-current-day';
		            return [true, cssClass];
		        },
		        onChangeMonthYear: function(year, month, inst) {
		            selectCurrentWeek();
		        }
		    });
		    
		    $('.week-picker .ui-datepicker-calendar tr').live('mousemove', function() { $(this).find('td a').addClass('ui-state-hover'); });
		    $('.week-picker .ui-datepicker-calendar tr').live('mouseleave', function() { $(this).find('td a').removeClass('ui-state-hover'); });
		});
		
		function showmap() { 
		       if(document.all.con.style.visibility=="hidden") {
		         document.all.con.style.visibility="visible";
		         return false;
		       }
		       else if(document.all.con.style.visibility=="visible") {
		    	document.all.con.style.visibility="hidden";
		        var sDate = document.getElementById("sDate").innerHTML;
		        var eDate = document.getElementById("eDate").innerHTML;
		        
		        $('.grid').remove(); //요소 초기화
		        ajaxCall(sDate,  eDate);
		        return false;
		       }
		 }
	
		
		
		
		var todoArr = [];
		var todoData = []; //데이터저장되는 곳
		var tempArr= [];
		
		var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');


		function ajaxCall(sDate, eDate){
	    		$.ajax({
		   		url : "<%=url%>charData",
		   		data : {
		   			command : "selectAllTodo",
		   			sDate : sDate,
           			eDate : eDate
		   		},
		   		type : "post",
		   		dataType : "html",
		   		
	    	   	success : function(resData) {
	    			
	    		var leng = resData.length;
	    		var str =  resData.substring(1, leng-3);
	    		
	    		var tempDate;
				var dateArr = []; 
				var date;
				var day;
	    		
	   			//1차 파싱
	    		todoArr = str.split(",");
				//2차파싱
				for(var i=0; i<todoArr.length; i++){
					tempArr = todoArr[i].split("/");
	
					tempDate = tempArr[2];
		   			dateArr = tempDate.split("-");
		   			tempDate = dateArr[1] + "," + dateArr[2] + "," + dateArr[0];
		   			date = new Date(tempDate);
		   			day = week[date.getDay()]; //요일을 구한다....
	
					//todoData.push([ [tempArr[0]],[tempArr[1]],[tempArr[2]],[tempArr[3]],[tempArr[4]],[tempArr[5]],[tempArr[6]] ]);
					todoData = [ tempArr[0],tempArr[1],tempArr[2],tempArr[3],tempArr[4],tempArr[5],tempArr[6]];
					
					
					addForm(todoData, day); //폼 동적 생성
	
				}
	    	}
		})
		}

		
		//var count = 1;
	   	function addForm(todoData,day){
			
	   		if(todoData[5] == 1){
		   		if(day=="월요일"){
		   			var addedFormDiv = document.getElementById("container0");
		   		}else if(day=="화요일"){
		   			var addedFormDiv = document.getElementById("container1");
		   		}else if(day=="수요일"){
		   			var addedFormDiv = document.getElementById("container2");
		   		}else if(day=="목요일"){
		   			var addedFormDiv = document.getElementById("container3");
		   		}else if(day=="금요일"){
		   			var addedFormDiv = document.getElementById("container4");
		   		}else{
		   			return;
		   		}
		   		var usrId = todoData[0];
	            var str = "";
	            str += "<div class='grid'>"
	            str += "<div class='imgholder' style='width: 100%; text-align: center'>";
	            str += "<img src='";
	            
	            if(usrId == ' 김형수'){
	            	str+= "../img/dongwon.jpg";
	            }else if(usrId == ' 권도영'){
	            	str+= "../img/goeun.jpg";
	            }else if(usrId == ' 한병우'){
	            	str+= "../img/gongyu.jpg";
	            }else if(usrId == ' 소현욱'){
	            	str+= "../img/yumi.jpg";
	            }else{
	            	str+= "../img/manager.jpg";
	            }
	            
	            str += "' style='width: 100%'; /> </div>";
	            str += "<strong>" + todoData[0] + "</strong>"; //유저ID
	            str += "<p>" + "업무유형 : " + todoData[1] + "</p>"; //업무 타입
	            str += "<p>" + "업무시작 : " + todoData[2] +"</p>"; //sDate
	            str += "<p>" + "업무종료 : " + todoData[3] + "</p>"; //eDate
	            str += "<p>" + "업무설명 : " + todoData[4] + "</p>"; //업무 설명
				str += "<div class='meta'>LDCC</div>"
				str += "</div>"
	
	            var addedDiv = document.createElement("div"); // 폼 생성
	            //addedDiv.id = "added_"+count; // 폼 Div에 ID 부여 (삭제를 위해)
	            addedDiv.innerHTML  = str; // 폼 Div안에 HTML삽입
	            addedFormDiv.appendChild(addedDiv); // 삽입할 DIV에 생성한 폼 삽입
	            //count++;
    		}else{
    			return false;
    		}
	   	}
	   	
	   	

	</script>
	
	<div id="wrapper">
		 <jsp:include page="../header.jsp" flush="false" />
		<!-- 여기부터  시작 -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading"><b>주간 일정 공유 </b>
   							<button id="button" onclick="showmap(con)" style = 'float:right'>날짜선택 /조회 </button>
   							<label>Week : </label><span id="sDate" ></span> - <span id="eDate"></span>
   							<div id="con" class="week-picker" style="position:absolute;float:right; left:75%; top:50px; visibility:hidden;"></div>
						</div>
								<div id="container0" class="container" style='text-align: center'><br><b>월요일</b></div>
								<div id="container1" class="container" style='text-align: center'><br><b>화요일</b></div>
								<div id="container2" class="container" style='text-align: center'><br><b>수요일</b></div>
								<div id="container3" class="container" style='text-align: center'><br><b>목요일</b></div>
								<div id="container4" class="container" style='text-align: center'><br><b>금요일</b></div>

						</div>
				</div>


				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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
