<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>infoWi</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
    <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$('.emp_email').on('change',function(){
		$.ajax({
			url:'${pageContext.request.contextPath}/employee/emailCk',
			data:{'emp_email':$('.emp_email').val()},
			success:function(result){
//					alert(result);
				// result.trim() => 결과값 앞뒤로 공백 제거
				if(result.trim()=="emailUp"){
					result="이메일 중복";
					$('.divresult_1').val("0");
					$('.divresult').html(result).css("color","red");
				}else{
					result="이메일 중복아님";
					$('.divresult_1').val("1");
					$('.divresult').html(result).css("color","blue");
				}
			}
		});
	   
	   });
});

$(document).ready(function(){
	$('.emp_tel').on('change',function(){
		$.ajax({
			url:'${pageContext.request.contextPath}/employee/telCk',
			data:{'emp_tel':$('.emp_tel').val()},
			success:function(result){
//					alert(result);
				// result.trim() => 결과값 앞뒤로 공백 제거
				if(result.trim()=="telUp"){
					result="전화번호 중복";
					$('.divresult_2').val("0");
					$('.divresult2').html(result).css("color","red");
				}else{
					$('.divresult_2').val("1");
					result="전화번호 중복아님";
					$('.divresult2').html(result).css("color","blue");
				}
			}
		});
	   });
});

  
$(document).ready(function(){	
	var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]/);
//   	var telCheck = RegExp((/^010)([0-9]{8})$/);
	$(".cancel").on("click", function(){
      window.close();
    })
    
    $("#save").on("click", function(){
      if($("#emp_nm").val()==""){
        alert("이름을 입력해주세요.");
        $("#emp_nm").focus();
        return false;
      }
      if($("#emp_pass").val()==""){
        alert("비밀번호를 입력해주세요.");
        $("#emp_pass").focus();
        return false;
      }
      if($("#emp_position").val()==""){
          alert("직책을 입력해주세요.");
          $("#emp_position").focus();
          return false;
      }
    
      if($("#emp_email").val()==""){
          alert("이메일을 입력해주세요.");
          $("#emp_email").focus();
          return false;
      }

      if(!emailCheck.test($('.emp_email').val())){
      	  alert("이메일 형식 아님");
      	  $('.emp_email').focus();
      	  return false;
        }
      
      if($("#emp_tel").val()==""){
        alert("전화번호를 입력해주세요.");
        $("#emp_tel").focus();
        return false;
      }
      
	   if($("#emp_tel").val().length!=11){
	   alert("전화번호를 11자 입력해주세요.");
	   $("#emp_tel").focus();
	   return false;
	 }
      
      if($(".divresult_1").val()=="0"){
          alert("이메일 중복");
          $("#emp_email").focus();
          return false;
        }
      
      if($(".divresult_2").val()=="0"){
          alert("전화번호 중복");
          $("#emp_tel").focus();
          return false;
        }
      
    	 $('#update2').submit();
    	 setTimeout(function() {  
        	 opener.parent.location.reload();
             window.close();}, 100);
    });
  });



</script>
</head>
<body>

		
        <div class="content">
		<form id="update2" action="${pageContext.request.contextPath}/employee/updatePro" method="post">
<!-- 		<form id="update" method="post"> -->
		

		
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">개인정보 수정</strong>  
							</div>
							<div class="card-body">

										
											사용자 ID <input type="text" name=emp_cd class="emp_cd form-control" id="emp_cd" value="${employeeDTO.emp_cd }" readonly><br><br>
											사용자명 <input type="text" name=emp_nm class="emp_nm form-control" id="emp_nm" value="${employeeDTO.emp_nm }"><br><br>
											비밀번호 <input type="text" name=emp_pass class="emp_pass form-control" id="emp_pass" value="${employeeDTO.emp_pass }"><br><br>										
											E-MAIL <input type="text" name=emp_email class="emp_email form-control" id="emp_email" value="${employeeDTO.emp_email }"><br>
													<div class="divresult"></div><input type="hidden" class="divresult_1"><br>
											전화번호 <input type="text" name=emp_tel class="emp_tel form-control" id="emp_tel" value="${employeeDTO.emp_tel }"><br>
												<div class="divresult2"></div><input type="hidden" class="divresult_2">
											직책 <select name="emp_position" class="emp_position form-control" id="emp_position">
												<option value="">직책을 선택하세요</option>
												<option value="관리자">관리자</option>
												<option value="파트장">파트장</option>
												<option value="사원">사원</option>
												</select></div>

							</div>
							<div>
		<input type="button" value="저장" class="save btn btn-secondary float-right  btn3" id="save" >					
		<input type="button" class="cancel btn btn-secondary float-right" id="cancel" value="취소">				
		</div>
						</div>
					</div>
				</div>
							</form>
			</div>
		<!-- .content -->

		<div class="clearfix"></div>
		<!-- 푸터 넣는 곳 -->
		<jsp:include page="../inc/footer.jsp" />
		<!-- 푸터 넣는 곳 -->
	<!-- /#right-panel -->

	<!-- Right Panel -->

	<!-- Scripts -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	
</body>
</html>
