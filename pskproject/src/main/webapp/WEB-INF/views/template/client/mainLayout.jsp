<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<%@ page trimDirectiveWhitespaces="true"%>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!--  <link rel="icon" href="/resources/include/favicon.ico"> -->



<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src=" /resources/include/dist/roominfo/tport.js"></script>
<script type="text/javascript" src=" /resources/include/dist/roominfo/glide.js"></script>
<script src=" /resources/include/dist/roominfo/jquery-3.3.1.min.js"></script>
<script src=" /resources/include/dist/roominfo/tport.js"></script>
<script src=" /resources/include/dist/roominfo/glide.js"></script>
<!-- Bootstrap core CSS -->

<!-- Custom styles for this template -->
<link rel="stylesheet" href="/resources/include/css/carousel.css" />
<link href="/resources/include/dist/maincss/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/include/css/sticky-footer-navbar.css" />

<style type="text/css">
   body {
      /*  background: url('/resources/image/bgimage.png') no-repeat center center fixed; 
       -webkit-background-size: cover;
       -moz-background-size: cover;
       -o-background-size: cover;
       background-size: cover; */
       background-color: #EAEAEA
   }
</style>

</head>
<body>
   
   <!-- nav(네비게이션), 헤더 설정 -->
   <tiles:insertAttribute name="header" />
   <!-- header 끝 -->
   
   <!-- Carousel
    ================================================== -->
   <div>
   <div id="myCarousel" class="carousel slide" data-ride="carousel">
   
      <!-- Indicators -->
      <ol class="carousel-indicators">
         <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
         <li data-target="#myCarousel" data-slide-to="1"></li>
         <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
         <div class="item active">
            <img src="/resources/image/main3.jpg ">
         </div>
         <div class="item">
            <img src="/resources/image/main4.jpg " alt="Second slide">
         </div>
         <div class="item">
            <img src="/resources/image/main5.jpg " alt="Third slide">
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
   <!-- /.carousel -->


   <!-- Marketing messaging and featurettes
    ================================================== -->
   <!-- Wrap the rest of the page in another container to center all the content. -->

   <div class="container marketing">

      <!-- Three columns of text below the carousel -->

      <!-- START THE FEATURETTES -->

      <hr class="featurette-divider">

      <div class="row featurette">
         <div class="col-md-7">
            <h2 class="featurette-heading">
               PENSIONKING POOL <span class="text-muted"></span>
            </h2>
            <p class="lead">최고의 시설</p>
            <p><a class="btn btn-default" href="/room/roomInfo.do" role="button">객실 둘러보기</a></p>
         </div>
         <div class="col-md-5">
            <img class="featurette-image img-responsive"
               src="/resources/image/land1.jpg" alt="Generic placeholder image">
         </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
         <div class="col-md-5">
            <img class="featurette-image img-responsive"
               src="/resources/image/land2.jpg" alt="Generic placeholder image">
         </div>
         <div class="col-md-7">
            <h2 class="featurette-heading">
               BBQ<span class="text-muted"></span>
            </h2>
            <p class="lead">사랑하는 가족 또는 연인과 함께</p>
            <p><a class="btn btn-default" href="/room/amenity.do" role="button">부대시설 보기</a></p>
         </div>
         
      </div>
      
      <hr class="featurette-divider">

      <!-- /END THE FEATURETTES -->

      </div>
      
      <!-- FOOTER -->

      <footer class=footer>
      <!-- footer 설정 -->
      <tiles:insertAttribute name="footer" />
      </footer>
   
   <!-- /.container -->
   </div>

   <!-- Bootstrap core JavaScript
    ================================================== -->
   <!-- Placed at the end of the document so the pages load faster -->
   
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   
   <script type="text/javascript"
      src="/resources/include/dist/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="/resources/include/js/docs.min.js"></script>
   <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
</body>