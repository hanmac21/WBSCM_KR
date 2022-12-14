<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/jsHeader.jsp"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>우보테크(관리자)</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css"/>

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
  
<!-- <script src="//code.jquery.com/jquery-latest.min.js"></script>   -->
</head>

<form id="formdata" name="formdata" method="post">
	<input type="hidden" id="userid" name="userid" value="111">
</form>
<form id="formdata2" name="formdata2" method="post">
	<input type="hidden" name="startdate" value=""> <input
		type="hidden" name="enddate" value=""> <input type="hidden"
		name="gubun" value=""> <input type="hidden" name="com_text"
		value=""> <input type="hidden" name="pageView" value="">
</form>

<style type="text/css" class="init">
th, td {
	white-space: nowrap;
}

div.dataTables_wrapper {
	margin: 0 auto;
}

div.container {
	width: 80%;
}
</style>
<style>
table {
	width: 100%;
	border: 1px solid #bbc6d3;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #bbc6d3;
	padding: 10px;
}

/* #Progress_Loading {
	position: absolute;
	left: 50%;
	top: 50%;
	background: #ffffff;
} */

#back{
	position: absolute;
	z-index: 100;
	background-color: #000000;
	display: none;
	left: 0;
	top: 0;
}

#loadingBar{
	position: absolute;
	left: 50%;
	top: 50%;
	display: none;
	z-index: 200;
	transform: translate(-10%, -15%);
	width: 48%;
	height: 50%;
}

#tablebody{
	width: 100%;
	border: 0px;
	border-collapse: collapse;
	display: bolck;
	margin-top: 0px;
}

#tablebody th{
	position: sticky;
	top: 0px;
	background-color: white;
	border-top: 2px;
	box-shadow: inset 0 1px 0  #bbc6d3, inset 0 -1px 0 #bbc6d3;
}

.tableWrapper{
	width: 100%;
	height: 675px;
	overflow: auto;
}

.switch-button{
	position: relative;
	display: inline-block;
	width: 55px;
	height: 30px;
}

.switch-button input{
	opacity: 0;
	width: 0;
	height: 0;
}

.onoff-switch{
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	border-radius: 20px;
	background-color: #ccc;
	box-shadow: inset 1px 5px 1px #999;
	-webkit-transition: .4s;
	transition: .4s;
}

.onoff-switch:before{
	position: absolute;
	content: "";
	height: 22px;
	width: 22px;
	left: 4px;
	bottom: 4px;
	background-color: #fff;
	-webkit-transition: .5s;
	transition: .4s;
	border-radius: 20px;
}

.switch-button input:checked + .onoff-switch{
	background-color: #F2D522;
	box-shadow: inset 1px 5px 1px #E3AE56;
}

