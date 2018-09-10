<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
	$(function(){
		$("#uf_btnCancel").click(function(){
			location.href="/admin/employee/employeeList.do";
		});
		
		$("#uf_btnOk").click(function(){
			$("#uf_updateForm").attr({
				"method":"post",
				"action":"/admin/employee/employeeUpdate.do"
			});
			$("#uf_updateForm").submit();
		});
	});
</script>
<body>
<ol class="breadcrumb">
	<li class="breadcrumb-item">
	<a href="#">Admin</a>
	</li>
	<li class="breadcrumb-item active">직원관리</li>
	<li class="breadcrumb-item active">직원 정보</li>
	<li class="breadcrumb-item active">정보 수정</li>
</ol>

<div class="container-fluid">
<form id="uf_updateForm" name="uf_updateForm">
	<input type="hidden" id="e_no" name="e_no" value="${updateData.e_no}" />
	<table class="table table-striped" id="s_table">
		<thead>
			<tr>
				<th class="tac">직원번호</th>
				<td class="tac1">${updateData.e_no}</td>
				<th class="tac">이름</th>
				<td class="tac1"><input type="text" id="e_name" name="e_name" value="${updateData.e_name}"></td>
				<th class="tac">성별</th>
				<td class="tac1"><input type="text" id="e_gender" name="e_gender" value="${updateData.e_gender}"></td>
			</tr>	
			<tr>
				<th class="tac">생년월일</th>
				<td class="tac1"><input type="text" id="e_birth" name="e_birth" value="${updateData.e_birth}"></td>
				<th class="tac">연락처</th>
				<td class="tac1"><input type="text" id="e_phone" name="e_phone" value="${updateData.e_phone}"></td>
			</tr>
			<tr>
				<th class="tac">주소</th>
				<td class="tac1"><input type="text" id="e_address" name="e_address" value="${updateData.e_address}"></td>
			</tr>
			<tr>
				<th class="tac">직책</th>
				<td class="tac1">
				<input type="text" id="j_no" name="j_no" value="${updateData.j_no}">
				${updateData.j_name}
				</td>
				<th class="tac">근무요일</th>
				<td class="tac1"><input type="text" id="j_day" name="j_day" value="${updateData.j_day}"></td>
				<th class="tac">근무시간</th>
				<td class="tac1"><input type="text" id="j_time" name="j_time" value="${updateData.j_time}"></td>
				<th class="tac">월급</th>
				<td class="tac1"><input type="text" id="e_price" name="e_price" value="${updateData.e_price}"></td>
			</tr>
			<tr>
				<th class="tac">등록일</th>
				<td class="tac1"><input type="text" id="e_date" name="e_date" value="${updateData.e_date}"></td>
			</tr>
			<tr>
				<th class="tac">입사일</th>
				<td class="tac1"><input type="text" id="e_hiredate" name="e_hiredate" value="${updateData.e_hiredate}"></td>
			</tr>
		</thead>
	</table>
</form>
	<table>
		<tr>
			<td><input type="button" value="확인" id="uf_btnOk"></td>
			<td><input type="button" value="취소" id="uf_btnCancel"></td>
		</tr>
	</table>
</div>
</body>