<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<script type="text/javascript">
	$(function(){
		$("#main td div:eq(0) span").html("메인 이미지").css("color","red");
		$("#main td div:eq(0) .imageDeleteBtn").click(function(){
			var br = $("<br/>");
			
			var div = $("<div>");
			div.addClass("image");
			
			var uploadFile = $("<input type='file' id='file' name='file'>");
			uploadFile.addClass("uploadFile uploadFile1");
			
			var span = $("<span>");
			span.html("메인 이미지").css("color","red");
			/* var imageDelete = $("<input type='button' value='삭제'/>");
			imageDelete.addClass("imageDeleteBtn"); */
			
			div.append(uploadFile).append(span);
			
        	$(this).parents("td").parents("tr").find("td:eq(1)").append(br).append(div);
		});
		
		$(".imageDeleteBtn").click(function(){
			var filenames = $(this).parents(".roomDiv").attr("data-image");
			var imageDelete = $("<input type='hidden' id='filenames' name='filenames'/>");
			imageDelete.val(filenames);
			$("#f_image").append(imageDelete);
				
			$(this).parents(".roomDiv").remove();
		});
		$("#imageInsertBtn").click(function(){
			
			var br = $("<br/>");
			
			var div = $("<div>");
			div.addClass("image");
			
			var uploadFile = $("<input type='file' id='file' name='file'>");
			uploadFile.addClass("uploadFile");
			
			/* var imageDelete = $("<input type='button' value='삭제'/>");
			imageDelete.addClass("imageDeleteBtn"); */
			
			div.append(uploadFile);
			
        	$(this).parents("td").parents("tr").find("td:eq(1)").append(br).append(div);
        	
        	
		});
		
		$("#roomInsertBtn").click(function(){
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
	       	 else if(!chkData("#r_cvc","편의사항을")) return;
	       	 else if(!chkData("#r_info","객실정보를")) return;
	       	 else if($("#main").find("td:eq(1) div").find(".uploadFile1").val() == ""){
	       		if(!chkData(".uploadFile1","메인 이미지 파일을")) return;
	       	 }
	       	 
	       	 else{
				if($("#f_image").find("input:eq(1)").val() != null){
					console.log("지울게 있어용");
					$.ajax({
						url : "/Image/imageDelete.do",
						type : "post",
						data : $("#f_image").serialize(),
						dataType : "text",
						error : function(){
							alert("시스템 오류입니다.");
						},
						success : function(result){
							$("#r_writeForm").attr({
								"method" : "post",
								"action" : "/admin/room/roomUpdate.do"
							});
							$("#r_writeForm").submit();
							console.log("성공");
						}
					})
				}else{
					console.log("지울게 없어용");
					$("#r_writeForm").attr({
						"method" : "post",
						"action" : "/admin/room/roomUpdate.do"
					});
					$("#r_writeForm").submit(); 
				}
	       	 }
		});
		
		
		
		/*목록 버튼 클릭 시 처리 이벤트 */
        $("#roomListBtn").click(function(){
           location.href="/admin/room/roomList.do";   
           
        });
	});
</script>

<div class="page-root page-header">
	<span><a href="/admin/room/roomList.do">객실관리</a> &gt; <a
		href="/admin/room/roomDetail.do?r_no=${updateData.r_no }">객실 상세보기</a>
		&gt; <a href="#">객실수정</a></span>
</div>
<form id="f_image" name="f_image">
	<input type="hidden" id="r_no" name="r_no" value="${updateData.r_no }" />
</form>
<form id="r_writeForm" name="r_writeForm" enctype="multipart/form-data">
	<input type="hidden" id="r_no" name="r_no" value="${updateData.r_no }" />
	<input type="hidden" id="i_kind" name="i_kind" value="room"> <input
		type="hidden" id="i_no" name="i_no" value="${roomImageList[0].i_no }" />
	<div class="contentBtn">
		<input type="button" value="저장" class="but" id="roomInsertBtn">
		<input type="button" value="목록" class="but" id="roomListBtn">
	</div>
	<div class="panel panel-default">
		<!-- Default panel contents -->

		<table class="table table-striped" id="roomWrite">
			<colgroup>
				<col width="17%" />
				<col width="33%" />
				<col width="17%" />
				<col width="33%" />
			</colgroup>
			<tr>
				<td class="ac">객실명</td>
				<td><input type="text" id="r_name" name="r_name"
					value="${updateData.r_name }"></td>
				<td class="ac">객실 종류</td>
				<td><input type="text" id="r_kind" name="r_kind"
					value="${updateData.r_kind }"></td>
			</tr>
			<tr>
				<td class="ac">기준 인원</td>
				<td><input type="text" id="r_standard" name="r_standard"
					value="${updateData.r_standard }"><br />
				<span class="error"></span></td>
				<td class="ac">최대 인원</td>
				<td><input type="text" id="r_max" name="r_max"
					value="${updateData.r_max }"><br />
				<span class="error"></span></td>
			</tr>
			<tr>
				<td class="ac">객실 크기</td>
				<td><input type="text" id="r_size" name="r_size"
					value="${updateData.r_size }"></td>
				<td class="ac">편의사항</td>
				<td><textarea rows="3" cols="22" class="r_cvc" id="r_cvc"
						name="r_cvc">${updateData.r_cvc }</textarea></td>
			</tr>
			<tr>
				<td class="ac">객실 정보</td>
				<td colspan="3"><textarea rows="5" cols="93" class="r_info"
						id="r_info" name="r_info">${updateData.r_info }</textarea></td>
			</tr>
			<tr id="main">
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
							</div> --> <c:choose>
						<c:when test="${not empty roomImageList}">
							<c:forEach var="image" items="${roomImageList}"
								varStatus="status">

								<div class="roomDiv" data-image="${image.i_name}">

									<img class="rimagePreview"
										src="/uploadStorage/room/${image.i_name}" /> <br />
									<span></span><input type="button" class="imageDeleteBtn"
										value="삭제" />
								</div>
							</c:forEach>
						</c:when>
					</c:choose>
				</td>
			</tr>
		</table>

	</div>

<div class="page-root page-header">
	<span><a href="#">가격수정</a></span>
</div>
<div class="contentBtn">
	<input type="button" value="저장" class="but" id="p_updateBtn">
</div>
<div class="panel panel-default">
	<!-- Default panel contents -->
	
		<input type="hidden" id="r_no" name="r_no" value="${updateData.r_no }" />
		<table class="table table-bordered" id="priceWrite">
			<colgroup>
				<col width="40" />
				<col width="60%" />
			</colgroup>
			<tr>
				<td class="ac">비성수기 평일 가격</td>
				<td><input type="text" id="pr_weekday" name="pr_weekday" value="${updatePrice.pr_weekday }">원</td>
			</tr>
			<tr>
				<td class="ac">비성수기 주말 가격</td>
				<td><input type="text" id="pr_weekend" name="pr_weekend" value="${updatePrice.pr_weekend }">원</td>
			</tr>

		</table>
		<table class="table table-bordered" id="priceWrite">
			<colgroup>
				<col width="40" />
				<col width="60%" />
			</colgroup>
			<tr>
				<td class="ac">성수기 평일 가격</td>
				<td><input type="text" id="pr_sweekday" name="pr_sweekday" value="${updatePrice.pr_sweekday }">원</td>
			</tr>
			<tr>
				<td class="ac">성수기 주말 가격</td>
				<td><input type="text" id="pr_sweekend" name="pr_sweekend" value="${updatePrice.pr_sweekend }">원</td>
			</tr>

		</table>
	</div>
</form>