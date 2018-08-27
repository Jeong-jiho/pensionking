<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!--  <link rel="icon" href="/resources/include/favicon.ico"> -->

<title>Cover Template for Bootstrap</title>

<!-- Bootstrap core CSS -->
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/include/dist/css/cover.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/include/css/main.css" />

<style type="text/css">
</style>
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

<body class="home page-template-default page page-id-5">
	<!-- nav(네비게이션), 헤더 설정 -->
	<tiles:insertAttribute name="header" />
	<!-- header 끝 -->

	<section id="banner">
		<div class="full-featured">
			<img class="hidden-xs" id="banner-bg" src="/resources/image/main.jpg">
			<img class="visible-xs" id="m-banner-bg" src="/resources/image/main.jpg">
		</div>
	</section>

	<div class="isl-bg">
		<section id="content" style="margin-bottom: 40px;">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
						<h2 class="small-title">펜션왕 소개</h2>
						<p class="description">최고의 시설과 서비스를 제공하는 펜션왕</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
						<div class="column-content first"></div>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	<div class="row">
		<div class="col-xs-12 bottom-images">
			<a class="profile " data-0="@class:profile nosnap;"
				data-90p-top="@class:profile snap;"
				href="#">
				<img src="/resources/image/location1.png"	alt="Room Info">
				<span class="name">Room Info</span>
			</a> <a class="profile " data-0="@class:profile nosnap;"
				data-90p-top="@class:profile snap-delay;"
				href="#">
				<img src="/resources/image/location2.png"	alt="Gallery">
				<span class="name">Gallery</span>
			</a>
		</div>
	</div>
	
	<!-- 갤러리 박스 추가시 주석 해제 -->
	<!-- <div class="row">
		<div class="col-xs-12 bottom-images">
			<a class="profile " data-0="@class:profile nosnap;"
				data-90p-top="@class:profile snap;"
				href="https://weareisland.com/portfolio/wanuskewin-heritage-park/">
				<img src="/resources/image/location1.jpg"	alt="Wanuskewin Heritage Park"> 
				<span class="name">QnA</span>
			</a> <a class="profile " data-0="@class:profile nosnap;"
				data-90p-top="@class:profile snap-delay;"
				href="https://weareisland.com/portfolio/chief-whitecap-waterway/">
				<img src="/resources/image/location1.jpg"	alt="Chief Whitecap Waterway"> 
				<span class="name">Contact</span>
			</a>
		</div>
	</div> -->

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
	<script src="/resources/include/dist/assets/js/docs.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>