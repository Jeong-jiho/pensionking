var loginM_id = "";
$(function() {
	// 이메일 도메인 직접 입력 선택 시 처리 이벤트
	$('#emailDomain').change(function(){
		$("#emailDomain option:selected").each(function() {
			if($("#emailDomain").val() == 'direct'){ 			// 직접입력일 경우
				$("#domain").val("");							// 값 초기화
				$("#domain").attr("readonly", false);			// 활성화
			} else {											// 직접입력이 아닐 경우
				$("#domain").val($("#emailDomain").val());		// 선택값 입력
				$("#domain").attr("readonly", true);			// 비활성화
			}
		});
	});
	errorCodeCheck();
	emailCheck();
	
	var message = ["기존 비밀번호를 입력해주세요.", 
		   "영문, 숫자, 특수문자만 가능. 8 ~ 15자 입력해 주세요.", 
		   "비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.", 
		   "- 포함 입력해 주세요. 예시) 010-0000-0000",
		   "",
		   ""];
	$('.error').each(function(index) {
		$('.error').eq(index).html(message[index]);
	});
	
	$('#oldM_pwd, #m_pwd, #m_pwdCheck, #m_phone, #emailName, #domain').bind("focus", function() {
		var idx = $('#oldM_pwd, #m_pwd, #m_pwdCheck, #m_phone, #emailName, #domain').index(this);
		// console.log("대상 : " + idx);
		$(this).parents(".form-group").find(".error").html(message[idx]);
	});
	
	// 수정폼에서 확인 버튼 클릭 시 처리 이벤트
	$("#modify").click(function() {
		// 입력값 체크
		if(!formCheck($("#oldM_pwd"), $(".error:eq(0)"), "기존 비밀번호를")) return;
		else if(!inputVerify(1, "#oldM_pwd", ".error:eq(0)")) return;
		else if(!formCheck($("#m_phone"), $(".error:eq(3)"), "전화번호를")) return;
		else if(!inputVerify(2, "#m_phone", ".error:eq(3)")) return;
		else if(!formCheck($("#emailName"), $(".error:eq(4)"), "이메일 주소를")) return;
		else if(!formCheck($("#domain"), $(".error:eq(4)"), "도메인을")) return;
		else {
			if($("#m_pwd").val() != "") {
				if(!inputVerify(1, "#m_pwd", ".error(1)")) return;
				if(!idPwdCheck()) return;
			}
			if($("#m_pwdCheck").val() != "") {
				if(!inputVerify(1, "#m_pwdCheck", ".error:eq(2)")) return;
			}
			if($("#m_pwd").val() != "" && $("#m_pwdCheck").val() != "") {
				if(!passwordCheck()) return;
			}
			
			$("#m_email").val($("#emailName").val() + "@" + $("#emailDomain").val());
			$("#memberForm").attr({
				"method" : "post",
				"action" : "/member/modify.do"
			});
			$("#memberForm").submit();
		}
	});
	
	$("#modifyReset").click(function() {
		$("#memberForm").each(function() {
			this.reset();
		});
	});
	
	$("#modifyCancel").click(function() {
		location.href = "/member/login.do";
	});
});

function passwordCheck() {
	if($("#m_pwd").val() != $("#m_pwdCheck").val()) {
		alert("비밀번호 입력이 일치하지 않습니다.");
		$("#m_pwd").val("");
		$("#m_pwdCheck").val("");
		$("#m_pwd").focus();
		return false;
	}
	return true;
}

function idPwdCheck() {
	var m_id = loginM_id;
	var m_pwd = $("#m_pwd").val();
	if(m_pwd.indexOf(m_id) > -1) {
		alert("비밀번호에 아이디를 포함할 수 없습니다.");
		$("#m_pwd").val("");
		$("#m_pwd").focus();
		return false;
	} else {
		return true;
	}
}