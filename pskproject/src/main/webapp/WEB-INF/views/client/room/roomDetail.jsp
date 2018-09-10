<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<style type="text/css">
.glide__slide img {
	width: 1080px;
}
.roomDetail-bottom {
margin-bottom: 20px;	
}
</style>

<link href="/resources/include/dist/roomcss/global.css" rel="stylesheet">

<link href="/resources/include/dist/roomcss/custom.css" rel="stylesheet">

<!-- <link href="/resources/include/dist/roomcss/font-awesome.min.css"
	rel="stylesheet"> -->

<!-- <link
	href="/resources/include/dist/roomcss/line-awesome-font-awesome.min.css"
	rel="stylesheet"> -->
<!-- JS -->
<script src=" /resources/include/dist/roominfo/jquery-3.3.1.min.js"></script>

<script src=" /resources/include/dist/roominfo/tport.js"></script>
<script src=" /resources/include/dist/roominfo/glide.js"></script>

<!-- <script src=" /resources/include/dist/roominfo/bootstrap.min.js"></script> -->
<!-- 윗 부분까지 기본 템플릿으로 설정 -->
</head>
<body>
	<a id="scrollTop"><img
		src="/resources/include/dist/roomcss/scroll-top.svg" /></a>
	<div>
		<div class="container py-4" style="margin-top: 3.5rem;">
			<h1>${detail.r_name }</h1>
			<div class="lead">${detail.r_kind }</div>
		</div>
		<div class="container mb-5">
			<div class="view-header">
				<div id="RoomtypeSlider">
					<div class="glide">
						<div class="glide__track" data-glide-el="track"
							data-num="${room.r_no }">
							<ul class="glide__slides">
								<c:choose>
									<c:when test="${not empty roomImageList }">
										<c:forEach var="room" items="${roomImageList }"
											varStatus="status">
											<li class="glide__slide"><img class="rimagePreview"
												src="/uploadStorage/room/${room.i_name}" /></li>
										</c:forEach>
									</c:when>
								</c:choose>
							</ul>
						</div>
						<!-- <div class="glide__arrows" data-glide-el="controls">
							<button class="glide__arrow glide__arrow--left">
								<img src="/resources/include/dist/roomcss/arrow-left.png">
							</button>
							<button class="glide__arrow glide__arrow--right">
								<img src="/resources/include/dist/roomcss/arrow-right.png">
							</button>
						</div> -->
						<div class="glide__bullets" data-glide-el="controls[nav]">
							<button class="glide__bullet" data-glide-dir="=1"></button>
							<button class="glide__bullet" data-glide-dir="=2"></button>
							<button class="glide__bullet" data-glide-dir="=3"></button>
							<button class="glide__bullet" data-glide-dir="=4"></button>
							<button class="glide__bullet" data-glide-dir="=5"></button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<h4>인원 및 추가요금</h4>
			<p class="pb-4">${detail.r_standard }명 | ${detail.r_max }명<br />- 기준 인원 초과 시 추가요금이 발생합니다.
			</p>
			<div class="table-responsive">
				<table class="table border text-center mb-5" id="room-price-table">
					<thead class="bg-light">
						<tr>
							<th colspan="4">객실 기본요금</th>
							<th class="border-left" colspan="3">추가인원 요금</th>
						</tr>
						<tr>
							<th class="border-right" style="width: 12%; min-width: 5rem">시즌</th>
							<th style="width: 12%">주중</th>
							<th style="width: 12%">금요일</th>
							<th style="width: 12%">토요일(공휴일전날)</th>
							<th class="border-left" style="width: 8%">성인</th>
							<th style="width: 8%">BBQ</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="border-right">비수기</td>
							<td>${price.pr_weekday }원</td>
							<td>${price.pr_weekend }원</td>
							<td>${price.pr_weekend }원</td>
							<td class="border-left">10,000원</td>
							<td>10,000원</td>
						</tr>
						<tr>
							<td class="border-right">성수기</td>
							<td>${price.pr_sweekday }원</td>
							<td>${price.pr_sweekend }원</td>
							<td>${price.pr_sweekend }원</td>
							<td class="border-left">10,000원</td>
							<td>10,000원</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="roomDetail-bottom">
				<h4>객실 내 시설</h4>
				<p class="pb-4">${detail.r_cvc }</p>
				<a class="btn btn-primary px-4 mr-3" href="/reservation/resCalendar.do">실시간 예약</a>
				<a class="btn btn-light px-4" href="/room/roomInfo.do">
				<i  class="fa fa-arrow-left mr-2"></i>다른객실 보기</a>
			</div>
		</div>
		<div class="py-5"></div>
	</div>
	<script async="async"
		src="https://www.googletagmanager.com/gtag/js?id=UA-54479942-9"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());
		gtag('config', 'UA-54479942-9');
	</script>
</body>
</html>