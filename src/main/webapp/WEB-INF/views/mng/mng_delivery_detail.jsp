<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/jsHeader.jsp"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Monitoring</title>
<link rel="shortcut icon" href="asset/dist/img/wbfavi.ico">
<link rel="icon" href="asset/dist/img/wbfavi.ico">
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="asset/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

<link rel="stylesheet"
	href="asset/plugins/datatables/dataTables.bootstrap.css">

<link rel="stylesheet"
	href="asset/plugins/daterangepicker/daterangepicker.css">
<!-- bootstrap datepicker -->
<link rel="stylesheet" href="asset/plugins/datepicker/datepicker3.css">
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet" href="asset/plugins/iCheck/all.css">
<!-- Bootstrap Color Picker -->
<link rel="stylesheet"
	href="asset/plugins/colorpicker/bootstrap-colorpicker.min.css">
<!-- Bootstrap time Picker -->
<link rel="stylesheet"
	href="asset/plugins/timepicker/bootstrap-timepicker.min.css">

<!-- jvectormap -->
<link rel="stylesheet"
	href="asset/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<!-- Theme style -->
<link rel="stylesheet" href="asset/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="asset/dist/css/skins/_all-skins.min.css">


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<style type="text/css" class="init">
/* for MS */
@keyframes blink{
	0% {background-color: #970000;}
	50% {background-color: blue;}
}

/* for Safari, Chrome*/
@-webkit-ketframes blink{
	0% {background-color: #970000;}
	50% {background-color: blue;}
}

/* for MS */
@keyframes blinkodd{
	0% {background-color: #970000;}
	50% {background-color: #73A2AA;}
}

/* for Safari, Chrome*/
@-webkit-ketframes blinkodd{
	0% {background-color: #970000;}
	50% {background-color: #73A2AA;}
}

/* for MS */
@keyframes blinkeven{
	0% {background-color: #970000;}
	50% {background-color: #4A6367;}
}

/* for Safari, Chrome*/
@-webkit-ketframes blinkeven{
	0% {background-color: #970000;}
	50% {background-color: #4A6367;}
}

.blinkcss{
	animation:blink 1s step-end infinite;
	-webkit-animation: blink 1s step-end infinite;
}

.blinkcssodd{
	animation:blinkodd 1s step-end infinite;
	-webkit-animation: blinkodd 1s step-end infinite;
}

.blinkcsseven{
	animation:blinkeven 1s step-end infinite;
	-webkit-animation: blinkeven 1s step-end infinite;
}

.boldfont{
	font-weight: bold;
}

.finishcss{
	color: #66FF66;
}

.ingcss{
	color: #FFFF00;
}

.line{
	border-bottom:1px solid white;
	height: 79px;
}

*{
	color: white;
}

.odd{
	background-color: #73A2AA;
}

.even{
	background-color: #4A6367;
}

.head{
	/* -webkit-text-stroke-width: 1px;
	-webkit-text-stroke-color: #005859; */
	font-weight:bold;
	font-size:30px;
}

table{
	table-layout: fixed;
	height: 850px;
	/* line-height: 120%; */
	padding: 0 0 0 0;
}

th, td{
	vertical-aligin: middle;
	word-wrap: break-word;
}

th{
	background-color: black;
	border-top : 1px solid white;
	border-bottom : 1px double white;
}

</style>

<body class="hold-transition skin-blue layout-top-nav">
	<div id="tabledata" style="background: #4A6367;">
	
		<div style="float:left; font-size:30px; padding: 15px;">
			<img src="resources/img/woobo-logo.png" height="45px" width="60px" style="vertical-align: middle;"> 
			실시간 배송 현황 Delivery Monitoring
		</div>
	
		<div style="float:right; padding: 15px;">
			<span id="set_timer" class="pull-right"
				style="margin-right: 20px; font-size: 30px;"></span>
		</div>
	
	<hr style="clear: both;">
	<div style="font-size: 25px; text-align: center; padding: 3px; display:flex;">
		<div align="left" style="float: left; width: 33%; padding-left: 15px;">
			<span id="date"></span>
		</div>
		<div align="center" style="float: left; width: 33%;">
			<span>납품 현황 총 ${itemCount } 건</span>
		</div>
		<div align="right" style="float: right; width: 33%; padding-right: 15px;">
			<span>page(${currentPage } / ${maxPage })</span>
		</div>
	</div>
		<!-- <hr style="clear: both; color: white;"> -->
		<table id="tablebody" width="100%"
			class="stripe row-border order-column">
			<thead style="padding-buttom: 30px;">
				<tr class="line head">
					<th style="font-size: 18px; text-align: center; width: 19%;">업 체 명<br>(Name)
					</th>
					<th style="font-size: 18px; text-align: center; width: 25%;">품 목<br>(Item)
					</th>
					<th style="font-size: 18px; text-align: center; width: 8%;">출발 지역<br>(From)
					</th>
					<th style="font-size: 18px; text-align: center; width: 13%;">출발 시간<br>(Dep Time)
					</th>
					<th style="font-size: 18px; text-align: center; width: 13%;">도착 예정 시간<br>(Arrive
						Time)
					</th>
					<th style="font-size: 18px; text-align: center; width: 12%;">지연 시간<br>(Delay Time) 
					</th>
					<th style="font-size: 18px; text-align: center; width: 10%;">상태<br>(Status)
					</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>

					<c:when test="${ board.size() >= 10 }">
						<c:forEach var="vo" items="${board }">
							<tr class="line" id="line+${vo.row_num }">
								<td style="font-size: 22px; text-align: center">${vo.cname }</td>
								<td style="font-size: 22px; text-align: center" id="test">${vo.pname }</td>
								<td style="font-size: 22px; text-align: center">${vo.area }</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime" value="${vo.dtime }"/>
									${fn:substring(dtime,0,10) } <br>
									${fn:substring(dtime,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center" id="date+${vo.row_num }">
									<c:set var = "dtime2" value="${vo.dtime2 }"/>
									${fn:substring(dtime2,0,10) } <br>
									${fn:substring(dtime2,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center" id="delay+${vo.row_num }">-</td>
								<%-- <td style="font-size: 18px; text-align: center" id="state+${vo.row_num }">${vo.dstate }</td> --%>
								<td style="font-size: 22px; text-align: center" id="${vo.row_num }" class="state">${vo.dstate }</td>
							</tr>
						</c:forEach>
					</c:when>
					
					<c:when test="${ board.size() eq 1 }">
						<c:forEach var="vo" items="${board }">
							<tr class="line" id="line+${vo.row_num }">
								<td style="font-size: 22px; text-align: center;">${vo.cname }</td>
								<td style="font-size: 22px; text-align: center;" id="test">${vo.pname }</td>
								<td style="font-size: 22px; text-align: center;">${vo.area }</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime" value="${vo.dtime }"/>
									${fn:substring(dtime,0,10) } <br>
									${fn:substring(dtime,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center" id="date+${vo.row_num }">
									<c:set var = "dtime2" value="${vo.dtime2 }"/>
									${fn:substring(dtime2,0,10) } <br>
									${fn:substring(dtime2,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center;" id="delay+${vo.row_num }">-</td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state">${vo.dstate }</td>
							</tr>
						</c:forEach>
						<c:forEach var="num" begin="1" end="9">
							<tr>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="test"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state"></td>
							</tr>
						</c:forEach>
					</c:when>
					
					<c:when test="${ board.size() eq 2 }">
						<c:forEach var="vo" items="${board }">
							<tr class="line" id="line+${vo.row_num }">
								<td style="font-size: 22px; text-align: center;">${vo.cname } </td>
								<td style="font-size: 22px; text-align: center;" id="test">${vo.pname }</td>
								<td style="font-size: 22px; text-align: center;">${vo.area }</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime" value="${vo.dtime }"/>
									${fn:substring(dtime,0,10) } <br>
									${fn:substring(dtime,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center" id="date+${vo.row_num }">
									<c:set var = "dtime2" value="${vo.dtime2 }"/>
									${fn:substring(dtime2,0,10) } <br>
									${fn:substring(dtime2,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center;" id="delay+${vo.row_num }">-</td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state">${vo.dstate }</td>
							</tr>
						</c:forEach>
						<c:forEach var="num" begin="1" end="8">
							<tr>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="test"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state"></td>
							</tr>
						</c:forEach>
					</c:when>
					
					<c:when test="${ board.size() eq 3 }">
						<c:forEach var="vo" items="${board }">
							<tr class="line" id="line+${vo.row_num }">
								<td style="font-size: 22px; text-align: center;">${vo.cname } </td>
								<td style="font-size: 22px; text-align: center;" id="test">${vo.pname }</td>
								<td style="font-size: 22px; text-align: center;">${vo.area }</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime" value="${vo.dtime }"/>
									${fn:substring(dtime,0,10) } <br>
									${fn:substring(dtime,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center" id="date+${vo.row_num }">
									<c:set var = "dtime2" value="${vo.dtime2 }"/>
									${fn:substring(dtime2,0,10) } <br>
									${fn:substring(dtime2,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center;" id="delay+${vo.row_num }">-</td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state">${vo.dstate }</td>
							</tr>
						</c:forEach>
						<c:forEach var="num" begin="1" end="7">
							<tr>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="test"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state"></td>
							</tr>
						</c:forEach>
					</c:when>
					
					<c:when test="${ board.size() eq 4 }">
						<c:forEach var="vo" items="${board }">
							<tr class="line" id="line+${vo.row_num }">
								<td style="font-size: 22px; text-align: center;">${vo.cname }</td>
								<td style="font-size: 22px; text-align: center;" id="test">${vo.pname }</td>
								<td style="font-size: 22px; text-align: center;">${vo.area }</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime" value="${vo.dtime }"/>
									${fn:substring(dtime,0,10) } <br>
									${fn:substring(dtime,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center" id="date+${vo.row_num }">
									<c:set var = "dtime2" value="${vo.dtime2 }"/>
									${fn:substring(dtime2,0,10) } <br>
									${fn:substring(dtime2,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center;" id="delay+${vo.row_num }">-</td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state">${vo.dstate }</td>
							</tr>
						</c:forEach>
						<c:forEach var="num" begin="1" end="6">
							<tr>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="test"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state"></td>
							</tr>
						</c:forEach>
					</c:when>
					
					<c:when test="${ board.size() eq 5 }">
						<c:forEach var="vo" items="${board }">
							<tr class="line" id="line+${vo.row_num }">
								<td style="font-size: 22px; text-align: center;">${vo.cname } </td>
								<td style="font-size: 22px; text-align: center;" id="test">${vo.pname }</td>
								<td style="font-size: 22px; text-align: center;">${vo.area }</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime" value="${vo.dtime }"/>
									${fn:substring(dtime,0,10) } <br>
									${fn:substring(dtime,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center" id="date+${vo.row_num }">
									<c:set var = "dtime2" value="${vo.dtime2 }"/>
									${fn:substring(dtime2,0,10) } <br>
									${fn:substring(dtime2,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center;" id="delay+${vo.row_num }">-</td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state">${vo.dstate }</td>
							</tr>
						</c:forEach>
						<c:forEach var="num" begin="1" end="5">
							<tr>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="test"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state"></td>
							</tr>
						</c:forEach>
					</c:when>
					
					<c:when test="${ board.size() eq 6 }">
						<c:forEach var="vo" items="${board }">
							<tr class="line" id="line+${vo.row_num }">
								<td style="font-size: 22px; text-align: center;">${vo.cname }</td>
								<td style="font-size: 22px; text-align: center;" id="test">${vo.pname }</td>
								<td style="font-size: 22px; text-align: center;">${vo.area }</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime" value="${vo.dtime }"/>
									${fn:substring(dtime,0,10) } <br>
									${fn:substring(dtime,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center" id="date+${vo.row_num }">
									<c:set var = "dtime2" value="${vo.dtime2 }"/>
									${fn:substring(dtime2,0,10) } <br>
									${fn:substring(dtime2,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center;" id="delay+${vo.row_num }">-</td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state">${vo.dstate }</td>
							</tr>
						</c:forEach>
						<c:forEach var="num" begin="1" end="4">
							<tr>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="test"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state"></td>
							</tr>
						</c:forEach>
					</c:when>
					
					<c:when test="${ board.size() eq 7 }">
						<c:forEach var="vo" items="${board }">
							<tr class="line" id="line+${vo.row_num }">
								<td style="font-size: 22px; text-align: center;">${vo.cname }</td>
								<td style="font-size: 22px; text-align: center;" id="test">${vo.pname }</td>
								<td style="font-size: 22px; text-align: center;">${vo.area }</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime" value="${vo.dtime }"/>
									${fn:substring(dtime,0,10) } <br>
									${fn:substring(dtime,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center" id="date+${vo.row_num }">
									<c:set var = "dtime2" value="${vo.dtime2 }"/>
									${fn:substring(dtime2,0,10) } <br>
									${fn:substring(dtime2,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center;" id="delay+${vo.row_num }">-</td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state">${vo.dstate }</td>
							</tr>
						</c:forEach>
						<c:forEach var="num" begin="1" end="3">
							<tr>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="test"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state"></td>
							</tr>
						</c:forEach>
					</c:when>
					
					<c:when test="${ board.size() eq 8 }">
						<c:forEach var="vo" items="${board }">
							<tr class="line" id="line+${vo.row_num }">
								<td style="font-size: 22px; text-align: center;">${vo.cname } </td>
								<td style="font-size: 22px; text-align: center;" id="test">${vo.pname }</td>
								<td style="font-size: 22px; text-align: center;">${vo.area }</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime" value="${vo.dtime }"/>
									${fn:substring(dtime,0,10) } <br>
									${fn:substring(dtime,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center" id="date+${vo.row_num }">
									<c:set var = "dtime2" value="${vo.dtime2 }"/>
									${fn:substring(dtime2,0,10) } <br>
									${fn:substring(dtime2,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center;" id="delay+${vo.row_num }">-</td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state">${vo.dstate }</td>
							</tr>
						</c:forEach>
						<c:forEach var="num" begin="1" end="2">
							<tr>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="test"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state"></td>
							</tr>
						</c:forEach>
					</c:when>
					
					<c:when test="${ board.size() eq 9 }">
						<c:forEach var="vo" items="${board }">
							<tr class="line" id="line+${vo.row_num }">
								<td style="font-size: 22px; text-align: center;">${vo.cname } </td>
								<td style="font-size: 22px; text-align: center;" id="test">${vo.pname }</td>
								<td style="font-size: 22px; text-align: center;">${vo.area }</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime" value="${vo.dtime }"/>
									${fn:substring(dtime,0,10) } <br>
									${fn:substring(dtime,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center" id="date+${vo.row_num }">
									<c:set var = "dtime2" value="${vo.dtime2 }"/>
									${fn:substring(dtime2,0,10) } <br>
									${fn:substring(dtime2,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center;" id="delay+${vo.row_num }">-</td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state">${vo.dstate }</td>
							</tr>
						</c:forEach>
						<c:forEach var="num" begin="1" end="1">
							<tr>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="test"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state"></td>
							</tr>
						</c:forEach>
					</c:when>

					<c:otherwise>
						<td colspan="8" style="height: 100px; text-align: center;">해당
							일에는 자료가 없습니다.</td>
					</c:otherwise>

				</c:choose>
			</tbody>
		</table>
		
	<div class="row" style="display:flex;">

	<div class="" style="padding-top: 0px; width: 33%; float: left;">
		<span style="padding-left: 15px; margin-left: 15px;">※ 납품 이상 발생시 연락처 : 정혜영 차장 010-3374-0706</span>
	</div>
	
	<div class="" style="width: 33%; text-align: center; float: left; padding-top: -10px; margin-top: -10px;">
		<ul class="pagination" style="padding-top:0px;">
			<li><a href="javascript:getUserList( '1' ,'')">&nbsp;&lt;&lt;&nbsp;</a></li>

			<c:if test="${currentPage > 1 }">
				<li><a href="javascript:getUserList(${ currentPage-1 },'');">&nbsp;&lt;&nbsp;</a></li>
			</c:if>
			<c:if test="${currentPage <= 1 }">
				<li><a href="javascript:getUserList(${ currentPage},'');">&nbsp;&lt;&nbsp;</a></li>
			</c:if>


			<c:forEach var="pg" items="${ paging }">
				<c:if test="${ pg == currentPage }">
					<!-- button type="button" class="btn" onclick="getUserList(${ pg },'');" style="font-weight:bold;">&nbsp;${ pg }&nbsp;</button-->
					<li class="active"><a
						href="javascript:getUserList(${ pg},'');">${ pg }</a></li>
				</c:if>
				<c:if test="${ pg != currentPage }">
					<!-- button type="button" class="btn" onclick="getUserList(${ pg },'');">&nbsp;${ pg }&nbsp;</button-->
					<li><a href="javascript:getUserList(${ pg},'');">${ pg }</a></li>
				</c:if>
			</c:forEach>

			<c:if test="${ currentPage < maxPage }">

				<!--button type="button" class="btn1" onclick="getUserList(${currentPage+1},'');">&nbsp;&gt;&nbsp;</button-->
				<li><a href="javascript:getUserList(${ currentPage+1},'');">&nbsp;&gt;&nbsp;</a></li>
			</c:if>
			<c:if test="${ currentPage >= maxPage }">
				<!-- button type="button" class="btn1">&nbsp;&gt;&nbsp;</button-->
				<li><a href="javascript:getUserList(${ currentPage},'');">&nbsp;&gt;&nbsp;</a></li>
			</c:if>
			
			<li><a href="javascript:getUserList(${maxPage},'');">&nbsp;&gt;&gt;&nbsp;</a></li>

		</ul>
	</div>
	
	<div style="float:right; width: 33%;">
	
	</div>
	
</div>
	</div>

	<!-- jQuery 2.2.3 -->
	<script src="asset/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="asset/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.number.min.js"></script>
	<script src="resources/js/jquery.number.js"></script>

	<!-- FastClick -->
	<script src="asset/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="asset/dist/js/app.min.js"></script>
	<!-- Sparkline -->
	<script src="asset/plugins/sparkline/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script src="asset/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="asset/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

	<script src="asset/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<!-- DataTables -->
	<script src="asset/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="asset/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src="asset/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- ChartJS 1.0.1 -->
	<script src="asset/plugins/chartjs/Chart.min.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<!-- script src="asset/dist/js/pages/dashboard2.js"></script-->
	<!-- AdminLTE for demo purposes -->
	<script src="asset/dist/js/demo.js"></script>



	<script type="text/javascript">
		/* $(document).ready(function() {
			alert(${param.indate });
		}); */
		//★★★★★삭제예정220721★★★★★시작
		function getParameterByName(name){
			name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	                results = regex.exec(location.search);
	        return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		}
		
		var indate = getParameterByName('indate');
		
		function show_list(cname){
			//alert(cname);
			//alert(indate);
			window.open("mng_delivery_detail?indate="+indate+"&cname="+cname,"Delivery Detail",'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
		}
		//★★★★★삭제예정220721★★★★★끝
		$(document).ready(function(){
			<c:forEach items="${board}" var="vo">
				//alert(${vo.row_num});
				//var state = document.getElementById("state"+${vo.row_num});
				//var state = document.getElementById("state+${vo.row_num}").value;
				//var state = $("state+${vo.row_num }").text();
				//var state = $("#test").text();
				var dtime2 = document.getElementById("date+${vo.row_num }").innerText;
				dtime2_day = dtime2.substr(0,10); 
				dtime2_time = dtime2.substr(11,16);
			
				dtime2 = dtime2_day +' '+ dtime2_time+':00';
				dtime2 = dtime2.replace(/-/gi,"/");
			
				dtime2 = new Date(dtime2);
			
				var result = isBefore(dtime2,now);
			
				var state = document.getElementById("${vo.row_num}").innerText;
				//alert(state);
			
				var int_row = "${vo.row_num}" * 1;
	
				/* if(state==="배송중"){
					document.getElementById("${vo.row_num}").innerText = "배송지연";
				} */
			
				if(state==="배송중"){
					if(result){
					
						document.getElementById("${vo.row_num}").innerText="배송지연";
					
						var dif = now.getTime() - dtime2.getTime();
					
						var delayedDay = Math.floor(dif/1000/60/60/24);
						var delayedHour = Math.floor((dif-delayedDay*1000*60*60*24)/1000/60/60);
						var delayedMin = Math.round((dif-(delayedDay*1000*60*60*24)-(delayedHour*1000*60*60))/1000/60);
					
						//var delayed = delayedDay+'일 '+delayedHour+'시간 '+delayedMin+'분';
						
						if(delayedDay==0 && delayedHour==0){
							var delayed = delayedMin+'분';
						}
						else if(delayedDay==0){
							var delayed = delayedHour+'시간  '+delayedMin+'분';
						}
						else{
							var delayed = delayedDay+'일  '+delayedHour+'시간  '+delayedMin+'분';
						}
					
						//var delayedMin = dif/1000/60;
					
						document.getElementById("delay+${vo.row_num }").innerText=delayed;	

						if(int_row%2==1){
							document.getElementById("${vo.row_num }").className -= ' ingcss';
							document.getElementById("line+${vo.row_num }").className += ' blinkcssodd';
							document.getElementById("${vo.row_num}").className += ' boldfont';
						}else{
							document.getElementById("${vo.row_num }").className -= ' ingcss';
							document.getElementById("line+${vo.row_num }").className += ' blinkcsseven';
							document.getElementById("${vo.row_num}").className += ' boldfont';
						}
						
					}else{
						document.getElementById("${vo.row_num }").className += ' ingcss';
					}
				}else if(state === "배송완료"){
					document.getElementById("${vo.row_num }").className += ' finishcss';
				}
			
				//alert(int_row);
				
				if(int_row%2==1){
					document.getElementById("line+${vo.row_num }").className += ' odd';
				}else{
					document.getElementById("line+${vo.row_num }").className += ' even';
				}
			</c:forEach>
			
			//var indate = getParameterByName('indate');
			//alert(indate);
			var ydate = indate.substring(0,4) + "년 ";
			var mdate = indate.substring(4,6) + "월 ";
			var ddate = indate.substring(6,8) + "일";
				
			document.getElementById("date").innerHTML = ydate + mdate + ddate;
			
			
			/* var state=$("#test").text();
			alert(state); */
			
			//페이지 자동 이동
			var pageChange = setInterval(()=>{
				
				<c:forEach var="pg" items="${paging}">
				
				//alert(${pg});
				//alert(${currentPage});
				//alert(${maxPage});
				//alert(${currentPage});
				//alert(${maxPage});
				
				var cur = ${currentPage};
				var max = ${maxPage};
				
					/* if(cur == max){
						//alert("y");
						$('#p1').get(0).click();
						//<c:set var="doneLoop" value="true"/>
						return;
					}else{
						//alert("n");
						//alert(cur+max);
						//$('#next').get(0).click();
						var nextPage = cur + 1;
						//alert(nextPage);
						$('#p'+nextPage).get(0).click();
						//$('#next').get(0).click();
						//<c:set var="doneLoop" value="true"/>
						//$('#p'cur+1).get(0).click();
						return;
					} */
				
				</c:forEach>
				
			},10000)
		})
			
		/* <c:forEach items="${board}" var="vo">
		
			var state = document.getElementById("state"+${vo.row_num });
			
			if(state.innerText === "배송중중"){
				document.getElementById('line').style.backgroundColor='red';
			}
			
		</c:forEach> */
		
		/* var timer = setInterval(currentTime, 1000);
		
		function currentTime() {
			var d = new Date();
			$('#set_timer').text(d.toLocaleString());
		} */
		
		function currentTime(){
			
			var xmlHttpRequest;
			if(window.XMLHttpRequest){
				xmlHttpRequest = new XMLHttpRequest();
			}else if(window.ActiveXOject){
				xmlHttpRequest = new ActiverXObject("Microsoft.XMLHTTP");
			}else{
				return;
			}
			
			xmlHttpRequest.open('HEAD',window.location.href.toString(), false);
			xmlHttpRequest.setRequestHeader("ContentType","text/html");
			xmlHttpRequest.send('');
			
			var serverDate = xmlHttpRequest.getResponseHeader("Date");
			
			//var timer = setInterval(currentTime,1000);
			
			var d = new Date(serverDate);
			//d = d.setSeconds(d.getSeconds()+1);
			//$('#set_timer').text(d.toLocaleString());
			//$('#set_timer').text(d);
			return d;
		}

		//var now = new Date(currentTime);
		const now = currentTime();
		$('#set_timer').text(now.toLocaleString());
		//alert(now);

		/* setInterval(function(){
			//console.log("@@@");
			currentTime();
		},1000); */

		var timer = setInterval(()=>{
			console.log("1초마다@@@@");
			now.setSeconds(now.getSeconds()+1);
			//console.log(now);
			//console.log(now);
			//console.log(currentTime());
			//currentTime();
			//now;
			//date();
			//now.setSeconds(now.getSeconds()+100);
			$('#set_timer').text(now.toLocaleString());
		},1000);
		
		var delay = setInterval(()=>{
			
			//forchk.setMinutes(now.getMinutes()+10);
			forchk.setSeconds(now.getMinutes()+10);
			
			<c:forEach items="${board}" var="vo">
				
				var dtime2 = document.getElementById("date+${vo.row_num }").innerText;
				dtime2_day = dtime2.substr(0,10); 
				dtime2_time = dtime2.substr(11,16);
				
				dtime2 = dtime2_day +' '+ dtime2_time+':00';
				dtime2 = dtime2.replace(/-/gi,"/");
				
				dtime2 = new Date(dtime2);
				
				//var result = isBefore(dtime2,now);
				
				//var start = new Date(2020,2,3);
				//var end = new Date(2021,1,2);
				//var result = isBefore(start,end);
				
				//alert(result);
				
				//alert(dtime2);
				//alert(now);
				var result = isBefore(dtime2,forchk);
				//alert(result);
				
				var state = document.getElementById("${vo.row_num}").innerText;
				
				var int_row = "${vo.row_num}" * 1;
				
				if(state==="배송중"){
					if(result){
						
						document.getElementById("${vo.row_num}").innerText="배송지연";
						
						var dif = forchk.getTime() - dtime2.getTime();
						
						var delayedDay = Math.floor(dif/1000/60/60/24);
						var delayedHour = Math.floor((dif-delayedDay*1000*60*60*24)/1000/60/60);
						var delayedMin = Math.round((dif-(delayedDay*1000*60*60*24)-(delayedHour*1000*60*60))/1000/60);
						
						//var delayed = delayedDay+'일 '+delayedHour+'시간 '+delayedMin+'분';
						
						if(delayedDay==0 && delayedHour==0){
							var delayed = delayedMin+'분';
						}
						else if(delayedDay==0){
							var delayed = delayedHour+'시간  '+delayedMin+'분';
						}
						else{
							var delayed = delayedDay+'일  '+delayedHour+'시간  '+delayedMin+'분';
						}
						
						//var delayedMin = dif/1000/60;
						
						document.getElementById("delay+${vo.row_num }").innerText=delayed;

						if(int_row%2==1){
							document.getElementById("${vo.row_num }").className -= ' ingcss';
							document.getElementById("line+${vo.row_num }").className += ' blinkcssodd';
							document.getElementById("${vo.row_num}").className += ' boldfont';
						}else{
							document.getElementById("${vo.row_num }").className -= ' ingcss';
							document.getElementById("line+${vo.row_num }").className += ' blinkcsseven';
							document.getElementById("${vo.row_num}").className += ' boldfont';
						}
						
					}
				}
			
			</c:forEach>
			
		},600000);
		
		const isBefore=(date1,date2)=>{
			return (date1 - date2) < 0
		}
		
		function getUserList(page, keyword) {
			//alert("!");
			/* alert(page); */
			//alert(keyword);
			var form = document.formdata;
			var pageView = "mng_delivery_detail_table";
			var startdate = $('#startdate').val();
			var itemCountPerPage = 10;
			var indate = getParameterByName('indate');
			var cno = getParameterByName('cno');
			var branch = getParameterByName('branch');
			/* alert(indate); */
			//alert(cno);
			//alert(branch);
			
			$.ajax({
				type : "get",
				url : "mng_delivery_detail",
				dataType : "html",
				data : {
					page : page,
					pageView : pageView,
					startdate : startdate,
					itemCountPerPage : itemCountPerPage,
					indate : indate,
					cno : cno,
					branch : branch
				}
			}).done(function(data) {
				/* alert("done"); */
				$("#tabledata").html("");
				$("#tabledata").html(data);
				$('td.number').number(true, 0);
			}).fail(function(xhr, status, error) {
				alert("error!");
			});
		}
	</script>
</body>
</html>