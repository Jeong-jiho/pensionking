//비밀번호와 비밀번호 확인 일치 여부 확인
function passwordCheck(){
	if($("#userPw").val() != $("#userPwCheck").val()){
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
		$("#userPwCheck").focus();
		$("#userPwCheck").val("");
		return false;
	}else{
		return true;
	}
}

//아이디에 비밀번호 포함 여부 확인
function idPwdCheck(){
	var userId = $("#userId").val();
	var userPw = $("#userPw").val();
	if(userPw.indexOf(userId) > -1){
		alert("비밀번호에 아이디를 포함할 수 없습니다.");
		$("#userPw").val("");
		$("#userPw").focus();
		return false;
	}else{
		return true;
	}
}

var idConfirm = 1;
$(function(){
	/*errCodeCheck();*/
	//사용자에게 요구사항에 대한 문자열로 배열 초기화
	var message = ["영문,숫자만 가능. 6 ~ 12자로 입력해주세요",
					"영문,숫자,윽수문자만 가능. 8 ~ 15자 입력해 주세요.",
					"비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.",
					"- 포함 입력해 주세요. 예시) 010-0000-0000"];
	
	$(".error").each(function(index){
		$(".error").eq(index).html(message[index]);
	});
	
	$("#userId, #userPw, #userPwCheck, #phone").bind("focus", function(){
		var idx = $("#userId, #userPw, #userPwCheck, #phone").index(this);
		console.log(idx);
		$(this).parents(".form-group").find(".error").html(message[idx]);
	});
	
	//확인 버튼 클릭 시 처리 이벤트
	$("#joinInsert").click(function(){
		//입력값 체크
		if(!formCheck($("#userId"), $(".error:eq(0)"), "아이디를")) return;
		else if(!inputVerify(0,"#userId", ".error:eq(0)")) return;
		else if(!formCheck($("#userPw"), $(".error:eq(1)"), "비밀번호를")) return;
		else if(!inputVerify(1,"#userPw", ".error:eq(1)")) return;
		else if(!idPwdCheck()) return;
		else if(!formCheck($("#userPwCheck"), $(".error:eq(2)"), "비밀번호 확인을")) return;
		else if(!inputVerify(1,"#userPwCheck", ".error:eq(2)")) return;
	});
	
	$("#idConfirmBtn").click(function(){
		
	});
	
	
});