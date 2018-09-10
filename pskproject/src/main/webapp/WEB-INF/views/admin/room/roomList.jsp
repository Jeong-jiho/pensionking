<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<style type="text/css">
	#hh{width:320px; margin-left:10px;}
	#stermInsertBtn{margin-left:150px;}
	#sterm{font-size:100%; margin:10px 10px 30px 10px;}
</style>
<script>

	$(function(){
		$(".nav li span").html("14");
		
		$("#s_form").hide();
		/*디테일 클릭시 처리 이벤트 */
		$(".goDetail").click(function(){
			var r_no = $(this).parents("div").attr("data-num");
			$("#r_no").val(r_no);
			console.log(r_no);
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/admin/room/roomDetail.do"
			});
			$("#detailForm").submit();
		});
		var cnt=0;
		$("#sterm").click(function(){
			if(cnt==0){
				$("#s_form").show();
				cnt = 1;
			}else{
				$("#s_form").hide();
				cnt = 0;
			}
			
		});
		$("#stermInsertBtn").click(function(){
			$("#s_form").submit();
			$.ajax({
  				url : "/admin/sterm/stermInsert.do",      
  				type : "post",								
  				data : $("#s_form").serialize(),				        
  				dataType : "text",
  				error : function(){							
  					alert('시스템 오류 입니다. 관리자에게 문의 하세요.');
  				},											
  				success : function(resultData){
  					console.log(resultData)
  					if(resultData=="성공"){
  						alert("성수기 기간이 설정되었습니다.");
  					}else{
  						alert("오류");
      					return;
  					}
  				}
  			});
		});
	});

</script>

<ol class="breadcrumb">
	<li class="breadcrumb-item">
	<a href="#">Admin</a>
	</li>
	<li class="breadcrumb-item active">객실관리</li>
</ol>

<form id="detailForm" name="detailForm">
	<input type="hidden" id="r_no" name="r_no" />
</form>

<div class="container-fluid">

		<input type="button" value="성수기 기간 설정" id="sterm" class="btn">

			<form id="s_form" role="dialog">
				<div id="stermDiv">
					<table class="table table-responsive-sm table-striped" id="hh">
						<tr>
							<td>성수기 시작일 </td>
							<td><input type="date" id="st_start" name="st_start" value="${sterm.st_start }"></td>
						</tr>
						<tr>
							<td>성수기 시작일 </td>
							<td><input type="date" id="st_end" name="st_end" value="${sterm.st_end }"></td>
						</tr>
					</table>
					<input type="button" id="stermInsertBtn" value="저장">
				</div>
			</form>

		<c:choose>
			<c:when test="${not empty roomList}">
				<c:forEach var="room" items="${roomList}" varStatus="status">
				
					<div class="imagePreview" data-num="${room.r_no}">
						<h2>${room.r_name }</h2>
						<a  class="goDetail">
							<img class="rimagePreview" src="/uploadStorage/room/${room.r_main}"/>
						</a>
					</div>
				</c:forEach>
			</c:when>
		</c:choose>
		
		<div class="imagePreview">
			<h4><span style="visibility:hidden">ggg</span></h4>
			<div class="rimagePreview">
				<h3 class="title" ><a href="/admin/room/writeForm.do">추가</a></h3>
			</div>
		</div>

</div>       

