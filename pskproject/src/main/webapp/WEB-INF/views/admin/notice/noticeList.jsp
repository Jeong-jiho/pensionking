<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
	
		
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/notice.js"></script>
	
	<script type="text/javascript">
	
		$(function(){
		
			 
			/* 글쓰기 버튼 처리 이벤트 */
			$("#insertFormBtn").click(function(){
				location.href="writeForm.do";
			})
		 	
			
			/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
		 	$(".goDetail").click(function(){
				var n_no = $(this).parents("tr").attr("data-num");
				$("#n_no").val(n_no);
				console.log("글번호:" + n_no);
				// 상세 페이지로 이동하기 위해 form 추가 (id: detailForm)
				$("#detailForm").attr({
					"method":"get",
					"action":"noticeDetail.do"
				})
				$("#detailForm").submit();
			})
		})
		
				
		// 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수	
	 	function goPage(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			$("#f_search").attr({
				"method":"get",
				"action":"noticeList.do"
			});
			$("#f_search").submit();	
		}
		  
	
	</script>
	<ol class="breadcrumb">
	<li class="breadcrumb-item">
	<a href="#">Admin</a>
	</li>
	<li class="breadcrumb-item active">게시판관리</li>
	<li class="breadcrumb-item active">공지사항</li>
</ol>

<div class="container-fluid">
	<form name="detailForm" id="detailForm">
	<input type="hidden" name="n_no" id="n_no"> 
	</form>
	<div class="table-responsive">
				<div class="table table-responsive-sm table-striped">
					<form class="form-inline" id="f_search">
				<h3>
					<span class="label label-success">검색조건</span>
				</h3>
				<div class="form-group">
					<select id="search" name="search" class="form-control">
						<option value="n_title">제목</option>
						<option value="n_content">내용</option>
						<option value="n_writer">작성자</option>
						<option value="n_date">작성일자</option>
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
			<thead>
				<tr>
					<th class="tac">번호</th>
					<th class="tac">제목</th>
					<th class="tac">작성일</th>
					<th class="tac">작성자</th>
				</tr>
			</thead>
			<tbody>
				<!-- 데이터 출력  -->
				<c:choose>
					<c:when test="${not empty noticeList}">
						<c:forEach var="notice" items="${noticeList}" varStatus="status">
							<tr class="tac" data-num="${notice.n_no}">
								<td>${notice.n_no}</td>
								<td class="goDetail tal">${notice.n_title}</td>
								<td>${notice.n_date}</td>
								<td class="name">${notice.n_writer}</td>
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
	<div class="contentBtn">
		<input type="button" value="글쓰기" id="insertFormBtn" />
	</div>
</div>