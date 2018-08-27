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
<link rel="stylesheet" href="/resources/include/css/common.css" />
<link rel="stylesheet" href="/resources/include/css/board.css" />


<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>

<script type="text/javascript">
			
		</script>
<!-- 윗 부분까지 기본 템플릿으로 설정 -->
</head>
<body>
	<div>
		<div class="row">
			<div class="col-xs-12 bottom-images">
				<a class="profile " data-0="@class:profile nosnap;"
					data-90p-top="@class:profile snap;" href="#"> <img
					src="/resources/image/location1.png" alt="Room Info"> <span
					class="name">Room Info</span>
				</a> <a class="profile " data-0="@class:profile nosnap;"
					data-90p-top="@class:profile snap-delay;" href="#"> <img
					src="/resources/image/location2.png" alt="Gallery"> <span
					class="name">Gallery</span>
				</a>
			</div>
		</div>
	</div>
</body>
</html>