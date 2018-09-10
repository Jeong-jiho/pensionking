<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<style type="text/css">
	.rp_cnt {
		font-size: 10px;
		color: red;
		}
	.r_image{width:120px; height:90px;}
	#reviewDiv,#qnaDiv{width:530px; margin-top:10px;} 
	#reviewDiv{float:left;} 
	#qnaDiv{float:right;}
	#reservationDiv{display: inline-block; width:100%; }
	.zzz{width:287px;}
 
</style> 
<script type="text/javascript">
	$(function(){
		$(".resDiv").each(function(){
			if($(this).find(".dday").html()>0) {
				var refundMoney = $(this).find(".pay_price").html();
				switch($(this).find(".dday").html()) {
				case '1':
					x = 0.1;
					break;
				case '2':
					x = 0.2;
					break;
				case '3':
					x = 0.3;
					break;
				case '4':
					x = 0.4;
					break;
				case '5':
					x = 0.5;
					break;
				case '6':
					x = 0.6;
					break;
				case '7':
					x = 0.7;
					break;
				default:
					x = 1;
				}
				refundMoney = refundMoney * x;
				$(this).find(".refundMoney").html(refundMoney);
				$(this).find(".percent").html(x*100);
			}
		});
		
		
		$(".goDetail_r").click(function(){
			var rv_no = $(this).parents("tr").attr("data-num");
			$("#rv_no").val(rv_no);
			console.log("글번호:" + rv_no);
			// 상세 페이지로 이동하기 위해 form 추가 (id: detailForm)
			$("#detailForm_r").attr({
				"method":"get",
				"action":"/review/reviewDetail.do"
			})
			$("#detailForm_r").submit();
		})
		
		$(".goDetail_q").click(function(){
				var q_no = $(this).parents("tr").attr("data-num");
				$("#q_no").val(q_no);
				console.log("글번호:" + q_no);
				// 상세 페이지로 이동하기 위해 form 추가 (id: detailForm)
				$("#detailForm_q").attr({
					"method":"get",
					"action":"/qna/qnaDetail.do"
				})
				$("#detailForm_q").submit();
			})
		
		 $(".refundBtn").click(function(){ 
			 if(confirm("환불 처리 하시겠습니까?")){
					$.ajax({
			  			url : "/admin/pay/refund.do",      
			  			type : "post",								
		  			data:JSON.stringify({
		  				pay_no : $(this).parents(".resDiv").attr("data-num"),
						res_gno : $(this).next().val(),
						a_confirm : 2,
						pay_price : $(this).parents(".resDiv").find(".pay_price").text()
					}),				
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
		  			dataType : "text",
		  			error : function(){							
		  				alert('시스템 오류 입니다. 관리자에게 문의 하세요.');
		  			},											
		  			success : function(resultData){
		  				console.log(resultData)
		  				if(resultData=="성공"){
		  					alert("해당 결제의 환불 처리가 완료 되었습니다.");
		  					location.reload();
		  				}else if(resultData=="불가능"){
		  					alert("환불 기간이 아닙니다");
		  					return;
		  				}else{
		  					alert("오류");
		      				return;
		  				}
		  			}
		  		});
			}else{
				return false;
			} 
		 });
		 $("#updateBtn").click(function(){
			 location.href = "/member/modify.do";
		 });
		 $("#retireBtn").click(function(){
			 location.href = "/member/delete.do";
		 });
	});
</script>

