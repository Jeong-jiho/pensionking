<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
	 $(function(){
		$("#if_btnInsert").click(function(){	
			$("#if_insertForm").attr({
				"method":"post",
				"action":"/admin/employee/employeeInsert.do"
			});
			$("#if_insertForm").submit();
		});
		
		$("#if_btnEmployeeList").click(function(){
			location.href="/admin/employee/employeeList.do";
		});
	}); 
</script>
<body>
<ol class="breadcrumb">
	<li class="breadcrumb-item">
	<a href="/statistics/main.do">Admin</a>
	</li>
	<li class="breadcrumb-item active">직원관리</li>
	<li class="breadcrumb-item active">직원등록</li>
</ol>

<div class="container-fluid">
<form id="if_insertForm" name="if_insertForm">
	<table class="table table-striped" id="s_table">
		<tr>
			<th class="tac">이름</th>
			<td colspan="2"><input type="text" id="e_name" name="e_name"></td>
			<th class="tac">생년월일</th>
			<td colspan="2"><input type="text" id="e_birth" name="e_birth"></td>
			<th class="tac">성별</th>
			<td colspan="2"><input type="text" id="e_gender" name="e_gender"></td>
		</tr>
		<tr>
			<th class="tac">연락처</th>
			<td colspan="2"><input type="text" id="e_phone" name="e_phone"></td>
			<th class="tac">주소</th>
			<td colspan="5"><input type="text" id="e_address" name="e_address"></td>
		</tr>
		<tr>
			<th class="tac">월급</th>
			<td colspan="2"><input type="text" id="e_price" name="e_price"></td>
			<th class="tac">입사일</th>
			<td colspan="2"><input type="text" id="e_hiredate" name="e_hiredate"></td>
			<th class="tac">직책번호</th>
			<td colspan="2"><input type="text" id="j_no" name="j_no"></td>
		</tr>
	</table>
	<table>
		<tr>
			<td><input type="button" value="등록" id="if_btnInsert"></td>
			<td><input type="button" value="취소" id="if_btnEmployeeList"></td>
		</tr>
	</table>
</form>
</div>
</body>