<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<style>
tr.space {
  border-bottom: 10px solid #fff;
}

.as {
	background-color:#000000;
	color: #ffffff;
}
@page { size: A4 portrait; margin:0; }   //A4 세로 출력
</style>
  <c:choose>
	<c:when test="${ board.size() > 2 }">
	<div class="modal-dialog" id="label_div" style="width: 60%; height:80%; overflow:scroll; margin-top: 50px">
	</c:when>
	<c:otherwise>
	
	<div class="modal-dialog" id="label_div" style="width: 60%; height:40%; overflow:scroll; margin-top: 50px">
	</c:otherwise>
	</c:choose>
	<div class="modal-content">
		<div class="modal-header">
			<!-- <button type="button" class="close" onclick="fnclose2()"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button> -->
			<h4 class="modal-title"><span> &nbsp;&nbsp;</span>라벨 바코드 재발행 <!--  <span> &nbsp;&nbsp;</span> <button type="button" class="btn btn-info"
					onclick="print()">발행</button>	<button type="button" class="btn btn-success"
					onclick="fnclose2()">취소</button> --></h4>
			
			<h4 class="modal-title">
					<label style="margin-right:50px;"><input type = "checkbox" name = "chk" value="1" id = "chk" style="margin-right:10px; onclick="asChk(this)">AS </label>
					<button type="button" class="btn btn-info"
					onclick="a4print('${board[0].pno}','${board[0].trbarcode }','${memo }')">A4 인쇄</button>	
					
					<button type="button" class="btn btn-info"
					onclick="a4double('${board[0].pno}','${board[0].trbarcode }','${memo }')">A4 인쇄(각 2부)</button>
					
					<button type="button" class="btn btn-info" style="margin-left : 20px;"
					onclick="rejprint('${board[0].pno}','${board[0].trbarcode }','${memo }')">라벨 프린터 인쇄</button>
					
					<button type="button" class="btn btn-info" 
					onclick="jprintdouble('${board[0].pno}','${board[0].trbarcode }','${memo }')">라벨 프린터 인쇄(각 2부)</button>
					
					<button type="button" class="btn btn-success" style="margin-left:20px;"
					onclick="fnclose2()">취소</button></h4>
			<h4 class="modal-title" style="text-align: center;" id="sp_p_biz_nm"></h4>
		</div>
		<div class="box-body" id="label_print">
			<table style=" width: 100%; padding-left: 15px; padding-right: 15px"  >
									
<!-- 여기까지 -->
									<tr class="space">
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
										
									<tr class="space">
									</tr>
