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
		<link rel="shortcut icon"    href="/resources/images/icon.png"/>
		<link rel="apple-touch-icon" href="/resources/images/icon.png"/>
		<!-- 모바일 웹페이지 설정 끝 -->
	
		<!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
		<!-- [if lt IE9]><script src="../js/html5shiv.js"></script>-->
		<!-- [endif] -->
		
		<link rel="stylesheet" type="text/css" href="/resources/include/css/board.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/css/common.css">
	
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
	 	<script type="text/javascript">
		
		var butChk=0;   /*버튼 구별 변수(전역변수) */
		$(function(){
			
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
			
			/* 비밀번호 입력창 숨기기  */
			$("#pwdChk").hide();
			
			/* 수정 버튼 처리 */
			$("#updateFormBtn").click(function(){
				$("#pwdChk").show();
				$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color","#000099");
				butChk = 1 ;
			})
		
			                                    	
			/* 삭제버튼 클릭시 처리 이벤트 */
				$("#reviewDeleteBtn").click(function(){
					$.ajax({
						url:"/review/replyCount.do",      //전송 url
						type:"post",					  //전송 시 method 방식
						data: "rv_no="+$("#rv_no").val(), //폼전체 데이터 전송
						dataType: "text",
						error: function(){		    	  //실행시 오류가 발생했을 경우
							alert('시스템 오류 입니다. 관리자에게 문의 하세요'); 
						},
						success:function(resultData){     		  
							if(resultData==0){
								$("#pwdChk").show();
								$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color","#000099");
								butChk=2; 
							}else{
								alert("댓글이 있어 글을 삭제 할 수 없습니다. \n\n댓글을 삭제후 다시 확인해 주세요");
								return;
							}
						}
					});
				});		
             
             
						
			/* 확인 버튼 클릭 시 처리 이벤트 */
				$("#pwdBtn").click(function(){
					if(!chkData('#rv_pwd',"비밀번호를")) return;
					else{
						$.ajax({
							url:"/review/pwdConfirm.do", 				//요청 url
							type:"post",							 	//method 방식
							data: $("#f_pwd").serialize(),			 	//폼 전체 데이터 전송
							dataType: "text",
							error: function(){						  
								alert('시스템 오류 입니다. 관리자에게 문의 하세요'); 
							},	
							success : function(resultData){
								var goUrl="";
								if(resultData=="실패"){ 		//일치하지 않을 경우
									$("#msg").text("작성시 입력한 비밀번호가 일치하지 않습니다.").css("color","red");
									$("#rv_pwd").select();
								}else if(resultData=="성공"){ //일치할경우
									$("#msg").text("");
									if(butChk==1){
										goUrl="/review/updateForm.do";
									}else if(butChk==2){
										goUrl="/review/reviewDelete.do"
									}
									$("#f_data").attr("action", goUrl);	
									$("#f_data").submit();
								}
								
								} 
							})
						}
					})
			
			/* 목록 버튼 클릭 시 처리 이벤트 */
				$("#reviewListBtn").click(function(){
					location.href="/review/reviewList.do";	
			})
		})
			
		
		</script> 
		
	</head>
	<body>
	  <div class="contentContainer">
           
            <form name="f_data" id="f_data" method="post">
            	<input type="hidden" id="rv_no" name="rv_no" value="${detail.rv_no}">
            	<input type="hidden" name="rv_file" id="rv_file" value="${detail.rv_file}">
            </form>
           
          	<!-- =========비밀번호 확인 버튼 및 버튼 추가 시작========= -->
            <table id="boardPwdBut">
               <tr>
               	 <td id="btd1">
               	  	<div id="pwdChk">
               	  		<form name="f_pwd" id="f_pwd">
               	  			<input type="hidden" name="rv_no" value="${detail.rv_no}" />
               	  			<label for="rv_pwd" id="l_pwd">비밀번호:</label>
               	  			<input type="password" name="rv_pwd" id="rv_pwd" />
               	  			<input type="button" id="pwdBtn" value="확인" />
               	  			<span id="msg"></span>			
               	  		</form>
               	  	</div>	
               	  </td>
                  <td id="btd2">
                     <input type="button" value="수정" id="updateFormBtn">
                     <input type="button" value="삭제" id="reviewDeleteBtn">
                     <input type="button" value="목록" id="reviewListBtn">
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
                        <td>${detail.rv_name}</td>
                        <td class="ac">작성일</td>
                        <td>${detail.rv_date}</td>
                        <td class="ac">수정일</td>
                        <td>${detail.rv_update}</td>
                     </tr>
                     <tr>
                        <td class="ac">제목</td>
                        <td colspan="5">${detail.rv_title}</td>
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
         	<jsp:include page="reply.jsp"/>	
         </div>
   	</body>
</html>