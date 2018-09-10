<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
		<head>
			<meta charset="UTF-8">
			<title>회원가입</title>
			<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
			<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정. -->
			
			<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
			<!-- viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정. initial-scale은 초기비율 -->
			
			<!-- 모바일 웹 페이지 설정 -->
			<link rel="shortcut icon" href="/resources/images/icon.png" />
			<link rel="apple-touch-icon" href="/resources/images/icon.png" />
			<!-- 모바일 웹 페이지 설정 끝 -->
			
			<!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
			<!-- [if lt IE 9]>
				<script src="/resources/include/js/html5shiv.js"></script>
			<![endif] -->
			<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
			<script type="text/javascript" src="/resources/include/js/common.js"></script>
			<script type="text/javascript" src="/resources/include/js/delete.js"></script>
			<script type="text/javascript" src="/resources/include/js/login.js"></script>
			<style type="text/css">
				.ss{height:650px;} 
			</style>
			<script type="text/javascript">
				function errorCodeCheck() {
					var status = '<c:out value="${status}" />'
					if(status != "") {
						// 명확한 자료형 명시를 위해 status의 타입을 정수형으로 변환
						switch(parseInt(status)) {
						case 1:
							alert("아이디 또는 비밀번호가 일치하지 않거나 존재하지 않는 \n회원입니다. 다시 로그인해 주세요.");
							break;
						}
					}
				}
			</script>
		</head>
		<body>
		<div class="container ss">
			<div class="page-header">
				<h2 style="font-weight:bold">회원 탈퇴</h2>	
			
			</div>
			<nav class="navbar navbar-default zzz">
				<div class="zz">
					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li><a class="active" href="/member/myPage.do">MyPage</a></li>
							<li><a class="active" href="/member/modify.do">회원수정</a></li>
							<li><a class="active" href="/member/delete.do">회원탈퇴</a></li>
						</ul>
					</div> 
				</div>
			</nav>
			<div class="contentContainer">
				
				<div class="well">
					<form id="deleteForm" name="deleteForm" class="form-horizontal">
						<div class="form-group">
							<label for="m_pwd" class="col-sm-2 control-label">비밀번호를 입력하세요.</label> 
							<div class="col-sm-4">
								<input type="password" id="m_pwd" name="m_pwd" class="form-control" placeholder="Password">
							</div>
							<p class="form-control-static error"></p>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-6">
								<input type="button" value="확인" id="passwordConfirmBtn" class="btn btn-default" /> 
								<input type="button" value="취소" id="cancelBtn" class="btn btn-default" />
							</div>
						</div>
					</form>
				</div>
			</div>
			</div>
		</body>
	</html>