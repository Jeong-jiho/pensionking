<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
	<html>
		<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		
		<title>아이디 찾기</title>

		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/js/findIdPwd.js"></script>
		<script type="text/javascript">
			function errorCodeCheck() {
				var status = '<c:out value="${status}" />';
				if (status != "") {
					// 명확한 자료형 명시를 위해 status의 타입을 정수형으로 변환.
					switch (parseInt(status)) {

					case 1:
						alert("아이디가 존재하지 않습니다.\n다시 입력해 주세요.");
						break;
					}
				}
			}
		</script>
		</head>
		<body>
			<div class="container"> 
				<div class="page-header">
					<h2 style="font-weight:bold">아이디 찾기</h2>	
				
				</div>
				<div class="well">
					
					<form id="findIdForm" class="form-horizontal">
						<div class="form-group">
						<label for="m_name" class="col-sm-2 control-label">이름</label>
							<div class="col-sm-4">
								<input type="text" id="m_name" name="m_name" class="form-control" placeholder="이름">
							</div>
						</div>
						<div class="form-group">
						<label for="m_phone" class="col-sm-2 control-label">핸드폰 번호</label>
							<div class="col-sm-4">
								<input type="text" id="m_phone" name="m_phone" class="form-control" placeholder="-를 포함해서  입력하세요">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-6">
								<input type="button" value="검색" id="findIdConfirmBtn" class="btn btn-default" />
								<input type="button" value="취소" id="findIdCancelBtn" class="btn btn-default" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</body>
	</html>