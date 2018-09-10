<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<link rel="stylesheet" href="/resources/include/css/jquery-ui.css" />
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/jquery-ui.js"></script>

<style type="text/css">
   .r_image{width:120px; height:90px;}
   .r_info{font-size:70%;}
   

</style>

<script type="text/javascript">
   //$(".payDiv").hide(); 
   var r_size = "${roomList.size()}";
   var rs_size = "${resRoom.size()}";
   $(function() {
      
      for(var i=0; i<r_size; i++){
         if($(".roomDiv:eq("+i+")").attr("data-num") == "${select.r_no}"){

            $(".roomDiv:eq("+i+")").find(".r_check").attr("checked","checked");
         }
      }
      for(var i=0; i<rs_size; i++){
         //console.log($(".resRoomNo").attr('data-num'));
         for(var j=0; j<r_size; j++){
            if($(".resRoomNo:eq("+i+")").attr('data-num') == $(".roomDiv:eq("+j+")").attr("data-num")){
               $(".roomDiv:eq("+j+")").find("td").each(function(){
                  if($(this).attr("data-state") != "stay"){
                     $(this).html("");

                  }
               });
               $(".roomDiv:eq("+j+")").find(".priceForm").html("예약완료");
               
            }
         }
      } 
      
      var dateOptions = [];
      var date1 = ""
      for(var i=0; i<"${select.res_indate}".length;++i){
         var character = "${select.res_indate}".charAt(i);
         if(character != ' '){
            date1 = date1 + character; 
         }else{
            dateOptions.push(date1);
            date1 = "";
             
         }
         
      }
      
      
      
      var date= new Date(dateOptions[0]+"-"+dateOptions[1]+"-"+dateOptions[2]);
      
      var y = date.getFullYear(); // 현재 연도
      var m = date.getMonth()+1; // 현재 월
      var d = date.getDate();
      
      console.log(d);
      $("#res_indate").val(dateOptions[0]+"-"+dateOptions[1]+"-"+dateOptions[2]);

      var last = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
      // 4년마다 있는 윤년을 계산합니다.(100년||400년 주기는 제외)
      if (y % 4 && y % 100 != 0 || y % 400 === 0) {
         lastDate = last[1] = 29;
      } 
      
      var d = d+1;
      
      
      if(d > last[m]){
         if(m+1>12){
            m = m-11;
         }else{
            m = m+1;
            
         }
         d = d-last[m];
         
      } else{
         m = m
         
      }
      
      
      $("#res_outdate").val(getDate(y+"-"+m+"-"+d));

      //datepicker 한국어로 사용하기 위한 언어설정
      $.datepicker.setDefaults({ 
         dateFormat : "yyyy-mm-dd", // 날짜의 형식
         prevText : '이전 달',
         nextText : '다음 달',
         monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', 
               '9월', '10월', '11월', '12월' ],
         monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
               '9월', '10월', '11월', '12월' ],
         dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
         dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
         dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
         showMonthAfterYear : true,
         yearSuffix : '년',
         changeYear : true,
         numberOfMonths : 2,
         showButtonPanel : true
      });

      //시작일.
      $('#res_indate').datepicker({
               showOn : "both", // 달력을 표시할 타이밍 (both: focus or button)
               buttonImage : "/resources/image/calendar.png", // 버튼 이미지
               //buttonImageOnly : true, // 버튼 이미지만 표시할지 여부
               buttonText : "날짜선택", // 버튼의 대체 텍스트               
               dateFormat : "yy-mm-dd",
               changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
               minDate : 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
               onClose : function(selectedDate) {
                  // 시작일(fromDate) datepicker가 닫힐때
                  // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                  $("#res_outdate").datepicker("option", "minDate",
                        selectedDate);
                  $("#res_outdate").datepicker("option", "maxDate",
                          selectedDate);
               }
            });

      //종료일
      $('#res_outdate').datepicker({
         showOn : "both",
         buttonImage : "/resources/image/calendar.png",
         //buttonImageOnly : true,
         buttonText : "날짜선택",
         dateFormat : "yy-mm-dd",
         changeMonth : true,
         //minDate: 0, // 오늘 이전 날짜 선택 불가
         onClose : function(selectedDate) {
            // 종료일(endDate) datepicker가 닫힐때
            // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
            $("#res_indate").datepicker("option", "maxDate", selectedDate);
         }
      }); 
      
      $("#resBtn").click(function(){
         /* $(".selectDiv").hide();
         $(".payDiv").show();
         var radio = $("input[name='r_check']:checked");
   
         var tbody = $(".res_tbody");
         tbody.find("tr").remove();
            var tr = radio.parent().parent();
            var td = tr.children();
            
            //체크된 row의 모든 값을 배열에 담는다 
            
            
            //td.eq(0)은 체크박스 이므로 td.eq(1)의 값부터 가져온다.
            var r_main = td.eq(1).find("input").val();
            var r_name = td.eq(2).find(".r_name").val();
            var r_size = td.eq(2).find(".r_size").val()+",";
            var r_standard = td.eq(2).find(".r_standard").val();
            var r_max = td.eq(2).find(".r_max").val();
            var res_night = td.eq(3).find(".res_night option:selected").val();
            var res_people = td.eq(4).find(".res_people option:selected").val();
            var res_bbq = "X";
            td.eq(5).find("input[name='r_bbq']:checked").each(function(){
               res_bbq = "O";
            });
            var res_indate = $("#res_indate").val();
            var res_outdate = $("#res_outdate").val();
            //var res_bbq = td.eq(5).text();
            var bs = td.eq(6).text();
            var res_price = td.eq(7).find(".price").text()+td.eq(7).find(".addPrice").text();


            var content = "<tr>"; 
            content += "<td>" + r_main + "</td>";
            content += "<td>" + r_name + "<br/>" ;
            content += r_size + "</br>";
            content += "기준"+r_standard + "/최대"+r_max+"</td>";
            content += "<td>" + res_indate +"("+res_night+"박) ~ "+res_outdate + "</td>";
            content += "<td>" + res_people + "</td>";
            content += "<td>" + res_bbq + "</td>";
            content += "<td>" + bs + "</td>";
            content += "<td>" + res_price + "</td>";

            content += "</tr>";
            tbody.append(content); */
            var i = 0;
            var x;

            $(".r_check").each(function(){
               if( $(this).is(":checked")){
               //var checkbox = $("input[name='r_check']:checked");
               var tr = $(this).parent().parent();
               var td = tr.children();
   
               tr.find(".res_night").val(td.eq(3).find(".night option:selected").val());
               tr.find(".res_people").val(td.eq(4).find(".people option:selected").val());
               var res_bbq = "X";
               tr.find(".bbq:checked").each(function(){
                  res_bbq = "O";
               });
               tr.find(".res_bbq").val(res_bbq); 
               tr.find(".indate").val($("#res_indate").val());
               tr.find(".outdate").val($("#res_outdate").val());
               if(tr.find(".c_price").html()==''){
                  tr.find(".c_price").html(td.eq(7).find(".price").text());
               }
               tr.find(".r_price").val(td.eq(7).find(".c_price").text());
               tr.find(".r_add").val(td.eq(7).find(".addPrice").text());
               if(i==0){
                  x = $(this).parent().parent().attr("data-num");
               }else{
                  x = x;
               }
               tr.find(".r_no1").val(x);
                
               tr.find(".r_no").attr("name","resVoList["+i+"].r_no");
               tr.find(".r_no1").attr("name","resVoList["+i+"].r_no1");
               tr.find(".r_main").attr("name","resVoList["+i+"].r_main");
               tr.find(".r_name").attr("name","resVoList["+i+"].r_name");
               tr.find(".r_size").attr("name","resVoList["+i+"].r_size");
               tr.find(".r_standard").attr("name","resVoList["+i+"].r_standard");
               tr.find(".r_max").attr("name","resVoList["+i+"].r_max");
               tr.find(".res_night").attr("name","resVoList["+i+"].res_night");
               tr.find(".res_people").attr("name","resVoList["+i+"].res_people");
               tr.find(".res_bbq").attr("name","resVoList["+i+"].res_bbq");
               tr.find(".indate").attr("name","resVoList["+i+"].res_indate");
               tr.find(".outdate").attr("name","resVoList["+i+"].res_outdate");
               tr.find(".r_price").attr("name","resVoList["+i+"].r_price");
               tr.find(".bs").attr("name","resVoList["+i+"].bs");
               
               i++
               
               
               console.log(x);
               }
               
         }); 
            
          $("#selectForm").attr({
            "method" : "post",
            "action" : "/reservation/resConfirm.do"
         });
         $("#selectForm").submit(); 

         
      });

      $(".night").change(function(){
         $(this).parents(".roomDiv").find(".price").hide();
         var price = $(this).parents(".roomDiv").find(".price").text();
         price = price * $(this).parents(".roomDiv").find(".night").val();
         if($(this).parents(".roomDiv").find(".people").val() == '4'){
            price = price;
         }else if($(this).parents(".roomDiv").find(".people").val() == '5'){
            price = (price-0) + 10000;
         }else{
            price = (price-0) + 20000;
         }
         if($(this).parents(".roomDiv").find(".bbq").is(":checked")){
            price = (price-0) + ($(this).parents(".roomDiv").find(".people").val()*10000);
         }
         $(this).parents(".roomDiv").find(".c_price").html(price);
         
      });
      $(".people").change(function(){
         $(this).parents(".roomDiv").find(".price").hide();
         var price = $(this).parents(".roomDiv").find(".price").text();
         price = price * $(this).parents(".roomDiv").find(".night").val();
         var x;
         if($(this).parents(".roomDiv").find(".people").val() == '4'){
            price = price;
            x = 0;
         }else if($(this).parents(".roomDiv").find(".people").val() == '5'){
            price = (price-0) + 10000;
            x = 1;
         }else{
            price = (price-0) + 20000;
            x = 2;
         }
         if($(this).parents(".roomDiv").find(".bbq").is(":checked")){
            price = (price-0) + ($(this).parents(".roomDiv").find(".people").val()*10000);
         }
         $(this).parents(".roomDiv").find(".c_price").html(price);
         var x = $(this).parents(".roomDiv").find(".addPrice").html("추가인원 + " + x + "명"); 
      });
      $(".bbq").change(function(){
         $(this).parents(".roomDiv").find(".price").hide();
         var price = $(this).parents(".roomDiv").find(".price").text();
         price = price * $(this).parents(".roomDiv").find(".night").val();
         var x;
         if($(this).parents(".roomDiv").find(".people").val() == '4'){
            price = price;
            x = 0;
         }else if($(this).parents(".roomDiv").find(".people").val() == '5'){
            price = (price-0) + 10000;
            x = 1;
         }else{
            price = (price-0) + 20000;
            x = 2;
         }
         if($(this).parents(".roomDiv").find(".bbq").is(":checked")){
            price = (price-0) + ($(this).parents(".roomDiv").find(".people").val()*10000);
         }
         $(this).parents(".roomDiv").find(".c_price").html(price);
      }); 
      
   });
   
   function getDate(x){
      var date = new Date(x);
      var y = date.getFullYear();
      var m = date.getMonth()+1;
      var d = date.getDate();

      if(m<10){
         m = "0" + m;
      }
      if(d<10){
         d = "0" + d   ;
      }
      
      return (y+"-"+m+"-"+d);
   }
    
    
