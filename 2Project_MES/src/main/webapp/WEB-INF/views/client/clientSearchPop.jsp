<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>clientSearchPop</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"> -->
<link rel="stylesheet" 
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
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

<script type="text/javascript">
function search(cli_cd) {
	  // 부모창의 input 요소에 선택한 거래처 코드를 넣어줌
	  opener.document.getElementById("clientSearchId").value = cli_cd;
	  // 자식 창을 닫음
	  self.close();
	}
</script>
</head>
<body>
		<div class="breadcrumbs">
			<div class="breadcrumbs-inner">
				<div class="row m-0">
					<div class="col-sm-4">
						<div class="page-header float-left">
							<div class="page-title">
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
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
									action="${pageContext.request.contextPath }/client/clientSearchPop"
									method="get" class="form-inline">
									<div class="form-group col-6 mb-1">
										<label class="pr-1 form-control-label">거래처코드</label>&nbsp;&nbsp;<input
											type="text" name="search" class="form-control ">
									</div>
									<div class="form-group col-6 mb-1">
										<label class="pr-1  form-control-label">거래처명</label>&nbsp;&nbsp;<input
											type="text" name="search2" class="form-control ">
									</div>
									<div class="form-group col-6 mt-1">
										<label class="pr-1  form-control-label">거래처구분</label>&nbsp;&nbsp;
										<div class="p-0 col">
											<select name="search3" id="select" class="form-control">
												<option>전체</option>
												<option value="협력사">협력사</option>
												<option value="고객사">고객사</option>
												<option value="자사">자사</option>
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
								<strong class="card-title">거래처</strong>
							</div>
							<div class="card-body">
									<table id="hover_tb"
										class="table table-striped table-bordered">
										<thead class="thead-dark">
											<tr>
												<th scope="col" style="width: 20%">거래처코드</th>
												<th scope="col" style="width: 20%">거래처명</th>
												<th scope="col" style="width: 20%">구분</th>
												<th scope="col" style="width: 20%">업태</th>
												<th scope="col" style="width: 20%">종목</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="clientDTO" items="${clientInfo }">
												<tr onclick="search('${clientDTO.cli_cd }')">
													<td scope="row">${clientDTO.cli_cd }</td>
													<td>${clientDTO.cli_nm }</td>
													<td>${clientDTO.cli_type }</td>
													<td>${clientDTO.cli_business }</td>
													<td>${clientDTO.cli_prod }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</form>


								<!-- 페이징 처리 -->
								<div class="pageNum">
									<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
										<a
											href="${pageContext.request.contextPath}/client/clientSearchPop?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}">[10페이지
											이전]</a>
									</c:if>

									<c:forEach var="i" begin="${pageDTO.startPage }"
										end="${pageDTO.endPage }" step="1">
										<a
											href="${pageContext.request.contextPath}/client/clientSearchPop?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}">${i}</a>
									</c:forEach>

									<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
										<a
											href="${pageContext.request.contextPath}/client/clientSearchPop?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}">[10페이지
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
<!-- 	</div> -->
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
