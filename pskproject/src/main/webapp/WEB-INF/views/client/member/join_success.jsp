<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>회원가입 완료 화면</title>
			<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
			<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정. -->
			
			<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
			<!-- viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정. initial-scale은 초기비율 -->
			<meta http-equiv="refresh" content="5; url=/member/login.do">
			<!-- 8초 후에 /member/login.do 페이지(로그인 페이지)로 자동으로 넘어가도록 설정 -->
			
			<!-- 모바일 웹 페이지 설정 -->
			<link rel="shortcut icon" href="/resources/images/icon.png" />
			<link rel="apple-touch-icon" href="/resources/images/icon.png" />
			<!-- 모바일 웹 페이지 설정 끝 -->
			
			<!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
			<!-- [if lt IE 9]>
				<script src="/resources/include/js/html5shiv.js"></script>
			<![endif] -->
		</head>
		<body>
		<div class="container">
			<div class="page-header">
				<h2 style="font-weight:bold">회원가입 완료</h2>	
			 
			</div>
			<div class="contentContainer">
				<div class="well">
					<div class="tac">
						펜션왕 회원 가입을 해주셔서 감사합니다.<br />
						<span id="text">(5초 후에 자동으로 로그인 화면으로 이동합니다.)</span>
					</div>
				</div>
			</div>
			</div>
		</body>
		
	</html>