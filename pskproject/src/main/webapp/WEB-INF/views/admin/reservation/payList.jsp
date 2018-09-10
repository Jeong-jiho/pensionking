<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<style type="text/css">
	.payConfirmbtn{width:120px;}
	.payList{float: none;}
</style>
<script type="text/javascript">
	$(function(){
		$(".payConfirmbtn").click(function(){
			console.log("gg");
			$(".resSearch").hide();
			$(".payAllList").hide();
			$(".payConfirmList").show(); 
		});
	});
</script>
<div class="payAllList">
		<div style="text-align:center; margin-top:-20px; margin-bottom:20px;">
			<input type="button" class="btn btn1 goResList" value="예약내역">
			<input type="button" class="btn btn1 payConfirmbtn" value="미확인 결제내역"> 
		</div>
			<div class="card-header">
				결제 내역
			</div>
			<form id="payForm">
			
			<div class="card-body">
			<table class="table table-responsive-sm table-striped" id="payList">
				<colgroup>
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
					<col width="15%" />
					<col width="14%" />
					<col width="12%" />
				</colgroup>
				<thead>
					<tr>
						<th>예약자명</th>
						<th>예약번호</th>
						<th>은행명</th>
						<th>계좌번호</th>
						<th>결제금액</th>
						<th>결제일</th>
						<th>결제 확인</th>
					</tr>
				</thead>
				<tbody>
					 <c:choose>
						<c:when test="${not empty payAllList}">
								<c:forEach var="payAll" items="${payAllList}" varStatus="status">
										<tr class="resDiv" data-num="${payAll.pay_no}">
											<td>${payAll.m_name }</td>
											<td>${payAll.res_gno }</td>
											<td>${payAll.pay_bank }</td>
											<td>${payAll.pay_acc }</td>
											<td class="pay_price">${payAll.pay_price }</td>
											<td>${payAll.pay_date }</td>
												<c:set var="confirm" value="${payAll.a_confirm }" />
												<c:if test="${confirm == '1'}">
													<td><input type="button" value="환불" class="refund">
													<input type="hidden" value="${payAll.res_gno }" name="res_gno"></td>
												</c:if>
												<c:if test="${confirm == '0'}">
													<td>결제대기</td>
												</c:if>
												<c:if test="${confirm == '2'}">
													<td>결제취소</td>
												</c:if>
										</tr>
								</c:forEach>
						</c:when>
						<c:otherwise>
						<tr>
							<td colspan="8" class="tac">미확인한 결제 내역이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose> 
				</tbody>
			</table>
			</div>
		</form>
	</div>
	<div class="payConfirmList">
		<div style="text-align:center; margin-top:-20px; margin-bottom:20px;">
			<input type="button" class="btn btn1 goResList" value="예약내역">
			<input type="button" class="btn btn1 payList" value="결제내역">
		</div>
			<div class="card-header">
				미확인 결제 내역
			</div>
			<form id="payForm">
			
			<div class="card-body">
			<table class="table table-responsive-sm table-striped" id="payList">
			
				<colgroup>
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
					<col width="15%" />
					<col width="14%" />
					<col width="12%" />
				</colgroup>
				<thead>
					<tr>
						<th>예약자명</th>
						<th>예약번호</th>
						<th>은행명</th>
						<th>계좌번호</th>
						<th>결제금액</th>
						<th>결제일</th>
						<th><input type="button" id="allConfirm" value="전체확인"></th>
					</tr>
				</thead>
				<tbody>
					 <c:choose>
						<c:when test="${not empty payList}">
								<c:forEach var="pay" items="${payList}" varStatus="status">
										<tr class="resDiv" data-num="${pay.pay_no}">
											<td>${pay.m_name }</td>
											<td>${pay.res_gno }</td>
											<td>${pay.pay_bank }</td>
											<td>${pay.pay_acc }</td>
											<td>${pay.pay_price }</td>
											<td>${pay.pay_date }</td>
											<td><input type="button" value="확인" class="payConfirm">
											<input type="hidden" value="${pay.res_gno }" name="res_noList"></td>
										</tr>
								</c:forEach>
						</c:when>
						<c:otherwise>
						<tr>
							<td colspan="8" class="tac">미확인한 결제 내역이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose> 
				</tbody>
			</table>
			</div>
		</form>
	</div>