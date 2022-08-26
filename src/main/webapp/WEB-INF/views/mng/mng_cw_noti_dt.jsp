<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../common/jsHeader.jsp"%>

<style>

.ck-editor_editable{
	min-height :500px;
}

</style>
<div class="modal-dialog" style="width: 80%">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<h4 class="modal-title">협력사 게시글 상세</h4>
			<h4 class="modal-title" style="text-align: center;" id="sp_p_biz_nm"></h4>
		</div>
		<div class="modal-body" id="modalbody1">
			<div class="box box-info">

				<!-- /.box-header -->
				<!-- form start -->
				<form class="form-horizontal" name="form1" id="form1" method="post">
				<input type="hidden"
								id="p_brd_no" value="${board.brd_no}">
				
<%if("master".equals(admin)){%>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label" style="font-size: 13px">협력사</label>

							<div class="col-sm-10">
							<div class="input-group input-group-sm"	>
								<input type="text" class="form-control" name="p_cno" id="p_cno"	placeholder="협력사번호" 	value="${board.cno}"  style="width: 25%" readonly="readonly" > 
								<input type="text" class="form-control" name="p_cu_sangho" id="p_cu_sangho"	placeholder="협력사명"	 value="${board.cu_sangho}"  style="width: 45%" readonly="readonly">
								
								<img alt="검색" src="resources/img/icon_search.png" style="width: auto; height: 26px;" onclick="">
							</div>
								
							</div>
						</div>
<%} else{ %>
						<input type="hidden" class="form-control" name="p_cno" id="p_cno"	placeholder="협력사번호" 	value="${board.cno}"  style="width: 25%" readonly="readonly" > 
						<input type="hidden" class="form-control" name="p_cu_sangho" id="p_cu_sangho"	placeholder="협력사명"	 value="${board.cu_sangho}"  style="width: 45%" readonly="readonly">
<%} %>	
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 13px">제목</label>

							<div class="col-sm-10">
								<input type="text" class="form-control" name="p_title"
									id="p_p_title" placeholder="" value="${board.title}">
							</div>
						</div>
						
						<div class="form-group">

							<label for="name" class="col-sm-2 control-label"
								style="font-size: 13px">비밀번호</label>

							<div class="col-sm-3">
								<input type="password" class="form-control" name="note_pass"
									id="cw_noti_pass" placeholder="" value="">
							</div>
	
						</div>



						<div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 13px">내용</label>

							<div class="col-xs-10" style="vertical-align: middle;" >
								<div id="edit_div2" style="height: 500px">
									<textarea id="p_contents" name="p_contents" rows="" cols=""
										style="width: 100%;  margin-left: 0px;">${board.contents}             </textarea>
										<hr>
								</div>
							</div>
						</div>

					</div>
					
					
					<div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 13px">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;첨부파일</label>

							<div class="col-sm-10">
								<table  style="width: 50%"
										class="stripe row-border order-column" cellspacing="0">
										<thead>
											<tr>
												<th>파일명</th>
												<th>등록일자</th>
												<th>파일다운로드</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${ board2.size() > 0 }">
													<c:forEach var="vo" items="${ board2 }">
														<tr>
															<td>${ vo.org_file_nm}</td>
															<td>${ vo.reg_date}</td>
															<td><a class="btn" href="/resimg/woobo/atach/${vo.file_nm}" download>다운로드</a> </td>

														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="3" style="height: 100px; text-align: center;">첨부 파일이 없습니다.</td>
													</tr>
												</c:otherwise>

											</c:choose>
										</tbody>
									</table>
									<hr>
							</div>
						</div>
						<form class="form-horizontal" name="form2" id="form2" method="post" >
							<input type="hidden" id="p_brdno" value="${board.brd_no}">
						
						<div class="form-group">
										<!-- 댓글작성자,댓글내용,  -->
									 <label for="name" class="col-sm-2 control-label" 
									 style="font-size: 13px">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;댓글</label>
								<div class="col-sm-10" >
									<!--  <div style="height: 30px" class="col-sm-10"> -->
										<!-- <textarea id="p_p_content" name="" rows="4" cols="95"></textarea> -->
										<label>&nbsp; &nbsp;${session_cu_sangho}</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" style="width:380px;" id="p_p_content" placeholder="댓글 내용">
										&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<Button type="button" onclick="fnQna_cw_i(${board.brd_no})">등록</Button>
											&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="password" id="p_pass"  style="width:100px;" placeholder="댓글비밀번호">
											<hr>
									<!--  </div> -->
								</div>
								<label for="name" class="col-sm-2 control-label" 
									 style="font-size: 13px"></label>
							<div class="col-sm-10">
								<table  style="width: 50%;"
											class="stripe row-border order-column" cellspacing="0">
											<tbody>
												<c:choose>
													<c:when test="${ text.size() > 0 }">
														<c:forEach var="vo" items="${text}">
														<input type="hidden" id="p_idx" value="${vo.idx}">
															<tr>
																<td style="border-right:1px solid #FFFFFF">${vo.cno}</td>
																<td style="border-right:1px solid #FFFFFF">
																<input type="text" style="border: none; background: transparent; width:380px;" disabled  id="qna_date_${vo.idx}" value="${vo.qna}">
																<button type="button" id="opentxt_${vo.idx}" style="display:inline;"  onclick="document.getElementById('update_qna_${vo.idx}').style.display='block',document.getElementById('secondButton_${vo.idx}').style.display='inline',document.getElementById('opentxt_${vo.idx}').style.display='none'">...</button> 
																<input type="button"  id="secondButton_${vo.idx}"  style="display:none;"  onclick="document.getElementById('update_qna_${vo.idx}').style.display='none',document.getElementById('secondButton_${vo.idx}').style.display='none',document.getElementById('opentxt_${vo.idx}').style.display='inline-block'" value="...">
																<div><input type="text" style="width:380px;display:none;" id="update_qna_${vo.idx}"  value="${vo.qna}"name="text"></div></td>
																<c:choose>
																	<c:when test ="${session_cu_sangho  ==  vo.cno }">
																		<td style="border-right:1px solid #FFFFFF"><button type="button" onclick="fnqna_cw_u(${vo.idx},${board.brd_no},this.id,'p_p_pass_${vo.idx}','verifty_${vo.idx}','update_qna_${vo.idx}')">수정</button><button type="button" onclick="fnqna_cw_d(${vo.idx},${board.brd_no},this.id,'p_p_pass_${vo.idx}','verifty_${vo.idx}')">삭제</button></td>
																		<td style="border-right:1px solid #FFFFFF"><input type="password" id="p_p_pass_${vo.idx}" style="width:100px;" placeholder="댓글비밀번호"></td>
																	</c:when>
																	<c:otherwise>
																		<td style="border-right:1px solid #FFFFFF"></td>
																		<td style="border-right:1px solid #FFFFFF"></td>
																	</c:otherwise>
																</c:choose>
																<td>${vo.upd_date}&nbsp;&nbsp;<input type="hidden" id="verifty_${vo.idx}" value="${vo.qpass}"/></td>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<tr>
															<td colspan="3" style="height: 100px; text-align: center;">댓글이 없습니다.</td>
														</tr>
													</c:otherwise>
	
												</c:choose>
											</tbody>
								</table>
							</div>	
							&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<!-- <div class="form-group">
								<label for="name" class="col-sm-2 control-label"
									style="font-size: 13px">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호</label>
	
								<div class="col-sm-3">
									<input type="password" class="form-control" name="cw_noti_pass"
										id="cw_noti_pass" placeholder="" value="">
								</div>
							</div> -->
							
					&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						
					</form> 
						
					<div class="box-footer" >
						
						<div style="text-align: center;" >
							<c:choose>
								<c:when test="${(adminId eq 'master') || (session_cu_sangho == board.cu_sangho)}">
									<button type="button" class="btn btn-info"
								onclick="fnNoti_d()">삭제</button>
							<button type="button" class="btn btn-success"
								onclick="fnCwNotiDt_u()">수정</button>
								</c:when>
							</c:choose>
										<button type="button" class="btn btn-warning"
								onclick="fnclose()">닫기</button>
						</div>

					</div>
					<!-- /.box-footer -->
			 </form>
			</div>
			
		</div>

	</div>
