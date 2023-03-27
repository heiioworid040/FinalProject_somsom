<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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
<script type="text/javascript">

function fun1(index, code_grp) {
	   
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
	         return;
	      } else {
	         if(confirm("삭제처리 하시겠습니까?")) { document.form.action='${pageContext.request.contextPath}/employee/deletePro' }
	      } } } 
	   
	else if(index==2)
		   { location.href='${pageContext.request.contextPath}/code/codeList?plus=plus&code_grp='+code_grp }
	
	else if(index==3)
	  	{ document.form.action='${pageContext.request.contextPath}/employee/employeeList' }
		
	   
	   
	   
	   
	   }
	      
</script>
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
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">Table Head</strong>
							</div>
							<div class="card-body">
								<form>
								<table class="table">
									<thead class="thead-dark">
										<tr>
											<th scope="col">그룹코드3</th>
											<th scope="col">그룹명</th>
											<th scope="col">상세보기</th>
											
										</tr>
									</thead>
									<tbody>
										<c:forEach var="codeDTO" items="${codeGrpList }"> 
										<tr>
											<td>${codeDTO.code_grp}</td>
											<td>${codeDTO.code_grp_nm}</td>
											<td><input type="button" name="plus" value="plus" onclick="fun1(2,'${codeDTO.code_grp}')"></td>	
										</tr>	
										</c:forEach>
									</tbody>
								</table>			

								<table class="table">
									<thead class="thead-dark">
										<tr>
											<th scope="col"><input type="checkbox" id="ckAll" name="ckAll"></th>
											<th scope="col">코드</th>
											<th scope="col">코드명</th>
											<th scope="col">정렬순서</th>
											<th scope="col">비고</th>
											<th scope="col">수정</th>	
										</tr>
									</thead>
									<tbody>
									<c:if test="${! empty plus}">
									<c:forEach var="codeDTO" items="${codeList2 }">
										<tr>
											<td><input type="checkBox" name="ck" id="ck" value="${codeDTO.code_cd}"/></td>
											<td>${codeDTO.code_cd}</td>
											<td>${codeDTO.code_nm}</td>
											<td>${codeDTO.code_num}</td>
											<td>${codeDTO.code_note}</td>
											<td><input type="button" value="수정" onclick="location.href='${pageContext.request.contextPath}/code/updateCode?code_cd=${codeDTO.code_cd}'"></td>											
										</tr>											
									</c:forEach>
									</c:if>
									</tbody>
								</table>
								</form>	
							</div>
						</div>
					</div>
				</div>
			</div>
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
