<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Ela Admin - HTML5 Admin Template</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
    <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<!--     <link rel="stylesheet" href="assets/css/cs-skin-elastic.css"> -->
<!--     <link rel="stylesheet" href="assets/css/style.css"> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
 <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
<script type="text/javascript">

$(document).ready(function(){  
    
    var key = getCookie("key");
    $("#emp_cd").val(key); 
      
    if($("#emp_cd").val() != ""){
        $("#remember_emp").attr("checked", true); 
    }
      
    $("#remember_emp").change(function(){ 
        if($("#remember_emp").is(":checked")){ 
            setCookie("key", $("#emp_cd").val(), 7); 
        }else{ 
            deleteCookie("key");
        }
    });
          
    $("#emp_cd").keyup(function(){ 
        if($("#remember_emp").is(":checked")){ 
            setCookie("key", $("#emp_cd").val(), 7); 
        }
    });
});
  
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
  
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
  
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}


$(document).ready(function(){
    $("#login").on("click", function(){
      if($("#emp_cd").val()==""){
        alert("아이디를 입력해주세요.");
        $("#emp_cd").focus();
        return false;
      }
      
      if($("#emp_pass").val()==""){
          alert("비밀번호를 입력해주세요.");
          $("#emp_pass").focus();
          return false;
        }
      
  
   
	   	 form.method='POST';
     	 document.form.action='${pageContext.request.contextPath}/employee/loginPro';
   		 document.form.submit();
    });
  })
</script>
    
    
    
</head>
<!-- <body class="bg-dark"> -->
<body>
<div class="container-doc">
<div class="ineer_container">
	<main class="doc-main">
		<div class="doc-title">
				<div class="logo_somsom">
					<div class="logo"><img src="${pageContext.request.contextPath}/resources/images/somsom.png" width="200" ></div>
				</div>
		</div>
		
	<article class="content-article">
		<div class="cont_login">
			<form action="${pageContext.request.contextPath}/employee/loginPro" class="form" method="post" >


                        <div class="box_tf fst">
                            <label>사용자ID</label><br>
                            <input type="text" name="emp_cd" id="emp_cd" placeholder="사용자ID" class="tf_g"><br>
							<div class="util_tf"></div>
                        </div>
                        
                        <div class="box_tf">
                            <label>비밀번호</label><br>
                            <input type="password" class="tf_g" name="emp_pass" id="emp_pass" placeholder="비밀번호">
                        	<div class="util_tf"></div>
                        </div>
                        
                        <div class="set_login">
                        	
    	                   	 <div class="checkbox">
                                <input type="checkbox" id="remember_emp" class="remember_emp" name="remember_emp"> 
                            <label class="lab_choice">
                                <span class="ico_comm ico_ckeck"></span>아이디 기억하기
                            </label>
							</div>
                        </div>

                        
                        
                        
                        <div class="confirm_btn">
                        <button type="submit" class="btn_g highlight submit" id="login" class="login" >로그인</button>
                        </div>
           </form>			
		</div>
	
	</article>		
		
		
		
		
		
		
			
                    
      </main>
</div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<!--     <script src="assets/js/main.js"></script> -->

</body>
</html>
