<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css" href="/resources/include/css/common2.css">

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
		
		$(function(){
				
		/* 목록 버튼 클릭 시 처리 이벤트 */
		$("#reviewListBtn").click(function() {
			location.href = "reviewList.do";
		})
	
		/* 삭제버튼 클릭시 처리 이벤트 */
		$("#reviewDeleteBtn").click(function() {
		if (confirm("선택하신 게시글을 삭제하시겠습니까?")) {
			$("#f_data").attr({
				"method" : "post",
				"action" : "reviewDelete.do"
				})
			$("#f_data").submit();
			}
		});	
		
		/* 첨부 파일 이미지 보여주기 위한 속성 추가  */
		var file = "<c:out value='${detail.rv_file}' />";
		if(file!=""){
			$("#fileImage").attr({
				src:"/uploadStorage/review/${detail.rv_file}",
				width:"450px",
				height:"200px"
			});
		}
		
		$("fileImage").show();
	});	
		
		
</script>

<div class="contentContainer">
	<div class="contentTit">
		<h3>후기 게시판</h3>
	</div>
	<form name="f_data" id="f_data" method="post">
		<input type="hidden" id="rv_no" name="rv_no" value="${detail.rv_no}">

	</form>
	<div class="contentBtn"> 
			<input type="button" class="btn btn-primary" value="삭제" id="reviewDeleteBtn"> 
			<input type="button" class="btn btn-primary" value="목록" id="reviewListBtn">
	</div>
	
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
					<td>${detail.rv_name}</td>
					<td class="ac">작성일</td>
					<td>${detail.rv_date}</td>
					<td class="ac">수정일</td>
					<td>${detail.rv_update}</td>
				</tr>
				<tr>
					<td class="ac">제목</td>
					<td colspan="5">${detail.rv_title }</td>
				</tr>
				<tr class="ctr">
					<td class="ac">내용</td>
					<td colspan="5">${detail.rv_content}</td>
				</tr>
				<c:if test="${detail.rv_file !=''}">
                <tr>
                    <td class="ac">첨부파일 이미지</td>
                    <td colspan="5"><img id="fileImage"></td>
                </tr>
                </c:if>
               </tbody>
		</table>
	</div>
	<jsp:include page="adminreply.jsp"/>
	
</div>