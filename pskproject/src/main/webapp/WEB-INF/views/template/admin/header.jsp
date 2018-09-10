<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %> 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">    


<button class="navbar-toggler sidebar-toggler d-lg-none mr-auto" type="button" data-toggle="sidebar-show">
<span class="navbar-toggler-icon"></span>
</button>
<a class="navbar-brand" href="/statistics/main.do">
<img class="navbar-brand-full" src="/resources/image/pk2.png" width="180" height="53" alt="CoreUI Logo" style="margin-left:20px;">
<img class="navbar-brand-minimized" src="" width="30" height="30" alt="CoreUI Logo">
</a> 
<button style="font-size:100%;" class="navbar-toggler sidebar-toggler d-md-down-none" type="button" data-toggle="sidebar-lg-show" style="margin-left:20px;">
<span class="navbar-toggler-icon"></span>  

</button>

<ul class="nav navbar-nav d-md-down-none"></ul>
<ul class="nav navbar-nav ml-auto">
	<li class="nav-item dropdown">
		<a class="nav-link" href="/admin/res/resCalendar.do" style=" margin-right:20px;">실시간 달력 보기</a>
	</li>
	<li class="nav-item dropdown" style="margin-right:20px;">
		<a class="nav-link" href="/admin/res/resList.do" role="button" aria-haspopup="true" aria-expanded="false">
			<!-- <img class="img-avatar" src="/resources/image/admin.JPG" alt="admin@bootstrapmaster.com"> -->
			<i class="nav-icon icon-puzzle fas fa-search" style="font-size:130%;"></i>
		</a>
	</li>
	<li class="nav-item dropdown" style="margin-right:10px;">
		<a class="nav-link nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
			<!-- <img class="img-avatar" src="/resources/image/admin.JPG" alt="admin@bootstrapmaster.com"> -->
			<i class="nav-icon icon-puzzle far fa-user" style="font-size:130%;"></i>
		</a>
		<div class="dropdown-menu dropdown-menu-right" style="font-size:100%;"> 
				<a class="dropdown-item" href="/admin/logout.do">
			<i class="fa fa-bell-o fas fa-sign-out-alt" style="font-size:100%;"></i> logout	</a>
		</div>
	</li>
	
</ul>

