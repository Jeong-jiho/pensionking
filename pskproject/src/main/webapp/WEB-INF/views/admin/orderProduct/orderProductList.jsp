<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
	$(function(){
		$("#op_btnBack").click(function(){
			location.href="/admin/order/orderList.do";
		});
	});
</script>
</head>
</html>
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
			<td><input type="button" value="이전" id="op_btnBack"></td>
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
				<th class="tac">상품명</th>
				<th class="tac">상품가격</th>
				<th class="tac">주문수량</th>
				<th class="tac">합산가격</th>
			</tr>
		</thead>
		<tbody class="tBody">
			<!-- 데이터 출력  -->
			<c:choose>
				<c:when test="${not empty orderProductList}">
					<c:forEach var="orderProduct" items="${orderProductList}" varStatus="status">
						<tr class="tac" data-num="${orderProduct.o_no}">
							<td class="tac1">${orderProduct.o_no}</td>
							<td class="tac1">${orderProduct.op_name}</td>
							<td class="tac1">${orderProduct.op_price}</td>
							<td class="tac1">${orderProduct.op_ea}</td>
							<td class="tac1">${orderProduct.op_sumprice}</td>
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