<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script type="text/javascript">

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
<form id="md_data" id="md_data" method="post">
	<input type="hidden" name="m_no" value="${detail.m_no}" />
</form>
<table class="table table-striped" id="s_table">
		<thead>
			<tr>
				<th class="tac">회원번호</th>
				<td class="tac1">${detail.m_no}</td>
				<th class="tac">이름</th>
				<td class="tac1">${detail.m_name}</td>
				<th class="tac">성별</th>
				<td class="tac1">${detail.m_gender}</td>
			</tr>	
			<tr>
				<th class="tac">연락처</th>
				<td class="tac1">${detail.m_phone}</td>
				<th class="tac">이메일</th>
				<td class="tac1">${detail.m_email}</td>
			</tr>
			<tr>
				<th class="tac">아이디</th>
				<td class="tac1">${detail.m_id}</td>
				<th class="tac">비밀번호</th>
				<td class="tac1">${detail.m_pwd}</td>
			</tr>
			<tr>
				<th class="tac">가입일</th>
				<td class="tac1">${detail.m_date}</td>
				<th class="tac">수정일</th>
				<td class="tac1">${detail.m_update}</td>
				<th class="tac">탈퇴일</th>
				<td class="tac1">${detail.m_retiredate}</td>
			</tr>
		</thead>
	</table>
	</div>
</body>