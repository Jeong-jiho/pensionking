<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<script type="text/javascript">
	$(function(){
		$("#ru").hide();
		$("#pu").hide();
		
		$("#main td div:eq(0) span").html("메인 이미지").css("color","red");
		$("#ru #main td div:eq(0) span").html("메인 이미지").css("color","red");
		$("#ru #main td div:eq(0) .imageDeleteBtn").click(function(){
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
				
			$(this).parents(".image").remove();
		});
		$("#imageInsertBtn").click(function(){
			
			var br = $("<br/>");
			
			var div = $("<div>");
			div.addClass("image");
			
			var uploadFile = $("<input type='file' id='file' name='file'>");
			uploadFile.addClass("uploadFile");
			
			var imageDelete = $("<input type='button' value='삭제'/>");
			imageDelete.addClass("imageDeleteBtn");
			
			div.append(uploadFile).append(imageDelete).append(br);
			
        	$(this).parents("td").parents("tr").find("td:eq(1)").append(div);
        	
        	
		});
		
		
		/* 삭제버튼 클릭 시 처리 이벤트 */
		$("#roomDeleteBtn").click(function(){
			$.ajax({
  				url : "/admin/room/roomDelete.do",      
  				type : "post",								
  				data : $("#r_data").serialize(),				        
  				dataType : "text",
  				error : function(){							
  					alert('시스템 오류 입니다. 관리자에게 문의 하세요.');
  				},											
  				success : function(resultData){
  					console.log(resultData)
  					if(resultData=="성공"){
  						alert("객실이 삭제 되었습니다.");
  						location.href="/admin/room/roomList.do";
  					}else{
  						alert("오류");
      					return;
  					}
  				}
  			});
		});
		/* 수정버튼 클릭시 처리 이벤트 */
		$("#roomUpdateBtn").click(function(){
			$("#rd").hide();
			$("#ru").show();
			
		});
		$("#priceUpdateBtn").click(function(){
			$("#rd").hide();
			$("#pu").show();
		});
		$("#r_updateBtn").click(function(){
			var cnt=0;
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
	       	 else if($("#ru #main").find("td:eq(1) div").find(".uploadFile1").val() == ""){
	       		if(!chkData(".uploadFile1","메인 이미지 파일을")) return;
	       	 }
	       	 
	       	 else{
	       		if($('.uploadFile').val() != ""){
       			 $('.uploadFile').each(function(){
       				 if(!chkFile($(this))){
       					 $(this).focus();
       					 cnt = 1;
       					 return;
       					 
       				 }
       			 });
       		 	}if(cnt == 0){

					if($("#f_image").find("input:eq(1)").val() != null){
						$.ajax({
							url : "/Image/imageDelete.do",
							type : "post",
							data : $("#f_image").serialize(),
							dataType : "text",
							error : function(){
								alert("시스템 오류입니다.");
							},
							success : function(result){
								$("#r_updateForm").attr({
									"method" : "post",
									"action" : "/admin/room/roomUpdate.do"
								});
								$("#r_updateForm").submit();
							}
						})
					}else{
						$("#r_updateForm").attr({
							"method" : "post",
							"action" : "/admin/room/roomUpdate.do"
						});
						$("#r_updateForm").submit(); 
					}
		       	 }
   		 		
    		 }
		});
		$(document).on("click",".imageDeleteBtn",function(){ 
			$(this).parent().remove();
			$(this).remove();
		}); 
		$("#p_updateBtn").click(function(){
			$("#p_updateForm").attr({
				"method" : "post",
				"action" : "/price/priceUpdate.do"
			});
			$("#p_updateForm").submit(); 
		});
		/*목록 버튼 클릭 시 처리 이벤트 */
        $(".roomListBtn").click(function(){
           location.href="/admin/room/roomList.do";   
           
        });
        
        
	});
