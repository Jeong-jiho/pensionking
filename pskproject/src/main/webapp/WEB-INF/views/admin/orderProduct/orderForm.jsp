<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
var ssum = 0;
var checkB = [];
	$(function(){
		$("#of_btnCancel").click(function(){
			location.href="/admin/order/orderList.do";
			});	
	
		$(".of_ea").change(function(){

			var q =	$(this).val(); 
			var price = parseInt($(this).parents("tr").children().eq(1).html());
			var sum = q * price;
			
			$(this).parents("td").parents("tr").find(".of_sumprice").html(sum);
			
			/* for(var i=0; i<6; i++){
			 ssum = ssum + parseInt($(this).parents("tr").eq(i).find(".of_sumprice").html());
			} */
			$(".of_sumprice").each(function(){
				ssum += parseInt($(this).html());
			});
	
			$("#of_ssumprice").html(ssum);
			ssum = 0;
		}); 
		
		$("#of_btnOk").click(function(){
			$("#o_price").val($("#of_ssumprice").html(ssum));
			console.log($("#o_price").val());
			boxForm();
			$("#of_orderForm").attr({
				"method":"post",
				"action":"/admin/order/orderInsert.do"
				});
				//$("#of_orderForm").submit();
		});
	});
	
	function boxForm(){
		  var values = document.getElementsByName("item");
	      for (var i = 0; i < values.length; i++) {
	         checkB.push(values[i].value);
	      }
	      var output = "";
	      for (var i = 0; i < checkB.length; ++i) {
	         output += checkB[i];
	         //if(i<checkB.length-1) output+=","
	         //   output = output + "<input type='hidden' name='b_no' value='"+checkB[i]+"'/>"; 
	      }
	      
	      $("#b_number").val(checkB[i]);
	      console.log($("#b_number").val());
	      //return output;
	   }
</script>
</head>
</html>
<body>
<ol class="breadcrumb">
	<li class="breadcrumb-item">
	<a href="#">Admin</a>
	</li>
	<li class="breadcrumb-item active">재고관리</li>
	<li class="breadcrumb-item active">발주현황</li>
	<li class="breadcrumb-item active">주문</li>
</ol>

<div class="container-fluid">
<form name="of_orderForm" id="of_orderForm">
<input type="hidden" name="o_price" id="o_price" > 
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
				<th class="tac">상품명</th>
				<th class="tac">상품가격</th>
				<th class="tac">상품수량</th>
				<th class="tac">합산가격</th>
			</tr>
		</thead>
			<tbody class="tBody">
			<!-- 데이터 출력  -->
			<c:choose>
				<c:when test="${not empty stockList}">
					<c:forEach var="order" items="${stockList}" varStatus="status">
						<tr class="tac" data-num="${order.s_no}">
							<td class="tac1">${order.s_name}</td>
							<td class="tac1">${order.s_price}원</td>
							<td class="tac1"><input type="number" class="of_ea" min="0" value="0"></td>
							<td class="tac1"><span class="of_sumprice">0</span>원</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6" class="tac">등록된 게시물이 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
						<tr>
							<td colspan="3">
							<input type="button" value="확인" id="of_btnOk">
							<input type="button" value="취소" id="of_btnCancel">
							</td>
							<td><span id="of_ssumprice">0</span>원</td>
						</tr>
		</tbody>
	</table>
</form>
</div>
</body>