</div>


<div class="modal fade" id="modal_contact">
  <div class="modal-dialog" style="margin-top: 40px;">
    <div class="modal-content div-modal-content-wrap">
    
      <div class="modal-header init-custom div-modal-header">
      		<img style="float: right; width: auto; height: 25px;" alt="팝업창 닫기" src="resources/img/close.png" onclick="fnPopClose();">
      </div>
    
      <div class="modal-body init-custom div-modal-body-wrap">
      
        	<p class="p-modal-contact-title" style="display: inline-block;" >찾기</p>
        	
			<input type="button"
				class="btn btn-info" onclick="fnUserSave()" value="적용" style="float: right;" />
				
        	<hr class="hr-1-black init-custom" style="margin-top: 20px;" />
        	
        	<div class="div-ad-srds-modal" style="margin-top: 15px;">
				
				<input type="text" id="pp_cu_sangho"> 
				<img alt="검색" src="resources/img/icon_search.png" style="width: auto; height: 26px;" onclick="fnSearch()">				
        	</div>
      	
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
						<!-- /.box-header -->
						<div class="box-body" id="table_user">
							<!-- input type="button" class="btn btn-warning navbar-right" onclick="fnCancelPop()" value="삭제"/></td-->
							<table id="tablebody1" width="100%" class="stripe row-border order-column" cellspacing="0" >
								<thead>
									<tr>
										<th><input type="checkbox" name="chk_info" value=""></th>
										<th>협력사번호</th>
										<th>협력사명</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>

						</div>
					</div>
				</div>
			</div>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">
