<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<link rel="shortcut icon"    href="/resources/images/icon.png"/>
		<link rel="apple-touch-icon" href="/resources/images/icon.png"/>
		<!-- 모바일 웹페이지 설정 끝 -->
	
		<!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
		<!-- [if lt IE9]><script src="../js/html5shiv.js"></script>-->
		<!-- [endif] -->
		
		<link rel="stylesheet" type="text/css" href="/resources/include/css/board.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/css/common.css">
			
		<style type="text/css">
			
			 #imgViewData{position:relative; top:-2px; left:0px; z-index:100} 
					
		</style>	
			
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js" ></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		
		<script type="text/javascript">
   $(function() {
      /*마우스 hover*/
      var value = "${updateData.rv_file}";
      if (value != "") {
         var img = $("<img>");   //동적 접근
         //마우스 영역에 들어갔을때랑 나왔을때, 총 2개의 매개변수 function() 필요하다
         $('#imgView').hover(function() {
            img.attr({
               src:"/uploadStorage/review/${updateData.rv_file}",
               width:"400px",
               length:"180px",
            });
            img.addClass("imgViewData");
            $('#imgArea').append(img);
         }, function() {
            img.remove();
         });
      } else {
         $('#imgView').hide();
      }
      
      /*저장 버튼 클릭 시 처리 이벤트(유효성검사)*/
      $("#reviewUpdateBtn").click(function() {
         if (!chkData("#rv_title", "제목을"))
            return;
         else if (!chkData("#rv_content", "내용을"))
            return;
         else {
            $("#f_writeForm").attr({
               "method" : "post",
               "action" : "/review/reviewUpdate.do"
            });
            $("#f_writeForm").submit();
         }
      });
   
      /*수정 화면에서 목록페이지 클릭 시 처리 이벤트*/
      $("#reviewListBtn").click(function() {
         location.href = "/review/reviewList.do"
      });
   });
</script>

</head>
<body>
	<div class="container">
			<div class="page-header">
				<h2 style="font-weight:bold">후기 수정</h2>	
			 
			</div>
   <div class="contentContainer">
      
      <!-- =========상세 정보 보여주기 시작========= -->
      <div class="contentTB">
         <form id="f_writeForm" name="f_writeForm" enctype="multipart/form-data">
        	<input type="hidden" name="rv_no" id="rv_no" value="${updateData.rv_no}">
            <input type="hidden" name="rv_file" id="rv_file" value="${updateData.rv_file}">
            <table border=1>
            	<colgroup>
            		<col width="17%"/>
            		<col width="33"/>
            		<col width="17%"/>
            		<col width="33%"/>
            	</colgroup>	
              
               <tr> 
               	  <td class="ac">글번호</td>
               	  <td>${updateData.rv_no }</td>
               	  <td class="ac">작성일</td>
               	  <td>${updateData.rv_date }</td>
               </tr>
               <tr>
                  <td class="ac">작성자</td>
                  <td colspan="3">${updateData.m_id}</td>
               </tr>
               <tr>
                  <td class="ac">글제목</td>
                  <td colspan="3"><input type="text" name="rv_title"
                     id="rv_title" value="${updateData.rv_title }"></td>
               </tr>
               <tr class="ctr">
                  <td class="ac">글내용</td>
                  <td colspan="3"><textarea id="rv_content" name="rv_content"
                        rows="10" cols="70">${updateData.rv_content}</textarea></td>
               </tr>
               <tr>
                  <td class="ac">첨부파일</td>
                  <td>
                     <input type="file" name="file" id="file">
                  </td>
                  <td colspan="2">   
                     <span id="imgView">이미지명:${updateData.rv_file}<span id="imgArea">
                     </span>
                     </span>
                  </td>
               </tr>
                <tr>
                  <td class="ac">비밀번호</td>
                  <td colspan="3"><input type="password" name="rv_pwd"
                     id="rv_pwd"> (수정할 비밀번호를 입력해 주세요)</td>
               </tr>
             </table>
  			</form>
       	</div>     
            <div class="contentBtn">
               <input type="button" value="수정" id="reviewUpdateBtn" class="but" />
               <input type="button" value="목록" id="reviewListBtn" class="but" />
            </div>
        </div>
        </div>
	</body>
</html>