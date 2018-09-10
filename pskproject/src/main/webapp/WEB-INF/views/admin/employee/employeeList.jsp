<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
$(function(){
	$(".goDetail").click(function(){
	 var e_no = $(this).parents("tr").attr("data-num");
		$("#e_no").val(e_no);
		console.log(e_no);
	$("#detailForm").attr({
		"method":"get",
		"action":"/admin/employee/employeeDetail.do"
	  }); 
	
	 $("#detailForm").submit();
	});
	
	$("#e_btnInsert").click(function(){
		location.href="/admin/employee/insertForm.do";
	});
	var day=["일","월","화","수","목","금","토"];
	var date=0;
	for(i=1; i<=31; i++){
		var x = $(".calendar").find("tr.tr1");
		var td = $("<td class='tac1'>"+i+"</td>");
		x.append(td);	
	}
	for(i=1; i<=31; i++){
		var x = $(".calendar").find("tr.tr2");
		var td = $("<td class='tac1 tac2'></td>");
		x.append(td);
	}
	/* for(x=0; i<=3; i++){
		for(y=0; y<=day.length; y++)
		var x = $(".calendar").find("tr.tr1");
		var td = $("<td class='tac1'>"+y+"</td>");
	x.append(td);
	} */
	$(document).on('click','#hyumuBtn',function(){
		$(document).on('click','.tac2',function(){
			 $(this).css("background-color","red");	
		});
	});
	});
</script>
<body>
<ol class="breadcrumb">
	<li class="breadcrumb-item">
	<a href="/statistics/main.do">Admin</a>
	</li>
	<li class="breadcrumb-item active">직원관리</li>
</ol>

<div class="container-fluid">
	<form id="detailForm" name="detailForm">
		<input type="hidden" name="e_no" id="e_no">
		<table class="table table-striped" id="s_table">
			<thead>
				<tr>
					<th class="tac">직원번호</th>
					<th class="tac">직원성함</th>
					<th class="tac">연락처</th>
					<th class="tac">직책</th>
					<th class="tac">근무요일</th>
					<th class="tac">근무시간</th>
					<th class="tac">상태</th>
				</tr>
			</thead>
			<tbody class="tBody">
				<!-- 데이터 출력  -->
				<c:choose>
					<c:when test="${not empty employeeList}">
						<c:forEach var="employee" items="${employeeList}"
							varStatus="status">
							<tr class="tac" data-num="${employee.e_no}">
								<td class="tac1">${employee.e_no}</td>
								<td class="tac1 goDetail">${employee.e_name}</td>
								<td class="tac1">${employee.e_phone}</td>
								<td class="tac1">${employee.j_name}</td>
								<td class="tac1">${employee.j_day}</td>
								<td class="tac1">${employee.j_time}</td>
								<td class="tac1">${employee.e_status}</td>
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
				<td><input type="button" value="등록" id="e_btnInsert">
				</td>
			</tr>
		</table>
	</form>
	<%-- <table border="1" class="calendar">
	<thead>
		<tr class="tr1">
			<th rowspan="2">직원성함</th>
		</tr>
		<tbody class="tBody">
				<!-- 데이터 출력  -->
				<c:choose>
					<c:when test="${not empty employeeList}">
						<c:forEach var="employee" items="${employeeList}"
							varStatus="status">
							<tr class="tac tr2" data-num="${employee.e_no}">
								<td class="tac1 goDetail">${employee.e_name}</td>
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
			<tr>
				<td>
				<input type="button" value="근무" id="workBtn">
				<input type="button" value="휴무" id="hyumuBtn">
				</td>
			</tr>
	</table> --%>
</div>
</body>