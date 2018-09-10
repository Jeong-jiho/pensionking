<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<script type="text/javascript">
	$(function(){
		
	});
</script>
<div id="ru">

<ol class="breadcrumb">
	<li class="breadcrumb-item">
	<a href="#">Admin</a>
	</li>
	<li class="breadcrumb-item active">객실관리</li>
	<li class="breadcrumb-item active">객실상세보기</li>
	<li class="breadcrumb-item active">객실수정</li>
</ol>
<form id="f_image" name="f_image">
	<input type="hidden" id="r_no" name="r_no" value="${detail.r_no }" />
</form>

	<input type="hidden" id="r_no" name="r_no" value="${detail.r_no }" />
	<input type="hidden" id="i_kind" name="i_kind" value="room"> <input
		type="hidden" id="i_no" name="i_no" value="${roomImageList[0].i_no }" />
	
	<div class="container-fluid">
	<div class="contentBtn">
		<input type="button" value="저장" class="but" id="r_updateBtn">
		<input type="button" value="목록" class="roomListBtn">
	</div>
		<!-- Default panel contents -->
	<form id="r_updateForm" name="r_updateForm" enctype="multipart/form-data">
		<input type="hidden" id="r_no" name="r_no" value="${detail.r_no }" />
		<input type="hidden" id="i_kind" name="i_kind" value="room"> 
		<input type="hidden" id="i_no" name="i_no" value="${roomImageList[0].i_no }" />
		<div class="card">
			<div class="card-header"> 
				객실수정
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
				<td><input type="text" id="r_name" name="r_name"
					value="${detail.r_name }"></td>
				<td class="ac">객실 종류</td>
				<td><input type="text" id="r_kind" name="r_kind"
					value="${detail.r_kind }"></td>
			</tr>
			<tr>
				<td class="ac">기준 인원</td>
				<td><input type="text" id="r_standard" name="r_standard"
					value="${detail.r_standard }"><br />
				<span class="error"></span></td>
				<td class="ac">최대 인원</td>
				<td><input type="text" id="r_max" name="r_max"
					value="${detail.r_max }"><br />
				<span class="error"></span></td>
			</tr>
			<tr>
				<td class="ac">객실 크기</td>
				<td><input type="text" id="r_size" name="r_size"
					value="${detail.r_size }"></td>
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
				<td colspan="3"><textarea rows="5" cols="93" class="r_info"
						id="r_info" name="r_info">${detail.r_info }</textarea></td>
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
	</div>
		</form>
	</div>

<div class="container-fluid">
	<!-- Default panel contents -->
	
		<input type="hidden" id="r_no" name="r_no" value="${detail.r_no }" />
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
	</div>

</div>