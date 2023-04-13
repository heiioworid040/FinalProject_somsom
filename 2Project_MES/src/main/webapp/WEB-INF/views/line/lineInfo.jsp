<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>infoInstruction</title>
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
	href="${pageContext.request.contextPath}/resources/css/performanceCurr.css">

</head>
<body>
	<c:if test="${empty sessionScope.emp_cd }">
		<c:redirect url="/employee/login"></c:redirect>
	</c:if>
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
								<h1>기준정보</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="#">기준정보</a></li>
									<li class="active">라인정보</li>
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
									<form action="${pageContext.request.contextPath}/line/lineInfo" class="form-inline" method="get">
										<div class="form-group col mb-1">
											<div class="input-group">
												<label for="searchLineCd" class="pr-1 form-control-label">라인 코드</label>
												<input type="text" id="searchLineCd" name="searchLineCd"
													placeholder="Line Code" class="form-control bg-white mr-4">
												<label for="searchLineNm" class="pr-1 form-control-label">라인명</label>
												<input type="text" id="searchLineNm" name="searchLineNm"
													placeholder="Line Name" class="form-control bg-white">
											</div>
											<div class="input-group">
												<div class="col p-0"><input type="submit" class="btn btn-primary ml-2" value="조회"></div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 편집창 -->
	<c:if test="${sessionScope.emp_position != '사원'}">
		<div class="content pt-0">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card m-0">
							<form action="${pageContext.request.contextPath}/line/insertLine" id="insertForm" method="post">
								<div class="card-body card-block">
									<table id="table" class="table table-striped table-bordered">
										<thead class="thead-dark">
											<tr>
												<th scope="col">라인코드</th>
												<th scope="col">라인명</th>
												<th scope="col" class="col-1">공정</th>
												<th scope="col">작업장</th>
												<th scope="col">정렬순서</th>
												<th scope="col" class="col-1">설비상태</th>
												<th scope="col">비고</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td scope="row"><input type="text" id="insertLineCd" name="line_cd" class="form-control" readonly></td>
												<td><input type="text" id="insertLineNm" name="line_nm" class="form-control"></td>
												<td>
												<div>
													<select name="line_process" id="insertLineProcess" class="form-control">
                                                		<option value="재단">재단</option>
                                                		<option value="조립">조립</option>
                                                		<option value="검수">검수</option>
                                                	</select>                                            	
												</div>
												</td>
												<td><input type="text" id="insertLinePlace" name="line_place" class="form-control"></td>
												<td><input type="text" id="insertLineNum" name="line_num" class="form-control"></td>
												<td>
													<div>
														<select id="insertLineSt" name="line_st" class="form-control">
                                                			<option value="대기">대기</option>
                                                			<option value="정상">정상</option>
                                                			<option value="err">err</option>
                                                		</select>                                            	
													</div>
												</td>
												<td><input type="text" id="insertLinNt" name="line_note" class="form-control  bg-white"></td>
											</tr>
										</tbody>
									</table>
									<button type="submit" class="btn btn-primary col-2 float-right ml-3" id="insertBtn">추가</button>
									<button type="submit" class="btn btn-primary col-1 float-right ml-3" id="updateBtn" disabled>수정</button>
									<button type="button" class="btn btn-secondary col-1 float-right ml-3" id="deleteBtn" disabled>삭제</button>
									<button type="reset"  class="btn btn-secondary col-1 float-right reset" id="resetLineBtn">취소</button>
								</div>
							</form>
						</div> 	
					</div>
				</div>
			</div>
		</div> 
	</c:if>
		
		<!-- 편집창 -->
		<!-- 리스트 -->
		<div class="content pt-0">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">라인정보</strong>
							</div>
							<div class="card-body">
							<form id="listForm" action="" method="post">
								<table id="hover_tb" class="table table-hover table-striped table-bordered table-align-middle mb-0">
									<thead class="thead-dark">
										<tr>
<!-- 										<th scope="col"><div class="form-check-inline form-check mr-0 ml-1"><input type="checkbox" class="form-check-input" id="allCheck"></div></th> -->
											<th scope="col">라인코드</th>
											<th scope="col">라인명</th>
											<th scope="col">공정</th>
											<th scope="col">작업장</th>
											<th scope="col">정렬순서</th>
											<th scope="col">설비상태</th>
											<th scope="col">비고</th>
											<c:if test="${sessionScope.emp_position ne '사원'}">
											<th scope="col"> </th>
											</c:if>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="lineDTO" items="${lineList }">
											<c:if test="${lineDTO.line_st eq 'err'}">
											<tr id="infoLineTr" class="data-row bg-danger">
											</c:if>
											<c:if test="${lineDTO.line_st ne 'err'}">
											<tr id="infoLineTr" class="data-row">
											</c:if>
