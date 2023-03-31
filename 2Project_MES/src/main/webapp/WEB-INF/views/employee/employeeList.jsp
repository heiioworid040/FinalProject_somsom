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
</head>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$('.emp_email').on('input',function(){
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
					result="이메일 사용가능";
					$('.divresult_1').val("1");
					$('.divresult').html(result).css("color","blue");
				}
			}
		});
	   
	   });
});

$(document).ready(function(){
	$('.emp_tel').on('input',function(){
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
//       if($("#emp_pass").val()==""){
//         alert("비밀번호를 입력해주세요.");
//         $("#emp_pass").focus();
//         return false;
//       }
      
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
      
      if($(".divresult_1").val()=="0"){
          alert("이메일 중복확인 해주세요.");
          $("#emp_email").focus();
          return false;
        }
      
      if($(".divresult_2").val()=="0"){
          alert("전화번호 중복확인 해주세요.");
          $("#emp_tel").focus();
          return false;
        }
   
     	 form.method='GET';
     	 document.form.action='${pageContext.request.contextPath}/employee/insertPro';
   		 document.form.submit();
    });
  })
  


$(function(){
    //전체선택 체크박스 클릭
	$("#ckAll").click(function(){
		//만약 전체 선택 체크박스가 체크된상태일경우
		if($("#ckAll").prop("checked")) {
			//해당화면에 전체 checkbox들을 체크해준다
			$("input[type=checkbox]").prop("checked",true);
		// 전체선택 체크박스가 해제된 경우
		} else {
			//해당화면에 모든 checkbox들의 체크를해제시킨다.
			$("input[type=checkbox]").prop("checked",false);
		}
	})
})


function fun1(index) {	   
	if(index==1){
	   let check = false;
	   with(document.form) {
	      if(ck.length==undefined) {
	         if(ck.checked) { check = true; }
	      } else {
	         for(let i=0;i<ck.length;i++) {
	            if(ck[i].checked) { check = true; } }
	      } if(!check) {
	      alert("삭제할 사용자를 선택하세요");
	  	    form.method='GET';
     		 document.form.action='${pageContext.request.contextPath}/employee/employeeList';
	      } else {
	         if(confirm("삭제처리 하시겠습니까?")==true) { document.form.action='${pageContext.request.contextPath}/employee/deletePro'}
	         else{
	        	 form.method='GET';
	        	 document.form.action='${pageContext.request.contextPath}/employee/employeeList';
	         }
	      }
	    	  
	   } } }
	   
// 	else if(index==2)
// 		   { document.form.action='${pageContext.request.contextPath}/employee/insertPro' }
	
// 	else if(index==3)
// 	  	{ document.form.action='${pageContext.request.contextPath}/employee/employeeList' }
	   


	      
</script>
<body>
	<!-- Left Panel1 -->
	<jsp:include page="../inc/leftPanel.jsp" />
	<!-- Left Panel1 -->
	
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
        Header 
		<jsp:include page="../inc/top.jsp" />
        Header
        
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
							<div class="card-body" style="padding=50px">
<!-- 								(검색창 위치) -->
							<div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card m-0">
							<div class="card-body card-block">
								<form action="${pageContext.request.contextPath}/employee/employeeList" method="get" class="form-inline">
									 <div class="form-group col-6 mt-1">
                                    	<label for="exampleInputName1" class="pr-1  form-control-label">사용자ID</label>
                                    	<input type="text" id="search" name="search" class="form-control ">
                                    	<div class="input-group">
                                    	</div>
                                    </div>
                                     <div class="form-group col-6 mt-1">
                                    	<label for="exampleInputName1" class="pr-1  form-control-label">사용자명</label>
                                    	<input type="text" id="search2" name="search2" class="form-control">
                                    	<div class="input-group">
                                    	</div>
                                    </div> 
                                    <div class="form-group col-6 mt-3">
                                    <input type="submit" value="search">
                                    	<div class="input-group">
                                        	<div class="input-group-addon"><i class="ti-search"></i></div>
                                    	</div>
								   </form>
                                    </div>
                            </div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
							<!-- 이 이상 긁는건 너무 템플릿에만의존적인 것 같아 나머지 기능은 직접 개발합시다 파이팅! -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<!-- 		.content -->
		
        <div class="content">
