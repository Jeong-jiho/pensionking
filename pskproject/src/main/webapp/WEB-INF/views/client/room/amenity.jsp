<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>

<!-- 윗 부분까지 기본 템플릿으로 설정 -->
</head>
<body>
<a id="scrollTop"><img
		src="/resources/include/dist/roomcss/scroll-top.svg" /></a>
	<div class="container">
		<div class="page-header">
			<h2 style="font-weight:bold">최고의 편의시설</h2>
		</div>  

		<p>
		<h3>BBQ</h3>
		<div class="row">
			<div class="col-sm-8" style="padding-right: 0">
				<!-- Carousel -->
				<div id="myCarousel32" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel32" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel32" data-slide-to="1" class=""></li>
						<li data-target="#myCarousel32" data-slide-to="2" class=""></li>
					</ol>

					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img class="" src="/resources/include/dist/room/bbq1.jpg"
								alt="slide">
						</div>
						<div class="item">
							<img class="" src="/resources/include/dist/room/bbq2.jpg"
								alt="slide">
						</div>
						<div class="item">
							<img class="" src="/resources/include/dist/room/bbq3.jpg"
								alt="slide">
						</div>
					</div>
					<a class="left carousel-control" href="#myCarousel31" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel32"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
					<div class="col-sm-4" style="padding-left: 0">
						<ul>
							<li>오붓한 바베큐 파티를 하실 수 있습니다.</li>
						</ul>
					</div>
				</div>
				<!-- /.carousel -->
			</div>

		</div>

		<br>

		<h3>POOL</h3>
		<div class="row">
			<div class="col-sm-8" style="padding-right: 0">
				<!-- Carousel -->
				<div id="myCarousel31" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel31" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel31" data-slide-to="1" class=""></li>
						<li data-target="#myCarousel31" data-slide-to="2" class=""></li>
					</ol>

					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img class="" src="/resources/include/dist/room/pool1.jpeg"
								alt="slide">
						</div>
						<div class="item">
							<img class="" src="/resources/include/dist/room/pool2.jpeg"
								alt="slide">
						</div>
						<div class="item">
							<img class="" src="/resources/include/dist/room/pool3.jpeg"
								alt="slide">
						</div>
					</div>
					<a class="left carousel-control" href="#myCarousel31" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel31"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
					<div class="col-sm-4" style="padding-left: 0">
						<ul>
							<li>아름다운 전망과 함께하는 수영장</li>
							<li>수영장이용시 수영복, 래쉬가드를 꼭 착용해주시기 바랍니다.</li>
						</ul>
					</div>
				</div>
				<!-- /.carousel -->
			</div>
		</div>
	</div>

</body>
</html>