//function updateBox(idx,id,qna_id,update_id){
	//var text = $('#'+qna_id).val(); //댓글내용
	//alert ("댓글 내용 ==>"+text);
	//$('#'+update_id).append(
			//'<input type="text" style="width:380px;" id="update_qna_${vo.idx}" name="text">'
	//);
	
	//$('#update_qna_${vo.idx}').val(text);
//}
//협력사 등록된 댓글 삭제
function fnqna_cw_d(idx,brd_no,id,pass_id,vi_pass) {
	
	var brd_no=$("#p_brdno").val();
	
	//var idx=$("#p_idx").val();
	//alert ("idx값 :"+idx);
	//var pass=$("#p_p_pass").val();
	
	var pass=$('#'+pass_id).val();
	//alert("idx==>"+idx);
	//alert("pass==>"+pass);
	var temp=$('#'+vi_pass).val();
	if(brd_no ==''){
		alert('댓글을 삭제할 수가 없습니다.');
		return;
	}
	if(pass ==''){
		alert('댓글비밀번호를 입력해주세요.');
		return;
	}
	
	if(pass != temp){
		alert('비밀번호가 일치하지 않습니다. 비밀번호를 확인해주세요.');
		return;
	}
	
	$.ajax({
		type : "post",
		url : "mng_cw_qna_d",
		dataType : "html",
		data : {
			brd_no : brd_no,
			pass : pass,
			idx :idx,
		}
	}).done(function(data) {
		var isOk = data;
		if (isOk == 1) {
			alert('댓글삭제 처리되었습니다.');
			//location.reload();
			fnCwNotiDt(brd_no);
		}else{
			alert('비밀번호를 확인하세요.');
		}

	});
	
}

function fnSearch() {
    var cu_sangho = $("#pp_cu_sangho").val();
 	//alert(userid);
	if(cu_sangho==''){
		$("#modal_contact").modal('show');
		return;
	}	    
 	$.ajax({
 		type:"post",
 		url:"mng_cu_sangho",
 		dataType:"html",
 		data:{
 			cu_sangho :cu_sangho
 		}	
 		}).done(function(data){
 			$("#modal_contact").modal('show');
 			
 			$("#table_user").html("");
 			$("#table_user").html(data);
 		
 		//	$('span.number').number( true, 0 );
 		});

}

function fnUserSave(){
	var cno='';
	var cu_sangho='';
	var j=0;
	private_yn ="N";
	for (var i = 1; i < $('#tablebody3').find('tr').size(); i++) {
			
		// table 중 tr이 i번째 있는 자식중에 체크박스가 체크중이면

		var chk = $('#tablebody3').find('tr').eq(i).children().find('input[type="checkbox"]').is(':checked');
		
		if (chk == true) {
			cno = $('#tablebody3').find('tr').eq(i).find('input[type="checkbox"]').val();
			cu_sangho = $('#tablebody3').find('tr').eq(i).find('.d_cu_sangho').text();
			cno = $('#tablebody3').find('tr').eq(i).find('.d_cno').text();
			
			
			j++;

		}
	}
	
	if(j==0){
		alert("사용자를 선택해주세요");
		return;
	}else if(j>=2){
		alert("사용자를 한명만 선택 해주세요");
		return;
	}else if(j==1){
		$('#p_cno').val(cno);
		$('#p_cu_sangho').val(cu_sangho);
		//$('#h_name').val(name);
		private_yn="Y";
	}
	$("#modal_contact").modal('hide');
	
}   

function fnNoti_d(){
	
	var brd_no = $("#p_brd_no").val();
	var cpass = $("#cw_noti_pass").val();
	
	if(brd_no==''){
		alert('삭제할 수가 없습니다.');
		return;
	}
	if(cpass==''){
		alert('비밀번호를 입력해주세요.');
		return;
	}
	if(!confirm("등록된 게시글 삭제 하시겠습니까?")){
		return;
	}
	
	$.ajax({
		type : "post",
		url : "mng_noti_d",
		dataType : "html",
		data : {
			brd_no : brd_no,
			pass:cpass,
		}
	}).done(function(data) {
		var isOk = data;
		if (isOk == 1) {
			alert('삭제 처리되었습니다.');
			location.reload();
		}else{
			alert('비밀번호를 확인하세요.');
		}

	});
	
}

function fnDelete(good_no,seq){
	
	if(good_no==''){
		alert('삭제할 수가 없습니다.');
		return;
	}
	if(!confirm("등록된 이미지를 삭세 하시겠습니까?")){
		return;
	}
	
	$.ajax({
		type : "post",
		url : "mng_goods_d",
		dataType : "html",
		data : {
			good_no : good_no,
			seq : seq
		}
	}).done(function(data) {
		var isOk = data;
		if (isOk == 1) {
			alert('삭제 처리되었습니다.');
			location.reload();
		}else{
			alert('삭제 실패');
		}

	});
	
}

function fnPopClose(){
	$('#modal_contact').modal('hide');
}

	CKEDITOR.replace('p_contents',{height:400});
	
	$(document).ready(function() {
		
	});
</script>