<%-- 		<form name="ckDelete" action="${pageContext.request.contextPath}/employee/deletePro" method="post"> --%>
		<form name="form" method="post">
<%-- 		<input type="submit" value="add" name="add" onclick="location.href='${pageContext.request.contextPath}/employee/employeeList'">			 --%>
		<input type="submit" name="ckDelete" value="삭제" onclick="fun1(1)" >
		<input type="submit" value="add" name="add" onclick="fun1(3)" formmethod="get">			
													
			<div class="animated fadeIn">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">Table Head</strong>  
							</div>
							<div class="card-body">
								<table class="table" style=>
									<thead class="thead-dark">
										<tr>
											<th scope="col"><input type="checkbox" id="ckAll" name="ckAll"></th>
											<th scope="col">사용자 ID</th>
											<th scope="col">사용자명</th>
											<th scope="col">비밀번호</th>
											<th scope="col">직책</th>
											<th scope="col">E-MAIL</th>
											<th scope="col">전화번호</th>
											<th scope="col">수정/추가</th>										

											
										</tr>
									</thead>
									<tbody>
										
										
										<c:if test="${! empty add }">
										<tr>
											<td><input type="checkBox" name="ck" id="ck" value=""/></td>
											<td><input type="text" name="emp_cd" id="emp_cd" class="emp_cd" readonly></td>
											<td><input type="text" name="emp_nm" id="emp_nm" class="emp_nm"></td>
											<td><input type="text" name="emp_pass" id="emp_pass" class="emp_pass"></td>
											<td><select name="emp_position" id="emp_position" class="emp_position">
												<option value="">직책을 선택하세요</option>
												<option value="관리자">관리자</option>
												<option value="파트장">파트장</option>
												<option value="사원">사원</option>
												</select></td>
											
											<td><input type="email" id="emp_email" name="emp_email" class="emp_email"><br>
											<div class="divresult"></div><input type="hidden" class="divresult_1"><br>
											</td>
											
											<td><input type="text" name="emp_tel" id="emp_tel" class="emp_tel"><br>
											<div class="divresult2"></div><input type="hidden" class="divresult_2"><br></td>



<!-- 											<td><input type="submit" value="저장" onclick="fun1(2)" formmethod="get" id="save" ><br> -->
											<td><input type="submit" value="저장" formmethod="get" id="save" ><br>
<!-- 											<input type="submit" value="취소" onclick="fun1(3)" formmethod="get" class="cancel" ></td> -->
											<input type="submit" value="취소"  formmethod="get" class="cancel" ></td>
										</tr>
										</c:if>
										
										
										<c:forEach var="employeeDTO" items="${employeeList }">
										
										<tr>
											
											<td><input type="checkBox" name="ck" id="ck" value="${employeeDTO.emp_cd}"/></td>																					
											<td>${employeeDTO.emp_cd}</td>
											<td>${employeeDTO.emp_nm}</td>
											<td>${employeeDTO.emp_pass}</td>
											<td>${employeeDTO.emp_position}</td>
											<td>${employeeDTO.emp_email}</td>
											<td>${employeeDTO.emp_tel}</td>
											<td><input type="button" value="수정" onclick="location.href='${pageContext.request.contextPath}/employee/updateEmployee?emp_cd=${employeeDTO.emp_cd}'"></td>													
										
										</tr>
										</c:forEach>
										
										
										
										
									</tbody>
								</table>

<div align="center">					
<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath}/employee/employeeList?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&search=${pageDTO.search}&search2=${pageDTO.search2}">◁◁</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath}/employee/employeeList?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}">${i}</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/employee/employeeList?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&search=${pageDTO.search}&search2=${pageDTO.search2}">▷▷</a>
</c:if>
</div>		
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form><!-- .content -->

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


