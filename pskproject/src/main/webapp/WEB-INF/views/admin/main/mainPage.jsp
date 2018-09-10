<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<style type="text/css">
	
	.st{padding:20px 20px; background-color:white; color:black;margin-top:10px; border-color:white;  text-align:center;}
	.card-body{padding:10px 40px;}
	.st1{ float:left; width:49.4%; margin-top:-2px;}
	.s1{float:left; width:350px; }
	.st h1{margin-bottom:10px; margin-top:-5px;}
	.day{color:#819FF7; font-weight: bold;} 
	.main1{height:110px;}
	.title1{text-align:left; font-weight:bold; font-size:120%}
	.t1 {background-color:white;}
	.m1{font-size:400%; }
</style>
<script type="text/javascript">
	$(function(){ 
		printClock();
		for(var i=0; i<3; i++){
			if($(".m1:eq("+i+")").text()=='0') {
				$(".m1:eq("+i+")").css("color","#D8D8D8");
			}
		}
	});
	
	function printClock() {
	    
	    var clock = document.getElementById("clock");            // 출력할 장소 선택
	    var currentDate = new Date();                                     // 현재시간
	    var calendar = currentDate.getFullYear() + "." + addZeros(currentDate.getMonth()+1,2) + "." + addZeros(currentDate.getDate(),2); // 현재 날짜
	    var amPm = 'AM'; // 초기값 AM
	    var currentHours = addZeros(currentDate.getHours(),2); 
	    var currentMinute = addZeros(currentDate.getMinutes() ,2);
	    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
	    var day = currentDate.getDay();
	    var today;
	    
	    switch(day){
	    case 0:
	       today = "일";
	       break;
	    case 1:
	       today = "월";
	       break;
	    case 2:
	       today = "화";
	       break;
	    case 3:
	       today = "수";
	       break;
	    case 4:
	       today = "목";
	       break;
	    case 5:
	       today = "금";
	       break;
	    case 6:
	       today = "토";
	       break;
	    }
	       
	    
	    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
	       amPm = 'PM';
	       currentHours = addZeros(currentHours - 12,2);
	    }

	    /*if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
	       currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
	    }*/
	    clock.innerHTML = '<h1 style="font-size:200%; margin-bottom:10px; fond-weight:lighter">' + calendar+"("+today+")</h1>"; //날짜를 출력해 줌
	    
	    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
	}

	function addZeros(num, digit) { // 자릿수 맞춰주기
	     var zero = '';
	     num = num.toString();
	     if (num.length < digit) {
	       for (i = 0; i < digit - num.length; i++) {
	         zero += '0';
	       }
	     }
	     return zero + num;
	}
</script>

<ol class="breadcrumb">
	<li class="breadcrumb-item">
	<a href="#">Admin</a>
	</li>
	<li class="breadcrumb-item active">home</li>
</ol>

<div class="container-fluid">
	<div class="card st st0">
		<span class="day">today</span>
		<div id="clock"></div>
		<div class="card-body">
			<div class="wait s1">
				<div class="main1"><h1><span class="m1">${todayCnt.res_wait }</span></h1></div>
				<div class="title">입금대기</div>
			</div>
			<div class="end s1"> 
				<div class="main1"><h1><span class="m1">${todayCnt.res_end }</span></h1></div>
				<div class="title">예약완료</div>

			</div>
			<div class="cancel s1">
				<div class="main1"><h1><span class="m1">${todayCnt.res_cancel }</span></h1></div>
				<div class="title">예약취소</div>
			</div>
		</div>
	</div>
	<div class="card st st1" style="margin-right:15px;">
		<div class="card-body">
			<div class="today in">
				<div class="title1">오늘 입실</div>
				<table class="table table-responsive-sm table-striped"> 
					<tr>
						<th>객실명</th>
						<th>예약자</th>
						<th>전화번호</th>
						<th>바베큐</th>
					</tr>
					<c:choose>
					<c:when test="${not empty todayIn}">
							<c:forEach var="in" items="${todayIn}" varStatus="status">
									<tr></tr>
									<tr class="inDiv" data-num="${in.res_no }">
										<td class="t1">${in.r_name }<br><span style="font-weight:lighter">(${in.res_people }명)</span></td>
										<td class="t1">${in.m_name }</td>
										<td class="t1">${in.m_phone }</td>
										<td class="t1">${in.res_bbq }</td>
									</tr>
									
							</c:forEach>
					</c:when>
					</c:choose> 
				</table>
			</div>
		</div>
	</div>
	<div class="card st st1">
		<div class="card-body">
			<div class="today in">
				<div class="title1" style="float:left;">오늘 퇴실</div>
				<form id="outForm">
				<table class="table table-responsive-sm table-striped">
					<tr>
						<th>객실명</th>
						<th>예약자</th>
						<th>전화번호</th>
						<th>비고</th>
					</tr> 
					<c:choose>
					<c:when test="${not empty todayOut}">
							<c:forEach var="out" items="${todayOut}" varStatus="status">
									<tr></tr>
									<tr class="outDiv" data-num="${out.res_no }">
										<td class="t1">${out.r_name }<br><span style="font-weight:lighter">(${out.res_people }명)</span></td>
										<td class="t1">${out.m_name }</td>
										<td class="t1">${out.m_phone }</td>
										<td class="t1"></td>
									</tr>
							</c:forEach>
					</c:when>
					</c:choose> 
				</table>
				</form>
			</div>
		</div>
	</div>
	
</div>