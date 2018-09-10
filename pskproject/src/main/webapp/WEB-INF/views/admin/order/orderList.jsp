<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
	$(function(){
		$(".tac1").click(function() {
			var o_no = $(this).parents("tr").attr("data-num");
			location.href="/admin/orderProduct/orderProductList.do";
		});
		$("#o_btnOrder").click(function(){
			location.href="/admin/orderProduct/orderForm.do";	
		});
		$("#o_btnStockList").click(function(){
			location.href="/admin/stock/stockList.do";
	});
	});
</script>
<body>
<ol class="breadcrumb">
	<li class="breadcrumb-item">
	<a href="/statistics/main.do">Admin</a>
	</li>
	<li class="breadcrumb-item active">재고관리</li>
	<li class="breadcrumb-item active">발주현황</li>
</ol>

<div class="container-fluid">
	<table>
	<tr>
		<td>
			<input type="button" value="주문" id="o_btnOrder">
			<input type="button" value="재고목록" id="o_btnStockList">
		</td>
	</tr>
	</table>
<table class="table table-striped" id="s_table"> 
		<colgroup>
			<col width="10%">
			<col width="40%">
			<col width="20%">
			<col width="15%">
			<col width="15%">
		</colgroup>
		<thead>
			<tr>
				<th class="tac">발주번호</th>
				<th class="tac">발주일자</th>
				<th class="tac">총가격</th>
				<th class="tac">수정일자</th>
			</tr>
		</thead>
		<tbody class="tBody">
			<!-- 데이터 출력  -->
			<c:choose>
				<c:when test="${not empty orderList}">
					<c:forEach var="order" items="${orderList}" varStatus="status">
						<tr class="tac" data-num="${order.o_no}">
							<td class="tac1">${order.o_no}</td>
							<td class="tac1">${order.o_date}</td>
							<td class="tac1">${order.o_price}</td>
							<td class="tac1">${order.o_update}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6" class="tac">등록된 게시물이 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	</div>
</body>