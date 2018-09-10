<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>QnA 작성</title>
			
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정 -->

		<meta name="viewport"
		content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<!-- 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정 initial-scale는 초기비율-->
		
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon"    href="/resources/image/icon.png"/>
		<link rel="apple-touch-icon" href="/resources/image/icon.png"/>
		<!-- 모바일 웹페이지 설정 끝 -->
	
		<!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
		<!-- [if lt IE9]><script src="../js/html5shiv.js"></script>-->
		<!-- [endif] -->
		<link rel="stylesheet" type="text/css" href="/resources/include/css/board.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/css/common.css">
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js" ></script>
		<script type="text/javascript" src="/resources/include/js/common.js" ></script>
		
		<script type="text/javascript">
			$(function(){
				
				/* 저장 버튼  클릭 시 처리 이벤트 */
				$("#qnaInsert").click(function(){
					//입력값 체크
					if(!chkData("#q_title","제목을"))	return;
					else if(!chkData("#q_content","작성할 내용을"))	return;
					else if(!chkData("#q_pwd","비밀번호를"))		return;
					
						$("#f_writeForm").attr({
							"method":"post",
							"action":"/qna/qnaInsert.do"
						})
						
						$("#f_writeForm").submit();
					})
				
			
				/*목록 버튼 클릭 시 처리 이벤트 */
				$("#qnaListBtn").click(function(){
					location.href="/qna/qnaList.do";	
				})
			})
		
		</script>
		
		
	</head>
	<body>
	<div class="container">
			<div class="page-header">
				<h2 style="font-weight:bold">Q&A 작성</h2>	
			 
			</div> 
		<div class="contentContainer">
				<div class="contentBtn">
				<input type="button" value="저장" class="but" id="qnaInsert">
				<input type="button" value="목록" class="but" id="qnaListBtn">
			</div>
		<div class="contentTB">
			<form id="f_writeForm" name="f_writeForm" enctype="multipart/form-data">
			            				
				<table id="qnaWrite">
					<colgroup>
						<col width="17%"/>
						<col width="83%"/>
					</colgroup>
				
					<tr>
						<td class="ac">글 제 목</td>
						<td><input type="text" id="q_title" name="q_title"></td>
					</tr>
					<tr>
						<td class="ac">내 용</td>
						<td><textarea id="q_content" name="q_content"></textarea></td>
					</tr>
					<tr>
						<td class="ac">비밀번호</td>
						<td><input type="password" id="q_pwd" name="q_pwd"></td>
					</tr>
					
				</tbody>
				</table>
			</form>
		</div>	
	</div>
	</div>
	</body>
</html>