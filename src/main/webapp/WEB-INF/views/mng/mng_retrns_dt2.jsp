<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("replaceChar", "<br><br>"); %>
<!--
<style>
page[size="A4"] {
	background: white;
	width: 29.7cm;
	height: 21cm;
	display: block;
	margin: 0 auto;
	margin-bottom: 0.5cm;
	box-shadow: 0 0 0.5cm rgba(0, 0, 0, 0.5);
}
@media print {
	body, page[size="A4"] {
		margin: 0;
		box-shadow: 0;
	}
}
</style>
-->
<style>
th, td {
	word-break: break-all;
	/* line-height: 125%; */
}
table{
	/* line-height: 125%; */
}
</style>
<body>
	<div class="modal-dialog" style="width:55%; height:72%; overflow: scroll;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" id="close"
					aria-label="Close">
					<!-- <span aria-hidden="true">&times;</span> -->
				</button>
				
				<div style="float:left;">
					<h4 class="modal-title">Transaction statement</h4>
					<h4 class="modal-title" style="text-align: center;" id="sp_p_biz_nm"></h4>
					현재 적용된 순번 : <span id = "p_memo3"> ${memo2 }</span>
				</div>
				
				<div style="width: 100%" style="float: right;">
								<button type="button" class="btn btn-success pull-right modal-close"
									style="margin-left: 10px" onclick="fnClCon()">Close</button>
								<!-- button type="button" class="btn btn-info pull-right" 			onclick="fnTransPrint()">인쇄</button-->
								
								<c:choose>
									<c:when test="${pageview eq 'mng_trns_data'}">
										<button type="button" class="btn btn-info pull-right print_btn" id="print1"  
											style="margin-left: 15px" onclick="fnTrnsPop('${barcode}','${memo}')">인쇄</button>
										<button type="button" class="btn btn-info pull-right print_btn" id="print2"  
											style="margin-left: 10px" onclick="fnTrnsForcePop('${barcode}','${memo}')">인쇄 (라벨발행 무시)</button>
									</c:when>	
									<c:otherwise>
										<button type="button" class="btn btn-info pull-right print_btn" id="print1"  
											style="margin-left: 15px" onclick="jtrnsprint('${barcode}','${memo}')">Print</button>
									</c:otherwise>
									
								</c:choose>	
								<%-- <button type="button" class="btn btn-info pull-right print_btn" 
									style="margin-left: 10px" onclick="fnTrnsPop('${barcode}','${prdate}')">Report</button> --%>
									
								<button type="button" class="btn btn-warning pull-right"
									style="margin-right: 10px" onclick="fnMemoSet('${barcode}')" id="ok2">Apply</button>
								<input type="text" class="pull-right"
									placeholder="비고에 들어갈 내용을 작성하세요" value=""  
									style="width: 300px; height: 30px; margin-right: 10px"
									id="s_memo" onKeypress="javascript:if(event.keyCode==13){$('#ok2').click(); $('#s_memo').val('');}">
								<span class="pull-right" style="margin-top:5px; margin-right: 5px;">Remarks :  </span>	
								<!--  <button type="button" class="btn btn-info pull-right print_btn" id="labelPrintAll"  
											style="margin-right: 20px" onclick="fnAllLabel('${barcode }')" disabled>전체 재발행(라벨프린터)</button>-->
								<c:forEach var="vo" items="${ text }" varStatus="status">
									<c:choose>
										<c:when test="${vo.dstate=='출하준비중'}">
											<button type="button" class="btn  btn-warning pull-right"
												style="margin-right: 10px"
												onclick="fnDelivertView('${deliveryno}','배송중')"
												style="font-size: 15px">출하준비중</button>
										</c:when>

										<c:when test="${vo.dstate=='배송중'}">
											<input type="button" class="btn  btn-primary pull-right"
												style="margin-right: 10px"
												onclick="fndelivery_u2('${deliveryno}','배송완료')"
												style="font-size: 15px" value="배송중" />
										</c:when>
										
										<c:otherwise>
											<input type="button" class="btn  btn-info pull-right"
												style="margin-right: 10px" style="font-size: 15px"
												value="배송완료" />
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<input type="hidden" value="${vo.itemcode1}">
							</div>
			</div>
			<div class="modal-body" id="modalbody1">
				<div class="">
							<input type="hidden" id="p_u_id" name="p_u_id" value="">
							 
							<page size="A4">

							<div id="all_trans_print">

								<table style="border: 3px solid #00C0EF; width: 100%; padding: 0 0 0 0;">
									<tr>
										<td width="50%">
											
											<div class="row"
												style="width: 100%; margin-bottom: 10px; text-align: center">
												<span style="font-size: 24px"><U><B>Transaction statement</B></U></span><br>
												
												<input type="hidden" value="${board.size() }" id="all"/>
											</div>
											<div style="width:100%">
												<div class="row" style="width: 50%; margin-right: 10px;  text-align: right; float: right;">
													<span style="font-size:15px;"> Origin</span><br>
													<span style="font-size: 12px">Receiver </span> &nbsp; <br>
													<br>
													<br>
													<br>
												</div>
												<div class="row" style="margin-left: 10px; float: left; width:50%">
													<span style="font-size: 16px"><b>DN &nbsp;No.  </b></span> &nbsp;&nbsp;<span id="p_sumqty" style="font-size:15px;">${barcode}</span><br>
													<span style="font-size: 12px">Supplier </span> &nbsp; <br>
													<!-- <span style="font-size: 12px">작성일자 : ${outdate}</span> -->
													<br>
													<br>
													<br>
												</div>
												
											</div>

											<table border="1">
												<tr>
													<td style="width: 55%; border: hidden;">
														<table>
															<thead>
																<tr>
																	<th
																		style="text-align: center; font-size: 13px; width: 5%"">No.</th>
																	<th
																		style="text-align: center; font-size: 13px; width: 20%">Part Name</th>
																	<th
																		style="text-align: center; font-size: 13px; width: 45%">Part Number</th>
																	<th
																		style="text-align: center; font-size: 13px; width: 10%"">Qty</th>
																	<th
																		style="text-align: center; font-size: 13px; width: 10%">Printing status</th>
																	<th
																		style="text-align: center; font-size: 13px; width: 10%">incoming shipment</th>


																</tr>
															</thead>
															<tbody>

																<c:choose>
																	<c:when test="${ board.size() > 0 }">
																		<c:forEach var="vo" items="${ board }"
																			varStatus="status">
																		<c:set var="i" value="${i+1 }"/>	

																			<tr style="height: 30px;">
																				<td style="text-align: center; font-size: 13px">${vo.madate}</td>
																				<!-- <td style="text-align: center; visibility:hidden; font-size: 13px">${vo.itemcode1}</td> -->
																				<td style="text-align: center; font-size: 13px">${vo.itemqty}</td>
																				<td style="text-align: center; font-size: 13px; line-height: 115%;">
																					${fn:replace(vo.itemname,replaceChar,"<br/>")}
																				</td>
																				<td class="number"
																					style="text-align: center; font-size: 13px">${vo.i_qty}</td>
																				
																				<c:choose>
																					<c:when test="${pageview eq 'mng_trns_data'}">
																						<td style="text-align: center; font-size: 13px"><span
																							id="label_text${vo.label_idx}"></span></td>
																					</c:when>
																					
																					<c:when test="${pageview eq 'mng_re_trns_data'}">
																						<td style="text-align: center; font-size: 13px"><span
																							id="label_text${i}">재발행</span></td>
																					</c:when>

																					<c:otherwise>
																						<td style="text-align: center; font-size: 13px"><span
																							id="label_text${vo.label_idx}"></span></td>
																					</c:otherwise>
																				</c:choose>

																				<c:choose>
																					<c:when test="${pageview eq 'mng_trns_data'}">
																						<td style="text-align: center; font-size: 13px; padding: 0 0 0 0;">
																							<input type="button"
																								class="btn btn-success"
																								onclick="fnLabelViewSet(${vo.label_idx})"
																								value="라벨발행" style="font-size:12px; margin: 0px; border: 0px;" />
																								</td>
																					</c:when>
																					
																					<c:when test="${pageview eq 'mng_re_trns_data'}">
																						<td style="text-align: center; font-size: 13px; padding: 0 0 0 0;">
																							
																							<input type="button"
																								id="${vo.itemcode1 }+reTrnsBtn"
																								class="btn btn-success"
																								onclick="fnReLabel('${vo.itemcode1}')"
																								value="라벨재발행" style="font-size:12px; margin: 0px; border: 0px;"
																								disabled />
																						</td>
																					</c:when>

																					<c:otherwise>
																						<td style="text-align: center; font-size: 13px"><span
																							class="label"></span></td>
																					</c:otherwise>
																				</c:choose>
																			</tr>

																		</c:forEach>
																	</c:when>
																	<c:otherwise>
																		<tr>
																			<td colspan="12">명세서에 표기할 내용이 없습니다.</td>
																		</tr>
																	</c:otherwise>

																</c:choose>
															</tbody>
														</table>
														
													</td>
												</tr>
											</table>
											<table>
												<tr>
													<td style="width: 55%; border: hidden;">
														<table>
															<tr >
																<td style=" text-align: center;">
																	Remarks
																</td>
															</tr>
															<tr style="height: 50px">
																<td
																	style="width: 80%; text-align: center; padding-left: 10px"
																	rowspan="2"><span id="p_memo"> ${memo}</span></td>
															</tr>
														</table>
													</td>

												</tr>
											</table>
											<table style="margin-top:10px; border:0px;">
												<tr style="text-align:center;">
													<td style="border:0px;">Supplier Sign/Podpis dostawcy</td>
													<td style="border:0px;">Driver Sign/Podpis kierowcy</td>
													<td style="border:0px;">Reciever Sign/Podpis odbiorcy</td>
												</tr>
												<tr style="height:120px;">
													<td style="border:0px;"><div style="border-bottom:1px solid #bbc6d3;"></div></td>
													<td style="border:0px;"><div style="border-bottom:1px solid #bbc6d3;"></div></td>
													<td style="border:0px;"><div style="border-bottom:1px solid #bbc6d3;"></div></td>	
												</tr>
												<tr>
													
												</tr>
											</table>
										</td>
									</tr>
								</table>

							</div>
						</page>
				</div>
				</form>
			</div>

		</div>
	</div>
	</div>
	<form id="formT" name="formT" action="mng_print" method="post">
	</form>

