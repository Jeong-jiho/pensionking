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
		
		<link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/css/reply.css" />
		<!-- 모바일 웹페이지 설정 끝 -->
	
		<!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
		<!-- [if lt IE9]><script src="../js/html5shiv.js"></script>-->
		<!-- [endif] -->
		
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>		
		<script type="text/javascript">
		var replyNum, message = " 작성시 입력한 비밀번호를 입력해 주세요.", btnKind=""; 
		 
		$(function(){
			/* 기본 덧글 목록 불러오기 */
			var rv_no = "${detail.rv_no}";
			listAll(rv_no)
			
			/** 댓글 내용 저장 이벤트 */
			$("#replyInsert").click(function(){
				if(!chkData("#rp_writer","이름을")) return;
				else if(!chkData("#rp_pwd","비밀번호를")) return;
				else if(!chkData("#rp_content","내용을")) return;
				else{
					var insertUrl = "/replies/replyInsert.do";
					/** 글 저장을 위한 post 방식의 Ajax 연동처리 */
					$.ajax({
						url:insertUrl, 	// 전송 url
						type:"post",	// 전송 시 method 방식
						headers:{
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"POST"
						},
						dataType:"text",
						data : JSON.stringify({
							rv_no:rv_no,
							rp_writer:$("#rp_writer").val(),
							rp_pwd:$("#rp_pwd").val(),
							rp_content:$("#rp_content").val()
						}),
						error : function(){  //실행시 오류가 발생하였을 경우
							alert('시스템 오류 입니다. 관리자에게 문의하세요');
						},
						success : function(resultData){
							if(resultData=="SUCCESS"){
								alert("댓글 등록이 완료되었습니다.");
								dataReset();
								listAll(rv_no);
							}
						}
					})
				}
			})
				
				/* "삭제하기" 버트 클릭 처리 */
	   			$(document).on("click",".delete_btn", function(){
	    			//$(".reset.btn").click();
	   				var currLi = $(this).parents("li")
	    			replyNum=currLi.attr("data-num");
	    			pwdReset(this);
	    			pwdView(currLi);
	    			btnKind="delBtn";
	    		});
			
			
				/* 비밀번호 취소 버튼 클릭 시 처리 이벤트 */
		  		$(document).on("click", ".pwdResetBut",function(){
		  			//$(this).parent("li").removeClass("glayLayer");
		  			//$(this).parent().parent().removeClass("overLayer");
		  			pwdReset(this);
		  		});
				
				/* 비밀번호 입력 양식에 커서 주어졌을 경우 처리 이벤트 */
	  			$(document).on("focus",".passwd", function(){
	  				$(this).val("");
	  			var span = $(this).parents("form").find("span");
	  				span.removeClass("msg_error");
	  				span.addClass("msg_default");
	  				span.html(message);
	 		 	});
							
				/* 비밀번호 입력 양식 enter 제거 */ 
		  		$(document).on("keydown",".passwd", function(event){
		  			if(event.keyCode == 13){
		  				event.preventDefault();
		  			}
		  		});
		  		
				
		  		/* 글수정를 위한 Ajax 연동 처리 */
	   			$(document).on("click",".update_form", function(){
	    			$(".reset_btn").click();
	   				var currLi = $(this).parents("li")
	    			replyNum=currLi.attr("data-num");
	    			pwdReset(this);
	    			pwdView(currLi);
	    			btnKind="upBtn";
	    			});
							
				
		  		/* 수정취소 버튼 클릭 시 처리 이벤트 */
			   	$(document).on("click", ".reset_btn",function(){
			   		
			   		var conText =$(this).parents("li").find("textarea").html();
					conText = conText.replace(/(\r\n|\r|\n)/g, "<br/>");
			   		$(this).parents("li").find("input[type='button']").show();
			   		
			   		var conArea = $(this).parents("li").children().eq(1);
			   		conArea.html(conText);
		  		});
				
		  		
		  		/* 수정화면에서 수정완료 버튼 클릭시 수정을 위한 Ajax 연동 처리 */
		  		$(document).on("click", ".update_btn", function() {
		  			var rp_no = $(this).parents("li").attr("data-num");
		  			var rp_content = $("#content").val();
		  		
		  			if(!chkData("#content", "댓글 내용을")) return;
		  			else{
		  				$.ajax({
		  					url:"/replies/"+rp_no+".do",
		  					type:"put",
		  					headers:{
		  						"Content-Type":"application/json",
		  						"X-HTTP-Method-Override":"PUT"
		  					},
		  					data:JSON.stringify({
		  						rp_content:rp_content
			  					
		  					}),
		  					dataType:'text',
		  					success:function(result) {
		  						console.log("result"+result);
		  						if(result == "SUCCESS"){
		  							alert("수정 완료 되었습니다.")
		  							listAll(rv_no);
		  						}
		  					}
		  				})
		  			}
		  		})
		  		
		  		
		  		/* 비밀번호 확인 버튼 클릭 시 처리 이벤트 */
		  		$(document).on("click",".pwdCheckBut",function(){
		  			var li = $(this).parents("li");
		  			var form =$(this).parents("form");
		  			var pwd = form.find(".passwd");
		  			var msg = form.find(".msg");
		  			var result = 0;
		  			
		  			if(!formCheck(pwd, msg, "비밀번호를"))return;
		  			else{
		  				$.ajax({
		  					url:"/replies/pwdConfirm.do",
		  					type:"post",
		  					data:"rp_no="+replyNum+"&rp_pwd="+pwd.val(),
		  					dataType:"text",
		  					error:function(){
		  						alert('시스템 오류 입니다. 관리자에게 문의하세요');
		  					},
		  					success : function(resultData){
		  						 	console.log("resultData:"+resultData);
		  						if(resultData==0){				// 일치하지 않는 경우
		  							msg.addClass("msg_error");
		  							msg.text(" 입력한 비밀번호가 일치하지 않습니다.").css("color","red");
		  							//pwdConfirm=0;
		  						}else if(resultData==1){ 		// 일치할 경우
		  							console.log("resultData:"+resultData);	
		  							pwdReset(form);
		  							
		  							console.log("btnKind :"+ btnKind);
		  							if(btnKind=="upBtn"){
		  								updateForm(li);
		  							}
		  							else if(btnKind=="delBtn"){
		  								deleteBtn(rv_no);
		  							}
		  							btnKind="";
		  						}
		  					}
		  				})
		  			}	
		  		});
			});
			
				
			function pwdReset(target){
		  			$("li.pwdArea").not(this).html("");
		  			$(target).parents("li").find(".pwdArea").html("");
		  		}
		
		
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
	           
	           // 수정하기 버튼
	           var up_input=$("<input>");
	           up_input.attr({"type":"button","value":"수정하기"});
	           up_input.addClass("update_form");
	                      
	           // 삭제하기 버튼
	           var del_input=$("<input>");
	           del_input.attr({"type":"button","value":"삭제하기"});
	           del_input.addClass("delete_btn");
	           
	           // 내용
	           var content_p=$("<p>");
	           content_p.html(rp_content);
	           
	           // 조립하기
	           writer_p.append(name_span).append(date_span).append(up_input).append(del_input);
	           new_li.append(writer_p).append(content_p);
	           $("#comment_list").append(new_li);
	        }
		
	        
			/* 입력 폼 초기화  */
   	        function dataReset(){
   	           $("#rp_writer").val("");
   	           $("#rp_pwd").val("");
   	           $("#rp_content").val("");
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
			
			
			 function pwdView(area){
			   	  	//$(".pwdResetBut").click();
			   	  	var pwd_div = $("<div>");
			   	  	pwd_div.addClass("pwdArea");
			  	 	  	
		  	 	  	var pwd_form = $("<form>");
		  	 	  	pwd_form.attr("name", "f_pwd");
		   		  	
		   		  	var pwd_label = $("<label>");
		   		  	pwd_label.attr("for", "passwd");
			   	  	pwd_label.html("비밀번호 : ");		

	 		  	  	var pwd_input = $("<input>");
	 		  	  	pwd_input.attr({"type" : "password", "name" : "passwd"});
	 		  	  	pwd_input.addClass("passwd");
	 		  	  	pwd_input.prop("autofocus","autofocus");
	   	  	
	   			  	var pwd_check = $("<input>");
	   			  	pwd_check.attr({"type" : "button", "value" : "확인"});
			   	  	pwd_check.addClass("pwdCheckBut");
	   		  	
	   		  		var pwd_reset = $("<input>");
	   		  		pwd_reset.attr({"type" : "button", "value" : "취소"});
	   			  	pwd_reset.addClass("pwdResetBut");
	   	 	 	
	   		  		var pwd_span = $("<span>");
	   			  	pwd_span.addClass("msg");
	   		 	 	pwd_span.html(message);
	   	  	
	   			  	pwd_form.append(pwd_label).append(pwd_input).append(pwd_check).append(pwd_reset).append(pwd_span);
			   	  	pwd_div.append(pwd_form)
			   	  	area.append(pwd_div);
			 }
			 
				function updateForm(currLi){
	   	       		var conArea = currLi.children().eq(1);
	   	       		var conText = conArea.html().replace(/<br>|<br\/>/g,'\r\n');
	   	       		console.log("conText:"+ conText);
	   	       		
	   	       		currLi.find("input[type='button']").hide();
	   	       		conArea.html("");
	   	       		
	   	       		var update_area = $("<span>");
	   	       		update_area.addClass("update_area");
	   	       		
	   	       		var textarea = $("<textarea>");
	   	       		textarea.attr({"name":"content", "id":"content"});
	   	       		textarea.html(conText);
	   	       		
	   	       		var update_btn = $("<input>");
	   	       		update_btn.attr({"type":"button","value":"수정완료"})
	   	       		update_btn.addClass("update_btn");
	   	       		
	   	       		var reset_btn = $("<input>");
	   	       		reset_btn.attr({"type":"button","value":"수정취소"})
	   	       		reset_btn.addClass("reset_btn");
	   	       	
	   	       		update_area.append(textarea).append(update_btn).append(reset_btn);
	   	       		conArea.html(update_area);
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
				<form id=comment_form>
					<div id="comment">
						<label for="user_name" class="tac">작 성 자</label>
						<input type="text" name="rp_writer" id="rp_writer" />
						<label for="rp_pwd" class="tac">비밀번호</label>
						<input type="password" name="rp_pwd" id="rp_pwd" />
						<input type="button" id="replyInsert" value="저장하기"/>
					</div>
				<div >
					<label class="tac">덧글 내용</label>
					<textarea name="rp_content" id="rp_content"></textarea>
				</div>	 	
			</form>
		</div>
			<ul id="comment_list">
				<!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
			</ul>
		</div>
	</body>
</html>