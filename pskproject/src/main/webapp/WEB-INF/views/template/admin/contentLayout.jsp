<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>

<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<meta name="description" content="CoreUI - Open Source Bootstrap Admin Template">
	<meta name="author" content="Łukasz Holeczek">
	<meta name="keyword" content="Bootstrap,Admin,Template,Open,Source,jQuery,CSS,HTML,RWD,Dashboard">
    <title><tiles:getAsString name="title" /></title>
        
    <link rel="icon" href="/resources/image/icon.png">
    
    <!-- Bootstrap core CSS -->
    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/include/dist/css/justified-nav.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="/resources/include/dist/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link href="/resources/include/css/coreui-icons.min.css" rel="stylesheet">
	<link href="/resources/include/css/flag-icon.min.css" rel="stylesheet">
	<link href="/resources/include/css/font-awesome.min.css" rel="stylesheet">

	<link rel="stylesheet" type="text/css" href="/resources/include/css/admin.css" />
	<link href="/resources/include/css/style.css" rel="stylesheet">
	<link href="/resources/include/css/pace.min.css" rel="stylesheet"> 
	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript" src="/resources/include/js/lightbox.min.js"></script>   	
	
	<style type="text/css" >
		body{padding:0px; margin:0px; font-size:140%}
		.contentBtn,input,textarea,select{color:black;}
		.imagePreview, .rimagePreview {position:relative; float:left;  background-position: center center;
  					background-size: cover;
					text-align:center;
  					display: inline-block;	width:180px; height:180px;
  					}
		.rimagePreview .title {position:absolute; left:72px; top:75px; font-size:110%}
		.roomDiv{width:180px; height:200px; float:left; margin-right:20px; margin-bottom:10px; }
		.rimagePreview{-webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);}
		.imagePreview{margin: 10px 20px 10px 10px;}
		#-1{margin-top:20px;}
		.page-root{text-align:right; font-size:100%; margin-bottom:10px;}
		.contentBtn,.contentBtn1{text-align:right; margin-bottom:10px;}
		.contentBtn1{padding-right:100px;}
		.uploadFile, .uploadFile1{float:left; width:200px; color:white;}
		#priceWrite{width:45%;float:left; margin:20px 20px;}
		a:hover{text-decoration:none;}
		table, table td{text-align:center; }
		.container-fluid{font-size:100%;}
		.sch{text-align:left;}
		.resSearch,.payConfirmList,.payAllList{font-size:80%}
		.btn1{height:30px; width:70px; font-size:100%; margin-top:10px; background-color:orange;}
		input[type='date']{height:25px;}
	</style>
	
  </head>
	<body class="app header-fixed sidebar-fixed aside-menu-fixed sidebar-lg-show">
	  
      <!-- <div class="masthead"> -->
      <header class="app-header navbar">
        <tiles:insertAttribute name="header" />
      </header>

      <!-- Jumbotron -->
      <!-- <div class="jumbotron"> -->
      <div class="app-body">
      	<div class="sidebar">
      		<tiles:insertAttribute name="left" />
      	</div>
      	<div class="main">
      		<tiles:insertAttribute name="main"/>
      		
      	</div>
        
      </div>
	
	<footer class="app-footer">
		<tiles:insertAttribute name="footer" />
	</footer>

    <script src="/resources/include/js/jquery.min.js"></script>
	<script src="/resources/include/js/popper.min.js"></script>
	<script src="/resources/include/js/bootstrap.min.js"></script>
	<script src="/resources/include/js/pace.min.js"></script>
	<script src="/resources/include/js/perfect-scrollbar.min.js"></script>
	<script src="/resources/include/js/coreui.min.js"></script>
    
	</body>
</html>