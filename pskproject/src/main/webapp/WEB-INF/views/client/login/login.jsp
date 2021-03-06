<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous"> 
<!DOCTYPE html>
<html lang="en">
<head> 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="Neon Admin Panel" />
<meta name="author" content="Laborator.co" />
<link rel="icon"
   href="https://demo.neontheme.com/assets/images/favicon.ico">
<title>PensionKing</title>
<link rel="stylesheet"
   href="https://demo.neontheme.com/assets/js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css"
   id="style-resource-1">
<link rel="stylesheet"
   href="https://demo.neontheme.com/assets/css/font-icons/entypo/css/entypo.css"
   id="style-resource-2">
<link rel="stylesheet"
   href="//fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic"
   id="style-resource-3">
<link rel="stylesheet"
   href="https://demo.neontheme.com/assets/css/bootstrap.css"
   id="style-resource-4">
<link rel="stylesheet"
   href="https://demo.neontheme.com/assets/css/neon-core.css"
   id="style-resource-5">
<link rel="stylesheet"
   href="https://demo.neontheme.com/assets/css/neon-theme.css"
   id="style-resource-6">
<!-- <link rel="stylesheet"
   href="https://demo.neontheme.com/assets/css/neon-forms.css"
   id="style-resource-7"> -->
<link href="/resources/include/dist/css/login.css" rel="stylesheet">

<link rel="stylesheet"
   href="https://demo.neontheme.com/assets/css/custom.css"
   id="style-resource-8">
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<!--[if lt IE 9]><script src="https://demo.neontheme.com/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]> <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script> <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script> <![endif]-->
<!-- TS1536213943: Neon - Responsive Admin Template created by Laborator -->

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/js/login.js"></script>

<script type="text/javascript">
function errorCodeCheck() {
   var status = '<c:out value="${status}" />'
   if(status != "") {
      // 명확한 자료형 명시를 위해 status의 타입을 정수형으로 변환
      switch(parseInt(status)) {
      case 1:
         alert("아이디 또는 비밀번호가 일치하지 않거나 존재하지 않는 \n회원입니다. 다시 로그인해 주세요.");
         break;
      case 6:
         alert("5번 이상 로그인 시도로 30초 동안 로그인할 수 없습니다. \n잠시 후 다시 시도해 주세요.");
         break;
      }
   }
}
</script>
</head>
<body class="page-body login-page login-form-fall"
   data-url="https://demo.neontheme.com">
   <!-- TS153621394319948: Xenon - Boostrap Admin Template created by Laborator / Please buy this theme and support the updates -->
   <script type="text/javascript">
      var baseurl = 'https://demo.neontheme.com/';
   </script>
   <div class="login-container">
        <c:if test="${login.m_id == null or login.m_id == ''}">   
      <div class="login-header login-caret">
         
         <div class="login-content">
          
            <a href="/" class="logo">
               <img src="/resources/image/pk1.png"
               width="350" alt="" />
            </a>
            <p class="description">Dear user, log in to access the admin
               area!</p>
            <!-- progress bar indicator -->
            <div class="login-progressbar-indicator">
               <h3>43%</h3>
               <span>logging in...</span>
            </div>
         </div>
      </div>
      <div class="login-progressbar">
         <div></div>
      </div>
 
      <div class="login-form">
         <div class="login-content">
            <div class="form-login-error">
               <h3>Invalid login</h3>
               <p>
                  Enter <strong>demo</strong>/<strong>demo</strong> as login and
                  password.
               </p>
            </div>
             
            <form role="form" id="loginForm">
         
               <div class="form-group">
                  <div class="input-group">
                     <div class="input-group-addon">
                        <i class="fas fa-user"></i>
                     </div>
                     <input type="text" class="form-control" name="m_id"
                        id="m_id" placeholder="Id" autocomplete="off" />
                  </div>
               </div>
               <div class="form-group">
                  <div class="input-group">
                     <div class="input-group-addon">
                        <i class="fas fa-key"></i>
                     </div>
                     <input type="password" class="form-control" name="m_pwd"
                        id="m_pwd" placeholder="Password" autocomplete="off" />
                  </div>
               </div>
               <div class="form-group">
                  <button type="button" class="btn btn-primary btn-block btn-login" id="loginBtn" >
                  <i class="fas fa-sign-in-alt"></i> Log In 
                  </button>
                  <button type="button" class="btn btn-primary btn-block btn-login" id="joinBtn" >
                    <i class="fas fa-sign-in-alt"></i> 회원가입 
                    </button>    
               </div>

            </form> 
            <p class="forgot">아이디를 잊으셨나요? <a class="forgot2" href="/member/findId.do">&nbsp;아이디 찾기</a><br/>
                        비밀번호를 잊으셨나요? <a class=" forgot2" href="">&nbsp;비밀번호 찾기</a></p>
                     
         </div>
      </div>
      </c:if>
   </div>
   
      
      <!-- 로그인 후 화면 -->
               <c:if test="${login.m_id != null and login.m_id != ''}">
               
                  <fieldset id="loginAfter">
                     <legend><strong>[${login.m_name}]님 반갑습니다.</strong></legend>
                     <span id="memberMenu" class="tac">
                        <a href="/member/logout.do">로그아웃</a>&nbsp;&nbsp;&nbsp;
                        <a href="/member/modify.do">정보수정(비밀번호 변경)</a>&nbsp;&nbsp;&nbsp;
                        <a href="/member/delete.do">회원탈퇴</a>
                        <a href="/">home</a>
                     </span>
                  </fieldset>
               </c:if>

      </body>
   
   <script src="https://demo.neontheme.com/assets/js/gsap/TweenMax.min.js"
      id="script-resource-1"></script>
   <script
      src="https://demo.neontheme.com/assets/js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"
      id="script-resource-2"></script>
   <script src="https://demo.neontheme.com/assets/js/bootstrap.js"
      id="script-resource-3"></script>
   <script src="https://demo.neontheme.com/assets/js/joinable.js"
      id="script-resource-4"></script>
   <script src="https://demo.neontheme.com/assets/js/resizeable.js"
      id="script-resource-5"></script>
   <script src="https://demo.neontheme.com/assets/js/neon-api.js"
      id="script-resource-6"></script>
   <script src="https://demo.neontheme.com/assets/js/cookies.min.js"
      id="script-resource-7"></script>
   <script
      src="https://demo.neontheme.com/assets/js/jquery.validate.min.js"
      id="script-resource-8"></script>
   <script src="https://demo.neontheme.com/assets/js/neon-login.js"
      id="script-resource-9"></script>
   <!-- JavaScripts initializations and stuff -->
   <script src="https://demo.neontheme.com/assets/js/neon-custom.js"
      id="script-resource-10"></script>
   <!-- Demo Settings -->
   <script src="https://demo.neontheme.com/assets/js/neon-demo.js"
      id="script-resource-11"></script>
   <script src="https://demo.neontheme.com/assets/js/neon-skins.js"
      id="script-resource-12"></script>
   <script type="text/javascript">
 var _gaq = _gaq || [];
 _gaq.push(['_setAccount', 'UA-28991003-7']);
 _gaq.push(['_setDomainName', 'demo.neontheme.com']);
 _gaq.push(['_trackPageview']);
 (function() {
  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
 })();
</script>
</body>
</html>