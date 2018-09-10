//비밀번호와 비밀번호 확인 일치 여부 확인
function passwordCheck(){
	if($("#m_pwd").val() != $("#m_pwdCheck").val()){
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
		$("#m_pwdCheck").focus();
		$("#m_pwdCheck").val("");
		return false;
	}else{
		return true;
	}
}

//아이디에 비밀번호 포함 여부 확인
function idPwdCheck(){
	var m_id = $("#m_id").val();
	var m_pwd = $("#m_pwd").val();
	if(m_pwd.indexOf(m_id) > -1){
		alert("비밀번호에 아이디를 포함할 수 없습니다.");
		$("#m_pwd").val("");
		$("#m_pwd").focus();
		return false;
	}else{
		return true;
	}
}

var idConfirm = 1;
$(function(){
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
	
	errCodeCheck();
	//사용자에게 요구사항에 대한 문자열로 배열 초기화
	var message = ["영문,숫자만 가능. 6 ~ 12자로 입력해주세요",
					"영문,숫자,특수문자만 가능. 8 ~ 15자 입력해 주세요.",
					"비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.",
					"- 포함 입력해 주세요. 예시) 010-0000-0000",
					"",
					"",
					""];
	
	$(".error").each(function(index){
		$(".error").eq(index).html(message[index]);
	});
	
	$("#m_id, #m_pwd, #m_pwdCheck, #m_phone, #m_name, #emailName, #domain").bind("focus", function(){
		var m_no = $("#m_id, #m_pwd, #m_pwdCheck, #m_phone, #m_name, #emailName, #domain").index(this);
		console.log(m_no);
		$(this).parents(".form-group").find(".error").html(message[m_no]);
	});
	
	//확인 버튼 클릭 시 처리 이벤트
	$("#joinInsert").click(function() {
		//입력값 체크
		if(!formCheck($("#m_id"), $(".error:eq(0)"), "아이디를")) return;
		else if(!inputVerify(0,"#m_id", ".error:eq(0)")) return;
		else if(!formCheck($("#m_pwd"), $(".error:eq(1)"), "비밀번호를")) return;
		else if(!inputVerify(1,"#m_pwd", ".error:eq(1)")) return;
		else if(!idPwdCheck()) return;
		else if(!formCheck($("#m_pwdCheck"), $(".error:eq(2)"), "비밀번호 확인을")) return;
		else if(!inputVerify(1,"#m_pwdCheck", ".error:eq(2)")) return;
		else if(!passwordCheck()) return;
		else if(!formCheck($("#m_phone"), $(".error:eq(3)"), "전화번호를")) return;
		else if(!inputVerify(2,"#m_phone", ".error:eq(3)")) return;
		else if(!formCheck($("#m_name"), $(".error:eq(4)"), "이름을")) return;
		else if(!formCheck($("#emailName"), $(".error:eq(5)"), "이메일 주소를")) return;
		else if(!formCheck($("#domain"), $(".error:eq(5)"), "도메인을")) return;
		else if(idConfirm != 2){alert("아이디 중복 체크 진행해 주세요."); return;}
		else if($("#check_1").is(":checked") == false) {
			alert("서비스 이용 약관에 동의 하셔야 회원 가입이 가능합니다.");
			return;
		} else if($("#check_2").is(":checked") == false) {
			alert("개인정보 취급 방침에 동의 하셔야 회원 가입이 가능합니다.");
			return;
		} else {
			$("#m_email").val($("#emailName").val()+"@"+$("#emailDomain").val());
			$("#m_gender").val($("#gender").val());
			$("#memberForm").attr({
				"method" : "post",
				"action" : "/member/join.do"
			});
			$("#memberForm").submit();
		}
	});
	
	$("#joinCancel").click(function() {
		location.href="/member/login.do";
	});
	$("#joinReset").click(function() {
		$("#memberForm").each(function(){
			this.reset();
		});
	});
	
	// 아이디 중복 체크 버튼 클릭 시 처리 이벤트
	$("#idConfirmBtn").click(function() {
		if(!formCheck($("#m_id"),$(".error:eq(0)"),"아이디를")) return;
		else if(!inputVerify(0,"#m_id",".error:eq(0)")) return;
		else{
			$.ajax({
				url : "/member/m_idConfirm.do",
				type : "post",
				data : "m_id="+$("#m_id").val(),
				error : function(){
					alert("사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도하세요");
				},
				success : function(resultData){
					console.log("resultData : " + resultData);
					if(resultData=="1"){
						$("#m_id").parents(".form-group").find(".error").html("현재 사용중인 아이디입니다.");
					}else if(resultData=="2"){
						$("#m_id").parents(".form-group").find(".error").html("사용 가능한 아이디입니다.");
						idConfirm = 2;
					}
				}
			});
		}
	});
});