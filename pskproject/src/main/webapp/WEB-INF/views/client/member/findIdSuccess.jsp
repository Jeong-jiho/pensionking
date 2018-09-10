<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>아이디 찾기 성공</title>
			<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
			<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정. -->
			
			<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
			<!-- viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정. initial-scale은 초기비율 -->
			<meta http-equiv="refresh" content="5; url=/member/login.do">
			<!-- 5초 후에 /member/login.do 페이지(로그인 페이지)로 자동으로 넘어가도록 설정 -->
			
			<!-- 모바일 웹 페이지 설정 -->
			<link rel="shortcut icon" href="/resources/images/icon.png" />
			<link rel="apple-touch-icon" href="/resources/images/icon.png" />
			<!-- 모바일 웹 페이지 설정 끝 -->
			
			<!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
			<!-- [if lt IE 9]>
				<script src="/resources/include/js/html5shiv.js"></script>
			<![endif] -->
			<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		</head>
		<body>
			<div class="contentContainer">
				<div class="well">
					<div class="tac">
						[${login.m_name}]회원님의 아이디는 [${login.m_id}]입니다.
						<span id="text">(5초 후에 자동으로 로그인 화면으로 이동합니다.)</span>
					</div>
				</div>
			</div>
		</body>
	</html>