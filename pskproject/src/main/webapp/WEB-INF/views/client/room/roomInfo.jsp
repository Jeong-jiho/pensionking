<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<link rel="stylesheet" href="/resources/include/dist/roominfocss/room.css">

<title>Room Info</title>
<style type="text/css">
img.wp-smiley, img.emoji {
   display: inline !important;
   border: none !important;
   box-shadow: none !important;
   height: 1em !important;
   width: 1em !important;
   margin: 0 .07em !important;
   vertical-align: -0.1em !important;
   background: none !important;
   padding: 0 !important;
}
</style>


<script>
   $(function() {
      $(".goDetail").click(function() {
         var r_no = $(this).parents("div").attr("data-num");
         $("#r_no").val(r_no);
         console.log(r_no);
         $("#detailForm").attr({
            "method" : "get",
            "action" : "/room/roomDetail.do"
         });
         $("#detailForm").submit();
      });
   });
</script>
</head> 

<body>

	
   <form id="detailForm">
      <input type="hidden" name="r_no" id="r_no" />
   </form>
   <div class="container-fluid">
      <div class="row">
         <!-- 데이터 출력 -->
         <c:choose>
            <c:when test="${not empty roomList }">
               <c:forEach var="room" items="${roomList }" varStatus="status">
                  <div class="col-xs-12 bottom-images" data-num="${room.r_no }">
                     <a class="profile wide-img"> <img
                        src="/uploadStorage/room/${room.r_main}" class="goDetail">
                        <span class="name">${room.r_name }</span>
                     </a>
                  </div>
               </c:forEach>
            </c:when>
         </c:choose>
      
      </div>
         <br><br><br>
   </div>
  
</body>
</html>