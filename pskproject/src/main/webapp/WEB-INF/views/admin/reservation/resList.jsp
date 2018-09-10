<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<style type="text/css">
	.wait{color:blue;}
	.end{color:lightgreen;}
	.cancel{color:red;}
	.payList{float:right;}
</style>
<script type="text/javascript">
	var schDateType = "<c:out value='${data.schDateType}' />";
	var setYear =  "<c:out value='${data.setYear}'/>";
	var schStart = "<c:out value='${data.schStart}'/>";
	var schEnd = "<c:out value='${data.schEnd}'/>";
	var schState = "<c:out value='${data.schState}'/>";
	var schText = "<c:out value='${data.schText}'/>";
	$(function(){
		if("${payList.size()}">0){
			alert("미확인 결제 요청이 "+"${payList.size()}"+"건 있습니다");
		}
		$(".payConfirmList").hide();
		$(".payAllList").hide();
		var date = new Date();
		var date1 = getDateFormat(date);
		if(schDateType=="useDay"){
			console.log("gg");
			$("#schDateType2").attr("checked","checked");
		}
		if(schStart!=""){
			$("#schStart").val(schStart);
		}else{
			$("#schStart").val(date1);
		}
		
		if(schEnd!=""){
			$("#schEnd").val(schEnd);
		}else{
			$("#schEnd").val(date1);
		}
		
		if(setYear!=""){
			for(var i=0; i<6; i++){
				if($("#setYear option:eq("+i+")").val()==setYear){
					$("#setYear option:eq("+i+")").attr("selected","selected");
				}
			}
		}
		if(schState!=""){
			for(var i=0; i<4; i++){
				if($("#schState input:eq("+i+")").val()==schState){
					$("#schState input:eq("+i+")").attr("checked","checked");
				}
			}
		}
		if(schText!=""){
			$("#schText").val(schText);
		}
		
		$("#all").click(function(){
			location.href="/admin/res/resList.do";
		});
		
		$("#searchBtn").click(function(){
			goPage();
		});
		
		$("#setYear,#setMonth").on("change",function(){
			/* var date = new Date(); */
			if($("#setMonth").val() != "선택" && $("#setYear").val() != "선택"){
					var year = $("#setYear").val();
					var month = $("#setMonth").val();
					date.setYear(year);
					date.setMonth(month);
					date.setDate(0);
					var day = date.getDate();
					$("#schStart").val(year+"-"+month+"-"+"01");
					$("#schEnd").val(year+"-"+month+"-"+day);
				
			}
			
		});
		/* $("#setMonth").on("change",function(){
			var date = new Date();
			if($("#setMonth").val() != "선택" && $("#setYear").val() != "선택"){
					console.log("gg");
					var year = $("#setYear").val();
					var month = $("#setMonth").val();
					date.setYear(year);
					date.setMonth(month);
					date.setDate(0);
					var day = date.getDate();
					$("#schStart").val(year+"-"+month+"-"+"01");
					$("#schEnd").val(year+"-"+month+"-"+day);

				
			}
			
		}); */
		$(".dayBtn").click(function(){
				date = new Date();
				date1 = getDateFormat(date);
				if($(this).val() == "오늘"){
					$("#schStart").val(date1);
					$("#schEnd").val(date1);
				}else if($(this).val() == "최근5일"){
					date = new Date();
					date1 = getDateFormat(date);
					$("#schEnd").val(date1);
					date.setDate(date.getDate()-5);
					date1 = getDateFormat(date);
					$("#schStart").val(date1);
				}else{
					date = new Date();
					date1 = getDateFormat(date);
					$("#schEnd").val(date1);
					date.setMonth(date.getMonth()-1);
					date1 = getDateFormat(date);
					$("#schStart").val(date1);
				}
		});
		
		$(".goResList").click(function(){
			$(".payConfirmList").hide();
			$(".payAllList").hide();
			$(".resSearch").show();
		});
		$(".payList").click(function(){
			$(".resSearch").hide();
			$(".payConfirmList").hide();
			$(".payAllList").show();
		});
		
		var res_noList = [];
		var i=0;
		$("input[name='res_noList']").each(function(){
			res_noList[i] = $(this).val();
			i++
		});
		$("#allConfirm").click(function(){
			if("${payList.size()}" == 0){
				alert("미확인 결제 내역이 없습니다");
			}else{
				$.ajax({
	  				url : "/admin/pay/payUpdate.do",      
	  				type : "post",								
	  				data:JSON.stringify({
						res_noList : res_noList,
						a_confirm : 1
					}),				
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},	
	  				dataType : "text",
	  				error : function(){							
	  					alert('시스템 오류 입니다. 관리자에게 문의 하세요.');
	  				},											
	  				success : function(resultData){
	  					console.log(resultData)
	  					if(resultData=="성공"){
	  						alert("모든결제의 확인이 완료 되었습니다.");
	  						location.reload();
	  					}else{
	  						alert("오류");
	      					return;
	  					}
	  				}
	  			});
			}
			
		});
		
		$(".payConfirm").click(function(){
			//$("#payForm").attr("data-num",$(this).parents("td").parents("tr").attr("data-num"));
			
			$.ajax({
  				url : "/admin/pay/payUpdate.do",      
  				type : "post",								
  				data:JSON.stringify({
					pay_no : $(this).parents("td").parents("tr").attr("data-num"),
					res_gno : $(this).next().val(),
					a_confirm : 1
				}),				
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
  				dataType : "text",
  				error : function(){							
  					alert('시스템 오류 입니다. 관리자에게 문의 하세요.');
  				},											
  				success : function(resultData){
  					console.log(resultData)
  					if(resultData=="성공"){
  						alert("해당 결제 확인이 완료 되었습니다.");
  						location.reload();
  					}else{
  						alert("오류");
      					return;
  					}
  				}
  			});
		});
		
		//환불 버튼 클릭시
		$(".refund").click(function(){
			if(confirm("환불 처리 하시겠습니까?")){
				$.ajax({
	  				url : "/admin/pay/refund.do",      
	  				type : "post",								
	  				data:JSON.stringify({
	  					pay_no : $(this).parents(".resDiv").attr("data-num"),
						res_gno : $(this).next().val(),
						a_confirm : 2,
						pay_price : $(this).parents(".resDiv").find(".pay_price").text()
					}),				
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
	  				dataType : "text",
	  				error : function(){							
	  					alert('시스템 오류 입니다. 관리자에게 문의 하세요.');
	  				},											
	  				success : function(resultData){
	  					console.log(resultData)
	  					if(resultData=="성공"){
	  						alert("해당 결제의 환불 처리가 완료 되었습니다.");
	  						location.reload();
	  					}else if(resultData=="불가능"){
	  						alert("환불 기간이 아닙니다");
	  						return;
	  					}else{
	  						alert("오류");
	      					return;
	  					}
	  				}
	  			});
			}else{
				return false;
			} 
		});
		
	});
	function goPage(){
		$("#resSchForm").attr({
			"method" : "get",
			"action" : "/admin/res/resList.do"
		});
		$("#resSchForm").submit();
	}
