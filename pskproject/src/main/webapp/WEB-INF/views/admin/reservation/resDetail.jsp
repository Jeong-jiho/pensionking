<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<ol class="breadcrumb">
	<li class="breadcrumb-item">
	<a href="#">Admin</a>
	</li>
	<li class="breadcrumb-item active">예약관리</li>
	<li class="breadcrumb-item active">예약 상세정보</li>
</ol>

<div class="container-fluid">
	<div class="card resSearch">
		<div class="card-header">
			예약정보
		</div>
		<div class="card-body">
		<table class="table table-responsive-sm table-striped" id="payList">
			<colgroup>
				<col width="16%" />
				<col width="34%" />
				<col width="16%" />
				<col width="34%" />
			</colgroup>
			<tbody>
				<c:choose>
					<c:when test="${not empty payList}">
						<c:forEach var="pay" items="${payList}" varStatus="status">
						<tr>
							<td>예약자</td>
							<td>${pay.m_name }</td>
							<td>객실명</td>
							<td>${pay.r_name }</td>
							<td>숙박 시작일</td>
							<td>${pay.res_indate }</td>
							<td>은행명</td>
							<td>${pay.pay_bank }</td>
						</tr>
						<tr>
							<td>계좌번호</td>
							<td>${pay.pay_acc }</td>
							<td>결제금액</td>
							<td>${pay.pay_price }</td>
							<td>결제일</td>
							<td>${pay.pay_date }</td>
							<td>확인</td>
							<td><input type="button" value="확인" id="payConfirm"></td>
						</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" class="tac">결제 내역이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose> 
			
			
			
			</tbody>
		</table>
		</div>
	</div>
</div>