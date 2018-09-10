<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style>
   
/* {
   font-size: 18px;
   } */
</style>

<link rel="stylesheet" href="/resources/include/dist/introcss/bootstrap.min.css" />
<body>

<div class="container">
<div class="page-header">
			<h2 style="font-weight:bold">펜션소개</h2>
		</div>  
   <div id="myCarousel" class="carousel slide" data-ride="carousel">

      <!-- Indicators -->
      <ol class="carousel-indicators">
         <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
         <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
         <li data-target="#myCarousel" data-slide-to="2" class="active"></li>
         <li data-target="#myCarousel" data-slide-to="3" class="active"></li>
         <li data-target="#myCarousel" data-slide-to="4" class="active"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
         <div class="item active">
            <img src="/resources/image/main3.jpg">
         </div>
         <div class="item">
            <img src="/resources/image/main4.jpg" alt="Second slide">
         </div>
         <div class="item">
            <img src="/resources/image/main5.jpg" alt="Third slide">
         </div>
         <div class="item active">
            <img src="/resources/image/main1.jpg">
         </div>
         <div class="item active">
            <img src="/resources/image/main2.jpg">
         </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button"
         data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
         aria-hidden="true"></span> <span class="sr-only">Previous</span>
      </a> <a class="right carousel-control" href="#myCarousel" role="button"
         data-slide="next"> <span
         class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
         <span class="sr-only">Next</span>
      </a>
   </div>
   <div class="container py-5">
      <br>
      <h2>PENSION KING</h2>
      <p style="font-size: 18px;">
         [시설개요]<br /> 수영장 / 개별 BBQ / 모든 객실 무료 Wi-Fi<br /> <br />
         [시설정보]<br /> ㅁ BBQ 이용안내<br /> - 제공품목 : 숯, 그릴 세트<br /> 
         - 이용시간 : 18:00 ~ 22:00<br /> <br /> 
         ㅁ수영장<br /> 
         - 이용기간: 하절기<br /> - 이용시간: 오전 10시~일몰<br /> 
         - 주의사항: 수영복,수영모 반드시 착용하셔야 합니다. 반바지 및 티셔츠 금지!
      </p>
   </div>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   </div>
</body>