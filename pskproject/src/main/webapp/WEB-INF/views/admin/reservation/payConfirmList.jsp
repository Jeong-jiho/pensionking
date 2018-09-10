<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<ol class="breadcrumb">
	<li class="breadcrumb-item">
	<a href="#">Admin</a>
	</li>
	<li class="breadcrumb-item active">예약관리</li>
	<li class="breadcrumb-item active">미확인 결제내역</li>
</ol>

<div class="container-fluid">
	<div class="card resSearch">
		<div class="card-header">
			객실정보
		</div>
		<div class="card-body">
		<table class="table table-responsive-sm table-striped" id="payList">
			<colgroup>
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="17%" />
				<col width="15%" />
				<col width="16%" />
				<col width="12%" />
			</colgroup>
			<thead>
				<tr>
					<th>예약자</th>
					<th>결제일</th>
					<th>은행명</th>
					<th>계좌번호</th>
					<th>결제금액</th>
					<th>확인</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
					<c:when test="${not empty payList}">
							<c:forEach var="pay" items="${payList}" varStatus="status">
									<tr class="resDiv" data-num="${pay.pay_no}">
										<td>${pay.m_name }</td>
										<td>${pay.pay_date }</td>
										<td>${pay.pay_bank }</td>
										<td>${pay.pay_acc }</td>
										<td>${pay.pay_price }</td>
										<td><input type="button" value="확인" id="payConfirm"></td>
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
	</div>
</div>