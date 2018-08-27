<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

		<link rel="stylesheet" type="text/css" href="/resources/include/css/board.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/css/common.css">
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js" ></script>
		<script type="text/javascript" src="/resources/include/js/common.js" ></script>
		
		<script type="text/javascript">
			$(function(){
				
				/* 저장 버튼  클릭 시 처리 이벤트 */
				$("#noticeInsert").click(function(){
					//입력값 체크
					if(!chkData("#n_writer","이름을"))			return;
					else if(!chkData("#n_title","제목을"))		return;
					else if(!chkData("#n_content","작성할 내용을"))	return;
										
						$("#f_writeForm").attr({
							"method":"post",
							"action":"noticeInsert.do"
						})
						
						$("#f_writeForm").submit();
					})					
				
			
				/*목록 버튼 클릭 시 처리 이벤트 */
				$("#noticeListBtn").click(function(){
					location.href="noticeList.do";	
				})
			})
		
		</script>
		
		
		<p>공지사항 입력란</p>
		
		<div class="contentContainer">
				
		<div class="contentTB">
			<form id="f_writeForm" name="f_writeForm" enctype="multipart/form-data">
				<table id="noticeWrite">
					<colgroup>
						<col width="17%"/>
						<col width="83%"/>
					</colgroup>	
					<tr>
						<td class="ac">작 성 자</td>
						<td><input type="text" id="n_writer" name="n_writer"></td>
					</tr>
					<tr>
						<td class="ac">글 제 목</td>
						<td><input type="text" id="n_title" name="n_title"></td>
					</tr>
					<tr>
						<td class="ac">내 용</td>
						<td><textarea id="n_content" name="n_content"></textarea></td>
					</tr>
				</table>
			</form>
		</div>	
			
			<div class="contentBtn">
				<input type="button" value="저장" class="but" id="noticeInsert">
				<input type="button" value="목록" class="but" id="noticeListBtn">
			</div>
		</div>
