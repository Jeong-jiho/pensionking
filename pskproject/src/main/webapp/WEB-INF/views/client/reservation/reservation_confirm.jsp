<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="/resources/include/css/resskin.css" />
<link rel="stylesheet" href="/resources/include/css/resskin2.css" />
<link rel="stylesheet" href="/resources/include/css/resskin3.css" />
<link rel="stylesheet" href="/resources/include/css/resskin4.css" />
<style type="text/css">
	.r_image{width:120px; height:90px;}
	body{font-size:170%}
	.r_info{font-size:70%;}

</style>
<script type="text/javascript">
	$(function(){
		$("#ctt_ctt_total").val();
		var total = 0;
		for(var i=0; i<"${selectList.size()}"; i++){
			total = (total*1) + parseInt($(".resDiv:eq("+i+")").find(".res_price").val()); 
			
			$("#info").append("<input type='hidden' name='pay_price' value='"+$(".resDiv:eq("+i+")").find(".res_price").val()+"'");
			
		}
		$("#ctt_ctt_total").html(total);
		$("#price").html(total);
		$("#pay_price").val(total);
		$("#r_no1").val($(".resDiv:eq(0)").find(".r_no1").val());
		$("#res_indate").val($(".resDiv:eq(0)").find(".res_indate").val());
		$("#res_outdate").val($(".resDiv:eq(0)").find(".res_outdate").val());
		//결제버튼 클릭시
		$("#payBtn").click(function(){
			for(var i=0; i<"${selectList.size()}"; i++){
				$(".resDiv:eq("+i+")").find(".r_no").attr("name","resVoList["+i+"].r_no");
				$(".resDiv:eq("+i+")").find(".r_no1").attr("name","resVoList["+i+"].r_no1");
				$(".resDiv:eq("+i+")").find(".res_night").attr("name","resVoList["+i+"].res_night");
				$(".resDiv:eq("+i+")").find(".res_people").attr("name","resVoList["+i+"].res_people");
				$(".resDiv:eq("+i+")").find(".res_price").attr("name","resVoList["+i+"].res_price");
				$(".resDiv:eq("+i+")").find(".res_indate").attr("name","resVoList["+i+"].res_indate");
				$(".resDiv:eq("+i+")").find(".res_outdate").attr("name","resVoList["+i+"].res_outdate");
				$(".resDiv:eq("+i+")").find(".res_bbq").attr("name","resVoList["+i+"].res_bbq");
				
			}
			if (confirm('결제를 하시겠습니까?')) {
				$("#resForm").attr({
					"method" : "post",
					"action" : "/reservation/payInsert.do"
				});
				$("#selectForm").submit(); 
			}else{
				return false; 
			}
			
		});


		
	});
	var MsgFlag = true;
    var paytype = "bank";
    function PaySubmitCheck() {
       var form = document.pay_fm;

       if (paytype == "bank") {
          if (form.payment_name.value == '') {
             alert('[입금자명]을 기재해 주세요.');
             form.payment_name.focus();
             return false;
          }
       }
       return true;
       
       
    }

    function ClickPayType(type) {
       form = document.pay_fm;
       var str = true;
       var color = "#eeeeee";
       if (type == "bank") {
          str = false;
          color = "#ffffff";
       }
       paytype = type;
       form.payment_bank.disabled = str;
       form.payment_name.disabled = str;
       form.payment_bank.style.background = color;
       form.payment_name.style.background = color;
    }
