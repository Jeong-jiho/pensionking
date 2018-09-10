$(function() {
	errorCodeCheck();
	
	// 아이디찾기 검색 버튼 클릭 시 처리 이벤트
	$("#findIdConfirmBtn").click(function() {
		if(!chkSubmit($("#m_name"), "이름을")) return;
		if(!chkSubmit($("#m_phone"), "핸드폰번호를")) return;
		else {
            $("#findIdForm").attr({
                "method" : "POST",
                "action" : "/member/findId.do" 
             });
             $("#findIdForm").submit();
		}
	});
	
	// 아이디찾기 취소 버튼 클릭 시 처리 이벤트
    $("#findIdCancelBtn").click(function(){
    	location.href="/member/login.do";
    });
    
    // 비밀번호찾기 검색 버튼 클릭 시 처리 이벤트
    $("#findPwdConfirmBtn").click(function() {
		if(!chkSubmit($("#m_id"), "아이디를")) return;
		if(!chkSubmit($("#m_email"), "이메일 주소를")) return;
		else {
			$("#findPwdForm").attr({
				"method" : "POST",
				"action" : "/member/findPwd.do"
			});
			$("#findPwdForm").submit();
		}
    });
     
    // 비밀번호찾기 재작성 버튼 클릭 시 처리 이벤트
    $("#findPwdResetBtn").click(function() {
		$("#findPwdForm").each(function(){
			this.reset();
		});
    });
    
	// 비밀번호찾기 취소 버튼 클릭 시 처리 이벤트
    $("#findPwdCancelBtn").click(function(){
    	location.href="/member/login.do";
    });
});