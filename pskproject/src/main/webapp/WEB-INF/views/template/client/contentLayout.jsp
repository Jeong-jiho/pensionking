<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<!-- 브라우저의 호환성 보기 모드를 막고,
      해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML을 보여주도록 설정한다. -->

<meta name="viewport"
   content="width=device-width, initial-scle=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<!-- viewport : 화면에 보이는 영역을 제어하는 기술, width는 device-width로 설정.initial-scale은 초기비율 -->

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />


<!-- CSS -->
<link rel="stylesheet" href="/resources/include/dist/maincss/bootstrap.min.css" />
<!--  <link rel="stylesheet" href="/resources/include/dist/logincss/global.css" /> -->
<link rel="stylesheet" href="/resources/include/css/sticky-footer-navbar.css" />
 
<!-- JS -->
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src=" /resources/include/dist/roominfo/tport.js"></script>
<script type="text/javascript" src=" /resources/include/dist/roominfo/glide.js"></script>
<script src=" /resources/include/dist/roominfo/jquery-3.3.1.min.js"></script>
<script src=" /resources/include/dist/roominfo/tport.js"></script>
<script src=" /resources/include/dist/roominfo/glide.js"></script>


 
<!-- 윗 부분까지 기본 템플릿으로 설정 -->
</head>
<body>
   <!-- header 설정 -->
    <tiles:insertAttribute name="header" />
   
   
      <!-- content 내용 영역 -->
      <tiles:insertAttribute name="body" />
    

   <footer class=footer>
      <!-- footer 설정 -->
   <tiles:insertAttribute name="footer" />
   </footer>

   <!-- Bootstrap core JavaScript
    ================================================== -->
   <!-- Placed at the end of the document so the pages load faster -->
   <!-- <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
   <script src="/resources/include/dist/js/bootstrap.min.js"></script>
   <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
   <script
      src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>