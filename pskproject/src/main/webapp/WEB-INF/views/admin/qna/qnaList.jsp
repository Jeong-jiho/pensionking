<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>


<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/qna.js"></script>
<script type="text/javascript">
	search= "<c:out value='${data.search}'/>";
	start_date= "<c:out value='${data.start_date}'/>";
	end_date= "<c:out value='${data.end_date}'/>";
	keyword= "<c:out value='${data.keyword}'/>";

	$(function(){
	
	
	/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
 	$(".goDetail").click(function(){
		var q_no = $(this).parents("tr").attr("data-num");
		$("#q_no").val(q_no);
		console.log("글번호:" + q_no);
		// 상세 페이지로 이동하기 위해 form 추가 (id: detailForm)
		$("#detailForm").attr({
			"method":"get",
			"action":"qnaDetail.do"
		})
		$("#detailForm").submit();
	});
			
});

	function goPage(){
		if($("#search").val()=="all"){
			$("#keyword").val("");
		}
		$("#f_search").attr({
			"method" : "get",
			"action" : "qnaList.do"
		})
		$("#f_search").submit();
	}
	
</script>
	<ol class="breadcrumb">
		<li class="breadcrumb-item">
		<a href="#">Admin</a>
		</li>
		<li class="breadcrumb-item active">게시판관리</li>
		<li class="breadcrumb-item active">Q&A</li>
	</ol>
	 
	<div class="container-fluid">
	<form name="detailForm" id="detailForm">
	<input type="hidden" name="q_no" id="q_no"> 
	</form>
	<div class="table-responsive">
				<div class="table table-responsive-sm table-striped">
					<form class="form-inline" id="f_search">
				<h3>
					<span class="label label-success">검색조건</span>
				</h3>
				<div class="form-group">
					<select id="search" name="search" class="form-control">
						<option value="q_title">제목</option>
						<option value="q_content">내용</option>
						<option value="m_id">작성자</option>
						<option value="q_date">작성일자</option>
					</select>
				</div>
				<div class="form-group" id="textCheck">
					<input type="text" name="keyword" id="keyword" class="form-control"
						placeholder="검색어를입력하세요" />
				</div>
				<div class="form-group" id="dateCheck">
					<input type="date" name="start_date" id="start_date"
						placeholder="시작일자" class="form-control"> 
					<input
						type="date" name="end_date" id="end_date" placeholder="종료일자"
						class="form-control">
				</div>
				<button type="button" class="btn btn-primary" id="searchBtn">Search</button>
				<button type="button" class="btn btn-primary" id="allSearchBtn">All
					Search</button>
				</form>
		</div>
		
		
		
		<table border="1" class="table table-striped">
		<colgroup>
                     <col width="15%" />
                     <col width="40%" />
                     <col width="15%" />
                     <col width="15%" />
                     <col width="15%" />
        </colgroup>
		
			<thead>
				<tr>
					<th class="tac">번호</th>
					<th class="tac">제목</th>
					<th class="tac">작성일</th>
					<th class="tac">작성자</th>
					<th class="tac">조회수</th>
				</tr>
			</thead>
			<tbody>
				<!-- 데이터 출력  -->
				<c:choose>
					<c:when test="${not empty qnaList}">
						<c:forEach var="qna" items="${qnaList}" varStatus="status">
							<tr class="tac" data-num="${qna.q_no}">
								<td>${qna.q_no}</td>
								<td class="goDetail tal">${qna.q_title}</td>
								<td>${qna.q_date}</td>
								<td class="name">${qna.m_id}</td>
								<td>${qna.readcnt}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</div>