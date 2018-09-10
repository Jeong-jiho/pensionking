<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<style type="text/css"> 
	.st{padding:20px 20px; background-color:white; color:black; border-color:white; margin-top:10px; }
	.st1{margin-top:20px;}
	.st h1{text-align:center;margin-bottom:10px;}
	
	.card-body > div{float:left; text-align:center;width:390px;}
	.main1 {margin:20px 0px 20px 0px; font-size:110%;}  
	.m1{font-size:180%; color:#819FF7;}
	.title{font-weight: bold; font-size:120%;} 
	.sub1 {margin: 30px 0px 10px 0px;}  
	.sub2 {margin: 20px 0px 10px 0px;}
	.t1 {background-color:white;}
	.s1 table, .s2 table{width:360px;}
	.s2 table{margin-left:20px; margin-top:30px;}
	.s1{border-right: 1px dotted #D8D8D8;}
</style>

<ol class="breadcrumb">
	<li class="breadcrumb-item">
	<a href="#">Admin</a>
	</li>
	<li class="breadcrumb-item active">통계</li>
</ol>

<div class="container-fluid"> 
	<div class="card st">
			통계
		<hr>
		<h1 style="font-size:200%; margin-bottom:10px; fond-weight:lighter">2018년 9월</h1>
		<div class="card-body">
			<div class="total s1">
				<div class="title">이달의 누적 판매 금액</div>
				<div class="main1"><span class="m1">${st.fure_total }</span>원</div>
				<div>작년 동기 대비 <span></span>▲</div>
				<table class="table table-responsive-sm table-striped">
						<tr>
							<th>총 예약</th>
							<td class="t1">${st.res_totalcnt }건</td>
							<td class="t1">${st.res_total }원</td>
						</tr>
						<tr></tr>
						<tr>
							<th>환불 수수료</th>
							<td class="t1">${st.cancel_cnt }건</td>
							<td class="t1">${st.cancel_total }원</td>
						</tr>
						<tr></tr>
						<tr>
							<th>정상 예약</th>
							<td class="t1">${st.res_cnt }건</td>
							<td class="t1">${st.res_current }원</td>
						</tr>
				</table>
			</div>
			<div class="avg s1"> 
				<div class="title">객실 평균 판매금액</div>
				<div class="main1"><span class="m1">${st.avg_price }</span>원</div>

					<div class="sub1">주중 <span>&nbsp;&nbsp;&nbsp;${st.avg_price_d }</span>원</div>
					<div class="sub2">주말 <span>&nbsp;&nbsp;&nbsp;${st.avg_price_e }</span>원</div>

			</div>
			<div class="using">
				<div class="title">객실 가동률</div>
				<div class="main1"><span class="m1">${st.using_all }</span>%</div>
				<div>
					<div class="sub1">주중<span>&nbsp;&nbsp;&nbsp;${st.using_day }</span>%</div>
					<div class="sub2">주말<span>&nbsp;&nbsp;&nbsp;${st.using_end }</span>%</div>
				</div>
			</div>
		</div>
	</div>
	<div class="card st st1">
		<div class="card-body">
			<div class="leadtime s1">
				<div class="title">예약 리드타임</div>
				<div class="main1">입실<span class="m1">${st.leadtime }</span>일전 예약</div>
				<div>
					<div class="sub1">주중 <span>&nbsp;&nbsp;&nbsp;입실${st.leadtime_d }</span>일전 예약</div>
					<div class="sub2">주말 <span>&nbsp;&nbsp;&nbsp;입실${st.leadtime_e }</span>일전 예약</div>
				</div>
			</div>
				<div class="cancel s1">
					<div class="title">취소율</div>
					<div class="main1"><span class="m1">${st.c_allpercent }</span>%</div>
				<div>
					<div class="sub1">주중 <span>&nbsp;&nbsp;&nbsp;${st.c_percent_d }</span>%</div>
					<div class="sub2">주말 <span>&nbsp;&nbsp;&nbsp;${st.c_percent_e }</span>%</div>
				</div>
			</div>
			<div class="rank s2">
				<div class="title">객실별 판매금액</div>
				<table class="table table-responsive-sm table-striped">
					<tr>
						<th>번호</th>
						<th>객실명</th>
						<th>예약</th>
						<th>결제금액</th>
					</tr>
					<c:choose>
					<c:when test="${not empty stRoom}">
							<c:forEach var="room" items="${stRoom}" varStatus="status">
									<tr></tr>
									<tr class="stDiv">
										<td class="t1">${status.count }</td>
										<td class="t1">${room.r_name }</td>
										<td class="t1">${room.res_totalcnt }</td>
										<td class="t1">${room.res_total }원</td>
									</tr>
									
							</c:forEach>
					</c:when>
					</c:choose> 
				</table>
			</div>
		</div>
	</div>
</div>