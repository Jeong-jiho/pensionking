<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
	
	<link rel="stylesheet" type="text/css" href="/resources/include/css/board.css">
	<link rel="stylesheet" type="text/css" href="/resources/include/css/common.css">
	
	
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	
	<script type="text/javascript">
		
		$(function(){
			   if('${data.keyword}'!=""){
				$("#keyword").val('${data.keyword}');
				$("#search").val('${data.search}');
				
			}
			 
			
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
			});
		
			// 검색 대상이 변결될 때마다 처리 이벤트
		 	$("#search").change(function(){
				if($("#search").val()=="all"){
					$("#keyword").val("전체데이터 조회합니다.");
				}else if($("#search").val()!="all"){
					$("#keyword").val("");
					$("#keyword").focus();
				}	
			});
			
			// 검색 버튼 클릭 시 처리 이벤트
		 	$("#searchData").click(function(){
				if($("#search").val()!="all"){
					if(!chkData('#keyword', "검색어를")) return;
				}
				goPage();
			}); 
									
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
	
	

	<form name="detailForm" id="detailForm">
	<input type="hidden" name="n_no" id="n_no"> 
	</form>
	<div class="contentContainer">
			<div class="contentTit"><h3>공지사항</h3></div>
		<form id="f_search" name="f_search">
			<table summary="검색">
			<tr>
				<td id="btd1">
					<label>검색조건</label>
        		   	<select id="search" name="search">
           				<option value="all">전체</option>
           				<option value="n_title">제목</option>
           				<option value="n_content">내용</option>
           				<option value="n_writer">작성자</option>
          			</select>
          			<input type="text" name="keyword" id="keyword" value="검색어를입력하세요" />
          			<input type="button" value="검색" id="searchData" />
         		</td>
         	</tr>	
         </table>
         </form> 		
	<table border="1" class="table table-bordered table table-hover">
			<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>작성자</th>
				
			</tr>
			</thead>
			<!-- 데이터 출력  -->
			<tbody id="list">
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