</script>

<!-- 윗 부분까지 기본 템플릿으로 설정 -->
</head>
<body>
<div class="container">
<div class="selectDiv">
   <div class="container">
      <div class="col-lg-3 col-md-3">
         <div class="archive-widget">
         </div>
      </div>
      
         <div class="col-lg-9 col-md-9">
            
            <div class="col-sm-12">
             <label for="res_indate">Check In</label>
                <input class="dateInput" type="text" id="res_indate"
                  name="res_indate" maxlength="10" value="" readOnly = true/>&nbsp;&nbsp;
            
            
            <label for="res_outdate">Check
               Out</label>
            
               <input type="text" id="res_outdate" name="res_outdate"
                  maxlength="10" value=""  readOnly = true/>
            </div>
         
      </div>
   <form id="selectForm">
      <div class="box box-solid box-primary">
         <div class="box-header">
            <h3 class="box-title">
               <small class="badge bg-red">예약가능 객실</small>
            </h3>
            <div class="card ">
            <div class="card-body">
            <table class="table table-responsive-sm table-striped" id="roomList">
               <colgroup>
                  <col width="6%" />
                  <col width="14%" />
                  <col width="16%" />
                  <col width="12%" />
                  <col width="12%" />
                  <col width="8%" />
                  <col width="14%" />
                  <col width="14%" />
               </colgroup>
               <thead>
                  <tr>
                     <th>선택</th>
                     <th></th>
                     <th>객실명</th>
                     <th>숙박일</th>
                     <th>추가 인원</th>
                     <th>비비큐</th>
                     <th>기간</th>
                     <th>총 금액</th>
                  </tr>
               </thead>
               <tbody>
              <c:choose>
                     <c:when test="${not empty roomList}">
                           <c:forEach var="room" items="${roomList}" varStatus="status" >
                                 
                                 <tr class="roomDiv" data-num="${room.r_no}" >
                                 
                                 <td><input type="checkbox"  class="r_check" name = "r_check"></td>
                                    <td data-state="stay"><img class="r_image" src="/uploadStorage/room/${room.r_main}" alt="객실 이미지"/>
                                       <input type="hidden"  class="r_main" value="${room.r_main }">
                                       <input type="hidden" class="r_no" value="${room.r_no }" >
                                       <input type="hidden" class="r_no1">
                                 <input type="hidden" class="indate"/>
                           <input type="hidden" class="outdate" />
                                    </td>
                                    <td data-state="stay">${room.r_name }
                                          <br/><span class="r_info">${room.r_size }</span>
                                          <br/><span class="r_info">기준 ${room.r_standard }명/최대 ${room.r_max }명</span>
                                          <input type="hidden" class="r_name" value="${room.r_name }">
                                          <input type="hidden" class="r_size" value="${room.r_size }">
                                          <input type="hidden" class="r_standard" value="${room.r_standard }">
                                          <input type="hidden" class="r_max" value="${room.r_max }">
                                    </td>
                              
                                    <td>기간<br/>
                                       <select name="res_night"  class="night">
                                             <option value="1" >1박
                                             <!-- <option value="2" >2박
                                             <option value="3">3박 -->
                                       </select>
                                       <input type="hidden" class="res_night">
                                   </td>
                                    <td>인원<br/>
                                       <select name="res_people" class="people">
                                             <option value= "4" >4명
                                             <option value="5" >5명
                                             <option value="6">6명
                                       </select>
                                       <input type="hidden" class="res_people" >
                                       </td>
                                    <td><input type="checkbox"  class="bbq" >
                                       <input type="hidden" class="res_bbq">
                                    </td>
                          
                                    <td >${select.bs}
                                     <input type="hidden" class="bs" value="${select.bs }" >
                                    </td>
                                   
                                    <td data-state="stay">
                                       <div class="priceForm">
                                          <span class="price">
                                          <c:set var="bs" value="${select.bs}" />
                                          <c:if test="${bs == '비수기 주중'}"><input type="hidden" class="rp" value="${room.pr_weekday }"/>${room.pr_weekday }</c:if>
                                          <c:if test="${bs == '비수기 주말'}"><input type="hidden" class="rp" value="${room.pr_weekend }"/>${room.pr_weekend }</c:if>
                                          <c:if test="${bs == '성수기 주중'}"><input type="hidden" class="rp" value="${room.pr_sweekday }"/>${room.pr_sweekday }</c:if>
                                          <c:if test="${bs == '성수기 주말'}"><input type="hidden" class="rp" value="${room.pr_sweekend }"/>${room.pr_sweekend }</c:if>
                                          </span>
                                          <span class="c_price"></span>
                                          <span >
                                          원
                                          </span>
                                       </div>
                                       <span class="addPrice"></span>
                                       <input type="hidden" class="r_price">
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
         </div>
         <div class="box-footer"> 
            <br> <br> <a class="btn btn-primary btn-block btn-lg"
               id="resBtn">예약하기</a>
                <div id="resRoom">
                <c:choose>
                
                     <c:when test="${not empty resRoom}">
                           <c:forEach var="res" items="${resRoom}" varStatus="status">
                            <div class="resRoomNo" data-num="${res.r_no }">
                            </div> 
                           </c:forEach>
                     </c:when>
                  
               </c:choose> 
               </div>

         </div>
      </div>
      </form>
   </div>
</div>
</div>
   <%-- <jsp:include page="reservation_confirm.jsp"/> --%>
</body>