</script>
<div class="container">
<div class="payDiv">
<form id="resForm">
   <div id="rsvSysroot">
   <div class="dtitle">선택객실목록</div>
   	<div class="card ">
		      <div class="card-body">
		      
		      <table class="table table-responsive-sm table-striped" id="cartList">
		         <colgroup>
		            <col width="14%" />
		            <col width="10%" />
		            <col width="16%" />
		            <col width="8%" />
		            <col width="8%" />
		            <col width="14%" />
		            <col width="14%" />
		         </colgroup>
		         <thead>
		            <tr>
		            	<th></th>
		               <th>객실명</th>
		               <th>숙박일</th>
		               <th>총 인원</th>
		               <th>비비큐</th>
		               <th>기간</th>
		               <th>총 금액</th>
		            </tr>
		         </thead>
		         <tbody class="res_tbody">
		      		<c:choose>
		               <c:when test="${not empty selectList}">
		                     <c:forEach var="select" items="${selectList}" varStatus="status" >

		                           <tr class="resDiv" data-num="${select.r_no}">
		                           	<td data-state="stay"><img class="r_image" src="/uploadStorage/room/${select.r_main}" alt="객실 이미지"/>
		                           		<input type="hidden"  class="r_no" value="${select.r_no }">
		                           		<input type="hidden" class="r_no1" value="${select.r_no1 }">
		                           	</td>
		                              <td data-state="stay">${select.r_name }
		                              		<br/><span class="r_info">${select.r_size }</span>
		                              		<br/><span class="r_info">기준 ${select.r_standard }명/최대 ${select.r_max }명</span>
		                              </td>
										
		                              <td>
			                              ${select.res_indate }(${select.res_night }박) ~ ${select.res_outdate }
			                              <input type="hidden" class="res_night" value="${select.res_night }">
			                              <input type="hidden" class="res_indate" value="${select.res_indate }"/>
										<input type="hidden" class="res_outdate" value="${select.res_outdate }"/>
			                          </td>
		                              <td>
			                              ${select.res_people }명
			                              <input type="hidden" class="res_people" value="${select.res_people }">
			                              </td>
		                              <td>${select.res_bbq }
		                              	<input type="hidden" class="res_bbq"  value="${select.res_bbq }">
		                              </td>
		                    
		                              <td >${select.bs}

		                              </td>
		                              <td>${select.r_price }원
		                              <input type="hidden" value = "${select.r_price }" class="res_price">
		                              
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
		     </div>
	</div> 
	
      

     
      <div class="divsum">
         <div>
            <span>예약 총 금액 : </span> <b><span id="ctt_ctt_total"></span></b> 원
         </div>
      </div>
      <div class="divBox" style="margin-top: 20px;">
         <div class="dtitle">이용시유의사항</div>

         <div class="smtView">

            <p>
               보호자 동반없는 <span style="color: rgb(255, 108, 0);">미성년자는 예약 및
                  입실 불가합니다.</span>
            </p>
            <p>
               예약시 신청하신 <span style="color: rgb(255, 108, 0);">인원이외에 추가인원은
                  입실이 거부될 수 있습니다.</span>
            </p>
            <p>예약인원 초과로 인한 입실 거부시 환불도 되지 않으니 유의하시기 바랍니다.</p>
            <p>예약후 펜션이나 객실 변경은 해당예약 취소후 다시 예약하셔야 합니다.</p>
            <p>
               예약변경을 위한 <span style="color: rgb(255, 108, 0);">취소시에도 취소수수료가
                  부과</span>되오니 신중하게 예약하시기 바랍니다.
            </p>
            <p>최대인원이 2인인 커플전용룸의 경우 유아나 아동은 동반입실이 불가능합니다.</p>
            <p>
               <span style="color: rgb(255, 108, 0);">애완견 동반시 입실이 불가능 </span>합니다.
            </p>
            <p>퇴실 시에는 내집같이 정돈을 부탁 드립니다.</p>

         </div>


         <div id="ctt_ctt_cc_title" class="dtitle" style="margin-top: 20px;">
            환불/취소수수료 안내</div>


         <div class="cancelnote">
            <p>예약취소는 구매한 사이트 "MYPAGE" 혹은 "예약확인/취소"에서 가능합니다.</p>
            <p>
               취소수수료는 예약시점과는 무관한 <b>이용시작일 기준</b>입니다.
            </p>
            <p>
               환불시 <b>결제하신 금액에서 취소수수료를 제외한 금액을 환불</b>해 드립니다.
            </p>
            <p>취소수수료는 결제금액이 아닌 예약금(객실요금+기타옵션요금) 기준으로 책정됩니다.</p>
            <p>
               <b>취소수수료가 100% 인 경우 전액 환불되지 않습니다.</b>
            </p>
            <p>수수료 내역은 아래와 같습니다.</p>
         </div>

         <table class="cancelfee">
            <tr>
               <th>기준</th>
               <th>취소수수료(%)</th>
               <th>환불액(%)</th>
            </tr>

            <tr>
               <td>이용일 <b>당일</b> 취소시
               </td>
               <td>100%</td>
               <td>0% 환불없음</td>
            </tr>

            <tr>
               <td>이용일 <b>1</b> 일전 취소시
               </td>
               <td>100%</td>
               <td>0% 환불없음</td>
            </tr>

            <tr>
               <td>이용일 <b>2</b> 일전 취소시
               </td>
               <td>80%</td>
               <td>20% 환불</td>
            </tr>

            <tr>
               <td>이용일 <b>3</b> 일전 취소시
               </td>
               <td>50%</td>
               <td>50% 환불</td>
            </tr>

            <tr>
               <td>이용일 <b>4</b> 일전 취소시
               </td>
               <td>50%</td>
               <td>50% 환불</td>
            </tr>

            <tr>
               <td>이용일 <b>5</b> 일전 취소시
               </td>
               <td>30%</td>
               <td>70% 환불</td>
            </tr>

            <tr>
               <td>이용일 <b>6</b> 일전 취소시
               </td>
               <td>20%</td>
               <td>80% 환불</td>
            </tr>

            <tr>
               <td>이용일 <b>7</b> 일전 취소시
               </td>
               <td>10%</td>
               <td>90% 환불</td>
            </tr>

            <tr id="ctt_ctt_CancelFee_tr_basefee" class="basefee">
               <td>기본 취소 수수료</td>
               <td>10%</td>
               <td>90% 환불</td>
            </tr>
         </table>
      </div>

      <div class="row">
         	
            <input type="hidden"  name="r_no1" id="r_no1" />
			<input type="hidden" name="res_indate" id="res_indate">
			<input type="hidden" name="res_outdate" id="res_outdate">
            <div class="col-md-6">
               <div class="box box-solid box-primary">
                  <div class="box-body">
                     <h5 class="strong">
                        <b>결제요금 : </b>
                     </h5>
                     <h5 class="strong">
                        <b>결제방법선택 : <input type="radio"
                           value="무통장입금" checked="checked" onclick="ClickPayType('bank')">
                           무통장입금
                        </b>
                     </h5>
                     
                     <h5 class="strong">
                        <b>입금자명</b>
                     </h5>
                     <div class="form-group">
                        <input type="text" id="pay_name" value="${login.m_name }" readOnly = true>
                      </div>
                      <h5 class="strong">
                        <b>입금은행</b>
                     </h5>
                     <div class="form-group">
                        <input type="text" id="pay_bank" name="pay_bank">
                     </div>
                     <h5 class="strong">
                        <b>계좌번호</b>
                     </h5>
                     <div class="form-group">
                        <input type="text" id="pay_acc" name="pay_acc">
                     </div>
                     <h5 class="strong">
                        <b>금액</b>
                     </h5>
                     <div class="form-group">
                        <span id="price"></span>원
                        <input type="hidden" id="pay_price" name="pay_price">
                     </div>
                     <div id="info">
                     	
                     </div>
                        <hr>
                        <div class="alert alert-danger">
                           <i class="fa fa-check"></i> <strong>24</strong>시간 이내로 입금이 안될 경우
                           예약내용은 자동으로 예약취소가 되오니 이점 유의하시기 바랍니다.
                        </div>

                     <div class="box-footer">
                        <button class="btn btn-primary" id="prevBtn">이전단계</button>
                        <button class="btn btn-primary" id="payBtn" >결제하기</button>
                        <br>
                        <br>
                        
                     </div>
                  </div>
               </div>
            </div>
        
      </div>
   </div>
 </form>
	
</div>
</div>