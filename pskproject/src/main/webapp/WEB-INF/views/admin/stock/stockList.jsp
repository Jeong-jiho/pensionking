<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<script type="text/javascript">
var btnKind="";
var cnt = 0;

$(function(){
	/* 추가버튼 눌렀을때 객체 생성 및 추가 */
	$("#s_btnInsert").click(function(){
		$("#s_btnInsert").attr('disabled', true);
	var tr = $("<tr>");
	tr.addClass("tac");
	var td1 = $("<td class='tac1'>");
	var td2 = $("<td class='tac1'>");
	var td3 = $("<td class='tac1'>");
	var td4 = $("<td class='tac1'>");
	var td5 = $("<td class='tac1'>");

	var s_insertBtnOk = $("<input type='button' value='확인' class='s_insertBtnOk'>");
	var s_insertBtnCancel = $("<input type='button' value='취소' class='s_insertBtnCancel'>");
	var s_name = $("<input type='text' class='s_name' name='s_name'>");
	s_name.addClass("s_input");
	var s_ea = $("<input type='text' class='s_ea' name='s_ea'>");
	s_ea.addClass("s_input");
	var s_price = $("<input type='text' class='s_price' name='s_price'>");
	s_price.addClass("s_input");
			td2.append(s_name);
			td3.append(s_ea);
			td4.append(s_price);	
			td5.append(s_insertBtnOk).append(s_insertBtnCancel);
			tr.append(td1).append(td2).append(td3).append(td4).append(td5);
			$(".tBody").append(tr);
			
			
			$(".s_insertBtnOk").click(function(){
				/* 추가 버튼 눌렀을때 유효성 검사 */
			/* if(!chkSubmit($('#s_name'),"제품명을")) return;
			else if(!chkSubmit($('#s_ea'),"제품수량을")) return;
			else if(!chkSubmit($('#s_price'),"제품가격을")) return;
			else{ */
				$("#s_insertForm").attr({
					"method":"post",
					"action":"/admin/stock/stockInsert.do"
				});				
				$("#s_insertForm").submit();
			/* } */
		});
			/* 추가 버튼눌렀을때 취소버튼 처리 */
			 $(".s_insertBtnCancel").on('click',function(){
				 $("#s_btnInsert").attr('disabled', false);
				$(this).parents("tr").removeClass("tac");
				$(this).parents("tr").html("");
		});
	}); 
	
	/* 재고줄?! 클릭시 버튼 생성 */
	 $(".tac1").click(function(){
		 $(".tac1").unbind('click');
		 $("#s_btnInsert").attr('disabled', true);
		 var s_btnUpdate = $("<input type='button' class='s_btnUpdate' value='수정'>");
		 var s_btnDelete = $("<input type='button' class='s_btnDelete' value='삭제'>");
		 var s_btnCancel = $("<input type='button' class='s_btnCancel' value='취소'>");

		 var text1 = $(this).parents("tr").children().eq(1).html();
		 var text2 = $(this).parents("tr").children().eq(2).html();
		 var text3 = $(this).parents("tr").children().eq(3).html();
		 var text4 = $(this).parents("tr").children().eq(4);
		 
		 
		text4.append(s_btnUpdate).append(s_btnDelete).append(s_btnCancel);
		cnt = 1;
		//overClick();
		 	/* 재고줄 클릭 후 취소버튼 처리 */
			$(".s_btnCancel").click(function(){
				 $("#s_btnInsert").attr('disabled', false);
				$(this).parents("td").find("input[type='button']").hide();
				location.href="/admin/stock/stockList.do";
		cnt = 0;
		//overClick();
		}); 	
	
		/*재고줄 클릭 후  수정 버튼 클릭 시 */
		$(".s_btnUpdate").click(function(){
			$(this).parents("td").find("input[type='button']").hide();
	 		var s_updateBtnOk = $("<input type='button' class='s_updateBtnOk' value='확인'>");
	 		var s_updateBtnCancel = $("<input type='button' class='s_updateBtnCancel' value='취소'>");
			var cng_text1 = $(this).parents("tr").children().eq(1);
			var cng_text2 = $(this).parents("tr").children().eq(2);
			var cng_text3 = $(this).parents("tr").children().eq(3);
			var cng_text4 = $(this).parents("tr").children().eq(4);
	
			var s_upText1 = $("<input type='text' class='s_upText'>");
			var s_upText2 = $("<input type='text' class='s_upText'>");
			var s_upText3 = $("<input type='text' class='s_upText'>");
			
			cng_text1.html(s_upText1);
			console.log(text1);
			s_upText1.val(text1);
			cng_text2.html(s_upText2);
			s_upText2.val(text2);
			cng_text3.html(s_upText3);
			s_upText3.val(text3);
			cng_text4.append(s_updateBtnOk).append(s_updateBtnCancel);
			
		/* 수정 클릭 후 취소 버튼 */
		$(".s_updateBtnCancel").click(function(){
			$("#s_btnInsert").attr('disabled', false);
			cng_text1.html(text1);
			cng_text2.html(text2);
			cng_text3.html(text3);
			$(this).parents("tr").find("input[type='button']").hide();
			location.href="/admin/stock/stockList.do";
		});
		
		  $(document).on("click", ".s_updateBtnOk", function() {
		         var s_no = $(this).parents("tr").attr("data-num");
		         
		            $.ajax({
		               url:'/admin/stock/'+s_no+".do",
		               type:"put",
		               headers:{"Content-Type":"application/json",
		                     "X-HTTP-Method-Override":"PUT"   
		               },
		               data:JSON.stringify({
		                  "s_name": $(s_upText1).val(),
		                  "s_ea": $(s_upText2).val(),
		                  "s_price": $(s_upText3).val()
		               }),
		               dataType:"text",
		               error:function(){
		                  alert('시스템 오류입니다. 관리자에게 문의하세요.');
		               },
		               success:function(result){
		                  console.log("result :" + result);
		                  if(result == "SUCCESS"){
		                     alert("수정이 완료되었습니다");
		                     location.href="/admin/stock/stockList.do";
		                  }
		               }
		            });
		      });
		});	
		
		 $(document).on("click", ".s_btnDelete", function() {
			 var s_no = $(this).parents("tr").attr("data-num");
			 
			 if(confirm("선택하신 비품을 삭제하시겠습니까?")) {
				 console.log(s_no);
				 $.ajax({
					 url : s_no+'.do',
					 type : 'delete',
					 headers : {
						 'X-HTTP-Method-Override' : 'DELETE'
					 },
					 dataType : 'text',
					 error : function(){
						 alert('시스템 오류 입니다. 관리자에게 문의 하세요.');
					 },
					 success : function(result){
						 console.log("result: " + result);
						 if(result == 'SUCCESS'){
							 alert("삭제 되었습니다.");
							 location.href="/admin/stock/stockList.do";
						 }
					 }
				 });
			 }
		});
	});
	/* 발주현황 버튼 눌렀을 때 */
	$(document).on("click", "#s_btnOrder", function(){
		location.href="/admin/order/orderList.do";	
	});
});
/*  function overClick(){
	if(cnt == 1){
		$(".tac1").off('click');
		console.log(cnt);
	}else{
		$(".tac1").on('click');
		console.log(cnt);
	}
}  */

