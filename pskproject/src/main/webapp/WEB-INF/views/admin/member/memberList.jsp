<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
$(function(){
	$(".goDetail").click(function(){
	 var m_no = $(this).parents("tr").attr("data-num");
		$("#m_no").val(m_no);
		console.log(m_no);
	$("#detailForm").attr({
		"method":"get",
		"action":"/admin/member/memberDetail.do"
	  }); 
	
	 $("#detailForm").submit();
	});
	
	/* 검색 후 검색 대상과 검색 단어 출력 */
	var word="${data.keyword}";
	var value="";
	if(word!=''){
		$("#keyword").val("<c:out value = '${data.keyword}' />");
		$("#search").val("<c:out value = '${data.search}' />");
		
		if($("#search").val()!='m_no'){
			if($("#search").val=='m_name'){
				value = "#list tr td.goDetail";
			}else if($("#search").val()=='m_id'){
				value="#list tr td.m_id";
			}
			$(value+":contains('"+word+"')").each(function(){
				var regex = new RegExp(word, 'gi');
				$(this).html($(this).text().replace(regex,"<span class='required'>"+word+"</span>"));
			});
		}
	}
	
	/* 검색 대상이 변경될 때마다 처리 이벤트 */
	$("#search").change(function(){
		if($("#search").val()=="all"){
			$("#keyword").val("전체 데이터 조회합니다.");
		}else if($("#search").val()!="all"){
			$("#keyword").val("");
			$("#keyword").focus();
		}
	});
	
	/* 검색 버튼 클릭 시 처리 이벤트 */
	$("#searchData").click(function(){
		if($("#search").val()!="all"){
			if(!chkSubmit($('#keyword'),"검색어를"))return;
	}
		goPage();
	});
	
	function goPage(){
		if($("#search").val()=="all"){
			$("#keyword").val("");
		}
		$("#ml_search").attr({
			"method":"get",
			"action":"/admin/member/memberList.do"
		});
		$("#ml_search").submit();
	}
});
</script>
<body>
<ol class="breadcrumb">
	<li class="breadcrumb-item">
	<a href="/statistics/main.do">Admin</a>
	</li>
	<li class="breadcrumb-item active">회원관리</li>
</ol>

<div class="container-fluid">
<form name="ml_search" id="ml_search">
		<table summary="검색">
			<colgroup>
			</colgroup>
			<tr>
				<td id="btd1">
					<label>검색조건</label>
					<select id="search" name="search">
						<option value="all">전체</option>
						<option value="m_no">회원번호</option>
						<option value="m_name">성함</option>
						<option value="m_id">아이디</option>
					</select>
					<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" />
					<input type="button" value="검색" id="searchData" />
				</td>
			<!-- <td id="btd2">한페이지에 -->
			</tr>
		</table>
	</form>
<form id="detailForm" name="detailForm">
		<input type="hidden" name="m_no" id="m_no">
		<table class="table table-striped" id="s_table">
			<thead>
				<tr>
					<th class="tac">회원번호</th>
					<th class="tac">성함</th>
					<th class="tac">연락처</th>
					<th class="tac">아이디</th>
					<th class="tac">회원가입일자</th>
					<th class="tac">수정일</th>
					<th class="tac">탈퇴일</th>
					<th class="tac">상태번호</th>
				</tr>
			</thead>
			<tbody class="tBody">
				<!-- 데이터 출력  -->
				<c:choose>
					<c:when test="${not empty memberList}">
						<c:forEach var="member" items="${memberList}"
							varStatus="status">
							<tr class="tac" data-num="${member.m_no}">
								<td class="tac1 m_no">${member.m_no}</td>
								<td class="tac1 goDetail">${member.m_name}</td>
								<td class="tac1">${member.m_phone}</td>
								<td class="tac1 m_id">${member.m_id}</td>
								<td class="tac1">${member.m_date}</td>
								<td class="tac1">${member.m_update}</td>
								<td class="tac1">${member.m_retiredate}</td>
								<td class="tac1">${member.m_status}</td>
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
	</form>
	</div>
</body>