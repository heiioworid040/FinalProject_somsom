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
	href="${pageContext.request.contextPath}/resources/css/client.css">

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
								<h1>생산관리</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="#">생산관리</a></li>
									<li class="active">생산실적 현황</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 	검색창 -->
		<div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card m-0">
							<div class="card-body card-block">
								<form
									action="${pageContext.request.contextPath }/performance/performanceCurrentInfo"
									method="get" class="form-inline">
									<div class="form-group col-6 mb-1">
										<label class="pr-1  form-control-label">실적일자</label>&nbsp;&nbsp; <input
											type="date" id="" class="form-control ">&nbsp;~&nbsp;
										<input type="date" id="" class="form-control">
									</div>
									<div class="form-group col-6 mb-1">
										<label class="pr-1  form-control-label">품번</label>&nbsp;&nbsp; <input
											type="text" id="" class="form-control ">
											<div class="input-group">
                                        	<div class="input-group-addon"><i class="ti-search"></i></div>
                                    	</div>
									</div>
									<div class="form-group col-6 mt-1">
										<label class="pr-1  form-control-label">지시번호</label>&nbsp;&nbsp;
										<input
											type="text" id="" class="form-control ">
									</div>
									<div class="form-group col-6 mb-1">
										<label class="pr-1  form-control-label">라인</label>&nbsp;&nbsp; 
											<div class="p-0 col">
											<select name="select" id="select" class="form-control">
												<option value="0">전체</option>
												<option value="1">cut001</option>
												<option value="2">cut002</option>
												<option value="3">cut003</option>
											</select>
										</div>
                                    	
									</div>
							</div>
						</div>
						<input type="submit" class="btn btn-secondary float-right"
							value="조회">
					</div>
				</div>
			</div>

		</div>
		</form>
		<!-- 	검색창 -->

		<div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">생산실적</strong>
							</div>
							<div class="card-body">
									
												
									<table id="bootstrap-data-table"
										class="table table-striped table-bordered">
										<thead class="thead-dark">
											<tr>
												<th scope="col">실적일자</th>
												<th scope="col">라인명</th>
												<th scope="col">품번</th>
												<th scope="col">품명</th>
												<th scope="col">단위</th>
												<th scope="col">양품</th>
												<th scope="col">불량</th>
												<th scope="col">불량사유</th>
												<th scope="col">비고</th>
												<th scope="col">지시번호</th>
												<th scope="col">수주번호</th>
												<th scope="col">업체</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="performanceDTO" items="${performanceCurrentInfo }">
												<tr>
													<td><fmt:formatDate value="${performanceDTO.perf_date}" pattern="yyyy.MM.dd"/></td>
													<td>${performanceDTO.line_nm }</td>
													<td>${performanceDTO.prod_cd }</td>
													<td>${performanceDTO.prod_nm }</td>
													<td>${performanceDTO.prod_unit }</td>
													<td>${performanceDTO.perf_good }</td>
													<td>${performanceDTO.perf_err }</td>
													<td>${performanceDTO.perf_cause }</td>
													<td>${performanceDTO.perf_note }</td>
													<td>${performanceDTO.inst_cd }</td>
													<td>${performanceDTO.ord_cd }</td>
													<td>${performanceDTO.cli_nm }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									
									<br><br>
									
									<b>생산실적 현황</b>
									<table id="bootstrap-data-table"
										class="table table-striped table-bordered">
										<thead class="thead-dark">
											<tr>
												<th scope="col">품번</th>
												<th scope="col">품명</th>
												<th scope="col">단위</th>
												<th scope="col">투입량</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="performanceDTO" items="${performanceCurrentInfo }">
												<tr>
													<td>${performanceDTO.prod_cd }</td>
													<td>${performanceDTO.prod_nm }</td>
													<td>${performanceDTO.prod_unit }</td>
													<td></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								

								<!-- 페이징 처리 -->
								<div class="pageNum">
									<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
										<a
											href="${pageContext.request.contextPath}/performance/performanceCurrentInfo?pageNum=${pageDTO.startPage - pageDTO.pageBlock }">[10페이지
											이전]</a>
									</c:if>

									<c:forEach var="i" begin="${pageDTO.startPage }"
										end="${pageDTO.endPage }" step="1">
										<a
											href="${pageContext.request.contextPath}/performance/performanceCurrentInfo?pageNum=${i}">${i}</a>
									</c:forEach>

									<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
										<a
											href="${pageContext.request.contextPath}/performance/performanceCurrentInfo?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">[10페이지
											다음]</a>
									</c:if>
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
