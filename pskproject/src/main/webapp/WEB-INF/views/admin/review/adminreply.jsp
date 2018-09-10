<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<link rel="shortcut icon"    href="/resources/image/icon.png"/>
		<link rel="apple-touch-icon" href="/resources/image/icon.png"/>
		
		<link rel="stylesheet" type="text/css" href="/resources/include/css/common2.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/css/reply2.css" />
		<!-- 모바일 웹페이지 설정 끝 -->
	
		<!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
		<!-- [if lt IE9]><script src="../js/html5shiv.js"></script>-->
		<!-- [endif] -->
		
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>		
		<script type="text/javascript">
		var replyNum
		 
		$(function(){
			/* 기본 덧글 목록 불러오기 */
			var rv_no = "${detail.rv_no}";
			listAll(rv_no)
			
							
				/* "삭제하기" 버트 클릭 처리 */
	   			$(document).on("click",".delete_btn", function(){
	    			//$(".reset.btn").click();
	   				var currLi = $(this).parents("li")
	    			replyNum=currLi.attr("data-num");
	    			deleteBtn(rv_no);
	    		});
			
		});		
			
		
		/* 새로운 글을 화면에 추가하기 위한 함수 */ 
	        function addNewItem(rp_no, rp_writer, rp_content, rp_date) {
	           // 새로운 글이 추가될 li 태그 객체
	           var new_li =$("<li>");
	           new_li.attr("data-num",rp_no);
	           new_li.addClass("comment_item");
	           
	           // 작성자 정보가 지정될 <p>태그
	           var writer_p=$("<p>");
	           writer_p.addClass("writer");
	           
	           // 작성자 정보의 이름
	           var name_span = $("<span>");
	           name_span.addClass("name");
	           name_span.html(rp_writer+"님");
	           
	           // 작성일시
	           var date_span =$("<span>");
	           date_span.html(" / "+rp_date+" ");
	                        
	           // 삭제하기 버튼
	           var del_input=$("<input>");
	           del_input.attr({"type":"button","value":"삭제하기"});
	           del_input.addClass("delete_btn");
	           
	           // 내용
	           var content_p=$("<p>");
	           content_p.html(rp_content);
	           
	           // 조립하기
	           writer_p.append(name_span).append(date_span).append(del_input);
	           new_li.append(writer_p).append(content_p);
	           $("#comment_list").append(new_li);
	        }
		
	        			
			
			/* 댓글 목록 보여주는 함수 */
			function listAll(rv_no){
				$("#comment_list").html("");
				var url = "/replies/all/"+rv_no+".do";
				$.getJSON(url, function(data){
					console.log(data.length);
					
					$(data).each(function(){
						var rp_no = this.rp_no;
						var rp_writer = this.rp_writer;
						var rp_content = this.rp_content;
						var rp_date = this.rp_date;
						addNewItem(rp_no, rp_writer, rp_content, rp_date);
					})
				}).fail(function(){
					alert("댓글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
				});
			}
			
			
			 
			 /*   글 삭제를 위한 Ajax 연동 처리 */
		        function deleteBtn(rv_no) {
		           if (confirm("선택하신 댓글을 삭제하시겠습니까?")) {
		              $.ajax ({
		                 url : '/replies/' + replyNum +".do",
		                 type : 'delete',
		                 headers : {
		                    "Context-Type" : "application/json",
		                    "X-HTTP-Method-Override" : "DELETE"
		                 },
		                 dataType : 'text',
		                 success : function(result) {
		                    console.log("result : " + result);
		                    if(result == 'SUCCESS') {
		                       alert("삭제 완료 되었습니다.");
		                       listAll(rv_no);
		                    }
		                 }
		              });
		           }
		        }
			 		
		</script>
			
	</head>
	<body>
		<div id="replyContainer">
			<div id="comment_write">
				<label class="tac">댓글 리스트</label>
			</div>						
			<ul id="comment_list">
				<!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
			</ul>
		</div>
	</body>
</html>