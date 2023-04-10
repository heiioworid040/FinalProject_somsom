<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>omatupdate</title>
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

<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<script type="text/javascript">
function prodchk(event) {
// 	var imat_count = document.getElementById( 'imat_count' ).value;
// 	 var prod_cd = document.getElementById( 'prod_cd' ).value;
// 	if( prod_cd== ""){
// 		alert("품번 입력하세요");
// 		//부모페이지로 이벤트전파방지
// 		event.preventDefault();
// 		}
	var chkStyle = /\d/ ; 
	if(document.getElementById( 'omat_count' ).value== ""){
		alert("출고수량 입력하세요");
		document.fr.omat_count.focus();
		//부모페이지로 이벤트전파방지
		
		event.preventDefault();
		}
	else{
		if(!chkStyle.test((document.getElementById( 'omat_count' ).value))){
			alert("출고수량에는 숫자만 입력 가능합니다.");
			document.fr.omat_count.focus();
			//부모페이지로 이벤트전파방지
			event.preventDefault();
			}
			
	}
	
// 	if(!chkStyle.test((document.getElementById( 'imat_count' ).value))){
// 		alert("입고수량에는 숫자만 입력 가능합니다.");
// // 		$(imat_count).val="";
// 		//부모페이지로 이벤트전파방지
// 		event.preventDefault();
// 		}
		
}
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
							<div class="page-title"></div>
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
			<div class="anomated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">TEST</strong>
							</div>
							<div class="card-body">

								<form
									action="${pageContext.request.contextPath}/omat/omatupdatePro"
									method="post">
									<table id="bootstrap-data-table"
										class="table table-striped table-bordered">
										<thead class="thead-dark">
											<tr>
												<th scope="col">입고번호</th>
												<th scope="col">상품코드</th>
												<th scope="col">입고창고</th>
												<th scope="col">입고수량</th>
												<th scope="col">비고</th>
											</tr>
										</thead>
										<tbody>
											<tr>

												<td><input type="text" name="omat_cd"
													value="${omatDTO.omat_cd}" readonly></td>
												<td><input type="text" name="prod_cd" id="prod_cd" 
													value="${omatDTO.prod_cd}" readonly></td>
												<td><input type="text" name="omat_stg"
													value="${omatDTO.omat_stg}" readonly></td>
												<td><input type="text" name="omat_count" id="omat_count"
													value="${omatDTO.omat_count}" readonly></td>
												<td><input type="text" name="omat_note"
													value="${omatDTO.omat_note}" readonly></td>
											</tr>
										</tbody>
									</table>
									<div class="btn-div float-right">
										<input type="submit" class="btn btn-secondary" value="수정">
										<input type="button" class="btn btn-secondary" value="취소"
											onclick="location.href='${pageContext.request.contextPath}/omat/omatbeList'">
									</div>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- .content -->
		<!-- .content -->


		<div class="clearfix"></div>
		<!-- 푸터 넣는 곳 -->
		<jsp:include page="../inc/footer.jsp" />
		<!-- 푸터 넣는 곳 -->
	</div>
	<!-- /#right-panel -->

	<!-- Right Panel -->

	<!-- Scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>


</body>
</html>