</body>

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



<!-- Core plugin JavaScript-->
<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<link rel="stylesheet" href="resources/css/print-preview.css">
<script src="resources/js/jquery.print-preview.js"></script>
<script src="resources/js/sb-admin-2.min.js"></script>
<script src="resources/js/printThis.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>

<script type="text/javascript">
	$('td.number').number(true, 0);
	
	$(document).ready(function() {
		//alert(${barcode})
		$("#p_barcode").val('${barcode}');
		
		var trbarcode = ${barcode};
				
		//alert(pageView);
		//alert(trbarcode);
		
		//document.getElementById("reTrnsBtn").style.display="none";
		
		
		
		//var branch = getCookie("branch");
		
		/* if(branch==='000'){
			document.getElementById("wjuso").innerText = '경기도 평택시 청북면 양교1길 134';
			document.getElementById("wjuso2").innerText = '경기도 평택시 청북면 양교1길 134';
		}else if(branck==='001'){
			document.getElementById("wjuso").innerText = '울산광역시 울주군 언양읍 반천산업로 108-67';
			document.getElementById("wjuso2").innerText = '울산광역시 울주군 언양읍 반천산업로 108-67';
		} */
		
		/* var loc1 = document.getElementById("wjuso").innerText;
		//var loc2 = document.getElementById("wjuso2").innerText;
		
		if(loc1==='000'){
			document.getElementById("wjuso").innerText = '경기도 평택시 청북면 양교1길 134';
			//document.getElementById("wjuso2").innerText = '경기도 평택시 청북면 양교1길 134';
		}else if(loc1==='001'){
			document.getElementById("wjuso").innerText = '울산광역시 울주군 언양읍 반천산업로 108-67';
			//document.getElementById("wjuso2").innerText = '울산광역시 울주군 언양읍 반천산업로 108-67';
		} */
		
		<c:forEach var="vo" items="${ board }"
			varStatus="status">
		<c:set var="n" value="${n+1 }"/>	
		//alert(trbarcode);
		//alert("${vo.itemcode1}");
		//document.getElementById("${vo.itemcode1 }+reTrnsBtn").style.display="none";
		//document.getElementById("reTrnsBtn").hide();
		//alert(trbarcode);
		
		var pno = $('#${vo.itemcode1 }').val();
		//alert(pno);
		
		var lacnt = ${vo.lacnt} * 1;
		//alert(cnt);cnt
		console.log(lacnt);
		if(lacnt>=1){
			//document.getElementById("${vo.itemcode1 }+reTrnsBtn").style.display="block";
			document.getElementById("${vo.itemcode1 }+reTrnsBtn").disabled=false;
			//document.getElementById("labelPrintAll").disabled=false;
			document.getElementById("label_text${n}").innerText = '발행';
		}else{
			document.getElementById("label_text${n}").innerText = '미발행';
		}
		
		/* $.ajax({
			type:"get",
			url:"mng_label_exist",
			//dataType:"text",
			data:{
				tradebarcode:trbarcode,
				pno:pno
			}
		}).done(function(data){
			//alert("done!");
			
			console.log(typeof data);
			console.log(data);
			alert(data);
			
			data = data*1
			
			if(data>=1){
				document.getElementById("${vo.itemcode1 }+reTrnsBtn").style.display="block";
			}
		}); */
		
	
	</c:forEach>
		
	});
	
	function jtrnsprint(barcode, memo){
		//var memo = document.getElementById('p_memo2').innerText;
			
		//var amount = ((({board.size()} / 10) + 1) * 10);
		var prdate = $("#outdate").val();
		var amount = $('#all').val();
		if(amount%10!=0){
			amount = (Math.floor(amount/10)+1)*10;
		}else{
			amount = amount;
		}
		var sumqty = document.getElementById('p_sumqty').innerText;
		
		//alert(amount);
				
		//alert("인쇄");
				
		window.open("mng_trns_jprint?barcode="+barcode+"&amount="+amount+"&memo="+memo+"&prdate="+prdate+"&sumqty="+sumqty,"Report Print",'height=900, width=1500');
				
	}
	
	function fnPrint(){
		
		var form = $("#formT");
	
		var dt = $("#all_trans_print").html();
		
		$("#dt").val(dt);		
		
		
	 	//form.dt.value='1';
	 
	 	form.submit();
		//alert(data);
	}
	
	function fnReLabel(pno) {
		  
		  var trbarcode = ${barcode}
		
		  //alert("!");
		  //var pno = $('#${vo.itemcode1 }').val();
		  
		  //<c:forEach var="vo" items="${ board }">
		  //<c:set var="i" value="${i+1}"/>
		  	//var pno = $('#${vo.itemcode1 }').val();
		  	//alert(pno);
		  //alert(trbarcode);
		  //</c:forEach>
		  
		  //alert(pno);
		  console.log(pno);
		  
		  //alert(pno);
		  //alert(trbarcode);
		  	
			$.ajax({
				type : "post",
				url : "mng_label_reprint",
				dataType : "html",
				data : {
					pno:pno,
					trbarcode:trbarcode,
				}
			}).done(function(data) {
				//$("#modalPop3").html("");
				$("#modalPop3").modal('hide');
				$("#modalPop2").html("");
				$("#modalPop2").html(data);
				$('#modalPop2').modal({backdrop:'static'});
			});
		}
	
      
