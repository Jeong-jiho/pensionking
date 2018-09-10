<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<script type="text/javascript">
	$(function(){
		/* $("#priceInsertBtn").click(function(){
			$("#p_writeForm").attr({
				"method" : "post",
				"action" : "admin/price/priceInsert.do"
			});
			$("#p_writeForm").submit();
		}); */

	});
</script>

<div class="page-root page-header">
	<span><a href="#">가격설정</a></span>
</div>

<!-- <div class="contentBtn">
	<input type="button" value="저장" class="but" id="priceInsertBtn">
</div> -->
<div class="panel panel-default">
	<!-- Default panel contents -->
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
</div>
