<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- 아래 내용은 DB에 이메일 정보가 javauser2018@naver.com으로 저장되어 있기에 @를 구분자로 분리하고 작성한 소스 --%>
<c:set var="m_email" value="${fn:split(member.m_email, '@')}" />
	<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>회원 정보 수정</title>
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
			<script type="text/javascript" src="/resources/include/js/modify.js"></script>
			<script type="text/javascript">
				function errorCodeCheck() {
					var status = '<c:out value="${status}" />';
					if(status != "") {
						alert("기존 비밀번호 검증에 실패하였습니다. \n기존 비밀번호를 다시 확인해 주세요.");
					}
				}
				
				loginM_id = "${member.m_id}";
				
				function emailCheck() {
					var email = "${m_email[1]}";
					$("#emailDomain").val(email).prop("selected", "true");
				}
			</script>
		</head>
		<body>
		<div class="container">
			<div class="page-header">
				<h2 style="font-weight:bold">회원 정보 수정</h2>	
			
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
					<form id="memberForm" class="form-horizontal">
						<input type="hidden" name="m_no" id="m_no" value="${member.m_no}" />
						<input type="hidden" name="m_email" id="m_email" />
						<input type="hidden" name="m_gender" id="m_gender" />
						<div class="form-group form-group-sm">
							<label for="m_id" class="col-sm-2 control-label">사용자 ID</label>
							<div class="col-sm-3">
								${member.m_id}
							</div>
						</div>
						<div class="form-group form-group-sm">
							<label for="oldM_pwd" class="col-sm-2 control-label">기존 비밀 번호</label>
							<div class="col-sm-3">
								<input type="password" id="oldM_pwd" name="oldM_pwd" maxlength="15" class="form-control" placeholder="기존 비밀번호 입력">
							</div>
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
						</div>
						<div class="form-group form-group-sm">
							<label for="m_pwd" class="col-sm-2 control-label">변경할 비밀 번호</label>
							<div class="col-sm-3">
								<input type="password" id="m_pwd" name="m_pwd" maxlength="15" class="form-control" placeholder="변경할 비밀번호 입력">
							</div>
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
						</div>
						<div class="form-group form-group-sm">
							<label for="m_pwdCheck" class="col-sm-2 control-label">변경할 비밀 번호 확인</label>
							<div class="col-sm-3">
								<input type="password" id="m_pwdCheck" name="m_pwdCheck" maxlength="15" class="form-control" placeholder="변경할 비밀번호 입력 확인">
							</div>
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
						</div>
						<div class="form-group form-group-sm">
							<label for="m_phone" class="col-sm-2 control-label">핸드폰 번호</label>
							<div class="col-sm-3">
								<input type="text" id="m_phone" name="m_phone" maxlength="15" class="form-control" value="${member.m_phone}">
							</div>
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
						</div>
						<div class="form-group form-group-sm">
							<label for="m_name" class="col-sm-2 control-label">이름</label>
							<div class="col-sm-3">
								${member.m_name}
							</div>
						</div>
						<div class="form-group form-group-sm">
							<label for="emailName" class="col-sm-2 control-label">이메일</label>
							<div class="col-sm-3">
								<input type="text" id="emailName" name="emailName" maxlength="60" class="form-control" value="${m_email[0]}">
							</div>
							
							<div class="col-sm-2">
								<input type="text" id="domain" name="domain" maxlength="30" class="form-control" placeholder="도메인">	
							</div>
							<div class="col-sm-2">
								<select id="emailDomain" name="emailDomain" class="form-control">
									<option value="naver.com">네이버</option>
									<option value="gmail.com">구글</option>
									<option value="daum.net">다음</option>
									<option value="nate.com">네이트</option>
									<option value="direct" selected>직접 입력</option>
								</select>
							</div>
							<div class="col-sm-3">
								<p class="form-control-static error"></p>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-6">
								<input type="button" value="확인" id="modify" class="btn btn-default" />
								<input type="button" value="재작성" id="modifyReset" class="btn btn-default" />
								<input type="button" value="취소" id="modifyCancel" class="btn btn-default" />
							</div>
						</div>
					</form>
				</div>
			</div>
			</div>
		</body>
	</html>