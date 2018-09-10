$(function() {
	// 아래 함수는 서버로 받아 온 코드값에 대한 처리 함수(login.jsp 파일에 정의)
	errorCodeCheck();
	$("#owner_id, #owner_pwd").bind("keyup", function() {
		$(this).parents("div").find(".error").html("");
	});
	
	// 로그인 버튼 클릭 시 처리 이벤트
	$("#loginBtn").click(function() {
		if(!formCheck($("#owner_id"), $(".error:eq(0)"), "아이디를")) return;
		else if(!formCheck($("#owner_pwd"), $(".error:eq(1)"), "비밀번호를")) return;
		else {
			$("#loginForm").attr({
				"method" : "POST",
				"action" : "/admin/login.do"
			});
			$("#loginForm").submit();
		}
	});
	
	// 메인 버튼 클릭 시 처리 이벤트
	$("#cancelBtn").click(function() {
		location.href="/admin/logout.do";
	});
});