<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/common.jspf"%>
<style type="text/css">

	section.gradient button {
	  color: black;
	  background-color: #D8D8D8;
	  background-image: linear-gradient(top, #6496c8, #346392);
	  box-shadow: inset 0 0 0 1px #27496d;
	  border: none;
	}
	section.gradient button:hover,
	section.gradient button.hover {
	  box-shadow: inset 0 0 0 1px #27496d,0 5px 15px #193047;
	}
	section.gradient input:active,
	section.gradient input.active {
	  box-shadow: inset 0 0 0 1px #27496d,inset 0 5px 30px #2E2E2E;
	}
</style>
<script type="text/javascript">
			$(function(){
				/*저장 버튼 클릭 시 처리 이벤트 */
				$("#roomInsertBtn").click(function(){
					var cnt=0;
					$(".error").html("");
					 if(!chkData("#r_name","객실명을")) return;
	            	 else if(!chkData("#r_kind","객실 종류를")) return;
	            	 else if(!chkData("#r_standard","기준인원을")) return;
	            	 else if(!checkNumber($("#r_standard"),$(".error:eq(0)"))) return;
	            	 else if(!chkData("#r_max","최대인원을")) return;
	            	 else if(!checkNumber($("#r_max"),$(".error:eq(1)"))) return;
	            	 else if($("#r_max").val()<$("#r_standard").val()) {
	            		 $(".error:eq(1)").html("기준인원보다 크게 입력해 주세요"); 
	            		 $("#r_max").val("");
	            		 $("#r_max").focus(); 
	            	 }
	            	 else if(!chkData("#r_size","객실 크기를")) return;
	                 else if( $("input[name='cvc']:checked").length==0) {
	                	 alert("편의사항을 체크해 주세요"); 
	                	 return;
	                 }
	            	 else if(!chkData("#r_info","객실정보를")) return;
	            	 else if(!chkData("#file","이미지 파일을")) return;
	            	 else if(!chkData("#pr_weekday","비성수기 평일가격을")) return;
	            	 else if(!chkData("#pr_weekend","비성수기 주말가격을")) return;
	            	 else if(!chkData("#pr_sweekday","성수기 평일가격을")) return;
	            	 else if(!chkData("#pr_sweekend","성수기 주말가격을")) return;
	            	 else{
	            		 if($('.uploadFile').val() != ""){
	            			 $('.uploadFile').each(function(){
	            				 if(!chkFile($(this))){
	            					 $(this).focus();
	            					 cnt = 1;
	            					 return;
	            					 
	            				 }
	            			 });
	            		 }
	            		 
	            		 if(cnt==0){
	            			 $("#r_writeForm").attr({
	            				 "method" : "post",
	 	            			"action" : "/admin/room/roomInsert.do"
	 	            		 });
	 	            		 $("#r_writeForm").submit(); 
	 	            		 
	            		 }
	            			 
	            			
	            	 }
				});
				
				/*목록 버튼 클릭 시 처리 이벤트 */
	            $("#roomListBtn").click(function(){
	               location.href="/admin/room/roomList.do";   
	               
	            });
	            
				/*이미지 추가 버튼 클릭시 처리 이벤트 */
				$("#imageInsertBtn").click(function(){

					var br = $("<br/>");
					
					var div = $("<div>");
					div.addClass("image");
					
					var uploadFile = $("<input type='file' name='file'>");
					uploadFile.addClass("uploadFile");
					
					var imageDelete = $("<input type='button' value='삭제'/>");
					imageDelete.addClass("imageDeleteBtn");
					
					div.append(uploadFile).append(imageDelete).append(br);
					
	            	$(this).parents("td").parents("tr").find("td:eq(1)").append(div);
	            	
	              	/* $(this).insertAfter(uploadFile); */
				}); 
				
				$(document).on("click",".imageDeleteBtn",function(){ 
					$(this).parent().remove();
					$(this).remove();
				}); 
				
			});
			//초기화 작업
			function resetData(){
				$("#r_writeForm").each(function(){
					this.reset();
				});
			}
			var test = "";
			
				 
				
			
			
			
			
		</script>


<ol class="breadcrumb">
		<li class="breadcrumb-item">
		<a href="#">Admin</a>
		</li>
		<li class="breadcrumb-item active">객실관리</li>
		<li class="breadcrumb-item active">객실등록</li>
	</ol>

<form id="r_writeForm" name="r_writeForm" enctype="multipart/form-data">
	<div class="container-fluid">
	
		<div class="contentBtn">
			<input type="button" value="저장" class="but" id="roomInsertBtn">
			<input type="button" value="목록" class="but" id="roomListBtn">
		</div>
		<input type="hidden" id="i_kind" name="i_kind" value="room">
		<div class="card">
			<div class="card-header"> 
				객실정보입력
			</div>
		<div class="card-body">
		<table class="table table-responsive-sm table-bordered" id="roomWrite">
			<colgroup>
				<col width="17%" />
				<col width="33%" />
				<col width="17%" />
				<col width="33%" />
			</colgroup>
			<tr>
				<td class="ac">객실명</td>
				<td><input type="text" id="r_name" name="r_name"></td>
				<td class="ac">객실 종류</td>
				<td><input type="text" id="r_kind" name="r_kind"></td>
			</tr>
			<tr>
				<td class="ac">기준 인원</td>
				<td><input type="text" id="r_standard" name="r_standard"><br />
				<span class="error"></span></td>
				<td class="ac">최대 인원</td>
				<td><input type="text" id="r_max" name="r_max"><br />
				<span class="error"></span></td>
			</tr>
			<tr>
				<td class="ac">객실 크기</td>
				<td><input type="text" id="r_size" name="r_size"></td>
				<td class="ac">편의사항</td>
				<td> 
					
					    <input type="checkbox" name="cvc" value="수영장" >수영장
					    <input type="checkbox" name="cvc" value="개별바비큐">개별바비큐
					    <input type="checkbox" name="cvc" value="IPTV/WIFI">IPTV/WIFI
					    <input type="checkbox" name="cvc" value="냉장고" >냉장고
					    <input type="checkbox" name="cvc" value="드라이기" >드라이기
					    <input type="checkbox" name="cvc" value="에어컨">에어컨
					    <input type="checkbox" name="cvc" value="욕실용품" >욕실용품
					    <input type="checkbox" name="cvc" value="전기밥솥">전기밥솥
					    <input type="checkbox" name="cvc" value="전자레인지">전자레인지
					    <input type="checkbox" name="cvc" value="스파" >스파
		
				</td>
			</tr>
			<tr>
				<td class="ac">객실 정보</td>
				<td colspan="3"><textarea rows="5" cols="93" class="r_info" id="r_info"
						name="r_info"></textarea></td>
			</tr>
			<tr>
				<td class="ac">이 미 지 <br />
				<input type="button" value="추가" id="imageInsertBtn" /></td>
				<td colspan="3">
					<!-- <div class="hh">
			                  	<div class="imagePreview" id="0">
			                  		<input class="uploadFile" type="file" name="file" id="file"/>
			                  		<img class="img-thumbnail">
			                  	</div>
		                  	</div>
		                  	
		                  	<div class="hh" id="-1">
		                  		
			                  	<div class="imagePreview" >
									<h3 class="title" ><a id="imageInsertBtn">추가</a></h3>
									<img class="img-thumbnail">
								</div>
							</div> -->
					<div class="image">
						<input class="uploadFile" type="file" name="file"
							id="file" /> <span style="color: red;">메인 이미지</span>
					</div>
					<br/>
				</td>
			</tr>
		</table>
		</div>
		</div>
	</div>
	<div class="container-fluid">
	<!-- Default panel contents -->
		<div class="card">
			<div class="card-header"> 
				가격정보입력
			</div>
		<div class="card-body">
		<table class="table table-responsive-sm table-bordered" id="priceWrite">
			<colgroup>
				<col width="40" />
				<col width="60%" />
			</colgroup>
			<tr>
				<td class="ac">비성수기 평일 가격</td>
				<td><input type="text" id="pr_weekday" name="pr_weekday">원</td>
			</tr>
			<tr>
				<td class="ac">비성수기 주말 가격</td>
				<td><input type="text" id="pr_weekend" name="pr_weekend">원</td>
			</tr>

		</table>
		<table class="table table-bordered" id="priceWrite">
			<colgroup>
				<col width="40" />
				<col width="60%" />
			</colgroup>
			<tr>
				<td class="ac">성수기 평일 가격</td>
				<td><input type="text" id="pr_sweekday" name="pr_sweekday">원</td>
			</tr>
			<tr>
				<td class="ac">성수기 주말 가격</td>
				<td><input type="text" id="pr_sweekend" name="pr_sweekend">원</td>
			</tr>

		</table>
		</div>
		</div>
	</div>
</form>

