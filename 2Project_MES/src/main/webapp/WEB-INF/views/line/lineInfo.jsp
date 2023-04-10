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
										<div class="form-group col-6 mb-1">
											<div class="input-group modalP" id="modalP1">
												<label for="modalLineCd" class="pr-1 form-control-label">라인 코드</label>
												<input type="text" id="modalLineCd" name="modalLineCd"
													placeholder="Line Code" class="form-control bg-white mr-4">
												<label for="modalLineNm" class="pr-1 form-control-label">라인명</label>
												<input type="text" id="modalLineNm" name="modalLineNm"
													placeholder="Line Name" class="form-control bg-white">
												<div class="input-group-btn">
													<input type="submit" class="btn btn-primary ml-2"
														id="lineSearchBtn" value="검색">
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
			</div>
	<div class="content py-1 px-4">
		<div class="animated fadeIn">
			<div class="row">
				<div class="col">
					<div class="btn-div float-right px-2">
						<button type="button" class="btn btn-secondary">삭제</button>
						<button type="button" class="btn btn-primary" id="editBtn">수정</button>
						<button type="button" class="btn btn-primary">추가</button>
					</div>
				</div>
			</div>
		</div>
	</div>
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
										<th scope="col"><div class="form-check-inline form-check mr-0 ml-1"><input type="checkbox" class="form-check-input" id="allCheck"></div></th>
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
												<td><div class="form-check-inline form-check mr-0 ml-1"><input type="checkbox" class="form-check-input m-0"></div></td>
												<td class="pr-0 pl-0"><input type="text" class="bg-transparent border-0 col-md" value="${lineDTO.line_cd }" readonly></td>
												<td><input type="text" class="bg-transparent border-0 col-md" value="${lineDTO.line_nm }" readonly></td>
												<td><input type="text" class="bg-transparent border-0 col-md" value="${lineDTO.line_process}" readonly></td>
												<td><input type="text" class="bg-transparent border-0 col-md" value="${lineDTO.line_place}" readonly></td>
												<td><input type="text" class="bg-transparent border-0 col-md" value="${lineDTO.line_num}" readonly></td>
												<td><input type="text" class="bg-transparent border-0 col-md" value="${lineDTO.line_st}" readonly></td>
												<td><input type="text" class="bg-transparent border-0 col-md" value="${lineDTO.line_note}" readonly></td>
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
												<a href="${pageContext.request.contextPath}/instruction/infoInst?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}"
												class="page-link">Previous</a></li>
										</c:if>
										<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
											<li class="ppaginate_button page-item previous" >
												<a href="${pageContext.request.contextPath}/instruction/infoInst?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}"
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
													<a class="page-link" href="${pageContext.request.contextPath}/instruction/infoInst?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}">${i}</a>
												</li>
											</c:if>
										</c:forEach>
										
										<c:if test="${pageDTO.endPage >= pageDTO.pageCount }">
											<li class="paginate_button page-item next disabled" id="bootstrap-data-table_next">
												<a href="${pageContext.request.contextPath}/instruction/infoInst?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}" class="page-link">Next</a>
											</li>
										</c:if>
										<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
											<li class="paginate_button page-item next" id="bootstrap-data-table_next">
												<a href="${pageContext.request.contextPath}/instruction/infoInst?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}" class="page-link">Next</a>
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
	// 체크박스 제어
	$(document).on("change", "#allCheck", function(){
		if(jQuery("#allCheck").is(":checked")){
		jQuery('input[type="checkbox"]').prop('checked', true);
		}else{
		jQuery('input[type="checkbox"]').prop('checked', false);
			
		}
	});
	// 수정 버튼 제어
	$(document).on("click", "#editBtn", function(){
		jQuery('#listForm tr td input[type="text"]').prop('readonly', false);
		jQuery('#listForm').attr('action', '${pageContext.request.contextPath}/line/updateLine');
		console.log(jQuery("#listForm").attr('action'));
	});
	// 엔터기 감지
	$(document).on("keyup", function(event) {
	    if (event.which === 13) {
	        alert('Enter is pressed!');
	    	if(jQuery("#listForm").attr('action')=='${pageContext.request.contextPath}/line/updateLine'){
	    		jQuery("#listForm").submit();
	    	}
	    }
	});
		
// 		// 취소 버튼 (clear)
// 		$(document).on("click",".reset", function(){
// 			console.log($(this).closest('form').find('div input[type="text"]'));
// 			console.log($(this).attr('id'));
// 			$(this).closest('form').find('div input[type="text"]').attr('value', '');
// 			$(this).closest('form').find('div input[type="date"]').attr('value', '');
// 			if($(this).attr('id')=='resetInstBtn'){
// 				$("#insertInstForm").attr('action', '${pageContext.request.contextPath}/instruction/insertInst');
// 				$('#updateInstBtn').prop('disabled', true);
// 				$('#deleteInstBtn').prop('disabled', true);
// 				$('#insertInstBtn').prop('disabled', false);
// 			}
// 		});
		
// 		// 행 클릭시 이동
// 		$(document).on("click","#infoInstTr td:not(:last-child)", function(){
// 			location.href='${pageContext.request.contextPath}/performance/performanceCurrentInfo?pageNum=1&search='+$(this).closest('tr').children('td:eq(0)').text()+'&search2=&search3=&search4=&search5=';
// 		});

// 		// 회색 수정 버튼
// 		$(document).on("click", "#editInstBtn", function(){
// 			console.log('['+$(this).closest('tr').children('td:eq(0)').text().trim()+']');
// 			$('#insertInstCd').val($(this).closest('tr').children('td:eq(0)').text().trim());
// 			$('#insertLineCd').val($(this).closest('tr').children('td:eq(1)').text());
// 			$('#insertLineNm').val($(this).closest('tr').children('td:eq(2)').text());
// 			$('#insertOrderCd').val($(this).closest('tr').children('td:eq(3)').text());
// 			$('#insertProdCd').val($(this).closest('tr').children('td:eq(4)').text());
// 			$('#insertProdNm').val($(this).closest('tr').children('td:eq(5)').text());
// 			$('#insertProdUnit').val($(this).closest('tr').children('td:eq(6)').text());
// 			$('#insertInstSt').val($(this).closest('tr').children('td:eq(7)').text()).prop('selected', true);
// 			$('#insertProdCount').val($(this).closest('tr').children('td:eq(8)').text());
// 			$('#insertInstFcount').val($(this).closest('tr').children('td:eq(9)').text());
// 			$('#insertClientNm').val($(this).closest('tr').children('td:eq(11)').text());
// 			$('#insertInstForm').attr('action', '${pageContext.request.contextPath}/instruction/updateInst');
// 			$('#updateInstBtn').prop('disabled', false);
// 			$('#deleteInstBtn').prop('disabled', false);
// 			$('#insertInstBtn').prop('disabled', true);
// 			$('#lineModalBtn').focus();
// 		});
		
// 		// 삭제버튼 제어
// 		$(document).on("click", "#deleteInstBtn", function(){
// 			console.log($('#insertInstCd').val());
// 			location.href='${pageContext.request.contextPath}/instruction/deleteInst?delInstCd='+$('#insertInstCd').val();
// 		});
		

	</script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
