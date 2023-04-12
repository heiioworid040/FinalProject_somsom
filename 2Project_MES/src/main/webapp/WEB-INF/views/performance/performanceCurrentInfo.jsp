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

<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
</head>
<body>
	<!-- 	로그인 안했을시 로그인페이지로 이동  -->
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

		<!-- 	검색창 name search(오브젝트)  -->
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
										<label class="pr-1 form-control-label mr-2">지시번호</label> <input
											type="text" name="searchInstCd" class="form-control instCd" placeholder="Inst Code">
									</div>
									<div class="form-group col-6 mb-1">
										<label for="searchLine" class="pr-1 form-control-label mr-2">라인</label>
										<div class="input-group modalP" id="modalP1">
											<input type="text" id="searchLineCd" name="searchLineCd"
												placeholder="Line Code" class="form-control bg-white"readonly>
											<div class="input-group-btn">
												<input type="button" class="btn btn-primary ml-2"
													id="linePopBtn" value="검색">
											</div>
										</div>
									</div>
									<div class="form-group col-6 mt-1">
										<label class="pr-1  form-control-label mr-2">실적일자</label> <input
											type="date" name="searchPerfDate1" class="form-control mr-1">~ <input type="date"
											name="searchPerfDate2" class="form-control ml-1">
									</div>
									<div class="form-group col-6 mt-1">
										<label class="pr-1  form-control-label mr-2">품번</label> <input
											type="text" id="productSearchId" name="searchProdCd"
											class="form-control" placeholder="Prod Code">
										<div class="input-group">
											<input type="button" class="btn btn-primary ml-2"
												id="productSearchPop" value="검색">
										</div>
									</div>

									<div class="col p-0 mt-3">
										<input type="submit"
											class="btn btn-primary col-2 float-right ml-3"
											id="searchPerf" value="조회"> <input type="reset"
											class="btn btn-secondary col-1 float-right reset" value="취소">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 	검색창 -->
		<!-- 	편집창 -->
		<div class="content pt-0">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card m-0">
							<div class="card-header">
								<strong class="card-title">생산실적 입력/수정</strong>
							</div>
							<form
								action="${pageContext.request.contextPath}/performance/insertPerf"
								id="insertPerfForm" method="post">
								<div class="card-body card-block">
									<table id="table" class="table table-striped table-bordered">
										<thead class="thead-dark">
											<tr>
												<th scope="col">실적코드</th>
												<th scope="col">지시번호</th>
												<th scope="col">실적일자</th>
												<th scope="col">라인명</th>
												<th scope="col">상품명</th>
												<th scope="col">단위</th>
												<th scope="col">지시수량</th>
												<th scope="col">양품</th>
												<th scope="col">불량</th>
												<th scope="col">불량사유</th>
												<th scope="col">수주번호</th>
												<th scope="col">비고</th>
										</thead>
										<tbody>
											<tr>
												<td scope="row"><input type="text" id="insertPerfCd"
													name="perf_cd" class="form-control instCd" readonly></td>
												<td>
													<div class="input-group modalP" id="modalP2">
														<input type="text" id="insertInstCd" name="inst_cd"
															value="${pageDTO.search}" readonly
															placeholder="Inst Code" class="form-control bg-white">
														<div class="input-group-btn">
															<input type="button" class="btn btn-primary"
																id="instListBtn" value="검색">
														</div>
													</div>
												</td>
												<td><input type="text" id="insertPerfDate" disabled
													class="form-control"></td>
												<td><input type="text" id="insertLineNm"
													value="${instructionDTO.line_nm}" disabled
													class="form-control"></td>
												<td><input type="text" id="insertProdNm"
													value="${instructionDTO.prod_nm}" disabled
													class="form-control"></td>
												<td><input type="text" id="insertProdUnit"
													value="${instructionDTO.prod_unit}" disabled
													class="form-control"></td>
												<td><input type="text" id="insertProdCount"
													value="${instructionDTO.prod_count}" disabled
													class="form-control"></td>
												<td><input type="text" id="insertPerfGd"
													name="perf_good" value="0" class="form-control"></td>
												<td><input type="text" id="insertPerfErr"
													name="perf_err" value="0" class="form-control"></td>
												<td class="col-1">
													<div class="col p-0">
														<select class="form-control" id="insertPerfCs"
															name="perf_couse" disabled="disabled">
															<option value="">--</option>
															<option value="기계이상">기계이상</option>
															<option value="재고부족">재고부족</option>
															<option value="기타">기타</option>
														</select>
													</div>
												<td><input type="text" id="insertOrdCd"
													value="${instructionDTO.ord_cd}" disabled
													class="form-control"></td>
												<td><input type="text" id="insertPerfNote"
													class="form-control"></td>
											</tr>
										</tbody>
									</table>
									<button type="submit"
										class="btn btn-primary col-2 float-right ml-3"
										id="insertPerfBtn">추가</button>
									<button type="submit"
										class="btn btn-primary col-1 float-right ml-3"
										id="updatePerfBtn" disabled>수정</button>
									<button type="button"
										class="btn btn-secondary col-1 float-right ml-3"
										id="deletePerfBtn" disabled>삭제</button>
									<button type="reset"
										class="btn btn-secondary col-1 float-right reset"
										id="resetPerfBtn">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 	편집창 -->

		<div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">생산실적</strong>
							</div>
							<div class="card-body">
								<table id="hover_tb" class="table table-striped table-bordered">
									<thead class="thead-dark">

										<tr>
											<th scope="col">실적코드</th>
											<th scope="col">지시번호</th>
											<th scope="col">실적일자</th>
											<th scope="col">라인명</th>
											<th scope="col">품번</th>
											<th scope="col">품명</th>
											<th scope="col">단위</th>
											<th scope="col">지시수량</th>
											<th scope="col">양품</th>
											<th scope="col">불량</th>
											<th scope="col">불량사유</th>
											<th scope="col">수주번호</th>
											<th scope="col">업체</th>
											<th scope="col" class="col-1">비고</th>
											<c:if test="${sessionScope.emp_position != '사원'}">
											<th scope="col"></th>
											</c:if>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="performanceDTO"
											items="${performanceCurrentInfo }">
											<tr class="data-row" data-prod-cd="${performanceDTO.prod_cd}"
												data-perf-cd="${performanceDTO.perf_cd}">
												<td>${performanceDTO.perf_cd }</td>
												<td>${performanceDTO.inst_cd }</td>
												<td><fmt:formatDate value="${performanceDTO.perf_date}"
														pattern="yyyy.MM.dd" /></td>
												<td>${performanceDTO.line_nm }</td>
												<td>${performanceDTO.prod_cd }</td>
												<td>${performanceDTO.prod_nm }</td>
												<td>${performanceDTO.prod_unit }</td>
												<td>${performanceDTO.inst_count }</td>
												<td>${performanceDTO.perf_good }</td>
												<td>${performanceDTO.perf_err }</td>
												<td>${performanceDTO.perf_cause }</td>
												<td>${performanceDTO.ord_cd }</td>
												<td>${performanceDTO.cli_nm }</td>
												<td>${performanceDTO.perf_note }</td>
												<c:if test="${sessionScope.emp_position != '사원'}">
												<td>
													<div class="input-group">
														<button id="editPerfBtn" class="btn btn-secondary"
															value="${performanceDTO.perf_cd }">편집</button>
													</div>
												</td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- 페이징 -->
								<div class="col p-0 mt-3">
									<div class="dataTables_paginate paging_simple_numbers float-right">
										<ul class="pagination">
										<!-- 이전 -->
										<c:if test="${pageDTO.startPage <= pageDTO.pageBlock }">
											<li class="paginate_button page-item previous disabled">
												<a href="${pageContext.request.contextPath}/performance/performanceCurrentInfo?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&searchInstCd=${pageDTO.search}&searchProdCd=${pageDTO.search2}&searchPerfDate1=${pageDTO.search3}&searchPerfDate2=${pageDTO.search4}&searchLineCd=${pageDTO.search5}"
												class="page-link">Previous</a></li>
										</c:if>
										<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
											<li class="ppaginate_button page-item previous" >
												<a href="${pageContext.request.contextPath}/performance/performanceCurrentInfo?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&searchInstCd=${pageDTO.search}&searchProdCd=${pageDTO.search2}&searchPerfDate1=${pageDTO.search3}&searchPerfDate2=${pageDTO.search4}&searchLineCd=${pageDTO.search5}"
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
													<a class="page-link" href="${pageContext.request.contextPath}/performance/performanceCurrentInfo?pageNum=${i}&searchInstCd=${pageDTO.search}&searchProdCd=${pageDTO.search2}&searchPerfDate1=${pageDTO.search3}&searchPerfDate2=${pageDTO.search4}&searchLineCd=${pageDTO.search5}">${i}</a>
												</li>
											</c:if>
										</c:forEach>
										<!-- 현재 -->										
										<!-- 다음 -->																				
										<c:if test="${pageDTO.endPage >= pageDTO.pageCount }">
											<li class="paginate_button page-item next disabled" id="bootstrap-data-table_next">
												<a href="${pageContext.request.contextPath}/performance/performanceCurrentInfo?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&searchInstCd=${pageDTO.search}&searchProdCd=${pageDTO.search2}&searchPerfDate1=${pageDTO.search3}&searchPerfDate2=${pageDTO.search4}&searchLineCd=${pageDTO.search5}" class="page-link">Next</a>
											</li>
										</c:if>
										<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
											<li class="paginate_button page-item next" id="bootstrap-data-table_next">
												<a href="${pageContext.request.contextPath}/performance/performanceCurrentInfo?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&searchInstCd=${pageDTO.search}&searchProdCd=${pageDTO.search2}&searchPerfDate1=${pageDTO.search3}&searchPerfDate2=${pageDTO.search4}&searchLineCd=${pageDTO.search5}" class="page-link">Next</a>
											</li>
										</c:if>
										<!-- 다음 -->																				
										</ul>
									</div>
								</div>
								<!-- 페이징 -->
								<br>
								<br> <b>생산실적 현황</b>
								<table id="result-table"
									class="table table-striped table-bordered">
									<thead class="thead-dark">
										<tr>
											<th scope="col" style="width: 25%;">품번</th>
											<th scope="col" style="width: 25%;">품명</th>
											<th scope="col">단위</th>
											<th scope="col">투입량</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="4" style="text-align: center;">검색된 자료가
												없습니다.</td>
										</tr>
									</tbody>
								</table>
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
		// 생산실적 현황 json 리스트
		$(document).ready(function() {
		  // 첫번째 표에서 데이터 클릭시 이벤트 리스너 추가
		  jQuery('.data-row').on('click', function() {
		    var prod_cd = jQuery(this).data('prod-cd');
		    var perf_cd = jQuery(this).data('perf-cd');
		    jQuery.ajax({
		      url: '${pageContext.request.contextPath}/performance/perfCurrJsonList',
		      data: {prod_cd: prod_cd, perf_cd: perf_cd},
		      success: function(data) {
		        // 결과를 두번째 표에 출력
		        var resultTable = jQuery('#result-table').find('tbody');
		        resultTable.empty();
		        for (var i = 0; i < data.length; i++) {
		          var row = '<tr>' +
		            '<td>' + data[i].r_prod_cd + '</td>' +
		            '<td>' + data[i].r_prod_nm + '</td>' +
		            '<td>' + data[i].r_prod_unit + '</td>' +
		            '<td>' + data[i].req_req * (data[i].perf_good + data[i].perf_err) + '</td>' +
		            '</tr>';
		          resultTable.append(row);
		        }
		      },
		      error: function(xhr, textStatus, errorThrown) {
                  console.log(xhr.responseText);
                  console.log(textStatus);
                  console.log(errorThrown);
              }
		    });
		  });
		});
		
		// 회색 수정 버튼
		$(document).on("click", "#editPerfBtn", function(){
			console.log(jQuery(this).closest('tr').children('td:eq(0)').text());
			jQuery('#insertPerfCd').val(jQuery(this).closest('tr').children('td:eq(0)').text());
			jQuery('#insertInstCd').val(jQuery(this).closest('tr').children('td:eq(1)').text());
			if('#insertPerfDate' != null){
				jQuery('#insertPerfDate').val(jQuery(this).closest('tr').children('td:eq(2)').text());
			}
			jQuery('#insertLineNm').val(jQuery(this).closest('tr').children('td:eq(3)').text());
			jQuery('#insertProdNm').val(jQuery(this).closest('tr').children('td:eq(5)').text());
			jQuery('#insertProdUnit').val(jQuery(this).closest('tr').children('td:eq(6)').text());
			jQuery('#insertProdCount').val(jQuery(this).closest('tr').children('td:eq(7)').text());
			jQuery('#insertPerfGd').val(jQuery(this).closest('tr').children('td:eq(8)').text());
			jQuery('#insertPerfErr').val(jQuery(this).closest('tr').children('td:eq(9)').text());
			jQuery('#insertPerfCs').val(jQuery(this).closest('tr').children('td:eq(10)').text()).prop('selected', true);
			jQuery('#insertPerfForm').attr('action', '${pageContext.request.contextPath}/performance/updatePerf');
			jQuery('#updatePerfBtn').prop('disabled', false);
			jQuery('#deletePerfBtn').prop('disabled', false);
			jQuery('#insertPerfBtn').prop('disabled', true);
			jQuery('#insertPerfGd').focus();
			
			if(jQuery('#insertPerfErr').val() != 0){
				jQuery('#insertPerfCs').attr('disabled', false);
			}
		});
		
		// 취소 버튼 (입력창 clear)
		$(document).on("click",".reset", function(){
			console.log(jQuery(this).closest('form').find('div input[type="text"]'));
			console.log(jQuery(this).attr('id'));
			jQuery(this).closest('form').find('div input[type="text"]').attr('value', '');
			jQuery(this).closest('form').find('div input[type="select"]').attr('value', '');
			if(jQuery(this).attr('id')=='resetPerfBtn'){
				jQuery("#insertPerfForm").attr('action', '${pageContext.request.contextPath}/performance/insertPerf');
				jQuery('#updatePerfBtn').prop('disabled', true);
				jQuery('#deletePerfBtn').prop('disabled', true);
				jQuery('#insertPerfBtn').prop('disabled', false);
			}
		});
		
		// 불량사유 on off
		$(document).on("keyup", "#insertPerfErr", function(){
			console.log();
			if(jQuery('#insertPerfErr').val() != 0){
				jQuery('#insertPerfCs').attr('disabled', false);
			}
			if(jQuery('#insertPerfErr').val() == 0){				
				jQuery('#insertPerfCs').attr('disabled', true);
			}
		});
			
		// 실적 추가 버튼
		$(document).on("click", "#insertPerfBtn", function(){
			console.log(jQuery('#insertPerfCs option:selected').val());
			if(jQuery('#insertPerfGd').val() == 0 && jQuery('#insertPerfErr').val() == 0){
				alert("양품/불량품 입력해주세요.");
				return false;
			}
			if(jQuery('#insertInstCd').val() == ''){
				alert("지시번호 입력해주세요.");
				return false;
			}
			if(jQuery('#insertPerfErr').val() != 0 && jQuery('#insertPerfCs option:selected').val()==''){
				alert("불량사유 입력해주세요.");
				return false;
			}
		});
		
		// 삭제 버튼
		$(document).on("click", "#deletePerfBtn", function(){
			console.log(jQuery('#insertPerfCd').val());
			location.href='${pageContext.request.contextPath}/performance/deletePerf?delPerfCd='+jQuery('#insertPerfCd').val();
		});
		
		// 라인 팝업
		$(document).on("click", "#linePopBtn", function(){
			window.open(
					'${pageContext.request.contextPath}/line/linePop', 'LinePop', 'width=800,height=650');
		});
		
		// 품목팝업
		$(document).on("click", "#productSearchPop", function(){
		// 새로운 윈도우 창을 띄움
			window.open(
				"${pageContext.request.contextPath }/product/productSearchPop",
				"productSearchPop", "width=800,height=650");
		});
		
		// 목록(생산 지시 페이지로 이동)
		$(document).on("click", "#instListBtn", function(){
			location.href='${pageContext.request.contextPath}/instruction/infoInst';
		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
