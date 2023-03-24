<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		</div>
		<!-- .content -->

		<form action="${pageContext.request.contextPath}/employee/insertPro"
			method="post">
			<input type="submit" value="추가">
			<div class="content">
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
												<!-- 												<th scope="col">#</th> -->
												<th scope="col">사용자 ID</th>
												<th scope="col">사용자명</th>
												<th scope="col">비밀번호</th>
												<th scope="col">부서</th>
												<th scope="col">직책</th>
												<th scope="col">E-MAIL</th>
												<th scope="col">전화번호</th>
											</tr>
										<tbody>

											<tr>
												<td><input type="text" name="emp_cd"></td>
												<td><input type="text" name="emp_nm"></td>
												<td><input type="text" name="emp_pass"></td>
												<td><input type="text" name="emp_dept"></td>
												<td><input type="text" name="emp_position"></td>
												<td><input type="text" name="emp_email"></td>
												<td><input type="text" name="emp_tel"></td>
											</tr>

											<c:forEach var="employeeDTO" items="${employeeList }">
												<tr>
													<!-- 													<th scope="row">1</th> -->
													<!-- 													<td><th scope="col">#</th></td> -->
													<td>${employeeDTO.emp_cd}</td>
													<td>${employeeDTO.emp_nm}</td>
													<td>${employeeDTO.emp_pass}</td>
													<td>${employeeDTO.emp_dept}</td>
													<td>${employeeDTO.emp_position}</td>
													<td>${employeeDTO.emp_email}</td>
													<td>${employeeDTO.emp_tel}</td>
												</tr>
											</c:forEach>


										</tbody>
										</thead>
									</table>

									<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
										<a
											href="${pageContext.request.contextPath}/employee/insertEmployee?pageNum=${pageDTO.startPage - pageDTO.pageBlock }">◁◁</a>
									</c:if>

									<c:forEach var="i" begin="${pageDTO.startPage }"
										end="${pageDTO.endPage }" step="1">
										<a
											href="${pageContext.request.contextPath}/employee/insertEmployee?pageNum=${i}">${i}</a>
									</c:forEach>

									<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
										<a
											href="${pageContext.request.contextPath}/employee/insertEmployee?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">▷▷</a>
									</c:if>


								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
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
