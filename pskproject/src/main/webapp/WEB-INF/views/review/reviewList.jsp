<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	
	
	
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	
	
<!-- 	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	부가적인 테마
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	합쳐지고 최소화된 최신 자바스크립트
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
	
	<!-- <script type="text/javascript">
		
		$(function(){
			if('${data.keyword}'!=""){
				$("#keyword").val('${data.keyword}');
				$("#search").val('${data.search}');
				
			}
			
			
			$("#insertFormBtn").click(function(){
				location.href="/board/writeForm.do";
			
			})
			/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
			$(".goDetail").click(function(){
				var b_num = $(this).parents("tr").attr("data-num");
				$("#b_num").val(b_num);
				console.log("글번호:" + b_num);
				// 상세 페이지로 이동하기 위해 form 추가 (id: detailForm)
				$("#detailForm").attr({
					"method":"get",
					"action":"/board/boardDetail.do"
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
				"action":"/board/boardList.do"
			});
			$("#f_search").submit();	
		}
		
	
	</script> -->
	
</head>
<body>
	<form name="detailForm" id="detailForm">
	<input type="hidden" name="b_num" id="b_num"> 
	</form>
	<div class="contentContainer">
			<div class="contentTit"><h3>목록</h3></div>
		<form id="f_search" name="f_search">
			<table summary="검색">
			<tr>
				<td id="btd1">
					<label>검색조건</label>
        		   	<select id="search" name="search">
           				<option value="all">전체</option>
           				<option value="rv_title">제목</option>
           				<option value="b_content">내용</option>
           				<option value="b_name">작성자</option>
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
				<th>이용객실</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			</thead>
			<!-- 데이터 출력  -->
			<tbody id="list">
			<c:choose>
				<c:when test="${not empty reviewList}">
					<c:forEach var="board" items="${reviewList}" varStatus="status">
						<tr class="tac" data-num="${review.rv_no}">
							<td>${review.rv_no}</td>
							<td class="goDetail tal">${board.rv_title}</td>
							<td></td>
							<td class="name">${review.rv_name}</td>
							<td>${review.rv_date}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5" class="tac">등록된 게시물이 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	</div>
	<div class="contentBtn">
		<input type="button" value="글쓰기" id="insertFormBtn" />
	</div>
	
	
</body>
	
</html>