var loginM_id = "";
$(function() {
	$("#m_pwd").bind("keyup", function() {
		$(this).parents("div").find(".error").html("");
	});
	
	// 로그인 버튼 클릭 시 처리 이벤트
	$("#passwordConfirmBtn").click(function() {
		if(!formCheck($("#m_pwd"), $(".error:eq(0)"), "비밀번호를")) return;
		else if(!inputVerify(1, "#m_pwd", ".error:eq(0)")) return;
		else {
			$("#deleteForm").attr({
				"method" : "POST",
				"action" : "/member/delete.do"
			});
			$("#deleteForm").submit();
		}
	});
	
	// 취소 버튼 클릭 시 처리 이벤트
	$("#cancelBtn").click(function() {
		history.back();
	});
});