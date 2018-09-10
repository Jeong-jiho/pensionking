<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<div id="pu">
	<ol class="breadcrumb">
		<li class="breadcrumb-item">
		<a href="#">Admin</a>
		</li>
		<li class="breadcrumb-item active">객실관리</li>
		<li class="breadcrumb-item active">객실상세보기</li>
		<li class="breadcrumb-item active">가격수정</li>
	</ol>
	<div class="container-fluid">
		<!-- Default panel contents -->
		<div class="contentBtn">
			<input type="button" value="목록" class="roomListBtn">
		</div>
		<div class="card">
			<div class="card-header"> 
				객실정보
			</div>
		<div class="card-body">
		<table class="table table-striped" id="roomWrite">
			<colgroup>
				<col width="17%" />
				<col width="33%" />
				<col width="17%" />
				<col width="33%" />
			</colgroup>
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
		</table>
		</div>
		</div>
	</div>

<div class="container-fluid">
	<!-- Default panel contents -->
	<form id="p_updateForm" name="p_updateForm">
		<input type="hidden" id="r_no" name="r_no" value="${detail.r_no }" />
		<div class="contentBtn">
			<input type="button" value="저장" class="but" id="p_updateBtn">
		</div>
		<div class="card">
			<div class="card-header"> 
				가격수정
			</div>
		<div class="card-body">
		<table class="table table-bordered" id="priceWrite">
			<colgroup>
				<col width="40" />
				<col width="60%" />
			</colgroup>
			<tr>
				<td class="ac">비성수기 평일 가격</td>
				<td><input type="text" id="pr_weekday" name="pr_weekday" value="${price.pr_weekday }">원</td>
			</tr>
			<tr>
				<td class="ac">비성수기 주말 가격</td>
				<td><input type="text" id="pr_weekend" name="pr_weekend" value="${price.pr_weekend }">원</td>
			</tr>

		</table>
		<table class="table table-bordered" id="priceWrite">
			<colgroup>
				<col width="40" />
				<col width="60%" />
			</colgroup>
			<tr>
				<td class="ac">성수기 평일 가격</td>
				<td><input type="text" id="pr_sweekday" name="pr_sweekday" value="${price.pr_sweekday }">원</td>
			</tr>
			<tr>
				<td class="ac">성수기 주말 가격</td>
				<td><input type="text" id="pr_sweekend" name="pr_sweekend" value="${price.pr_sweekend }">원</td>
			</tr>

		</table>
		</div>
		</div>
		</form>
	</div>

</div>