<!-- 여기까지 -->
									<tr class="space">
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
										
									<tr class="space">
									</tr>
				<c:choose>
						<c:when test="${ board.size() > 0 }">
							<c:forEach var="vo" items="${ board }" varStatus="status">
									<c:choose>
									<c:when test="${ board.size() >1 }">
									<input type="hidden" value="${board.size() }" id="boardSize">
									<c:if test="${(status.count) %2 ==1}">
										<tr>
									</c:if>				
									
									<td>
											<div class="bar-wrap" style="margin-top: 5px;">
												<table class="table2" width="100%" height="250px"  border="1" bordercolor="#A2AFCC" bordercolorlight="#ffffff" bodercolordark="#6c717d" cellspacing="0" cellpadding="0">
													<tbody>
													
														<tr>
															<td class="td"   width="20%" style="text-align: center;">품명</td>
															
															
															<c:choose>
															    <c:when test="${fn:length( vo.pname )> 20}">
															        <td class="asPname"  colspan="3" width="80%" style="font-size: 12px;text-align: center" id ="asPname${status.count}"><strong>${vo.pname}</strong></td>
															    </c:when>
															    <c:otherwise>
															       <td class="asPname"  colspan="3" width="80%" style="text-align: center" id ="asPname${status.count}"><strong>${vo.pname}</strong></td>
															    </c:otherwise>
															</c:choose>
															
															
														</tr>
														<tr>
															<td class="td"  width="20%" style="text-align: center;">공급업체</td>
															<!--  <td class="td" colspan="3" width="80%" style="text-align: center;" >${custname}</td> -->
															<td class="td" colspan="2" width="40%" style="text-align: center;" >${vo.cname}</td><td class="td"  colspan="2"  width="10%" style="font-size: 12px;text-align: center;" >검사: <input type="text" style="width:40px;border: none; background: transparent;" value="완료"> </td>
														</tr>
														
														<tr>
															<td class="td" width="20%" style="text-align: center;">품번</td>
															<td class="td" width="30%" style="text-align: center;"><span style="font-size: 12px;">${vo.pno}</span></td>
															<td class="td" width="20%" style="text-align: center;">차종</td>
															<c:choose>
																<c:when test="${fn:length( vo.carkind )> 10}">
																	<td class="td"  width="30%" style="text-align: center;"><strong>
																		${fn:substringBefore(vo.carkind,',') } 외
																	</strong></td>
																</c:when>
																<c:otherwise>
																	<td class="td"  width="30%" style="text-align: center;"><strong>${vo.carkind}</strong></td>
																</c:otherwise>
															</c:choose>
															
														</tr>
														
														<tr>
															
															<td class="td" style="text-align: center;">수량</td>
															<td class="td" style="text-align: center;"><strong>${vo.qty}</strong></td>
															<td class="td" style="text-align: center;"><span style="font-size: 12px;">입고일자</span></td>
															<td class="td" style="text-align: center;"><span style="font-size: 12px;">${vo.indate}</span></td>
															
														</tr>
														<tr>
															<!-- <td class="td" style="font-size: 12px;text-align: center;">바코드번호</td>
															<td class="td" style="font-size: 12px;text-align: center;">${vo.barcode}</td> -->
															<td class="td" style="font-size: 12px;text-align: center;">비고</td>
															<!--<td class="td" style="font-size: 12px;text-align: center;"><input type="text" style="border: none; background: transparent;" value="">${memo}</td> -->
															<td class="td" style="font-size: 12px;text-align: center;">${memo}</td>
															<td class="td" style="text-align: center;"><span style="font-size: 12px;">생산일자</span></td>
															<td class="td" style="text-align: center;"><span style="font-size: 12px;">${vo.madate}</span></td>
															
														</tr>
														
														
														<tr>
															<td colspan="4" class="td" style="text-align: center; padding-bottom: 0">
															
																<img src ="/resimg/woobo/barcode/${vo.barcode}.png"  style="width: 260px; height: 50px;">	
																
															
															</td>
														</tr>
													</tbody>
												</table>
											</div>
						
									</td>
															
									
									<c:if test="${(status.count) %2 ==0}">
										</tr>
									</c:if>
									</c:when>
									<c:otherwise>
										<tr>
										<td>
											<div class="bar-wrap" style="margin-top: 10px;">
												<table class="table2" width="100%" height="250px" border="1" bordercolor="#A2AFCC" bordercolorlight="#ffffff" bodercolordark="#6c717d" cellspacing="0" cellpadding="0">
													<tbody>
														<tr>
															<td class="td"   width="20%" style="text-align: center;">품명</td>
															
															
															<c:choose>
															    <c:when test="${fn:length( vo.pname )> 20}">
															        <td class="td"  colspan="3" width="80%" style="font-size: 12px;"  id ="asPname"><strong>${vo.pname}</strong></td>
															    </c:when>
															    <c:otherwise>
															       <td class="td"  colspan="3" width="80%"  id ="asPname"><strong>${vo.pname}</strong></td>
															    </c:otherwise>
															</c:choose>
															
															
														</tr>
														<tr>
															<td class="td"  width="20%" style="text-align: center;">공급업체</td>
															<td class="td" colspan="3" width="80%" >${vo.cname}</td>
														</tr>
														
														<tr>
															<td class="td" width="20%" style="text-align: center;">품번</td>
															<td class="td" width="30%" style="text-align: center;" ><span style="font-size: 12px;">${vo.pno}</span></td>
															<td class="td" width="20%" style="text-align: center;">차종</td>
															<c:choose>
																<c:when test="${fn:length( vo.carkind )> 10}">
																	<td class="td"  width="30%" style="text-align: center;"><strong>
																		${fn:substringBefore(vo.carkind,',') } 외
																	</strong></td>
																</c:when>
																<c:otherwise>
																	<td class="td"  width="30%" style="text-align: center;"><strong>${vo.carkind}</strong></td>
																</c:otherwise>
															</c:choose>
															
														</tr>
														
														<tr>
															
															<td class="td" style="text-align: center;">수량</td>
															<td class="td" style="text-align: center;"><strong>${vo.qty}</strong></td>
															<td class="td" style="text-align: center;"><span style="font-size: 12px;">입고일자</span></td>
															<td class="td" style="text-align: center;"><span style="font-size: 12px;">${vo.indate}</span></td>
															
														</tr>
														<tr>
															<!-- <td class="td" style="font-size: 12px;text-align: center;">바코드번호</td>
															<td class="td" style="font-size: 12px;text-align: center;">${vo.barcode}</td> -->
															<td class="td" style="font-size: 12px;text-align: center;">비고</td>
															<td class="td" style="font-size: 12px;text-align: center;"></td>
															<td class="td" style="text-align: center;"><span style="font-size: 12px;">생산일자</span></td>
															<td class="td" style="text-align: center;"><span style="font-size: 12px;">${vo.mkdate}</span></td>
															
														</tr>
														
														
														<tr>
															<td colspan="4" class="td" style="text-align: center; padding-bottom: 0">
															
																<img src ="/resimg/woobo/barcode/${vo.barcode}.png"  style="width: 260px; height: 50px;">	
																
															
															</td>
														</tr>
													</tbody>
												</table>
											</div>
						
									</td>
									<td style="width:50%">
											<div class="bar-wrap" style="margin-top: 20px;" >
											</div>
						
									</td>
									</tr>
									
									
									
									</c:otherwise>
									</c:choose>
									<c:if test="${(status.count) %8 ==0 && board.size()>status.count}">
									<tr>
									</tr>
									<tr class="space">
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
										
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
<!-- 여기까지 -->
									<tr class="space">
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
										
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									
									<tr class="space">
										
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									
									</c:if>	
									
														
							</c:forEach>
						</c:when>
				</c:choose>
			</table>
		</div>
		<div class="box-footer" >
			<div class="col-xs-7; text-center"> <!-- col-xs-8 ,pull-right -->
					<button type="button" class="btn btn-info"
					onclick="a4print('${board[0].pno}','${board[0].trbarcode }','${memo }')">A4 인쇄</button>
					
					<button type="button" class="btn btn-info"
					onclick="a4double('${board[0].pno}','${board[0].trbarcode }','${memo }')">A4 인쇄(각 2부)</button>	
					
					<button type="button" class="btn btn-info" style="margin-left : 20px;"
					onclick="rejprint('${board[0].pno}','${board[0].trbarcode }','${memo }')">라벨 프린터 인쇄</button>
					
					<button type="button" class="btn btn-info" 
					onclick="jprintdouble('${board[0].pno}','${board[0].trbarcode }','${memo }')">라벨 프린터 인쇄(각 2부)</button>
					
					<button type="button" class="btn btn-success" style="margin-left:20px;"
					onclick="fnclose2()">취소</button>
				
			</div>
		</div>
		<!-- /.box-footer -->
	</div>
</div>
<script type="text/javascript">

var boardSize = $("#boardSize").val();
$("#chk").change(function() {
	var element = Number(document.getElementById('.asPname'));
    if(this.checked) {	
    	for(var i = 1 ; i<=boardSize; i++){
    		var id = "asPname"+i;
    		document.getElementById(id).className = 'as';
    	}
    }else{
    	for(var i = 1 ; i<=boardSize; i++){
    		var id = "asPname"+i;
    		document.getElementById(id).classList.remove('as');
    	}
    	document.getElementById("asPname1").classList.remove('as');
    }
});
	
	$(document).ready(function() {
		//alert(${barcode})
		//alert("re");
		//alert(${board.size()} )
		
	});
	
	
	
	
</script>