<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펜션킹 객실예약</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<!-- 브라우저의 호환성 보기 모드를 막고,
		해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML을 보여주도록 설정한다. -->

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<!-- viewport : 화면에 보이는 영역을 제어하는 기술, width는 device-width로 설정.initial-scale은 초기비율 -->

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->

<!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
<!-- [if lt IE 9]>
		script src="../js/html15shiv.js></script> -->
<!-- [endif] -->
<link rel="stylesheet" href="/resources/include/css/common.css" />
<link rel="stylesheet" href="/resources/include/css/jquery-ui.css" />
<link rel="stylesheet" href="/resources/include/css/style.css" />

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/jquery-ui.js"></script>
<script type="text/javascript"
	src="/resources/include/js/pensioncommon.js"></script>


<script type="text/javascript">
	$(function() {
		//datepicker 한국어로 사용하기 위한 언어설정
		$.datepicker.setDefaults({
			dateFormat : "yy년-mm월-dd일", // 날짜의 형식
			prevText : '이전 달',
			nextText : '다음 달',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			showMonthAfterYear : true,
			yearSuffix : '년',
			changeYear : true,
			numberOfMonths : 2,
			showButtonPanel : true
		});

		//시작일.
		$('#fromDate').datepicker({
			showOn : "both", // 달력을 표시할 타이밍 (both: focus or button)
			buttonImage : "/resources/image/small-calendar.png", // 버튼 이미지
			buttonImageOnly : true, // 버튼 이미지만 표시할지 여부
			buttonText : "날짜선택", // 버튼의 대체 텍스트	        	                    
			changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
			minDate : 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
			onClose : function(selectedDate) {
				// 시작일(fromDate) datepicker가 닫힐때
				// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
				$("#toDate").datepicker("option", "minDate", selectedDate);
			}
		});

		//종료일
		$('#toDate').datepicker({
			showOn : "both",
			buttonImage : "/resources/image/small-calendar.png",
			buttonImageOnly : true,
			buttonText : "날짜선택",
			dateFormat : "yy년-mm월-dd일",
			changeMonth : true,
			//minDate: 0, // 오늘 이전 날짜 선택 불가
			onClose : function(selectedDate) {
				// 종료일(endDate) datepicker가 닫힐때
				// 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
				$("#fromDate").datepicker("option", "maxDate", selectedDate);
			}
		});

		/*예약하기 버튼 클릭 시 처리 이벤트*/
		$("#resBtn").click(function() {
			if (confirm('선택한 날짜로 예약 하시겠습니까?')) {
				location.href = "/reservation/reservation_confirm.do";
			}
		});
	});
</script>

<!-- 윗 부분까지 기본 템플릿으로 설정 -->
</head>
<body>
	<div class="container">
		<div class="col-lg-3 col-md-3">
			<div class="archive-widget">
				<h4>온라인 객실예약</h4>
				<ul class="archives">
					<li class="select"><a href="#">객실예약</a></li>
					<li><a href="#">예약조회/취소</a></li>
				</ul>
			</div>
		</div>
		<div class="col-lg-9 col-md-9">
			<div class="headline text-center">
				<h2 class="section-title">펜션왕 객실 예약</h2>
			</div>
			<p class="Gtxt">이용을 원하시는 날짜를 선택해주세요.</p>
			<form>
				<div class="showback">
					<div class="row">
						<div class="col-xs-12 col-sm-6">
							<div id="Calendar"></div>
							<label for="fromDate" class="col-sm-4 control-label">Check
								In</label>
							<div class="col-sm-8">
								<input class="dateInput" type="text" id="fromDate"
									name="fromDate" maxlength="10" value="" />&nbsp;&nbsp;
							</div>
							<label for="toDate" class="col-sm-4 control-label">Check
								Out</label>
							<div class="col-sm-8">
								<input type="text" id="toDate" name="toDate" maxlength="10"
									value="" />
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>

		<div class="box box-solid box-primary">
			<div class="box-header">
				<h3 class="box-title">
					<small class="badge bg-red">예약가능 객실</small>
				</h3>
				<div class="box-body"></div>
				<div class="box-body">
					<div class="box-body table-responsive no-padding">
						<table class="table table-hover text-center">
							<tbody>
								<tr>
									<th><i class="fa fa-fw fa-check-square-o"></i></th>
									<th>객실명</th>
									<th>기준인원</th>
									<th>최대인원</th>
									<th>인원선택</th>
									<th>객실크기</th>
									<th>비수기 평일</th>
									<th>비수기 주말</th>
									<th>성수기 평일</th>
									<th>성수기 주말</th>
									<th>예약 상태</th>
								</tr>
								<tr>
									<td><input type="checkbox" name="room_uid[]" value="1"></td>
									<td>디럭스룸1</td>
									<td>10명</td>
									<td>15명</td>
									<td><select name="person_num_1">
											<option value='10'>10</option>
											<option value='11'>11</option>
											<option value='12'>12</option>
											<option value='13'>13</option>
											<option value='14'>14</option>
											<option value='15'>15</option>
									</select></td>
									<td>50평</td>
									<td id="0_price1">300,000원</td>
									<td id="0_price3">350,000원</td>
									<td id="0_price2">400,000원</td>
									<td id="0_price3">450,000원</td>
									<td style="color:;">예약가능</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="room_uid[]" value="2"></td>
									<td>디럭스룸2</td>
									<td>10명</td>
									<td>15명</td>
									<td><select name="person_num_2">
											<option value='10'>10</option>
											<option value='11'>11</option>
											<option value='12'>12</option>
											<option value='13'>13</option>
											<option value='14'>14</option>
											<option value='15'>15</option>
									</select></td>
									<td>50평</td>
									<td id="1_price1">300,000원</td>
									<td id="1_price3">350,000원</td>
									<td id="1_price2">400,000원</td>
									<td id="1_price3">450,000원</td>
									<td style="color:;">예약가능</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="room_uid[]" value="3"></td>
									<td>패밀리룸1</td>
									<td>8명</td>
									<td>10명</td>
									<td><select name="person_num_3">
											<option value='8'>8</option>
											<option value='9'>9</option>
											<option value='10'>10</option>
									</select></td>
									<td>30평</td>
									<td id="2_price1">150,000원</td>
									<td id="2_price3">200,000원</td>
									<td id="2_price2">250,000원</td>
									<td id="2_price3">300,000원</td>
									<td style="color:;">예약가능</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="room_uid[]" value="4"></td>
									<td>패밀리룸2</td>
									<td>8명</td>
									<td>10명</td>
									<td><select name="person_num_4">
											<option value='8'>8</option>
											<option value='9'>9</option>
											<option value='10'>10</option>
									</select></td>
									<td>30평</td>
									<td id="3_price1">150,000원</td>
									<td id="3_price3">200,000원</td>
									<td id="3_price2">250,000원</td>
									<td id="3_price3">300,000원</td>
									<td style="color:;">예약가능</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="box-footer">
				<br> <br> <a class="btn btn-primary btn-block btn-lg"
					id="resBtn">예약하기</a>
			</div>
		</div>
	</div>
</body>
</html>