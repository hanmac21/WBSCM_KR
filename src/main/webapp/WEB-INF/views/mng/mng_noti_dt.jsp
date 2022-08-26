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
			<h4 class="modal-title">공지등록</h4>
			<h4 class="modal-title" style="text-align: center;" id="sp_p_biz_nm"></h4>
		</div>
		<div class="modal-body" id="modalbody1">
			<div class="box box-info">

				<!-- /.box-header -->
				<!-- form start -->
				<form class="form-horizontal" name="form1" id="form1" method="post">
				<input type="hidden"
								id="p_brd_no" value="${board.brd_no}">
					<div class="box-body">


						<div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 13px">제목</label>

							<div class="col-sm-10">
								<c:choose>
									<c:when test="${adminId eq 'master'}">
										<input type="text" class="form-control" name="p_title"
												id="p_p_title" placeholder="" value="${board.title}">
									</c:when>
									<c:otherwise>
										<input type="text" class="form-control" name="p_title"
												id="p_p_title" placeholder="" value="${board.title}" disabled >
									</c:otherwise>
								</c:choose>
								<!--  <input type="text" class="form-control" name="p_title"
									id="p_p_title" placeholder="" value="${board.title}"> -->
									
							</div>
						</div>
						
						<div class="form-group">
							<c:choose>
								<c:when test="${adminId eq 'master' }">
									<label for="name" class="col-sm-2 control-label"
										style="font-size: 13px">비밀번호</label>

									<div class="col-sm-3">
										<input type="password" class="form-control" name="note_pass"
											id="note_pass" placeholder="" value="">
									</div>
								</c:when>
								<c:otherwise>
								
								</c:otherwise>
							</c:choose>
					</div>



						<div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 13px">내용</label>

							<div class="col-xs-10" style="vertical-align: middle;" >
								<div id="edit_div2" style="height: 500px">
								<c:choose>
									<c:when test="${adminId eq 'master'}">
										<textarea id="p_contents" name="p_contents" rows="" cols=""
											style="width: 100%;  margin-left: 0px;">${board.contents}           </textarea>
									</c:when>
									<c:otherwise>
										<textarea id="p_contents" name="p_contents" rows="" cols=""
											style="width: 100%;  margin-left: 0px;" disabled>${board.contents}           </textarea>
									</c:otherwise>
								</c:choose>		
								<hr>					
								</div>
							</div>
						</div>

					</div>
					
					
					<div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 13px">첨부파일</label>

							<div class="col-sm-10">
								<table  style="width: 50%"
										class="stripe row-border order-column" cellspacing="0">
										<thead>
											<tr>
												<th>파일명</th>
												<th>등록일자 </th>
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
															<td><a class="btn" href="/resimg/woobo/atach/${vo.file_nm}" download>다운로드</a> 
															
															<c:choose>
																<c:when test="${adminId eq 'master'}">
															 		<button type="button" class="btn btn-warning"	onclick="fnfile_d(${ vo.brd_no},${ vo.seq})">삭제</button> 
															 	</c:when>
															 </c:choose>
															</td>

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
									 style="font-size: 13px">댓글</label>
								<div class="col-sm-10" >
									<!--  <div style="height: 30px" class="col-sm-10"> -->
										<!-- <textarea id="p_p_content" name="" rows="4" cols="95"></textarea> -->
										<label>&nbsp; &nbsp;${session_cu_sangho}</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" style="width:380px;" id="p_p_content" autocomplete="off"  placeholder="댓글 내용">
										&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<Button type="button" onclick="fnQna_i(${board.brd_no})">등록</Button>
											&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="password"  style="width:100px;" id="p_pass" placeholder="댓글비밀번호">
											<hr>
									<!--  </div> -->
								</div>
								<label for="name" class="col-sm-2 control-label" 
									 style="font-size: 13px"></label>
							<div class="col-sm-10">
								<table  style="width:50%;" class="stripe row-border order-column" cellspacing="0" > <!-- 50% -->
											<tbody>
												<c:choose>
													<c:when test="${ text.size() > 0 }">
														<c:forEach var="vo" items="${text}">
															<tr>
																<td style="border-right: 1px solid #FFFFFF">${vo.cno}</td>
																<td style="border-right:1px solid #FFFFFF">
																<input type="text"  style="border: none; background: transparent;width:380px;" id="qna_date_${vo.idx}"  disabled value="${vo.qna}" /><input type="button" id="opentxt_${vo.idx}" style="display:inline;" onclick="document.getElementById('update_qna_${vo.idx}').style.display='block',document.getElementById('secondButton_${vo.idx}').style.display='inline',document.getElementById('opentxt_${vo.idx}').style.display='none'" value="..."/>
																<input type="button"  id="secondButton_${vo.idx}"  style="display:none;"  onclick="document.getElementById('update_qna_${vo.idx}').style.display='none',document.getElementById('secondButton_${vo.idx}').style.display='none',document.getElementById('opentxt_${vo.idx}').style.display='inline-block'" value="...">
																<div><input type="text" style="width:380px;display:none;" id="update_qna_${vo.idx}"  value="${vo.qna}"name="text"></div></td>
																<c:choose>
																	<c:when test="${session_cu_sangho  ==  vo.cno }">
																		<td style="border-right:1px solid #FFFFFF"><button type="button"  id="qnaupdate" name="qnaupdate" onclick="fnqna_u(${vo.idx},${board.brd_no},this.id,'p_p_pass_${vo.idx}','verifty_${vo.idx}','update_qna_${vo.idx}')">수정</button><button type="button" onclick="fnqna_d(${vo.idx},this.id,'p_p_pass_${vo.idx}','verifty_${vo.idx}')">삭제</button></td>
																		<td style="border-right:1px solid #FFFFFF"><input type="password" id="p_p_pass_${vo.idx}"  name="p_p_pass " style="width:100px;" placeholder="댓글비밀번호"></td>
																	</c:when>
																	<c:otherwise>
																		<td style="border-right:1px solid #FFFFFF" ></td>
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
									
						</div> 
						<!-- <div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 13px">비밀번호</label>

							<div class="col-sm-3">
								<input type="password" class="form-control" name="note_pass"
									id="note_pass" placeholder="" value="">
							</div>
					</div> -->
					</form> 
					
					<div class="box-footer" >


						<div style="text-align: center;" >
			
							<%-- <%if("master".equals(admin)){%>
							<button type="button" class="btn btn-info"
								onclick="fnNoti_d()">삭제</button>
							<button type="button" class="btn btn-success"
								onclick="fnNotiDt_u()">수정</button>
							<%} %>	 --%>
							
							<c:choose>
								<c:when test="${(adminId eq 'master')}">
									<button type="button" class="btn btn-info"
								onclick="fnNoti_d()">삭제</button>
							<button type="button" class="btn btn-success"
								onclick="fnNotiDt_u()">수정</button>
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