</script>
<div id="rd">
<ol class="breadcrumb">
	<li class="breadcrumb-item">
	<a href="#">Admin</a>
	</li>
	<li class="breadcrumb-item active">객실관리</li>
	<li class="breadcrumb-item active">객실상세보기</li>
</ol>

<div class="container-fluid">
	<div class="contentBtn">
		<input type="button" value="수정" class="btn" id="roomUpdateBtn">
		<input type="button" value="삭제" class="btn" id="roomDeleteBtn">
		<input type="button" value="목록" class="roomListBtn btn">
	</div>
	<form id="r_data" name="r_data">
		<input type="hidden" id="r_no" name="r_no" value="${detail.r_no}" />
	</form>
	<!-- Default panel contents -->
	<input type="hidden" id="i_kind" name="i_kind" value="room">
	<div class="card">
		<div class="card-header"> 
		
			객실정보
		</div>
		<div class="card-body">
		<table class="table table-responsive-sm table-bordered display" id="roomWrite">
			<colgroup>
				<col width="17%" />
				<col width="33%" />
				<col width="17%" />
				<col width="33%" />
			</colgroup>
			<tbody>
			<tr>
				<td class="ac">객실명</td>
				<td>${detail.r_name}</td>
				<td class="ac">객실 종류</td>
				<td>${detail.r_kind}</td>
			</tr>
			<tr>
				<td class="ac">기준 인원</td>
				<td>${detail.r_standard}</td>
				<td class="ac">최대 인원</td>
				<td>${detail.r_max}</td>
			</tr>
			<tr>
				<td class="ac">객실 크기</td>
				<td>${detail.r_size}</td>
				<td class="ac">등록일</td>
				<td>${detail.r_date}</td>
			</tr>
			<tr>
				<td class="ac">객실 정보</td>
				<td>${detail.r_info}</td>
				<td class="ac">편의사항</td>
				<td>${detail.r_cvc}</td>
			</tr>
			<tr id="main">
				<td class="ac">이 미 지</td>
				<td colspan="3"><c:choose>
						<c:when test="${not empty roomImageList}">
							<c:forEach var="image" items="${roomImageList}" varStatus="status">
								<div class="roomDiv" data-num="${image.r_no}">
									<img class="rimagePreview"
										src="/uploadStorage/room/${image.i_name}" /> <span></span>
								</div>
							</c:forEach>
						</c:when>
					</c:choose> <!-- <div class="hh">
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
								</div> --></td>
			</tr>
			</tbody>
		</table>
		</div>
	</div>
</div>


<div class="container-fluid">
	<div class="contentBtn">
		<input type="button" value="수정" class="btn" id="priceUpdateBtn">
	</div>
	<!-- Default panel contents -->
	<form id="p_writeForm" name="p_writeForm" enctype="multipart/form-data">
		<div class="card">
			<div class="card-header"> 
				가격정보
			</div>
		<div class="card-body">
		<table class="table table-responsive-sm table-bordered" id="priceWrite">
			<colgroup>
				<col width="40" />
				<col width="60%" />
			</colgroup>
			<tr>
				<td class="ac">비성수기 평일 가격</td>
				<td>${price.pr_weekday }원</td>
			</tr>
			<tr>
				<td class="ac">비성수기 주말 가격</td>
				<td>${price.pr_weekend }원</td>
			</tr>

		</table>
		<table class="table table-bordered" id="priceWrite">
			<colgroup>
				<col width="40" />
				<col width="60%" />
			</colgroup>
			<tr>
				<td class="ac">성수기 평일 가격</td>
				<td>${price.pr_sweekday }원</td>
			</tr>
			<tr>
				<td class="ac">성수기 주말 가격</td>
				<td>${price.pr_sweekend }원</td>
			</tr>

		</table>
	</div>
	</div>
	</form>
</div>
</div>
<jsp:include page="roomUpdateForm.jsp"/>
<jsp:include page="priceUpdateForm.jsp"/>