<!-- 												<td><div class="form-check-inline form-check mr-0 ml-1"><input type="checkbox" class="form-check-input m-0"></div></td> -->
												<td>${lineDTO.line_cd }</td>
												<td>${lineDTO.line_nm }</td>
												<td>${lineDTO.line_process}</td>
												<td>${lineDTO.line_place}</td>
												<td>${lineDTO.line_num}</td>
												<td>${lineDTO.line_st}</td>
												<td>${lineDTO.line_note}</td>
												<c:if test="${sessionScope.emp_position ne '사원'}">
												<td>
													<div class="input-group">
														<button type="button" id="editBtn" class="btn btn-secondary" value="${instructionDTO.inst_cd }">편집</button>
													</div>
												</td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</form>
								<!-- 페이징 -->
								<div class="col p-0 mt-3">
									<div class="dataTables_paginate paging_simple_numbers float-right">
										<ul class="pagination">
										<c:if test="${pageDTO.startPage <= pageDTO.pageBlock }">
											<li class="paginate_button page-item previous disabled">
												<a href="${pageContext.request.contextPath}/line/lineInfo?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}"
												class="page-link">Previous</a></li>
										</c:if>
										<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
											<li class="ppaginate_button page-item previous" >
												<a href="${pageContext.request.contextPath}/line/lineInfo?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}"
												class="page-link">Previous</a>
											</li>
										</c:if>
										
										
										<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
											<c:if test="${i==pageDTO.currentPage }">
												<li class="paginate_button page-item active">
													<a class="page-link" href="#">${i}</a>
												</li>											
											</c:if>
											<c:if test="${i!=pageDTO.currentPage }">
												<li class="paginate_button page-item ">
													<a class="page-link" href="${pageContext.request.contextPath}/line/lineInfo?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}">${i}</a>
												</li>
											</c:if>
										</c:forEach>
										
										<c:if test="${pageDTO.endPage >= pageDTO.pageCount }">
											<li class="paginate_button page-item next disabled" id="bootstrap-data-table_next">
												<a href="${pageContext.request.contextPath}/line/lineInfo?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}" class="page-link">Next</a>
											</li>
										</c:if>
										<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
											<li class="paginate_button page-item next" id="bootstrap-data-table_next">
												<a href="${pageContext.request.contextPath}/line/lineInfo?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}" class="page-link">Next</a>
											</li>
										</c:if>
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
		<!-- 푸터 넣는 곳 -->
		<jsp:include page="../inc/footer.jsp" />
		<!-- 푸터 넣는 곳 -->

	</div>
	<!-- /#right-panel -->

	<!-- Right Panel -->

	<!-- Scripts -->

	<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script type="text/javascript">
		// 취소 버튼 (clear)
		$(document).on("click",".reset", function(){
			console.log(jQuery(this).closest('form').find('div input[type="text"]'));
			console.log(jQuery(this).attr('id'));
			jQuery(this).closest('form').find('div input[type="text"]').attr('value', '');
			jQuery(this).closest('form').find('div input[type="date"]').attr('value', '');
			if(jQuery(this).attr('id')=='resetLineBtn'){
				jQuery('#insertForm').attr('action', '${pageContext.request.contextPath}/line/insertLine');
				jQuery('#updateBtn').prop('disabled', true);
				jQuery('#deleteBtn').prop('disabled', true);
				jQuery('#insertBtn').prop('disabled', false);
			}
		});

		// 회색 수정 버튼
		$(document).on("click", "#editBtn", function(){
			jQuery('#insertLineCd').val(jQuery(this).closest('tr').children('td:eq(0)').text().trim());
			jQuery('#insertLineNm').val(jQuery(this).closest('tr').children('td:eq(1)').text().trim());
			jQuery('#insertlineProcesst').val(jQuery(this).closest('tr').children('td:eq(2)').text()).prop('selected', true);
			jQuery('#insertLinePlace').val(jQuery(this).closest('tr').children('td:eq(3)').text().trim());
			jQuery('#insertLineNum').val(jQuery(this).closest('tr').children('td:eq(4)').text().trim());
			jQuery('#insertLineSt').val(jQuery(this).closest('tr').children('td:eq(5)').text().trim()).prop('selected', true);
			jQuery('#insertLineNt').val(jQuery(this).closest('tr').children('td:eq(6)').text().trim());
			jQuery('#insertForm').attr('action', '${pageContext.request.contextPath}/line/updateLine');
			jQuery('#updateBtn').prop('disabled', false);
			jQuery('#deleteBtn').prop('disabled', false);
			jQuery('#insertBtn').prop('disabled', true);
			jQuery('#insertLineNm').focus();
		});
		
		// 삭제버튼 제어
		$(document).on("click", "#deleteBtn", function(){
			location.href='${pageContext.request.contextPath}/line/deleteLine?delLineCd='+jQuery('#insertLineCd').val();
		});
		

	</script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