.switch-button input:checked + .onoff-switch:before{
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

</style>

<script type="text/javascript">
/* var timer = setInterval(currentTime,1000);
function currentTime(){
	  
	var d= new Date();
	//  console.log("time :" +d.toLocaleString());
	$('#set_timer').text(d.toLocaleString());
} */
</script>
<body class="hold-transition skin-blue layout-top-nav">
	<div class="wrapper">

		<header class="main-header">
			<nav class="navbar navbar-static-top">
				<jsp:include page="../common/mng_top_menu.jsp"></jsp:include>
				<!-- /.container-fluid -->
			</nav>
		</header>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<!-- <h1 style="float:left;">
					거래명세서관리 <small></small>
				</h1> -->
				
				<span style="float:left; font-size: 30px;">거래명세서관리</span>
				
				<span id="set_timer"
							class="pull-right" style="margin-right: 20px; font-size: 30px; float:right;"></span>
				
				<!-- <div id="Progress_Loading">
					<img src="resources/img/loadingbar1.gif">
				</div> -->
				<!-- ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol-->
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Info boxes -->
				<!-- 공통 검색 조건 -->
				<div class="row" style="width: 100%; margin-bottom: 5px; padding-bottom: 5px;">
					<!-- 공통 검색 조건 -->
					<div class="col-xs-12" style="padding-right: 0px;">
						<span>입고일자 : </span> &nbsp;<%-- <input type="text" id="startdate"
							name="startdate" style=" width: 100px"
							autocomplete="off" value="${startdate}" /> --%>
							
							<input type="text" id="startdate" name="startdate" value="${startdate }" style="width:125px" readonly='true'/>
							
						&nbsp; <span>공장 : </span> &nbsp;<select id="branch" name="branch" style="height:27px;">
							<option value="007" ${branch =='007' ? 'selected' :'' }>전체</option>
							<option value="000" ${branch =='000' ? 'selected' :'' }>평택</option>
							<option value="001" ${branch =='001' ? 'selected' :'' }>울산</option>
						</select>	
							
							<input
							type="button" class="btn btn-warning" onclick="getUserList('1')"
							value="조회하기" style="margin-left: 25px" id="ok" />
							
							<%if("master".equals(admin)){ %>							
							<input type="button" style="margin-left: 25px" class="btn btn-warning" value="납품 현황 보기" onclick="showMoni();"/>
							<%} %>
							
							<!-- 배송완료 품목 제외 체크박스 -->
		  					<label for="finishedChk" style="margin-left:25px; vertical-align:-4px;">배송완료 제외</label>
    						<label class="switch-button">
		  						<input type="checkbox" id="finishedChk"/>
    							<span class="onoff-switch"></span>
    						</label>
							
							<div id="page" style="float:right;">
								<span>페이지 당</span>
								
								<select id="itemCountPerPage" class="selectpicker"
									style="width: 60px; height: 27px" onchange="getUserList('1')">
									<option value="30" ${itemCountPerPage =='30'  ? 'selected' :'' }>30</option>
									<option value="100" ${itemCountPerPage =='100' ? 'selected' :'' }>100</option>
									<option value="300" ${itemCountPerPage =='300' ? 'selected' :'' }>300</option>
								</select>
								
								<span>개 씩 표시</span>	
							</div>	

						<!-- input type="button" class="btn btn-info"	onclick="exportToExcel()" value="엑셀변화"			style="float: right; margin-right: 10px;" /-->

					</div>
				</div>
				<div id="tabledata">
				
					<div class="row">
						<div class="col-xs-12">
							<div class="box">
								<!-- /.box-header -->
								<div class="box-body tableWrapper" style="overflow: scroll; padding: 0 0 0 0;">
									<!-- input type="button" class="btn btn-warning navbar-right" onclick="fnCancelPop()" value="삭제"/></td-->
									<table id="tablebody" width="100%"
										class="stripe row-border order-column" cellspacing="0">
										<thead>
											<tr>
												<th width="3%" style="text-align: center;">번호</th>
												<th width="7%" style="text-align: center;">바코드번호</th>
												<th width="3%" style="text-align: center;">지역</th>
												<th width="5%" style="text-align: center;">입고일자</th>
												<th width="3%" style="text-align: center;">협력사코드</th>
												<th width="11%" style="text-align: center;">협력사명</th>
												<th width="5%" style="text-align: center;">차종</th>
												<th width="4%" style="text-align: center;">수량</th>
												<th width="14%" style="text-align: center;">배송상태</th>
												<th width="8%" style="text-align: center;">작성일</th>
												<th width="7%" style="text-align: center;">
													<input type="checkbox" name="chk_del" id="del_all" value="del_all" class="chkall">&nbsp;&nbsp;&nbsp;
													<button type="button" id="all_del" onclick="fnAllDel()">삭제</button>
													<!-- 삭제 -->
												</th>
												
												<!-- th>과부족</th-->
											</tr>
										</thead>
										<tbody>
											<c:choose>

												<c:when test="${ board.size() > 0 }">

													<c:forEach var="vo" items="${ board }" varStatus="status">

														<tr>
															<td style="text-align: center;">${vo.row_num}</td>
															<td style="text-align: center;">${vo.barcode}</td>
															<td style="text-align: center;" id="${vo.row_num }">${vo.plant }</td>
															<td style="text-align: center;">${vo.indate}</td>
															<td style="text-align: center;">${vo.cno}</td>
															<td style="text-align: center;">${vo.cname}</td>
															<td style="text-align: center; overflow: hidden; text-overflow: ellipsis;">${vo.carkind}</td>
															<td class="number"
																style="font-size: 18px; text-align: center;">${vo.t_qty}</td>
															<td style="text-align: center;">
															<c:choose>
																	<c:when test="${vo.dstate=='출하준비중'}">
																		<input type="button" class="btn btn-warning"
																			onclick="fnDelivertView('${vo.deliveryno}','배송중','${vo.plant }')"
																			style="font-size: 18px" value="출하준비중" />
																	</c:when>

																	<c:when test="${vo.dstate=='배송중'}">
																		<input type="button" class="btn btn-primary"
																			onclick="fnDelivertView2('${vo.deliveryno}','배송완료')"
																			style="font-size: 18px" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;배송중&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" />
																	</c:when>
																	<c:otherwise>
																		<input type="button" class="btn btn-info"
																			style="font-size: 18px" value="&nbsp;&nbsp;&nbsp;배송완료&nbsp;&nbsp;" />
																	</c:otherwise>
																</c:choose>
																 <input type="button" class="btn bg-maroon"
																onclick="fnTrns('${vo.barcode}','${vo.prdate }')"
																style="font-size: 18px" value="재발행" /></td>
															<td style="text-align: center;">${vo.prdate}</td>	
															<td style="text-align: center;">
																<input type="checkbox" name="del" id="${vo.barcode }" data-chkBar="${vo.barcode }" class="chkbox">&nbsp;&nbsp;&nbsp;
																<button type="button" onclick="fnDel('${vo.barcode}')">삭제</button>
															</td>
														</tr>

													</c:forEach>
												</c:when>
												<c:otherwise>

													<tr>
														<td colspan="11"
															style="height: 100px; text-align: center;">검색된 자료가
															없습니다.</td>
													</tr>
												</c:otherwise>

											</c:choose>
										</tbody>
									</table>

								</div>
							</div>
						</div>
					</div>



	<div class="row" style="display:flex;">

	<div class="" style="padding-top: 0px; width: 33%; float: left;">
		<span style="margin-left: 10px;">건수 : ${ itemCount }</span>
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
		<div class="pull-right hidden-xs">
				<b></b>
		<strong>Copyright &copy; 2021 <a href="#">우보테크</a>.
		</strong> All rights reserved.
		</div>
	</div>
	
</div>


					<div></div>

				</div>


				<div id="modalPop" class="modal fade"></div>


				<div id="modalPop2" class="modal fade" style="text-align: center;">
				</div>


				<div id="modalPop3" class="modal fade"></div>


				<div id="modalPop4" class="modal fade"></div>
				
				<div id="modalPop5" class="modal fade"></div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- <footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b></b>
			</div>
			<strong>Copyright &copy; 2021 <a href="#">우보테크</a>.
			</strong> All rights reserved.
		</footer> -->

		<!-- Control Sidebar -->

		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>

	</div>
	<!-- ./wrapper -->


	<!-- <!-- jQuery 2.2.3 -->
	<script src="asset/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="asset/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.number.min.js"></script>
	<script src="resources/js/jquery.number.js"></script>


<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> -->

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
		<!-- Core plugin JavaScript-->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="resources/js/jquery.print-preview.js"></script>
	<script src="resources/js/sb-admin-2.min.js"></script>
	<script src="resources/js/printThis.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>


	<script type="text/javascript">
	$(function() {
		/* $('#p_delivery_date').datepicker({
			format : 'yyyy-mm-dd'
		}); */
		
		$("#startdate").datepicker ({ 
			  format: 'yyyy-mm-dd',
			  todayBtn:true,
			  todayBtn:'linked'
			  
		  }).on('change',function(){
				$('.datepicker').hide();
		  });
		
		$("#startdate").datepicker().datepicker("setDate", new Date());
	});
	$(document).ready(function() {
		//$('#Progress_Loading').hide();
		var without = getCookie("without");
		if(without==="yes"){
			$("input:checkbox[id='finishedChk']").prop("checked",true);
			document.getElementById('ok').click();
		}
		
		//완료 제외 여부 2022-04-25 정인우
		$("#finishedChk").change(function(){
			if($("#finishedChk").is(":checked")){
				setCookie("without","yes");
				document.getElementById('ok').click();
			}else{
				setCookie("without","no");
				document.getElementById('ok').click();
			}
		});
		
		//공장 값 가져온거 텍스트로 세팅 2022-04-25 정인우
		<c:forEach items="${board}" var="vo">
			var region = document.getElementById("${vo.row_num}").innerText;
			
			if(region==="000"){
				document.getElementById("${vo.row_num}").innerText = "평택";
			}else if(region==="001"){
				document.getElementById("${vo.row_num}").innerText = "울산";
			}
		</c:forEach>
		
	});
	/* .ajaxStart(function(){
		$('#Progress_Loading').show();
	}).ajaxStop(function(){
		$('#Progress_Loading').hide();
	}); */
	
	$(document).ready(function() {
		//$('#Progress_Loading').hide();
		
	}).ajaxStart(function(){
		FunLoadingBarStart();
		//$('#Progress_Loading').show();
	}).ajaxStop(function(){
		FunLoadingBarEnd();
		//$('#Progress_Loading').hide();
	});
	
	var chkall = document.querySelector('.chkall');
	var chkbox = document.querySelectorAll('.chkbox');
	
	//삭제 체크박스 전체 선택 2022-04-25 정인우
	chkall.onclick = function(){
		//alert('chk!');
		//alert(chkbox.length);
		if(chkall.checked == false){
			for(var i = 0; i<chkbox.length; i++){chkbox[i].checked = false;}
		}else{
			for(var i = 0; i<chkbox.length; i++){chkbox[i].checked = true;}
		}
	}
	
	for(var i=0;i<chkbox.length;i++){
		chkbox[i].onclick=function(){
			//alert('chk!!');
			if(this.checked==false){chkall.checked=false;}
		}
	}
	
	function fnClCon(){
		//$('#modalPop3').modal('hide');
		$('#close').click();
	}
	
	//여러개 선택 삭제 2022-04-25 정인우
	function fnAllDel(){
		
		//var startdate = $('#startdate').val();
		//alert(startdate);	
		var cnt = $("input[class='chkbox']:checked").length;
			
		if(cnt==0){
			alert("선택된 내역이 없습니다.");
			return false;
		}
		
		if(confirm(cnt + "개의 내역을 삭제 하시겠습니까?")){
			
			var checkArr = new Array();
			
			$("input[class='chkbox']:checked").each(function(){
				checkArr.push($(this).attr("data-chkBar"));
			});
			
			//alert(checkArr);
			
			$.ajax({
				type:"get",
				url:"mng_trns_delAll",
				dataType:"html",
				data:{
					delList : checkArr
				}
			}).done(function(data){
				document.getElementById('ok').click();
			});
			
		}else{
			return false;
		}
	}
	
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
	
	/* function currentTime(){
		
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
		$('#set_timer').text(d.toLocaleString());
	}   */
	
	/* setInterval(function(){
		//console.log("@@@");
		currentTime();
	},1000); */
	
	/* var timer = setInterval(()=>{
		//console.log("1초마다@@@@");
		currentTime();
	},1000); */
	
	function FunLoadingBarStart(){
		var backHeight = $(document).height();
		var backWidth = window.document.body.clientWidth;
		
		var backGroundCover = "<div id='back'></div>";
		var loadingBarImage = '';
		
		loadingBarImage += "<div id='loadingBar'>";
		loadingBarImage += "	<img src='resources/img/wooboloading7.gif'/>";
		loadingBarImage += "</div>";
		
		$('body').append(backGroundCover).append(loadingBarImage);
		
		$('#back').css({'width':backWidth,'height':backHeight,'opacity':'0.3'});
		$('#back').show();
		$('#loadingBar').show();
	}
	
	function FunLoadingBarEnd(){
		$('#back, #loadingBar').hide();
		$('#back, #loadingBar').remove();
	}

	//메모적용
	function fnMemoSet(barcode){
		var memo = $("#s_memo").val();
		var len= memo.length;
		if(len>20){
			alert("20자 이하로 입력해주세요 ")
			return;
		}
		if(memo==null || memo==""){
			alert('비고에 입력된 값이 없습니다.');
			return false;
		}
		
		$("#p_memo").text(memo);
		$("#p_memo2").text(memo);
		
		$.ajax({
			type : "post",
			url : "mng_trns_memo_u",
			dataType : "html",
			data : {
				memo : memo,
				barcode : barcode
				
			}
		}).done(function(data) {
			var isOk = data;
			if (isOk == 1) {
				alert('비고란에 적용되었습니다.');
				
			}else{
				alert('비고란 적용 실패');
			}

		});
	}
	
	//순번
	function fnMemoSet2(barcode){
		var memo2 = $("#s_memo2").val();
		var len = memo2.length;
		
		if(len>20){
			alert("20자 이내로 입력하세요.");
			return;
		}
		if(memo2==null || memo2==""){
			alert('발행순번에 입력된 값이 없습니다.');
			return false;
		}
		
		$("#p_memo3").text(memo2);
		$("#p_memo3").text(memo2);
		
		$.ajax({
			type:"post",
			url:"mng_trns_memo2_u",
			dataType:"html",
			data:{
				memo2:memo2,
				barcode:barcode
			}
		}).done(function(data){
			var isOk = data;
			if(isOk==1){
				alert('발행 순번이 적용되었습니다.');
			}else{
				alert('발행 순번 적용 실패!');
			}
		});
	}
	
	function fnMemoSet3(barcode){
		var prDate = $('#outdate').val();
		if(prDate==null || prDate==""){
			alert('작성일자에 입력된 값이 없습니다.');
			return false;
		}
		$.ajax({
			type:"post",
			url : "mng_trns_memo3_u",
			dataType :"html",
			data:{
				prDate :prDate,
				barcode: barcode
			}
		}).done(function(data){
			var isOk = data;
			if(isOk==1){
				alert('작성일자가 적용되었습니다.');
			}else{
				alert('작성일자 적용 실패!');
			}
		});
	}
	
	//거래명세서 인쇄
	//function fnTrnsPop(barcode,prdate){
		/* if(prdate==""){
			alert('noooo');
			return;
		} */
		//window.open("mng_print?barcode="+barcode+"&prdate="+prdate, "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no,left=0, top=0",'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
	//}
	
	function fnDel(barcode){
		//alert(barcode);
		if(confirm("삭제 하시겠습니까?")){
			$.ajax({
				type:"get",
				url:"mng_trns_del",
				dataType:"html",
				data:{
					barcode:barcode
				}
			}).done(function(data){
				document.getElementById('ok').click();
			});
		}else{
			return false;
		}
		
	}
	
	function fnTrns(barcode){
		//alert("재발행 합니다!");
		
		$.ajax({
			type : "post",
			url : "mng_re_trns_data",
			dataType : "html",
			data : {
				barcode : barcode
				//prdate : prdate
			}
		}).done(function(data) {
			//alert("3");
			$("#modalPop3").html("");
			$("#modalPop3").html(data);
			$('#modalPop3').modal('show');
			//	$('span.number').number( true, 0 );
		});
		
	}
	
	function fnDelivertDt(deliveryno){
		
		$.ajax({
			type : "post",
			url : "mng_delivery_dt",
			dataType : "html",
			data : {
				deliveryno : deliveryno
			}
		}).done(function(data) {
			$("#modalPop").html("");
			$("#modalPop").html(data);
			$('#modalPop').modal('show');
			//	$('span.number').number( true, 0 );
		});
	}
	
	function fndelivery_u2(deliveryno, dstate){
		
		if(!confirm("["+dstate +"]상태로 변경하시겠습니까?")){
			return;
		}
		
		var delivery_date = $("#p_delivery_date2").val();
		var delivery_hour = $("#p_delivery_hour2").val();
		var delivery_min = $("#p_delivery_min2").val();
		
		if("" == delivery_date){
			alert("날짜를 확인하세요!");
			return;
		}
		
		if("" == delivery_hour){
			alert("시간을 확인하세요!");
			return;
		}
		
		if("" == delivery_min){
			alert("분을 확인하세요!");
			return;
		}
		
		$.ajax({
			type : "post",
			url : "mng_delivery_state_u2",
			dataType : "html",
			data : {
				deliveryno:deliveryno,
				dstate:dstate,
				delivery_date:delivery_date,
				delivery_hour:delivery_hour,
				delivery_min:delivery_min
			}
		}).done(function(data) {
			var isOk = data;
			if (isOk == 1) {
				alert('정상 처리되었습니다.');
				//location.reload();
				document.getElementById('ok').click();
				$('#modalPop5').modal('hide');
			}else{
				alert('등록 실패');
			}

		});
		
	}
	
	function fndelivery_u(deliveryno, dstate){
		
		if(!confirm("["+dstate +"]상태로 변경하시겠습니까?")){
			
			return;
		}
		
		var delivery_date = $("#p_delivery_date").val();
		var delivery_hour = $("#p_delivery_hour").val();
		var delivery_min = $("#p_delivery_min").val();
		
		var du_hour = $("#p_du_hour").val();
		var du_min = $("#p_du_min").val();
		
		if("" == delivery_date){
			alert("날짜를 확인하세요!");
			return;
		}
		
		if("" == delivery_hour){
			alert("출발 시간을 확인하세요!");
			return;
		}
		
		if("" == delivery_min){
			alert("출발 분을 확인하세요!");
			return;
		}
		
		if("" == du_hour){
			alert("도착 예정 시간을 확인하세요!");
			return;
		}
		
		if("" == du_min){
			alert("도착 예정 분을 확인하세요!");
			return;
		}
		
		$.ajax({
			type : "post",
			url : "mng_delivery_state_u",
			dataType : "html",
			data : {
				deliveryno:deliveryno,
				dstate:dstate,
				delivery_date:delivery_date,
				delivery_hour:delivery_hour,
				delivery_min:delivery_min,
				du_hour:du_hour,
				du_min:du_min
				
			}
		}).done(function(data) {
			var isOk = data;
			if (isOk == 1) {
				alert('정상 처리되었습니다.');
				//location.reload();
				document.getElementById('ok').click();
				$('#modalPop').modal('hide');
				
			}else{
				alert('등록 실패');
			}

		});
		
	}
	
	function fnDelivertView(deliveryno,dstate,plant){
		
		//alert(deliveryno);
		//alert(plant);
		
		$.ajax({
			type : "post",
			url : "mng_delivery_view",
			dataType : "html",
			data : {
				dstate : dstate,
				deliveryno : deliveryno,
				plant : plant
			}
		}).done(function(data) {
			$("#modalPop").html("");
			$("#modalPop").html(data);
			$('#modalPop').modal('show');
			//	$('span.number').number( true, 0 );
		});
	}
	
	function fnDelivertView2(deliveryno,dstate){
		
		$.ajax({
			type : "post",
			url : "mng_delivery_view2",
			dataType : "html",
			data : {
				dstate : dstate,
				deliveryno : deliveryno
			}
		}).done(function(data) {
			$("#modalPop5").html("");
			$("#modalPop5").html(data);
			$('#modalPop5').modal('show');
			//	$('span.number').number( true, 0 );
		});
	}

		/**
		 * checkbox에서 선택된 항목들의 값을 배열로 리턴한다.
		 * @param checkbox
		 * @returns {Array}
		 */
		function getCheckedValue(checkbox) {
			var chk_arr = document.getElementsByName(checkbox);

			var str = new Array();
			var idx = 0;
			for (i = 0; i < chk_arr.length; i++) {
				if (chk_arr[i].checked) {
					str[idx] = chk_arr[i].value;
					idx++;
				}
			}
			return str;
		}

		 
		function fnCheckedValue(){
			var str = new Array();
			var j=0;
			for (var i = 1; i < $('table tr').size(); i++) {

				// table 중 tr이 i번째 있는 자식중에 체크박스가 체크중이면

				var chk = $('table tr').eq(i).children().find('input[type="checkbox"]').is(':checked');

				if (chk == true) {

				// 그 i 번째 input text의 값을 가져온다.

					var fabric_seq = $('table tr').eq(i).find('select').val();
					str[j] = fabric_seq;
					j++;

				}

			}
			
			return str;

		}
		
		function checkAll(controller, target) {
			var chk_arr = document.getElementsByName(target);
			for (i = 0; i < chk_arr.length; i++) {
				chk_arr[i].checked = controller.checked;
			}
		}

		 function getUserList(page, keyword) {
			 
		 	var form = document.formdata;
		 	
		 	var startdate = $('#startdate').val();
		 	
		 	var branch = $('#branch').val();

		 	var pageView = "mng_re_trns_table";
		 	
		 	var itemCountPerPage =  $('#itemCountPerPage').val();
		 	
		 	var without = getCookie("without");
		 	//alert(without);
		 	
		 	$.ajax({
		 		type:"post",
		 		url:"mng_re_trns",
		 		dataType:"html",
		 		data:{
		 			startdate : startdate,
		 			page : page,
		 			pageView : pageView,
		 			itemCountPerPage : itemCountPerPage,
		 			branch : branch,
		 			without : without
		 		}	
		 		}).done(function(data){
		 			$("#tabledata").html("");
		 			//alert("end1 -> 됨");
		 			$("#tabledata").html(data);
		 			//alert("end2 -> 안됨");
		 			$('td.number').number( true, 0 );
		 			//alert("end");
		 		//	$('span.number').number( true, 0 );
		 		});

		 }
		
		function fnCancelPop() {
			var checkedValue = getCheckedValue('box');

			if (checkedValue == "") {
				alert("삭제할 사용자를 선택한 후 다시 실행해주세요.");
				return false;
			}
			$('#cancelPop').modal('show');
		}

		function fnAppPop(id) {

			$('#userid').val(id);
			$('#modalPop').modal('show');
		}
		
		function fnPop() {
			$('#modalPop').modal('show');
		}
		
		//납품 현황 보기 2022-04-25 정인우
		function showMoni(){
			//alert("d");
			var indate = $('#startdate').val();
			var branch = $('#branch').val();
			indate=indate.replace(/\-/g,'');
			//window.open("mng_delivery_moni?indate="+indate,"Delivery Monitoring",'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
			//window.open("mng_delivery_moni?indate="+indate+"&branch="+branch,"Delivery Monitoring",'height=' + screen.height + ',width=' + screen.width + ',fullscreen=yes');
			window.open("mng_delivery_moni?indate="+indate+"&branch="+branch,"Delivery Monitoring",'height=' + screen.height + ',width=' + screen.width + ',fullscreen=yes');
		}
		
		function rejprint(pno,trbarcode,memo){
			
			//alert(pno);
			//alert(barcode);
			var chk = "0";
			$(document).ready(function(){
				if($("#chk").is(":checked")){
					chk ="1";
				}

			window.open("mng_label_rejprint?pno="+pno+"&trbarcode="+trbarcode+"&memo="+memo+"&chk="+chk,"Report Print",'height=500, width=500');
			//window.open("mng_label_jprint","Report Print",'height=500, width=500');
			});
		}
		
		function jprintdouble(pno,trbarcode,memo){
			var chk = "0";
			$(document).ready(function(){
				if($("#chk").is(":checked")){
					chk ="1";	
				}
			window.open("mng_label_jprintDouble?pno="+pno+"&trbarcode="+trbarcode+"&memo="+memo+"&chk="+chk,"Report Print",'height=500, width=500');
			});
		}
		
		function a4print(pno,trbarcode,memo){
			
			//alert(pno);
			//alert(barcode);
			var chk = "0";
			$(document).ready(function(){
				if($("#chk").is(":checked")){
					chk ="1";
				}

			window.open("mng_label_a4reprint?pno="+pno+"&trbarcode="+trbarcode+"&memo="+memo+"&chk="+chk,"Report Print",'height=900, width=900');
			//window.open("mng_label_jprint","Report Print",'height=500, width=500');
			});
		}
		
		function fnAllLabel(barcode){
			//alert(barcode);
			var sumqty = document.getElementById('p_sumqty').innerText;
			window.open("mng_label_labelAll?barcode="+barcode+"&sumqty="+sumqty,"Report Print",'height=500, width=500');
		}
		
	function a4double(pno,trbarcode,memo){
			
			//alert(pno);
			//alert(barcode);
			var chk = "0";
			$(document).ready(function(){
				if($("#chk").is(":checked")){
					chk ="1";	
				}

			window.open("mng_label_a4double?pno="+pno+"&trbarcode="+trbarcode+"&memo="+memo+"&chk="+chk,"Report Print",'height=900, width=900');
			//window.open("mng_label_jprint","Report Print",'height=500, width=500');
			});
		}
		
		function fnclose2(){
			//fnStartLabel();
			//	alert('a');
			$('#modalPop3').modal('show'); //거래명세서 화면을 가린다.
			$('#modalPop2').modal('hide');
		}
		
		//쿠키 생성 함수
		function setCookie(cName, cValue, cDay) {
			var expire = new Date();
			expire.setDate(expire.getDate() + cDay);
			cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
			if (typeof cDay != 'undefined')
				cookies += ';expires=' + expire.toGMTString() + ';';
			document.cookie = cookies;
		}

		// 쿠키 가져오기 함수
		function getCookie(cName) {
			cName = cName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cName);
			var cValue = '';
			if (start != -1) {
				start += cName.length;
				var end = cookieData.indexOf(';', start);
				if (end == -1)
					end = cookieData.length;
				cValue = cookieData.substring(start, end);
			}
			return unescape(cValue);
		}
				
	</script>

	<script>
	  $( function() {
		  /* $('#startdate').datepicker ({ 
			  format: 'yyyy-mm-dd'
		  }).on('change',function(){
				$('.datepicker').hide();
		  }); */
		  $('#enddate').datepicker ({
			  format: 'yyyy-mm-dd'
		   }).on('change',function(){
				$('.datepicker').hide();
		   });
	  } );
	  
	  /* var timer = setInterval(currentTime,1000);
	  function currentTime(){
		  
		  var d= new Date();
		//  console.log("time :" +d.toLocaleString());
		  $('#set_timer').text(d.toLocaleString());
	  } */
	  function print(){
			$('#modalPop3').modal('show'); //거래명세서 화면을 가린다.
			$('#modalPop').modal('hide'); //거래명세서 화면을 가린다.
			$('#modalPop2').modal('hide');
			$("#label_print").printThis();
			//fnNextLabel();
		}
  </script>
</body>
</html>