</script>

<ol class="breadcrumb">
	<li class="breadcrumb-item">
	<a href="#">Admin</a>
	</li>
	<li class="breadcrumb-item active">예약관리</li>
	<li class="breadcrumb-item active">예약내역(전체)</li>
</ol>

<div class="container-fluid">
	<div class="resSearch">
	<form name="resSchForm" id="resSchForm">
		<table class="table table-responsive-sm table-striped" >
			<colgroup>
				<col width="20%" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>기간</th>
					<td>
						<div style="float:left;" class="sch">
							<input type="radio" name="schDateType" id="schDateType1" value="resDay" checked>
							<label for="schDateType1">예약접수일 기준</label>
							<input type="radio" name="schDateType" id="schDateType2" value="useDay">
							<label for="schDateType2">이용일 기준</label>
						<div style="margin:6px 0px;">
							<label>월별조회</label>
							<select id="setYear" name="setYear">
								<option>선택</option>
								<option value="2014">2014년</option>
								<option value="2015">2015년</option>
								<option value="2016">2016년</option>
								<option value="2017">2017년</option>
								<option value="2018" selected>2018년</option>
							</select>
							<select id="setMonth" name="setMonth">
								<option>선택</option>
								<option value="01">1월</option>
								<option value="02">2월</option>
								<option value="03">3월</option>
								<option value="04">4월</option>
								<option value="05">5월</option>
								<option value="06">6월</option>
								<option value="07">7월</option>
								<option value="08">8월</option>
								<option value="09">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
						</div>
						<div style="float:left; margin-top:2px;">
							<label>조회기간</label>
							<input type="date" name="schStart" id="schStart"
							placeholder="시작일자" >
							<input type="date" name="schEnd" id="schEnd" 
							placeholder="종료일자" >
						</div>
						<div style="margin-left:30px; float:right;">
							<input type="button" class="btn dayBtn" id="today" value="오늘">
							<input type="button" class="btn dayBtn" id="recentFive" value="최근5일">
							<input type="button" class="btn dayBtn" id="recentOneMonth" value="최근한달">
						</div>
					</div>
					</td>
				</tr>
				<tr>
					<th>예약상태</th>
					<td class="sch" id="schState">
						<input type="radio" name="schState" id="schState1" value="전체" checked>
						<label for="schState1">전체</label>
						<input type="radio" name="schState" id="schState2" value="입금대기">
						<label for="schState2">입금대기</label>
						<input type="radio" name="schState" id="schState3" value="예약완료">
						<label for="schState3">예약완료</label>
						<input type="radio" name="schState" id="schState4" value="예약취소">
						<label for="schState4">예약취소</label>
					</td>
				</tr>
				<tr>
					<th>통합검색</th>
					<td class="sch">
						<input type="text" name="schText" id="schText" placeholder="예약자명,휴대폰,예약번호">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
	<div class="resSearch" style="text-align:center;">
		<input type="button" class="btn btn1" id="searchBtn" value="조회하기">
		<input type="button" class="btn btn1" id="all" value="전체보기">
		<input type="button" class="btn btn1 payList" value="결제내역">
		<!-- <input type="button" class="btn btn1 payConfirmbtn" value="미확인 결제내역"> -->
	</div>
	
	<br/>

	<div class="card resSearch">
		<div class="card-header">
			객실정보
		</div>
		<div class="card-body">
		<table class="table table-responsive-sm table-striped" id="resList">
			<colgroup>
				<col width="10%" />
				<col width="16%" />
				<col width="6%" />
				<col width="14%" />
				<col width="14%" />
				<col width="10"/>
				<col width="10%" />
				<col width="14%" />
			</colgroup>
			<thead>
				<tr>
					<th>예약자</th>
					<th>예약번호</th>
					<th>인원</th>
					<th>객실명</th>
					<th>입실일</th>
					<th>금액</th>
					<th>예약상태</th> 
					<th>신청일</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
					<c:when test="${not empty resList}">
							<c:forEach var="res" items="${resList}" varStatus="status">
									<tr class="resDiv" data-num="${res.res_gno}">
										<td>${res.m_name }</td>
										<td>${res.res_gno }</td>
										<td>${res.res_people }</td>
										<td>${res.r_name }</td>
										<td>${res.res_indate }</td>
										<td>${res.res_price }</td>
										<c:set var="state" value="${res.res_state }" />
										<c:if test="${state == '입금대기'}">
											<td class='wait'>${res.res_state }</td>
										</c:if>
										<c:if test="${state == '예약완료'}">
											<td class="end">${res.res_state }</td>
										</c:if>
										<c:if test="${state == '예약취소'}">
											<td class="cancel">${res.res_state }</td>
										</c:if>
										<td>${res.res_date }</td>
									</tr>
							</c:forEach>
					</c:when>
					<c:otherwise>
					<tr>
						<td colspan="7" class="tac">등록된 게시물이 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose> 
			
			</tbody>
		</table>
		</div>
	</div>
	<jsp:include page="payList.jsp"/>
</div>