<script type="text/javascript">
	$(document).ready(function() {
		
		var user = "${adminId}";
		
		//alert(user);
		
		//공지사항, 게시판의 경우 마스터만 내용에 툴 보이게하고 나머지는 그냥 텍스트 박스로 보이게 2022-04-25 정인우
		if(user==='master'){
			CKEDITOR.replace('p_contents',{height:400});
		}else{
			CKEDITOR.replace('p_contents',{toolbar:[], height:400});
		}
	
	});

	//공지사항에 등록된 댓글 삭제
	function fnqna_d(idx,id,pass_id,vi_pass) {
		
		var brd_no=$("#p_brdno").val();
		//var idx=$("#p_idx").val();
		//alert ("idx값 :"+idx);
		var temp=$('#'+vi_pass).val();
		//alert ("댓글 기존비밀번호 ==>"+temp);
		var pass=$('#'+pass_id).val();
		
		//alert("idx==>"+idx);
		//alert("pass==>"+pass);
		
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
			url : "mng_noti_qna_d",
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
				fnNotiDt(brd_no);
			}else{
				alert('댓글 비밀번호를 확인하세요.');
			}

		});
		
	}
//공지사항에 등록된 게시글 삭제 
function fnNoti_d(){
	
	var brd_no = $("#p_brd_no").val();
	var cpass = $("#note_pass").val();
	
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
//공지사항에 등록된 이미지 삭제
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

	//CKEDITOR.replace('p_contents',{height:400});
	//CKEDITOR.replace('p_contents',{toolbar:[]});
	
	$(document).ready(function() {
		
	});
</script>

