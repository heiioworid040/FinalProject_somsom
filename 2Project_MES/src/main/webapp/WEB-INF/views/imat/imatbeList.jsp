<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>imatbeList</title>
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
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/material.css">
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
							<div class="page-title"></div>
						<h1>자재 관리</h1>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
						
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="#">자재 입고</a></li>
<!-- 									<li><a href="#">Table</a></li> -->
<!-- 									<li class="active">Basic table</li> -->
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
													
					<div id="table_search">
					
							<form action="${pageContext.request.contextPath}/imat/imatsearch" method="get">
							<input type="text" name="search" class="input_box" placeholder="입고번호">
							<input type="text" name="search2" class="input_box" placeholder="품번">
							<input type="text" name="search3" class="input_box" placeholder="입고창고">
							<input type="submit" value="검색" class="btn">
							</form>
							</div>
													
							</div>
						</div>
					</div>
				</div>
			</div>




		

			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-body">
							
								<form action="${pageContext.request.contextPath}/imat/delete"
									id="chkdelete" method="post">
									<table class="table table-striped">
										<thead class="thead-dark">

											<tr>
<!-- 												<th><input type="checkbox" name="check" id="chAll"></th>				 -->
												<th scope="col">#</th>
												<th scope="col">입고번호</th>
												<th scope="col">납기일자</th>
												<th scope="col">품번</th>
												<th scope="col">품명</th>
												<th scope="col">단위</th>
												<th scope="col">입고창고</th>
												<th scope="col">입고수량</th>
												<th scope="col">거래처번호</th>
												<th scope="col">거래처명</th>
												<th scope="col">비고</th>
												<th scope="col">작업</th>
											</tr>
										</thead>
										<tbody>
										<tr>
													<td colspan="12" id="inser"><input type="button" value="추가" class="btn btn-outline-link"  
														onclick="location.href='${pageContext.request.contextPath}/imat/imatinsert'" ></td>
														</tr>
											<c:forEach var="ImatDTO" items="${ImatbeList}">
												<tr>
<!-- 													<th><input type="checkbox" name="checkRow" -->
<%-- 														id="${ImatDTO.imat_num}" value="${ImatDTO.imat_num}" --%>
<!-- 														class="chkbox"></th> -->
													<td>${ImatDTO.imat_num}</td>
													<td>${ImatDTO.imat_cd}</td>
													<td><fmt:formatDate value="${ImatDTO.imat_date}" pattern="yyyy-MM-dd" type="date"/></td>
													<td>${ImatDTO.prod_cd}</td>
													<td>${ImatDTO.prod_nm}</td>
													<td>${ImatDTO.prod_unit}</td>
													<td>${ImatDTO.imat_stg}</td>
													<td>${ImatDTO.imat_count}</td>
													<td>${ImatDTO.cli_cd}</td>
													<td>${ImatDTO.cli_nm}</td>
													<td>${ImatDTO.imat_note}</td>
													<td>
														<input type="button" value="수정" class="btn btn-secondary"
														onclick="location.href='${pageContext.request.contextPath}/imat/imatupdate?imat_cd=${ImatDTO.imat_cd}'">
														<input type="button" value="삭제" class="btn btn-danger"
														onclick="location.href='${pageContext.request.contextPath}/imat/imatdelete?imat_cd=${ImatDTO.imat_cd}'">

													</td>
												</tr>
											</c:forEach>


										</tbody>


									</table>
									<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
											<a href="${pageContext.request.contextPath}/imat/imatbeList?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}">[이전페이지]</a>
																	
										</c:if>

										<c:forEach var="i" begin="${pageDTO.startPage }"
											end="${pageDTO.endPage }" step="1">
											<a
												href="${pageContext.request.contextPath}/imat/imatbeList?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}">${i}</a>
										</c:forEach>

										<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
											<a
								href="${pageContext.request.contextPath}/imat/imatbeList?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}">>[다음페이지]</a>
										</c:if>
								</form>
																
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
