<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script type="text/javascript">
	$(function(){
		$("#ed_btnEmployeeList").click(function(){
			location.href="/admin/employee/employeeList.do";
		});
		
		$("#ed_btnUpdate").click(function(){
			$.ajax({
				url : "/admin/employee/updateForm.do",
				type : "post",
				dataType : "text",
				error : function(){
					alert('시스템 오류 입니다. 관리자에게 문의하세요.');
				},
				success : function(){
					var goUrl ="";
					goUrl = "/admin/employee/updateForm.do";
	
				$("#ed_data").attr("action",goUrl);
				$("#ed_data").submit();
			}
			});
		});
		
		$("#ed_btnRetire").click(function(){
			$("#ed_data").attr({
				"method":"post",
				"action":"/admin/employee/employeeRetire.do"
			});
			$("#ed_data").submit();
		});
	});
</script>
<body>
<ol class="breadcrumb">
	<li class="breadcrumb-item">
	<a href="/statistics/main.do">Admin</a>
	</li>
	<li class="breadcrumb-item active">직원관리</li>
	<li class="breadcrumb-item active">직원 정보</li>
</ol>

<div class="container-fluid">
<form id="ed_data" id="ed_data" method="post">
	<input type="hidden" name="e_no" value="${detail.e_no}" />
</form>
<form id="ed_updateForm" name="ed_updateForm">
	<table>
		<tr>
			<td><input type="button" value="목록" id="ed_btnEmployeeList"></td>
		</tr>
	</table>
	<table class="table table-striped" id="s_table">
		<thead>
			<tr>
				<th class="tac">직원번호</th>
				<td class="tac1">${detail.e_no}</td>
				<th class="tac">이름</th>
				<td class="tac1">${detail.e_name}</td>
				<th class="tac">성별</th>
				<td class="tac1">${detail.e_gender}</td>
			</tr>	
			<tr>
				<th class="tac">생년월일</th>
				<td class="tac1">${detail.e_birth}</td>
				<th class="tac">연락처</th>
				<td class="tac1">${detail.e_phone}</td>
			</tr>
			<tr>
				<th class="tac">주소</th>
				<td class="tac1">${detail.e_address}</td>
			</tr>
			<tr>
				<th class="tac">직책</th>
				<td class="tac1">${detail.j_name}</td>
				<th class="tac">근무요일</th>
				<td class="tac1">${detail.j_day}</td>
				<th class="tac">근무시간</th>
				<td class="tac1">${detail.j_time}</td>
				<th class="tac">월급</th>
				<td class="tac1">${detail.e_price}</td>
			</tr>
			<tr>
				<th class="tac">등록일</th>
				<td class="tac1">${detail.e_date}</td>
				<th class="tac">수정일</th>
				<td class="tac1">${detail.e_update}</td>
			</tr>
			<tr>
				<th class="tac">입사일</th>
				<td class="tac1">${detail.e_hiredate}</td>
				<th class="tac">퇴사일</th>
				<td class="tac1">${detail.e_retiredate}</td>
			</tr>
		</thead>
	</table>
</form>
	<table>
		<tr>
			<td><input type="button" value="수정" id="ed_btnUpdate"></td>
			<td><input type="button" value="퇴사" id="ed_btnRetire"></td>
			<td><input type="button" value="삭제" id="ed_btnDelete"></td>
		</tr>
	</table>
</div>
</body>
