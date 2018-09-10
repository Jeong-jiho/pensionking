<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" type="text/css" 	href="/resources/include/css/board.css">
<link rel="stylesheet" type="text/css"	href="/resources/include/css/common.css">

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {

		/* 목록 버튼 클릭 시 처리 이벤트 */
		$("#noticeListBtn").click(function() {
			location.href = "/notice/noticeList.do";
		})
	})
		
</script>
	<div class="container">
			<div class="page-header">
				<h2 style="font-weight:bold">공지사항 상세보기</h2>	
			 
			</div>
	<div class="contentContainer">
		<div class="contentTit">
			<h3>공지사항</h3>
		</div>
		<form name="f_data" id="f_data" method="post">
			<input type="hidden" id="n_no" name="n_no" value="${detail.n_no}">

		</form>

		<!-- =========비밀번호 확인 버튼 및 버튼 추가 시작========= -->
		<table id="boardPwdBut">
			<tr>
				<td id="btd2"> 
				<input type="button" value="목록" id="noticeListBtn">
				</td>
			</tr>
		</table>
		<!-- =========비밀번호 확인 버튼 및 버튼 추가 종료========= -->

		<!-- =========상세 정보 보여주기 시작========= -->
		<div class="contentTB">
			<table>
				<colgroup>
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
				</colgroup>
				<tbody>
					<tr>
						<td class="ac">작성자</td>
						<td>${detail.n_writer}</td>
						<td class="ac">작성일</td>
						<td>${detail.n_date}</td>
						<td class="ac">수정일</td>
						<td>${detail.n_update}</td>
					</tr>
					<tr>
						<td class="ac">제목</td>
						<td colspan="5">${detail.n_title }</td>
					</tr>
					<tr class="ctr">
						<td class="ac">내용</td>
						<td colspan="5">${detail.n_content}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>


