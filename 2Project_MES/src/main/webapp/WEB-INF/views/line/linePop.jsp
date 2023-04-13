<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>team3</title>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order.css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
</head>
<body>
<div class="col mt-3">
	<div class="row">
		<div class="col-lg">
			<div class="card">
				<div class="card-body card-block">
					<form action='${pageContext.request.contextPath}/line/linePop' class="form-inline" method="get" id="lineSearchForm">
						<div class="form-group col-6 mb-1">
							<div class="input-group modalP">
								<input type="hidden" value="${pageDTO.search3 }" id="btnId">
								<label for="popLineCd" class="pr-1 form-control-label">라인 코드</label>
								<input type="text" id="popLineCd" name="popLineCd" placeholder="Line Code" class="form-control bg-white mr-4">
								<label for="popLineNm" class="pr-1 form-control-label">라인명</label>
								<input type="text" id="popLineNm" name="popLineNm" placeholder="Line Name" class="form-control bg-white">
								<div class="input-group-btn">
								<input type	="submit" class="btn btn-primary ml-2" id="lineSearchBtn" value="검색">
								</div>
							</div>
						</div>
						<div class="col p-0"></div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="col">
	<div class="card">
		<div class="card-body">
		<div class="col">
			<table id="hover_tb" class="table table-hover table-striped table-bordered table-align-middle mb-0">
				<thead class="thead-dark">
					<tr>
						<th scope="col">라인코드</th>
						<th scope="col">라인명</th>
						<th scope="col">공정</th>
						<th scope="col">작업장</th>
						<th scope="col">정렬순서</th>
						<th scope="col">설비상태</th>
						<th scope="col">비고</th>
				</thead>
				<tbody>
					<c:forEach var="lineDTO" items="${lineList }">
						<c:if test="${lineDTO.line_st eq 'err'}">
							<tr id="infoLineTr" class="data-row bg-danger">
						</c:if>
						<c:if test="${lineDTO.line_st ne 'err'}">
							<tr id="infoLineTr" class="data-row">
						</c:if>
							<td id="line_cd">${lineDTO.line_cd }</td>
							<td>${lineDTO.line_nm }</td>
							<td>${lineDTO.line_process}</td>
							<td>${lineDTO.line_place}</td>
							<td>${lineDTO.line_num}</td>
							<td>${lineDTO.line_st}</td>
							<td>${lineDTO.line_note}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
								<div class="col p-0 mt-3">
									<div class="dataTables_paginate paging_simple_numbers float-right">
										<ul class="pagination">
										<!-- 이전 -->
										<c:if test="${pageDTO.startPage <= pageDTO.pageBlock }">
											<li class="paginate_button page-item previous disabled">
												<a href="${pageContext.request.contextPath}/line/linePop?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}"
												class="page-link">Previous</a></li>
										</c:if>
										<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
											<li class="ppaginate_button page-item previous" >
												<a href="${pageContext.request.contextPath}/line/linePop?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}"
												class="page-link">Previous</a>
											</li>
										</c:if>
										<!-- 이전 -->
										<!-- 현재 -->										
										<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
											<c:if test="${i==pageDTO.pageNum }">
												<li class="paginate_button page-item active">
													<a class="page-link" href="#">${i}</a>
												</li>											
											</c:if>
											<c:if test="${i!=pageDTO.pageNum }">
												<li class="paginate_button page-item ">
													<a class="page-link" href="${pageContext.request.contextPath}/line/linePop?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}">${i}</a>
												</li>
											</c:if>
										</c:forEach>
										<!-- 현재 -->										
										<!-- 다음 -->																				
										<c:if test="${pageDTO.endPage >= pageDTO.pageCount }">
											<li class="paginate_button page-item next disabled" id="bootstrap-data-table_next">
												<a href="${pageContext.request.contextPath}/line/linePop?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}" class="page-link">Next</a>
											</li>
										</c:if>
										<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
											<li class="paginate_button page-item next" id="bootstrap-data-table_next">
												<a href="${pageContext.request.contextPath}/line/linePop?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}" class="page-link">Next</a>
											</li>
										</c:if>
										<!-- 다음 -->																				
										</ul>
									</div>
								</div>
			</div>
			<!-- 페이징 -->
								<!-- 페이징 -->
			<div class="footer">
			</div>
		</div>
	</div>
</div>

			
<script
	src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script type="text/javascript">	
	$(document).on("click", "#infoLineTr", function() {
		
		var tr1 = $(this);
		var td1 = tr1.children();
		
		console.log($('#btnId').val());
		popLineCd = td1.eq(0).text();
		popLineNm = td1.eq(1).text();
		
		if($('#btnId').val()=='linePopI'){
		$("#insertLineCd", opener.document).val(popLineCd);
		$("#insertLineNm", opener.document).val(popLineNm);
		}else{
		$("#searchLineCd", opener.document).val(popLineCd);
		}
		
		self.close();
	});
	
	$(document).on("click", "#cancel", function() {
		self.close();
	});
</script>
</body>
</html>