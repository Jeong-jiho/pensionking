<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">    

<script type="text/javascript">
	$(function(){
		var id = "${login.m_id}";
		 
		  $("#book").click(function(){
			  if(id == ''){
				alert("로그인 후 이용 하실 수 있습니다");
				document.location.href="/member/login.do"; 
				return false;
			  } 
		}); 
		
		$("#logout").click(function(){
			if(confirm("로그아웃 하시겠습니까?")){
				return true;
			}else{
				window.location.reload();
				return false;
			}
		}); 
	}); 
</script>  

<nav class="navbar navbar-inverse navbar-static-top">
   <div class="container">
      <div class="navbar-header">
         <button type="button" class="navbar-toggle collapsed"
            data-toggle="collapse" data-target="#navbar" aria-expanded="false"
            aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span> <span
               class="icon-bar"></span> <span class="icon-bar"></span> <span
               class="icon-bar"></span>
         </button>
         <a class="navbar-brand" href="/"><img alt="pkimage" src="/resources/image/pk2.png"></a>
      </div>
      <div id="navbar" class="navbar-collapse collapse">
         <ul class="nav navbar-nav">
            <li class="dropdown"><a href="#" class="dropdown-toggle"
               data-toggle="dropdown" role="button" aria-expanded="false">
                  PENSION KING <span class="caret"></span>
            </a>
               <ul class="dropdown-menu" role="menu">
                  <li><a href="/room/intro.do">소개</a></li>
                  <li><a href="/reservation/maps.do">오시는길</a></li> 
                  <li><a href="/notice/noticeList.do">공지사항</a></li>
                  <li><a href="/review/reviewList.do">방문 후기</a></li>
                  <li><a href="/qna/qnaList.do">QnA</a></li>
               </ul></li>
            <li class=""><a href="/room/roomInfo.do">ROOM INFO</a></li>
            <li class=""><a href="/room/amenity.do">AMENITIES</a></li> 
            <li class="dropdown"><a href="#" class="dropdown-toggle"
               data-toggle="dropdown" role="button" aria-expanded="false">
                  RESERVATION <span class="caret"></span>
            </a>
               <ul class="dropdown-menu" role="menu">
                  <li><a id="book" href="/reservation/resCalendar.do">실시간 예약하기</a></li> 
               </ul></li>
         </ul>
          
         <c:if test="${login.m_id != null and login.m_id != ''}">
 			<div class="success">
		         <ul class="nav navbar-nav loginState" style="float:right">
					<li>
					 <a class="nav-link nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
					 <i class="nav-icon icon-puzzle far fa-user" style="font-size:120%;"></i>&nbsp;&nbsp;&nbsp;${login.m_id } 님
					 </a> 
					 <div class="dropdown-menu dropdown-menu-right" style="font-size:100%; ">  
						<ul class="nav navbar-nav">
							<li>
								<a class="dropdown-item" href="/member/myPage.do" >
								<i class="fa fa-bell-o fa-male" style="font-size:130%;"></i> MyPage	</a>
							</li>
							<li>
						 		<a class="dropdown-item" href="/member/logout.do" id="logout"> 
								<i class="fa fa-bell-o fas fa-sign-out-alt" style="font-size:100%;"></i> Logout	</a>
							</li>
						</ul>	
					</div>
					</li>
				</ul>
			</div>
		</c:if> 
		<c:if test="${login.m_id == null or login.m_id == ''}">
			<div class="fail">
				<ul class="nav navbar-nav loginState" style="float:right">
					<li class="nav-item dropdown">
						<a href="/member/login.do" >[로그인]</a>
					</li>
					<li class="nav-item dropdown" style="margin-right:10px;">
						<a href="/member/join.do">[회원가입]</a>
					</li>
				</ul>
      		</div>
      	</c:if>
      </div>
   </div>
</nav>