</script>
<body>
<ol class="breadcrumb">
	<li class="breadcrumb-item">
	<a href="/statistics/main.do">Admin</a>
	</li>
	<li class="breadcrumb-item active">비품관리</li>
</ol>

<div class="container-fluid">
<form id="s_updateForm" name="s_updateForm">
	<input type="hidden" id="s_no" name="s_no"/>
</form>
<form id="s_insertForm" name="s_insertForm">
<!-- <table>
	<tr>
		<td>
			<input type="button" value="발주현황" id="s_btnOrder">
		</td>
	</tr>
	</table> -->
<table class="table table-striped" id="s_table"> 
		<colgroup>
			<col width="10%">
			<col width="35%">
			<col width="20%">
			<col width="20%">
			<col width="15%">
		</colgroup>
		<thead>
			<tr>
				<th class="tac">재고번호</th>
				<th class="tac">재고명</th>
				<th class="tac">재고수량</th>
				<th class="tac">재고가격</th>
				<th class="tac"></th>
			</tr>
		</thead>
		<tbody class="tBody">
			<!-- 데이터 출력  -->
			<c:choose>
				<c:when test="${not empty stockList}">
					<c:forEach var="stock" items="${stockList}" varStatus="status">
						<tr class="tac" data-num="${stock.s_no}">
							<td class="tac1">${stock.s_no}</td>
							<td class="tac1">${stock.s_name}</td>
							<td class="tac1">${stock.s_ea}</td>
							<td class="tac1">${stock.s_price}</td>
							<td class="tac1"></td>
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
	<table>
	<tr>
		<td>
			<input type="button" value="추가" id="s_btnInsert">
		</td>
	</tr>
	</table>
</form>
</div>
</body>