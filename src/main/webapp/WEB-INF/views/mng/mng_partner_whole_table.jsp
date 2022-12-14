<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="row">
						<div class="col-xs-12">
							<div class="box">
								<!-- /.box-header -->
								<div class="box-body tableWrapper" style="overflow: scroll; padding: 0 0 0 0;">
									<!-- input type="button" class="btn btn-warning navbar-right" onclick="fnCancelPop()" value="삭제"/></td-->
									<table id="tablebody" width="100%" class="stripe row-border order-column" cellspacing="0" >
									
										<thead>
											<tr>
												<th style="text-align: center; font-size: 18x;">순번</th>
												<th style="text-align: center; font-size: 18x;">협력사</th>
												<th style="text-align: center; font-size: 18x;">업종</th>
												<th style="text-align: center; font-size: 18x;">사업자번호</th>
												<th style="text-align: center; font-size: 18x;">대표자</th>
												<th style="text-align: center; font-size: 18x;">주소</th>
												<th style="text-align: center; font-size: 18x;">출발지</th>
												<th style="text-align: center; font-size: 18x;">E-Mail전송</th>
												<!-- <th style="text-align: center; font-size: 18x;">메일2</th>
												<th style="text-align: center; font-size: 18x;">메일3</th>
												<th style="text-align: center; font-size: 18x;">메일4</th>
												<th style="text-align: center; font-size: 18x;">메일5</th> -->
											</tr>
										</thead>
										
										<tbody>
												<c:choose>
												<c:when test="${ board.size() > 0 }">
													<c:forEach var="vo" items="${ board }" varStatus="status">
													
														<c:set var="i" value="${i+1 }" />
														<tr style="border-bottom:1px solid #E0E0E0">
															<td style="text-align: center;">${i }</td>
															<td style="text-align: center;">${vo.cu_sangho}</td>
															<td style="text-align: center;">${vo.cu_upjong }</td>
															<td style="text-align: center;">${vo.cu_uptae }</td>
															<td style="text-align: center;">${vo.cu_master }</td>
															<td style="text-align: center;">${vo.cu_juso }</td>
															<td style="text-align: center;">${vo.area }</td>
															<td style="text-align: center;"><a href ="javascript:mailSend(${vo.custcode});">메일발송</a></td>
															<%-- <td style="text-align: center;">${vo.email1 }</td> --%>
															<%-- <td style="text-align: center;">${vo.email2 }</td>
															<td style="text-align: center;">${vo.email3 }</td>
															<td style="text-align: center;">${vo.email4 }</td>
															<td style="text-align: center;">${vo.email5 }</td> --%>
														</tr>
										
													</c:forEach>
											</c:when>
												<c:otherwise>
													<tr>
														<td colspan="8" style="height: 100px; text-align: center;">검색된
															자료가 없습니다.</td>
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
