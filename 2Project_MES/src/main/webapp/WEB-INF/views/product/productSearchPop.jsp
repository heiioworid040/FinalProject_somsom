<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>productSearchPop</title>
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
	function search(prod_cd) {
		// 부모창의 input 요소에 선택한 품번값을 넣어줌
		opener.document.getElementById("productSearchId").value = prod_cd;
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
						<div class="page-title"></div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="page-header float-right"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- 	검색창 -->
	<div class="content pb-0">
		<div class="animated fadeIn">
			<div class="row">
				<div class="col-lg">
					<div class="card m-0">
						<div class="card-body card-block">
							<form
								action="${pageContext.request.contextPath }/product/productSearchPop"
								method="get" class="form-inline">
								<div class="form-group col-6 mb-1">
									<label class="pr-1 form-control-label">품번</label>&nbsp;&nbsp;<input
										type="text" name="search" class="form-control "
										placeholder="Prod Code">
								</div>
								<div class="form-group col-6 mt-1">
									<label class="pr-1  form-control-label">자재유형</label>&nbsp;&nbsp;
									<div class="p-0 col">
										<select name="search3" id="select" class="form-control">
											<option>전체</option>
											<option value="원자재">원자재</option>
											<option value="부자재">부자재</option>
											<option value="완제품">완제품</option>
										</select>
									</div>
								</div>
								<div class="form-group col-6 mb-1">
									<label class="pr-1  form-control-label">품명</label>&nbsp;&nbsp;<input
										type="text" name="search2" class="form-control "
										placeholder="Prod Name">
								</div>
								<div class="col p-0">
									<input type="submit" class="btn btn-primary float-right ml-3"
										value="검색"> <input type="reset"
										class="btn btn-secondary float-right reset" value="취소">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 	검색창 -->

	<div class="content m-1">
		<div class="animated fadeIn">
			<div class="row">
				<div class="col-lg">
					<div class="card">
						<div class="card-header">
							<strong class="card-title m-0">품목</strong>
						</div>
						<div class="card-body">
							<form name="productSearch">
								<table id="hover_tb" class="table table-striped table-bordered">
									<thead class="thead-dark">
										<tr>
											<th scope="col">품번</th>
											<th scope="col">품명</th>
											<th scope="col">자재유형</th>
											<th scope="col">단위</th>
											<th scope="col">재질</th>
											<th scope="col">규격</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="productDTO" items="${productInfo }">
											<tr onclick="search('${productDTO.prod_cd }')">
												<td scope="row">${productDTO.prod_cd }</td>
												<td>${productDTO.prod_nm }</td>
												<td>${productDTO.prod_mat }</td>
												<td>${productDTO.prod_unit }</td>
												<td>${productDTO.prod_text }</td>
												<td>${productDTO.prod_size }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</form>
							<!-- 페이징 -->
							<div class="col p-0 mt-3">
								<div class="dataTables_paginate paging_simple_numbers float-right">
									<ul class="pagination">
										<!-- 이전 -->
										<c:if test="${pageDTO.startPage <= pageDTO.pageBlock }">
											<li class="paginate_button page-item previous disabled">
												<a
												href="${pageContext.request.contextPath}/product/productSearchPop?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}"
												class="page-link">Previous</a>
											</li>
										</c:if>
										<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
											<li class="ppaginate_button page-item previous"><a
												href="${pageContext.request.contextPath}/product/productSearchPop?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}"
												class="page-link">Previous</a></li>
										</c:if>
										<!-- 이전 -->
										<!-- 현재 -->
										<c:forEach var="i" begin="${pageDTO.startPage }"
											end="${pageDTO.endPage }" step="1">
											<c:if test="${i==pageDTO.pageNum }">
												<li class="paginate_button page-item active"><a
													class="page-link" href="#">${i}</a></li>
											</c:if>
											<c:if test="${i!=pageDTO.pageNum }">
												<li class="paginate_button page-item "><a
													class="page-link"
													href="${pageContext.request.contextPath}/product/productSearchPop?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}">${i}</a>
												</li>
											</c:if>
										</c:forEach>
										<!-- 현재 -->
										<!-- 다음 -->
										<c:if test="${pageDTO.endPage >= pageDTO.pageCount }">
											<li class="paginate_button page-item next disabled"
												id="bootstrap-data-table_next"><a
												href="${pageContext.request.contextPath}/product/productSearchPop?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}"
												class="page-link">Next</a></li>
										</c:if>
										<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
											<li class="paginate_button page-item next"
												id="bootstrap-data-table_next"><a
												href="${pageContext.request.contextPath}/product/productSearchPop?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}"
												class="page-link">Next</a></li>
										</c:if>
										<!-- 다음 -->
									</ul>
								</div>
							</div>
							<!-- 페이징 -->
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
