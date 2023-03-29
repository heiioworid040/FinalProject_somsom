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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$('.emp_email').on('blur',function(){
		$.ajax({
			url:'${pageContext.request.contextPath}/employee/emailCk',
			data:{'emp_email':$('.emp_email').val()},
			success:function(result){
//					alert(result);
				// result.trim() => 결과값 앞뒤로 공백 제거
				if(result.trim()=="emailUp"){
					result="이메일 중복";
					
					$('.divresult').html(result).css("color","red");
				}else{
					result="이메일 사용가능";
					$('.divresult').html(result).css("color","blue");
				}
			}
		});
	   
	   });
});

$(document).ready(function(){
	$('.emp_tel').on('blur',function(){
		$.ajax({
			url:'${pageContext.request.contextPath}/employee/telCk',
			data:{'emp_tel':$('.emp_tel').val()},
			success:function(result){
				if(result.trim()=="telUp"){
					result="전화번호 중복";
					$('.divresult2').html(result).css("color","red");
				}else{
					result="전화번호 사용가능";
					$('.divresult2').html(result).css("color","blue");
				}
			}
		});
	   
	   });
});


$(document).ready(function(){
    $(".cancel").on("click", function(){
      location.href = "${pageContext.request.contextPath}/employee/employeeList";
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

      if($("#emp_tel").val()==""){
        alert("전화번호를 입력해주세요.");
        $("#emp_tel").focus();
        return false;
      }
      
      if($(".divresult2")=="이메일 중복"){
          alert("이메일 중복확인 해주세요.");
          $("#emp_email").focus();
          return false;
        }
      else{
     	 form.method='GET';
     	 document.form.action='${pageContext.request.contextPath}/employee/updatePro';
      }
    });
  });
  


</script>
</head>
<body>
	<!-- Left Panel1 -->
	<jsp:include page="../inc/leftPanel.jsp" />
	<!-- Left Panel1 -->
	
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
        <!-- Header--> 
		<jsp:include page="../inc/top.jsp" />
        <!-- Header-->
        
        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>Dashboard</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">Dashboard</a></li>
                                    <li><a href="#">Table</a></li>
                                    <li class="active">Basic table</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
				
		<div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-body">
							<!--	(검색창 위치) -->
							<!-- 이 이상 긁는건 너무 템플릿에만의존적인 것 같아 나머지 기능은 직접 개발합시다 파이팅! -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div><!-- .content -->
		
        <div class="content">
		<form id="update" action="${pageContext.request.contextPath}/employee/updatePro" method="post">
		
		<div>
<!-- 		<input type="submit" value="저장" class="submit" id="submit">					 -->
		<input type="submit" value="저장" class="save" id="save">					
<%-- 		<input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/employee/employeeList'">				 --%>
		<input type="button" class="cancel" id="cancel" value="취소">				
		</div>
		
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">Table Head</strong>  
							</div>
							<div class="card-body">
								<table class="table">
									<thead class="thead-dark">
										<tr>
											<th scope="col">사용자 ID</th>
											<th scope="col">사용자명</th>
											<th scope="col">비밀번호</th>
											<th scope="col">직책</th>
											<th scope="col">E-MAIL</th>
											<th scope="col">전화번호</th>
											
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="text" name=emp_cd class="emp_cd" id="emp_cd" value="${employeeDTO.emp_cd }" readonly></td>
											<td><input type="text" name=emp_nm class="emp_nm" id="emp_nm" value="${employeeDTO.emp_nm }"></td>
											<td><input type="text" name=emp_pass class="emp_pass" id="emp_pass" value="${employeeDTO.emp_pass }"></td>
											<td><select name="emp_position" class="emp_position" id="emp_position">
												<option value="">직책을 선택하세요</option>
												<option value="관리자">관리자</option>
												<option value="파트장">파트장</option>
												<option value="사원">사원</option>
												</select></td>
											<td><input type="text" name=emp_email class="emp_email" id="emp_email" value="${employeeDTO.emp_email }"><br>
												<div class="divresult"></div><br></td>
											<td><input type="text" name=emp_tel class="emp_tel" id="emp_tel" value="${employeeDTO.emp_tel }"><br>
												<div class="divresult2"></div></td>
										</tr>

										
										
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
							</form>
		</div><!-- .content -->

		<div class="clearfix"></div>
		<!-- 푸터 넣는 곳 -->
		<jsp:include page="../inc/footer.jsp" />
		<!-- 푸터 넣는 곳 -->
	</div>
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
