<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">
.sun {
	color: #F5A9A9;
}

.sat {
	color: #A9A9F5;
}

table td {
	text-align: left;
	font-size: 80%;
}

.not {
	background-color: gray;
}

a {
	color: white;
}

/* a.none {
	pointer-events: none;
	color: #585858;
} */

.state {
	margin-left: 5px;
	margin-right: 25px;
	color: black;
	background-color: #40FF00;
}

.state1 {
	color: black;
	background-color: #40FF00;
}

.resEnd {
	color: black;
	background-color: #FF0000;
}

.resWait {
	color: black;
	background-color: #0101DF;
}

h1 {
	margin: 10px 0px;
	text-align: center;
}

.s_info {
	margin-bottom: 20px;
}

.price{
	float:right;
	color:#FE2EF7;
}
.weekend{float:right; color: #F5A9A9}
.weekday{float:right; }
.t_hide{visibility: hidden}
</style>

<script type="text/javascript">
	$(function() {
		
		$(".dd").hide();
		
		/* 현재 월의 마지막 일을 구합니다. */
		// 1월부터 12월까지의 마지막 일을 배열로 만듭니다.
		var last = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
		// 4년마다 있는 윤년을 계산합니다.(100년||400년 주기는 제외)
		if (y % 4 && y % 100 != 0 || y % 400 === 0) {
			lastDate = last[1] = 29;
		}

		// 달력에 표기되는 일의 초기값!
		var dNum = 1;
		for (var mm = 9; mm <= 12; mm++) {
			dNum = 1;
			/* 현재 날짜와 현재 달에 1일의 날짜 객체를 생성합니다. */
			var date = new Date(); // 날짜 객체 생성
			date.setMonth(mm-1);
			var y = date.getFullYear(); // 현재 연도
			var m = date.getMonth(); // 현재 월
			var d = date.getDate(); // 현재 일

			// 현재 년(y)월(m)의 1일(1)의 요일을 구합니다.
			var theDate = new Date(y, mm-1, 1);
			// 그 날의 요일은?
			var theDay = theDate.getDay();

			// 현재 월의 마지막 일이 며칠인지 구합니다.
			var lastDate = last[mm-1];

			/* 현재 월의 달력에 필요한 행의 개수를 구합니다. */
			// theDay(빈 칸의 수), lastDate(월의 전체 일수)
			var row = Math.ceil((theDay + lastDate) / 7);
			//문자 결합 연산자를 사용해 요일이 나오는 행을 생성합니다. 
			var div = "<div class='" + (mm) + "'>";
			var h1 = "<h1>" + y + "년 " + (mm) + "월" + "</h1>";
			var calendar = "<table class='table table-responsive-sm table-bordered calendar_table'>";

			calendar += "<tr>";
			calendar += "<th class='sun'>일</th>";
			calendar += "<th>월</th>";
			calendar += "<th>화</th>";
			calendar += "<th>수</th>";
			calendar += "<th>목</th>";
			calendar += "<th>금</th>";
			calendar += "<th class='sat'>토</th>";
			calendar += "</tr>";
			var div2 = "<div class='s_info'>";
			div2 += "<span class='state1' style='margin:0px 10px;'></span>"
					+ "예약가능";
			div2 += "<span class='resWait' style='margin:0px 10px;'></span>"
					+ "입금대기";
			div2 += "<span class='resEnd' style='margin:0px 10px;'></span>"
					+ "예약완료" + "</div>";
			for (var i = 1; i <= row; i++) { // 행 만들기
				calendar += "<tr>";
				for (var k = 1; k <= 7; k++) { // 열 만들기
					// 월1일 이전 + 월마지막일 이후 = 빈 칸으로!
					if (i === 1 && k<=theDay || dNum>lastDate) {
						calendar += "<td class='not'>  </td>";
					} else {
						var z = mm;
						if (z < 10)
							z = "0" + mm;
						if (dNum < 10)
							dNum = "0" + dNum;
						var bs = "비수기";

						if((y+"-"+z+"-"+dNum)>=$(".st_start").attr("data-sterm") &&
								(y+"-"+z+"-"+dNum)<=$(".st_end").attr("data-sterm")){
							bs = "성수기";
						}
						if (k == 1) {
							calendar += "<td class='sunday'>"
									+ "<span class='sun'>" + dNum + "일"
									+ "</span>" + "<span class='weekend'>" +bs
									+ " 주말" + "</span>"+"<br>";
									bs = bs+" 주말";
						} else if (k == 7) {
							calendar += "<td class='saturday'>"
									+ "<span class='sat'>" + dNum + "일"
									+ "</span>" + "<span class='weekend'>" +bs + " 주말"
									+ "</span>" + "<br>";
									bs = bs+" 주말";
						} else {
							calendar += "<td>" + dNum + "일" + "</span>" + "<span class='weekday'>" 
							+ bs + " 주중" + "</span>"+"<br>";
							bs = bs+" 주중";
						}

						for (var r = 0; r < "${r_count}"; r++) {
							calendar += "<div> ";
							calendar += "<span class='state "
									+ $(".r_name:eq(" + r + ")").attr("data-num")
									+ (y + "" + z + "" + dNum) + "'>"
									+ "</span>";

							calendar += "<a class='goDetail' href='#'>"+$(".r_name:eq(" + r + ")").html()+"</a>";
							var r_price =0 ;
							if((y+"-"+z+"-"+dNum)>=$(".st_start").attr("data-sterm") &&
									(y+"-"+z+"-"+dNum)<=$(".st_end").attr("data-sterm")){
								/* $(".weekend").html("성수기 주말");
								$(".weekday").html("성수기 주중"); */
								if(k == 1 || k==7){
									calendar += "<span class='price'>"+ $(".pr_sweekend:eq(" + r + ")").attr("data-price") +"원</span>";
									r_price = $(".pr_sweekend:eq(" + r + ")").attr("data-price");
								}else{
									calendar += "<span class='price'>"+ $(".pr_sweekday:eq(" + r + ")").attr("data-price") +"원</span>";
									r_price = $(".pr_sweekday:eq(" + r + ")").attr("data-price");
								}
							}else{
								if(k == 1 || k==7){
									calendar += "<span class='price'>"+ $(".pr_weekend:eq(" + r + ")").attr("data-price") +"원</span>";
									r_price = $(".pr_weekend:eq(" + r + ")").attr("data-price");
								}else{
									calendar += "<span class='price'>"+ $(".pr_weekday:eq(" + r + ")").attr("data-price") +"원</span>";
									r_price = $(".pr_weekday:eq(" + r + ")").attr("data-price");
								}
							} 
							
									 
							calendar += "<form id='resForm' name='resForm' >"
									+ "<input type='hidden' id='r_no' name='r_no' class='r_no' value='"+$(".r_name:eq(" + r + ")").attr("data-num")+"'>"
									+ "<input type='hidden' id='res_indate' name='res_indate' class='res_indate' value='"+(y + "-" + z + "-" + dNum)+"'>"
									+ "<input type='hidden' id='price' name='price' value='"+r_price+"'>"
									+ "<input type='hidden' id='bs' name='bs' value='"+bs+"'>"
									+ "</form>" + "</div>";
						}

						calendar += "</td>";
						dNum++;
					}
				}
				calendar += "</tr>";
			}
			for (var res = 0; res < "${res_count}"; res++) {
				if ($(".r_state:eq(" + res + ")").attr("data-state") == "예약완료") {
					$("." + $(".res:eq(" + res + ")").attr("data-num")).addClass("resEnd");
					$("." + $(".res:eq(" + res + ")").attr("data-num")).next()
							.addClass("none");
				} else if ($(".r_state:eq(" + res + ")").attr("data-state") == "입금대기") {
					$("." + $(".res:eq(" + res + ")").attr("data-num"))
							.addClass("resWait");
					$("." + $(".res:eq(" + res + ")").attr("data-num")).next()
							.addClass("none");
				}
			
			} 
			
			calendar += "</table></div>";
			;
			$(".cc").append(div).append(h1).append(div2).append(calendar);
		} // 문서 출력!
		$(".state").html("가");
		$(".state1").html("가");
		$(".resEnd").html("완");
		$(".resWait").html("대");
		$(".cc").find(".9").hide();
		//////////////////////////////////////////////////////////////////
		
		$(".goDetail").on("click",function(){
			var schR_no = $(this).parent().find(".r_no").val();
			var schIndate = $(this).parent().find(".res_indate").val();
			/* $(this).parents("div").find("#resForm").attr({
				"method" : "get",
				"action" : "/admin/res/resList.do?schDateType="+schDateType+"&schR_no="+schR_no+"&schStart="+schStart+"&schEnd="+schEnd
			});
			$(this).parents("div").find("#resForm").submit(); */
			location.href="/admin/res/resList.do?&schR_no="+schR_no+"&schIndate="+schIndate;
		});
	});
	
	
</script>

<div class="container-fluid">
	
	<div class="cc"></div>
	<div class="dd">
		<c:choose>
			<c:when test="${not empty roomName}">
				<c:forEach var="room" items="${roomName}" varStatus="status">
					<div class="r_name" data-num="${room.r_no}">${room.r_name}</div>
					<div class="pr_weekday" data-price="${room.pr_weekday }"></div>
					<div class="pr_weekend" data-price="${room.pr_weekend }"></div>
					<div class="pr_sweekday" data-price="${room.pr_sweekday }"></div>
					<div class="pr_sweekend" data-price="${room.pr_sweekend }"></div>
				</c:forEach>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${not empty resState}">
				<c:forEach var="res" items="${resState}" varStatus="status">
					<div class="res" data-num="${res.res_no1}"></div>
					<div class="r_state" data-state="${res.res_state }"></div>
					
				</c:forEach>
			</c:when>
		</c:choose>

		<div class="st_start" data-sterm="${sterm.st_start}"></div>
		<div class="st_end" data-sterm="${sterm.st_end}"></div>

		
	</div>
</div>