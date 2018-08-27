<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true"%>
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
		<!-- header 설정 -->
		<tiles:insertAttribute name="header" />
		
		<!-- Begin page content -->
	<div class="container">
		<div class="page-header">
			<h1>
				<!-- content  제목 영역 -->
				<tiles:getAsString name="title" />
			</h1>
		</div>
		<!-- content 내용 영역 -->
		<tiles:insertAttribute name="body" />
	</div>

	<footer class="footer">
		<!-- footer 설정 -->
		<tiles:insertAttribute name="footer" />
	</footer>
	</body>
=======
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %> <!-- 소스보기시 빈줄 제거  -->
 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="/resources/image/icon.png">

<title>Sticky Footer Navbar Template for Bootstrap</title>

<!-- Bootstrap core CSS -->
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/include/css/sticky-footer-navbar.css"
	rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<tiles:insertAttribute name="header"/>
	</nav>	


	<div class="container">
		<div class="page-header">
			<h1>
				<tiles:insertAttribute name="title"/>
			</h1>
		</div>
		<tiles:insertAttribute name="body"/>
	</div>


	<footer class="footer">
		<tiles:insertAttribute name="footer"/>
	</footer>

	
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
>>>>>>> branch 'master' of https://github.com/Jeong-jiho/pensionking.git
</html>