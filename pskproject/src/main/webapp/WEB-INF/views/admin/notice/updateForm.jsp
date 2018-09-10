<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
		
		<link rel="stylesheet" type="text/css" href="/resources/include/css/board.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/css/common2.css">
					
					
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js" ></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		
		<script type="text/javascript">
   	  
	  $(function() {
      
      /*저장 버튼 클릭 시 처리 이벤트(유효성검사)*/
      $("#noticeUpdateBtn").click(function() {
         if (!chkData("#n_title", "제목을"))
            return;
         else if (!chkData("#n_content", "내용을"))
            return;
         else {
            $("#f_writeForm").attr({
               "method" : "post",
               "action" : "noticeUpdate.do"
            });
            $("#f_writeForm").submit();
         }
      });
   
      /*수정 화면에서 목록페이지 클릭 시 처리 이벤트*/
      $("#noticeListBtn").click(function() {
         location.href = "noticeList.do"
      });
   });
   		
</script>

   <div class="contentContainer">
      <div class="contentTit">
         <h3>공지사항 수정란</h3>
      </div>
      <!-- =========상세 정보 보여주기 시작========= -->
      <div class="contentTB">
         <form id="f_writeForm" name="f_writeForm" enctype="multipart/form-data">
        	<input type="hidden" name="n_no" id="n_no" value="${updateData.n_no}">
            <table border=1>
            	<colgroup>
            		<col width="17%"/>
            		<col width="33"/>
            		<col width="17%"/>
            		<col width="33%"/>
            	</colgroup>	
               <tr> 
               	  <td class="ac">글번호</td>
               	  <td>${updateData.n_no }</td>
               	  <td class="ac">작성일</td>
               	  <td>${updateData.n_date }</td>
               </tr>
               <tr>
                  <td class="ac">작성자</td>
                  <td colspan="3">${updateData.n_writer }</td>
               </tr>
               <tr>
                  <td class="ac">글제목</td>
                  <td colspan="3"><input type="text" name="n_title"
                     id="n_title" value="${updateData.n_title }"></td>
               </tr>
               <tr class="ctr">
                  <td class="ac">글내용</td>
                  <td colspan="3"><textarea id="n_content" name="n_content"
                        rows="10" cols="70">${updateData.n_content}</textarea></td>
               </tr>
               
            </table>

            <div class="contentBtn">
               <input type="button" value="수정" id="noticeUpdateBtn" class="but" />
               <input type="button" value="목록" id="noticeListBtn" class="but" />
            </div>
         </form>
      </div>
   </div>
