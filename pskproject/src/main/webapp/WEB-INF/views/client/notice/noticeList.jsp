<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정 -->

<meta name="viewport"
	content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<!-- 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정 initial-scale는 초기비율-->

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<!-- 모바일 웹페이지 설정 끝 -->

<!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
<!-- [if lt IE9]><script src="../js/html5shiv.js"></script>-->
<!-- [endif] -->

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/js/notice.js"></script>

<script type="text/javascript">
	search= "<c:out value='${data.search}'/>";
	start_date= "<c:out value='${data.start_date}'/>";
	end_date= "<c:out value='${data.end_date}'/>";
	keyword= "<c:out value='${data.keyword}'/>";


	$(function(){
			
		/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
		$(".goDetail").click(function(){
			var n_no = $(this).parents("tr").attr("data-num");
			$("#n_no").val(n_no);
			console.log("글번호:" + n_no);
			// 상세 페이지로 이동하기 위해 form 추가 (id: detailForm)
			$("#detailForm").attr({
				"method":"get",
				"action":"/notice/noticeDetail.do"
			})
			$("#detailForm").submit();
		})
		
	});
	

	function goPage(){
		if($("#search").val()=="all"){
			$("#keyword").val("");
		}
		$("#f_search").attr({
			"method" : "get",
			"action" : "/notice/noticeList.do"
		})
		$("#f_search").submit();
	}
	
</script>
	
	
			<div class="container">
			<div class="page-header">
				<h2 style="font-weight:bold">공지사항</h2>	
			 
			</div>
	<div class="well">
	<form name="detailForm" id="detailForm">
	<input type="hidden" name="n_no" id="n_no"> 
	</form>
	
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
						placeholder="시작일자" class="form-control"> <input
						type="date" name="end_date" id="end_date" placeholder="종료일자"
						class="form-control">
				</div>
				<button type="button" class="btn btn-primary" id="searchBtn">Search</button>
				<button type="button" class="btn btn-primary" id="allSearchBtn">All
					Search</button>
			</form>
	

		<table class="table table-striped">
			<thead>
				<tr>
					<th class="tac">글번호</th>
					<th class="tac">글제목</th>
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
	</div>
	