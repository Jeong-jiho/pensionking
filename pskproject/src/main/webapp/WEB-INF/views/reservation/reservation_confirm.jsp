<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 정보 확인</title>
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

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/js/pensioncommon.js"></script>
<script type="text/javascript">
	
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

		<section class="content">
			<div class="row">
				<div class="col-md-6">
					<div class="box box-solid box-primary">
						<div class="box-header">
							<h3 class="box-title">
								<small class="badge bg-red">예약정보확인</small>
							</h3>
						</div>
						<div class="box-body"></div>
						<div class="box-body">
							<div class="alert alert-info">
								<i class="fa fa-check"></i>
								<h4></h4>
								<p>
									객실요금 : <strong> </strong><br>
									이용기간 : <strong></strong><br> 
									인원수 : <strong></strong><br>
									이용요금 : <strong></strong>
								</p>
							</div>
						</div>
						<div class="box-body">
							<div class="alert alert-warning">
								<i class="fa fa-check"></i>
								<h4>부대시설이용</h4>
								<p>
									<strong></strong>
								</p>
							</div>
						</div>
						<div class="box-body">
							<div class="alert alert-danger">
								<i class="fa fa-check"></i>
								<h4>이용요금</h4>
								전체이용요금합계 : <strong></strong>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<div class="row">
			<div class="col-md-6">
				<div class="box box-solid box-primary">
					<div class="box-header">
						<h3 class="box-title">
							<small class="badge bg-red">예약내용동의</small> 
						</h3>
					</div>
					<div class="box-body"></div>
					<div class="box-body">
						<div class="alert alert-success">
							<i class="fa fa-check"></i>
							<h4>이용요금규정</h4>
							<ul>
								<li>모든 금액은 기준인원에 측정되어 있습니다.</li>
								<li>기준 인원에서 인원 추가시 1인당 10,000원이 추가됩니다.</li>
								<li>공휴일 전날은 주말요금이 적용됩니다.</li>
								<li>예약인원에서 인원이 추가되었을 경우 미리 말씀하셔야 합니다.</li>
								<li>최대인원초과시는 입실에 제한을 받으실 수 있습니다.</li>
							</ul>
						</div>
					</div>
					<div class="box-body">
						<div class="alert alert-success">
							<i class="fa fa-check"></i>
							<h4>취소/환불규정</h4>
							<ul>
								<li>예약후 날짜변경, 객실변경은 예약취소후 다시 예약하셔야 합니다.</li>
								<li>객실과 날짜는 예약전 신중히 생각하시고 결정해 주시기 바랍니다.</li>
								<li>환불은 입금자명으로 되며 입금시 송금수수료는 제외한 후 입금됩니다.</li>
							</ul>
						</div>
					</div>
					<div class="box-body">
						<div class="alert alert-success">
							<i class="fa fa-check"></i>
							<h4>환불 수수료율</h4>
							<table class="table text-center table-bordered">
								<tbody>
									<tr>
										<th>이용일기준</th>
										<th>환불금액율</th>
									</tr>
									<tr>
										<td class="content1_td">+ 이용일 당일</td>
										<td class="content2_td">전액환불불가</td>
									</tr>
									<tr>
										<td class="content1_td">+ 이용 1일전</td>
										<td class="content2_td">전액환불불가</td>
									</tr>
									<tr>
										<td class="content1_td">+ 이용 2일전</td>
										<td class="content2_td">40% 환불</td>
									</tr>
									<tr>
										<td class="content1_td">+ 이용 3일전</td>
										<td class="content2_td">50% 환불</td>
									</tr>
									<tr>
										<td class="content1_td">+ 이용 4일전</td>
										<td class="content2_td">60% 환불</td>
									</tr>
									<tr>
										<td class="content1_td">+ 이용 5일전</td>
										<td class="content2_td">70% 환불</td>
									</tr>
									<tr>
										<td class="content1_td">+ 이용 6일전</td>
										<td class="content2_td">80% 환불</td>
									</tr>
									<tr>
										<td class="content1_td border_Bno">+ 이용 7일 ~ 예약일</td>
										<td class="content2_td border_Bno">90% 환불</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="box-footer">
						<br> <br> <a class="btn btn-primary btn-block btn-lg" id="confirmBtn">예약확인</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>