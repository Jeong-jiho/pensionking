<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<div class="page-root page-header">
	<span><a href="/admin/room/roomList.do">객실관리</a> &gt; <a href="/admin/room/writeForm.do">객실추가</a>
	&gt; <a href="#">가격설정</a></span>
</div>

<div class="contentBtn">
	<input type="button" value="저장" class="but" id="priceInsertBtn">
	<input type="button" value="목록" class="but" id="roomListBtn">
</div>
<div class="panel panel-default">
	<!-- Default panel contents -->
	<form id="p_writeForm" name="p_writeForm" enctype="multipart/form-data">
		<input type="hidden" id="r_no" name="r_no" value="">
		<table class="table table-bordered" id="priceWrite">
			<colgroup>
				<col width="40" />
				<col width="60%" />
			</colgroup>
			<tr>
				<td class="ac">비성수기 평일 가격</td>
				<td><input type="text" id="pr_weekday" name="pr_weekday"></td>
			</tr>
			<tr>
				<td class="ac">비성수기 주말 가격</td>
				<td><input type="text" id="pr_weekend" name="pr_weekend"></td>
			</tr>

		</table>
		<table class="table table-bordered" id="priceWrite">
			<colgroup>
				<col width="40" />
				<col width="60%" />
			</colgroup>
			<tr>
				<td class="ac">성수기 평일 가격</td>
				<td><input type="text" id="pr_sweekday" name="pr_sweekday"></td>
			</tr>
			<tr>
				<td class="ac">성수기 주말 가격</td>
				<td><input type="text" id="pr_sweekend" name="pr_sweekend"></td>
			</tr>

		</table>
		<div class="contentBtn1">
			<input type="button" value="이전" class="but" id="roomprevBtn">
		</div>
	</form>
</div>