</script>
<script>
$(function() {
	/* $('#p_delivery_date').datepicker({
		format : 'yyyy-mm-dd'
	}); */
	
	$("#outdate").datepicker ({ 
		  format: 'yyyy-mm-dd',
		  todayBtn:true,
		  todayBtn:'linked'
		  
	  }).on('change',function(){
			$('.datepicker').hide();
	  });
	
	
});
$(function() {
	$('span.number').number(true, 0);
	
	/* $('#outdate').datepicker({
		format : 'yyyy-mm-dd'
	}); */
	$('#outdate').datepicker({
		format : 'yyyy-mm-dd'
	}).on('change',function(){
		$('.datepicker').hide();
	});
	
});
var cnt = 0;
function changed(obj){
	
	let od2 = document.getElementById('outdate2');
	let changed = $("#outdate").val();	

	od2.value = changed;
}

function fnTrnsPop(barcode,prdate){
	var prdate = $("#outdate").val();
	//var chk_already = $('#label_text'+label_idx).text();
	
	//alert("최초발행분");
	
	if("" == prdate){
	  alert("작성일자를 입력하세요");
	  return;
	}

	var text = prdate.substring(0,4)+"-" +prdate.substring(5,7)+"-" +prdate.substring(8,10);

	var all = document.getElementById("all").value;
	all = all*1;

	
	<c:forEach items="${board}" var = "vo">
	
		var chk = document.getElementById("label_text${vo.label_idx}").innerText;
		
		if(chk==="발행완료"){
			cnt = cnt+1;
		}
		
		//alert(cnt);
		
		/* if(cnt<all){
			cnt = 0;
		}else{
			cnt = cnt*1;
		} */
	
	</c:forEach>

	if(cnt<all){
		cnt = 0;
	}else{
		cnt = cnt*1;
	}
	//alert(cnt);
	var memo2 = document.getElementById('p_memo3').innerText;
	
	//var memo = document.getElementById('p_memo2').innerText;
	
	//var amount = ((({board.size()} / 10) + 1) * 10);
	
	var amount = $('#all').val();
	
	amount = (Math.floor(amount/10)+1)*10;
	
	if(cnt==all){
		cnt = 5;
		$("#print1").removeAttr("onclick");
		$("#print1").attr("onclick","fnTrnsRePop('${barcode}','${prdate}');");
		window.open("mng_trns_jprint?barcode="+barcode+"&amount="+amount+"&memo="+memo,"Report Print",'height=1500, width=1000');
		//window.open("mng_print?barcode="+barcode+"&prdate="+prdate+"&memo2="+memo2,  "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no,left=0, top=0",'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
	}else{
		alert("라벨을 모두 발행해주세요!");
	}
}


function fnTrnsRePop(barcode,prdate){
	var prdate = $("#outdate").val();
	//var chk_already = $('#label_text'+label_idx).text();
	
	//alert("재발행분");
	
	if("" == prdate){
	  alert("작성일자를 입력하세요");
	  return;
	}

	var text = prdate.substring(0,4)+"-" +prdate.substring(5,7)+"-" +prdate.substring(8,10);

	var all = document.getElementById("all").value;
	all = all*1;
	//alert(all);
	var memo2 = document.getElementById('p_memo3').innerText;
	
	//var memo = document.getElementById('p_memo2').innerText;
	var memo = document.getElementById('p_memo').innerText;
	var amount = $('#all').val();
	
	amount = (Math.floor(amount/10)+1)*10;
	
	var sumqty = document.getElementById('p_sumqty').innerText;

	window.open("mng_trns_jprint?barcode="+barcode+"&amount="+amount+"&memo="+memo,"Report Print",'height=500, width=500');
	
}

</script>

<script type="text/javascript">
</script>