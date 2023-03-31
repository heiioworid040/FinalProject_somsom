<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>performanceCurrentInfo</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/cs-skin-elastic.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/performanceCurr.css">

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script>	
<script type="text/javascript">
//jQuery 준비 => 대상.함수()
$(document).ready(function(){
// 	alert("준비"); 
	$('.group').click(function(){
// 		alert("클릭"); 
// 	var code_grp = $(this).data('code-grp');
	var code_grp = jQuery(this).data('code-grp');
// 		alert(code_grp);
		$('.code').html('');			
		$.ajax({
			url:'${pageContext.request.contextPath}/code/listjson',
			data:{code_grp : code_grp},
			dataType:'json',
			success:function(arr){					
				$.each(arr,function(index,item){
// 						alert(index);
// 						alert(item.code_cd);
// 						alert(item.code_nm);
// 						alert(item.code_num);
// 						alert(item.code_note);					
					$('.code').append('<tr><td>'+item.code_cd+'</td><td>'+item.code_nm+'</td><td>'+item.code_num+'</td><td>'+item.code_note+'</td></tr>');
				});
					
			}
		});
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
								<h1>시스템관리</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="#">시스템관리</a></li>
									<li class="active">공통코드 관리</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
  		<!-- 	검색창 -->
  		<!-- 	검색창 -->
				
        <div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">그룹코드</strong>
							</div>
							<div class="card-body">
							
							
								<form>
								<table id="hover_tb"
										class="table table-striped table-bordered">
									<thead class="thead-dark">
										<tr>
											<th scope="col">그룹코드</th>
											<th scope="col">그룹명</th>											
										</tr>
									</thead>
									<tbody>
										<c:forEach var="codeDTO" items="${codeGrpList }"> 
										<tr class="group" data-code-grp="${codeDTO.code_grp}">
											<td>${codeDTO.code_grp}</td>
											<td>${codeDTO.code_grp_nm}</td>
										</tr>	
										</c:forEach>
									</tbody>
								</table>	
								
								<br><br>
								
								<b>코드</b>
								<table id="table" class="table table-striped table-bordered">
									<thead class="thead-dark" >
										<tr>
											<th scope="col" style="width: 25%;" >코드</th>
											<th scope="col" style="width: 25%;">코드명</th>
											<th scope="col" >정렬순서</th>
											<th scope="col" >비고</th>
										</tr>
									</thead>
									<tbody class="code">										
									</tbody>
								</table>													
								</form>	
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
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
