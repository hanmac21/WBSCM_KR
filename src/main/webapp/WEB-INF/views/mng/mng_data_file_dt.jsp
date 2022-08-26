<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../common/jsHeader.jsp"%>

<style>
.ck-editor_editable {
	min-height: 500px;
}
</style>
<div class="modal-dialog" style="width: 80%">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<h4 class="modal-title">자료실</h4>
			<h4 class="modal-title" style="text-align: center;" id="sp_p_biz_nm"></h4>
		</div>
		<div class="modal-body" id="modalbody1">
			<div class="box box-info">

				<!-- /.box-header -->
				<!-- form start -->
				<form class="form-horizontal" name="form1" id="form1" method="post">
					<input type="hidden" id="p_cno" value="${board.cno}">
					<!--자료실 등록된 아이디값  -->
					<input type="hidden" id="p_brd_no" value="${board.brd_no}">

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
											id="p_p_title" placeholder="" value="${board.title}" disabled>
									</c:otherwise>
								</c:choose>
								<!--  <input type="text" class="form-control" name="p_title"
									id="p_p_title" placeholder="" value="${board.title}"> -->
							</div>
						</div>

						<div class="form-group">
							<c:choose>
								<c:when test="${adminId eq 'master'}">
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

							<div class="col-xs-10" style="vertical-align: middle;">
								<div id="edit_div2" style="height: 500px">
									<c:choose>
										<c:when test="${adminId eq 'master'}">
											<textarea id="p_contents" name="p_contents" rows="" cols=""
												style="width: 100%; margin-left: 0px;">${board.contents}             </textarea>
										</c:when>
										<c:otherwise>
											<textarea id="p_contents" name="p_contents" rows="" cols=""
												style="width: 100%; margin-left: 0px;" disabled>${board.contents}             </textarea>
										</c:otherwise>
									</c:choose>
									<!--  <textarea id="p_contents" name="p_contents" rows="" cols=""
										style="width: 100%;  margin-left: 0px;">${board.contents}             </textarea>  -->

					<hr>
								</div>
							</div>
						</div>
					</div>


					<div class="form-group">
						<label for="name" class="col-sm-2 control-label"
							style="font-size: 13px">첨부파일</label>

						<div class="col-sm-10">
							<table style="width: 50%" class="stripe row-border order-column"
								cellspacing="0">
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
													<td><a class="btn"
														href="/resimg/woobo/atach/${vo.file_nm}" download>다운로드</a>
														<c:choose>
															<c:when test="${adminId eq 'master'}">
																<button type="button" class="btn btn-warning"
																	onclick="fnfile_d(${ vo.brd_no},${ vo.seq})">삭제</button>
															</c:when>
														</c:choose> <!--  <button type="button" class="btn btn-warning"	onclick="fnfile_d(${ vo.brd_no},${ vo.seq})">삭제</button>  -->
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
						</div>
					</div>


					<!-- <div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 13px">비밀번호</label>
							<div class="col-sm-3">
								<input type="password" class="form-control" name="p_pass"
									id="p_pass" placeholder="" value="">
							</div>
					</div> -->

					<div class="box-footer">

						<!-- <div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 13px">비밀번호</label>
							<div class="col-sm-3">
								<input type="password" class="form-control" name="p_pass"
									id="p_pass" placeholder="" value="">
							</div>
					</div> -->

						<div style="text-align: center;">
							<%if("master".equals(admin)){%>
							<button type="button" class="btn btn-info"
								onclick="fnDataFile_d()">삭제</button>
							<button type="button" class="btn btn-success"
								onclick="fnDataFileDt_u()">수정</button>
							<%} %>

							<button type="button" class="btn btn-warning" onclick="fnclose()">닫기</button>
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
	
	//alert("${adminId}");
	
	var user = "${adminId}";
	
	//alert(user);
	
	if(user==='master'){
		CKEDITOR.replace('p_contents',{height:400});
	}else{
		CKEDITOR.replace('p_contents',{toolbar:[], height:400});
	}
 
});

//상세보기 삭제 ajax
function fnDataFile_d(){
	
	var brd_no = $("#p_brd_no").val();
	//var cno = $("#p_cno").val();
	var pass = $("#note_pass").val();
	
	if(brd_no==''){
		alert('삭제할 수가 없습니다.');
		return;
	}
	if(pass==''){
		alert('비밀번호를 입력해주세요.');
		return;
	}
	if(!confirm("등록된 게시글 삭제 하시겠습니까?")){
		return;
	}
	
	$.ajax({
		type : "post",
		url : "mng_data_file_d",
		dataType : "html",
		data : {
			brd_no : brd_no,
			pass: pass,
			//cno: cno,
		}
	}).done(function(data) {
		var isOk = data;
		if (isOk == 1) {
			alert('삭제 처리되었습니다.');
			location.reload();
		}else{
			//alert('삭제 실패');
			alert('비밀번호 일치하지 않습니다.');
		}
	});
	
}
	//CKEDITOR.replace('p_contents',{height:400});
	
	$(document).ready(function() {
		
	});
</script>