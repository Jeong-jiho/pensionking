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
<title>Insert title here</title>
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
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCz41EE9UBTGLAQ-_1mFLb7bHhVWaK-b34"></script>
<script type="text/javascript">
	function initialize() {
		var mapLocation = new google.maps.LatLng('37.812039', '127.524586'); // 지도에서 가운데로 위치할 위도와 경도
		var markLocation = new google.maps.LatLng('37.812039', '127.524586'); // 마커가 위치할 위도와 경도

		var mapOptions = {
			center : mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
			zoom : 18, // 지도 zoom단계
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("map-canvas"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
		mapOptions);

		var size_x = 60; // 마커로 사용할 이미지의 가로 크기
		var size_y = 60; // 마커로 사용할 이미지의 세로 크기

		// 마커로 사용할 이미지 주소
		var image = new google.maps.MarkerImage('/resources/image/marker.jpg',
				new google.maps.Size(size_x, size_y), '', '',
				new google.maps.Size(size_x, size_y));

		var marker;
		marker = new google.maps.Marker({
			position : markLocation, // 마커가 위치할 위도와 경도(변수)
			map : map,
			icon : image, // 마커로 사용할 이미지(변수)
			title : '펜션킹' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
		});

		var content = "펜션킹 위치입니다!"; // 말풍선 안에 들어갈 내용

		// 마커를 클릭했을 때의 이벤트.
		var infowindow = new google.maps.InfoWindow({
			content : content
		});

		google.maps.event.addListener(marker, "click", function() {
			infowindow.open(map, marker);
		});
	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>
<!-- 윗 부분까지 기본 템플릿으로 설정 -->
</head>

<body>
<div class="container">
	<div class="page-header">
			<h2 style="font-weight:bold">오시는길</h2>
		</div>  
	<div id="map-canvas" style="width: 100%; height: 500px;"></div>
	<div class="container" style="min-height: 40vh">
		<div class="row">
			<div class="col-sm">
				<h3>가평 펜션킹</h3>
				<p>
					가평에있는 펜션킹<br />연락처: 010-1234-8963
				</p>
				<div class="py-2"></div>
			</div>
			<div class="col-sm mb-5"></div>
		</div>
	</div>
</div>
</body>
</html>