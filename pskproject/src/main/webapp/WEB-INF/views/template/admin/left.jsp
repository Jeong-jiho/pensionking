<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">    

<nav class="sidebar-nav ps ps--active-y">
	<ul class="nav">
		<li class="nav-item">
			<a class="nav-link" href="/statistics/main.do">
			<i class="nav-icon icon-drop fas fa-home" style="font-size:140%; margin:0px 20px 0px 5px;"></i> 홈</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/admin/room/roomList.do">
			<i class="nav-icon icon-drop fas fa-hotel" style="font-size:140%; margin:0px 20px 0px 5px;"></i> 객실관리</a>
		</li>
		<li class="nav-item nav-dropdown">
			<a class="nav-link nav-dropdown-toggle" href="#">
			<i class="nav-icon icon-puzzle fas fa-book-open" style="font-size:140%; margin:0px 20px 0px 5px;"></i> 예약관리</a>
			<ul class="nav-dropdown-items">
				<li class="nav-item">
				<a class="nav-link" href="/admin/res/resList.do">
				<i class="nav-icon icon-puzzle far fa-list-alt" style="font-size:140%; margin:0px 20px 0px 5px;"></i> 예약리스트</a>
				</li>
				<li class="nav-item">
				<a class="nav-link" href="/admin/res/resCalendar.do">
				<i class="nav-icon icon-puzzle far fa-calendar-alt" style="font-size:140%; margin:0px 20px 0px 5px;"></i> 실시간 달력</a>
				</li> 
			</ul>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/statistics/statistics.do">
			<i class="nav-icon icon-puzzle fas fa-chart-line" style="font-size:140%; margin:0px 20px 0px 5px;"></i> 통계</a>
		</li>
		<li class="nav-item nav-dropdown">
			<a class="nav-link nav-dropdown-toggle" href="#">
			<i class="nav-icon icon-puzzle fas fa-book-open" style="font-size:140%; margin:0px 20px 0px 5px;"></i> 회원/직원관리</a>
			<ul class="nav-dropdown-items">
				<li class="nav-item"> 
					<a class="nav-link" href="/admin/member/memberList.do">
					<i class="nav-icon icon-drop fas fa-hotel" style="font-size:140%; margin:0px 20px 0px 5px;"></i> 회원관리</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/admin/employee/employeeList.do">
					<i class="nav-icon icon-drop fas fa-hotel" style="font-size:140%; margin:0px 20px 0px 5px;"></i> 직원관리</a>
				</li>
			</ul>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/admin/stock/stockList.do">
			<i class="nav-icon icon-drop fas fa-hotel" style="font-size:140%; margin:0px 20px 0px 5px;"></i> 비품관리</a>
		</li>
		<li class="nav-item nav-dropdown">
			<a class="nav-link nav-dropdown-toggle" href="#">
			<i class="nav-icon icon-puzzle fas fa-book-open" style="font-size:140%; margin:0px 20px 0px 5px;"></i> 게시판관리</a>
			<ul class="nav-dropdown-items">
				<li class="nav-item">
				<a class="nav-link" href="/admin/notice/noticeList.do">
				<i class="nav-icon icon-puzzle far fa-list-alt" style="font-size:140%; margin:0px 20px 0px 5px;"></i> 공지사항</a>
				</li>
				<li class="nav-item">
				<a class="nav-link" href="/admin/review/reviewList.do">
				<i class="nav-icon icon-puzzle far fa-calendar-alt" style="font-size:140%; margin:0px 20px 0px 5px;"></i> 후기</a>
				</li> 
				<li class="nav-item">
				<a class="nav-link" href="/admin/qna/qnaList.do">
				<i class="nav-icon icon-puzzle far fa-calendar-alt" style="font-size:140%; margin:0px 20px 0px 5px;"></i> Q&A</a>
				</li> 
			</ul>
		</li>
	</ul>
</nav>
<button type="button" class="sidebar-minimizer brand-minimizer"></button>