<div class="container">
	
	<div class="page-header">
		<h2 style="font-weight:bold">My Page</h2>	
	
	</div>
	<nav class="navbar navbar-default zzz">
		<div class="zz">
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a class="active" href="/member/myPage.do">MyPage</a></li>
					<li><a class="active" href="/member/modify.do">회원수정</a></li>
					<li><a class="active" href="/member/delete.do">회원탈퇴</a></li>
				</ul> 
			</div>
		</div>
	</nav>
	
		<div class="page-header">
			<h4 style="font-weight:bold;">내가 쓴글</h4>
		</div>
		<div id="reviewDiv">
			<div class="card">
				<div class="title"><h4>- 후기 -</h4></div> 
				<form id="detailForm_r">
				<input type="hidden" id="rv_no" name="rv_no">
					<table class="table table-responsive-sm table-striped">
						<thead>
						<tr>
							<th class="tac">글번호</th>
							<th class="tac">글제목</th>
							<th class="tac">작성일</th>
							<th class="tac">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty reviewList}">
								<c:forEach var="review" items="${reviewList}" varStatus="status">
									<tr class="tac" data-num="${review.rv_no}">
										<td>${review.rv_no}</td>
										<td class="goDetail_r tal">${review.rv_title}<c:if
												test="${review.rp_cnt>0}">
												<span class="rp_cnt">[${review.rp_cnt}]</span>
											</c:if>
										</td>
										<td>${review.rv_date}</td>
										<td>${review.readcnt}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" class="tac">작성한 게시물이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
					</table>
				</form>
			</div>
		</div>
		<div id="qnaDiv">
			<div class="card">
				<div class="title"><h4>- Q&A -</h4></div>
				<form id="detailForm_q">
				<input type="hidden" id="q_no" name="q_no">
					<table class="table table-responsive-sm table-striped">
						<thead>
						<tr>
							<th class="tac">글번호</th>
							<th class="tac">글제목</th>
							<th class="tac">작성일</th>
							<th class="tac">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty qnaList}">
								<c:forEach var="qna" items="${qnaList}" varStatus="status">
									<tr class="tac" data-num="${qna.q_no}">
										<td>${qna.q_no}</td>
										<td class="goDetail_q tal">${qna.q_title}</td>
										<td>${qna.q_date}</td>
										<td>${qna.readcnt}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" class="tac">작성한 게시물이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
					</table>
				</form>
			</div>
		</div>
	
	<div id="reservationDiv">
		<div class="page-header">
			<h4 style="font-weight:bold;">예약내역</h4>
		</div>
		<div class="card">
				<form id="detailForm_q">
				<input type="hidden" id="res_no" name="res_no">
					<table class="table table-responsive-sm table-striped" id="resList">
						<colgroup>
		            <col width="7%" />
		            <col width="8%" />
		            <col width="16%" />
		            <col width="5%" />
		            <col width="9%" />
		            <col width="8%" />
		            <col width="10%" />
		            <col width="11%" />
		         </colgroup> 
		         <thead>
		            <tr>
		            	<th></th>
		               <th>객실명</th>
		               <th>숙박일</th>
		               <th>총 인원</th>
		               <th>예약일</th>
		               <th>총 금액</th>
		               <th>예약번호</th>
		               <th>상태</th>
		            </tr>
		         </thead>
		         <tbody class="res_tbody">
		      		<c:choose>
		               <c:when test="${not empty selectList}">
		                     <c:forEach var="select" items="${selectList}" varStatus="status" >
								<tr class="resDiv" data-num="${select.pay_no}">
		                           	<td data-state="stay"><img class="r_image" src="/uploadStorage/room/${select.r_main}" alt="객실 이미지"/>
		                           	</td>
		                              <td data-state="stay">${select.r_name }
		                              		<br/><span class="r_info">${select.r_size }</span>
		                              		<br/><span class="r_info" style="font-size:80%;">기준 ${select.r_standard }명/최대 ${select.r_max }명</span>
		                              </td>
		                              <td>${select.res_indate }(${select.res_night }박) ~ ${select.res_outdate }</td>
		                              <td> ${select.res_people }명</td>
		                              <td >${select.res_date}</td>
		                              <td><span class="pay_price">${select.pay_price }</span>원</td>
		                              <td><c:if test="${select.res_no == select.res_gno}">
		                              		${select.res_gno } 
		                              	</c:if> </td>
		                              <td>
		                              	<c:if test="${select.res_no == select.res_gno}">
		                              	 	${select.res_state }
		                              	</c:if>
		                              	 <c:if test="${select.res_no == select.res_gno and select.res_state=='예약완료' and select.dday>0}">
		                              		<input type='button' value="환불 처리" class="refundBtn">
		                              		<input type="hidden" value="${select.res_gno }" class="res_gno">
		                              		<br><br>
		                              		<div style="font-size:90%; color:red">환불 금액 : <span class="refundMoney"></span>원
		                              		<br>수수료 : <span class="percent"></span>%
		                              		<br>(입실 <span class="dday">${select.dday }</span>일전)</div>
		                              	</c:if> 
		                              	
		                              </td>
		                         </tr>
		                     </c:forEach>
		               </c:when>
		               <c:otherwise>
		               <tr>
		                  <td colspan="7" class="tac">등록된 게시물이 존재하지 않습니다.</td>
		               </tr>
		            </c:otherwise>
		         </c:choose> 
		        
		         </tbody>
				</table>
			</form>
		</div>
	</div>
</div>