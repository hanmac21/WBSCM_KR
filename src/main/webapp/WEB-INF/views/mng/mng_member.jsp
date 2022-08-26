<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- %@ include file="../common/jsHeader.jsp"%-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>우보테크(관리자)</title>
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
	
 <link rel="stylesheet" href="asset/plugins/datatables/dataTables.bootstrap.css">	

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

<form id="formdata" name="formdata" method="post">
	<input type="hidden" id="userid" name="userid" value="111">
</form>
<form id="formdata2" name="formdata2" method="post">
	<input type="hidden"  name="startdate" value="">
	<input type="hidden"  name="enddate" value="">
	<input type="hidden"  name="gubun" value="">
	<input type="hidden"  name="com_text" value="">
	<input type="hidden"  name="pageView" value="">
</form>

<style type="text/css" class="init">
	  th, td { white-space: nowrap; }
	div.dataTables_wrapper {
		margin: 0 auto;
	}

 	div.container {

        width: 80%;

    }

</style>

 

<!-- 커스텀 CSS -->
<link rel="stylesheet" href="resources/css/comon-custom.css?ver=12">

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header">

			<!-- Logo -->
			<a href="mng_home" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>우보테크</b></span> <!-- logo for regular state and mobile devices, 우보테크(관리자) -->
				<span class="logo-lg"><b>우보테크</b></span>
			</a>

			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<li><a href="logout.do"><i class="fa fa-sign-out"></i></a></li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="asset/dist/img/user2-160x160.jpg" class="img-circle"
							alt="User Image">
					</div>
					<div class="pull-left info">
						<p>
						</p>
						<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
					</div>
				</div>
				<!-- search form -->

				<!-- /.search form -->
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<jsp:include page="../common/mng_left_menu.jsp"></jsp:include>
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					발주원장 <small></small>
				</h1>
				<!-- ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol-->
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Info boxes -->
	<div class="row" style="width: 100%; margin-bottom: 20px;">
		<!-- 공통 검색 조건 -->
		<div class="col-xs-12" style="padding-right: 0px;">
			<span>등록일자</span> 
			<input type="text"  id="startdate" name="startdate" style="margin-left: 10px;">
			<span>~</span>
			<input type="text"  id="enddate" name="enddate"  style="margin-right: 20px;">
			
			<select id="gubun" name="gubun">
				<option value="">선택</option>
				<option value="key1" ${gubun =='key1' ? 'selected' :'' }>이름</option>
				<option value="key2" ${gubun =='key2' ? 'selected' :'' }>아이디</option>
			</select>
			 <input type="text" id="com_text" name="com_text" style="width: 90px"
				value='${text}'> 
			<input type="button" class="btn btn-warning"
				onclick="getUserList('1')" value="조회하기" /> 
				
				
			
			<input type="button"
				class="btn btn-info" onclick="exportToExcel()" value="엑셀변화" style="float: right; margin-right: 10px;" />
				
		</div>
    </div> 
				<div  id="tabledata">
					<div class="row">
						<div class="col-xs-12">
							<div class="box">
								<!-- /.box-header -->
								<div class="box-body">
									<!-- input type="button" class="btn btn-warning navbar-right" onclick="fnCancelPop()" value="삭제"/></td-->
									<table id="tablebody" width="100%" class="stripe row-border order-column" cellspacing="0" >
										<thead>
											<tr>
												<th>사업장</th>
												<th>거래처</th>
												<th>품번</th>
												<th>품명</th>
												<th>발주구분</th>
												<th>21.02.15</th>
												<th>21.02.16</th>
												<th>21.02.17</th>
												<th>21.02.18</th>
												<th>21.02.19</th>
												<th>21.02.20</th>
												<th>21.02.21</th>
												<th>합계</th>
											</tr>
										</thead>
										<tbody>
												<tr>
													<td>(주)우보테크 평택공장</td>
													<td>대원산업(주)</td>
													<td>B20180111111</td>
													<td>DNB FRT 2WAY FRIM(분리형_판매)</td>
													<td>Planning</td>
													<td>360</td>
													<td>-</td>
													<td>480</td>
													<td>480</td>
													<td>480</td>
													<td>-</td>
													<td>1,000</td>
													
												</tr>
										</tbody>
									</table>

								</div>
							</div>
						</div>
					</div>



					<div class="row">
						<div class="col-md-6" style="padding-top: 20px;">
							<span>건수 : ${ itemCount }</span>
						</div>
						<div class="col-md-6" style="width: 85%">
							<ul class="pagination pull-right">
								<li><a href="javascript:getUserList( '1' ,'')">&nbsp;&lt;&lt;&nbsp;</a></li>

								<c:if test="${currentPage > 1 }">
									<li><a
										href="javascript:getUserList(${ currentPage-1 },'');">&nbsp;&lt;&nbsp;</a></li>
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
									<li><a
										href="javascript:getUserList(${ currentPage+1},'');">&nbsp;&gt;&nbsp;</a></li>
								</c:if>
								<c:if test="${ currentPage >= maxPage }">
									<!-- button type="button" class="btn1">&nbsp;&gt;&nbsp;</button-->
									<li></li>
								</c:if>

								<li><a href="javascript:getUserList(${maxPage},'');">&nbsp;&gt;&gt;&nbsp;</a></li>

							</ul>
						</div>
					</div>


					<div>


					</div>

				</div>


	<div id="modalPop" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title">포인트 조정</h4>
							</div>
							<div class="modal-body">
					<div class="box-body">

						
						<input type="hidden" class="form-control"  value="" id="p_u_id">
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">현재 <br>포인트</label>
							<div class="input-group input-group-sm"
								style="padding-left: 14px; padding-right: 14px;">
								<input type="text" class="form-control" placeholder="" value="" id="p_tatal_point" readonly="readonly">
							</div>
							
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">증감<br>포인트</label>
							<div class="input-group input-group-sm"
								style="padding-left: 14px; padding-right: 14px;">
								<input type="text" class="form-control" placeholder="" value="" id="p_point">
							</div>
							
						</div>
						
					</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary"
									onclick="fnPointSave(1)">충전</button>
								<button type="button" class="btn btn-primary"
									onclick="fnPointSave(2)">차감</button>	
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
			
			
			<div id="modalPop2" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title">패스워드 변경</h4>
							</div>
							<div class="modal-body">
					<div class="box-body">
						<input type="hidden" class="form-control"  value="" id="p_p_u_id">
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">패스워드</label>
							<div class="input-group input-group-sm"
								style="padding-left: 14px; padding-right: 14px;">
								<input type="text" class="form-control" placeholder="" value="" id="p_pw" >
							</div>
							
						</div>
					</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary"
									onclick="fnPWSave()">변경</button>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				</div>
				
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b></b>
			</div>
			<strong>Copyright &copy; 2018 <a href="#">더사주</a>.
			</strong> All rights reserved.
		</footer>

		<!-- Control Sidebar -->

		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>

	</div>
	<!-- ./wrapper -->


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

			
	$(document).ready(function() {

		});

	
	function fnPWSave(){
		var u_id =$('#p_p_u_id').val(); 
		var  pw = $('#p_pw').val();
		
		$.ajax({
			type : "post",
			url : "mng_pw_u",
			dataType : "html",
			data : {
				u_id : u_id,
				pw:pw
			}
		}).done(function(data) {
			var isOk = data;
			if (isOk == 1) {
				alert('정상 처리되었습니다.');
				location.reload();
			}else{
				alert('등록 실패');
			}

		});
		
	}
	
	function fnPWView(u_id,point){
		$('#p_p_u_id').val(u_id);
		
		$('#modalPop2').modal('show');
	}
	
	
	function fnPointView(u_id,point){
		$('#p_u_id').val(u_id);
		$('#p_tatal_point').val(point);
		$('#modalPop').modal('show');
	}
	
	function fnPointSave(p_type){
		var u_id =$('#p_u_id').val(); 
		var  point = $('#p_point').val();
		
		$.ajax({
			type : "post",
			url : "mng_point_u",
			dataType : "html",
			data : {
				u_id : u_id,
				point : point,
				p_type : p_type
			}
		}).done(function(data) {
			var isOk = data;
			if (isOk == 1) {
				alert('정상 처리되었습니다.');
				location.reload();
			}else{
				alert('등록 실패');
			}

		});
		
	}
	
	//엑셀 출력
	 function exportToExcel(){
		
	 	var form = document.formdata2;
	 	var startdate = $('#startdate').val();
	 	var enddate = $('#enddate').val();
	 	var gubun =$('#gubun').val();
	 	var com_text  =$('#com_text').val();
	 	form.startdate.value=startdate;
	 	form.enddate.value=enddate;
	 	form.gubun.value=gubun;
	 	form.com_text.value=com_text;
	 	form.pageView.value="mng_member_excel";
	 	form.action="mng_member";
	 	form.submit();
	 }
	
		
	
	function fnMemberOut(u_id){

		
		if(!confirm("탈퇴처리하시겠습니까?")){
			return;
		}
		$.ajax({
			type : "post",
			url : "mng_member_out",
			dataType : "html",
			data : {
				u_id : u_id
			}
		}).done(function(data) {
			var isOk = data;
			if (isOk == 1) {
				alert('정상 처리되었습니다.');
				location.reload();
			}else{
				alert('전환실패');
			}

		});
		
	}
	
	
		function fnSave(u_id,c_gb){

			var msg = "";
			if(c_gb=="B"){
				msg ="상담사로 전환하시겠습니까?";
			}else{
				msg ="사용자로 전환하시겠습니까?";
			}
			
			if(!confirm(msg)){
				return;
			}
			$.ajax({
				type : "post",
				url : "mng_member_state_u",
				dataType : "html",
				data : {
					u_id : u_id,
					c_gb :c_gb
				}
			}).done(function(data) {
				var isOk = data;
				if (isOk == 1) {
					alert('정상 처리되었습니다.');
					location.reload();
				}else{
					alert('전환실패');
				}

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
		 	var enddate = $('#enddate').val();
		 	var gubun =$('#gubun').val();
		 	var com_text  =$('#com_text').val();

		 	var pageView = "mng_member_table";
		 	
		 	
		 	$.ajax({
		 		type:"post",
		 		url:"mng_member",
		 		dataType:"html",
		 		data:{
		 			startdate : startdate,
		 			enddate : enddate,
		 			page : page,
		 			pageView : pageView,
		 			gubun : gubun,
		 			com_text: com_text
		 		}	
		 		}).done(function(data){
		 			$("#tabledata").html("");
		 			$("#tabledata").html(data);
		 			$('td.number').number( true, 0 );
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
		
		
		
		
	</script>

  <script>
	  $( function() {
		  $('#startdate').datepicker ({ format: 'yyyy-mm-dd' });
		  $('#enddate').datepicker ({ format: 'yyyy-mm-dd' });
	  } );
	  
  </script>
</body>
</html>
