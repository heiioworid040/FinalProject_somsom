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

		<!-- 	검색창 -->
		<div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card m-0">
							<div class="card-body card-block">
								<form action="${pageContext.request.contextPath }/performance/performanceCurrentInfo" method="get" class="form-inline">
									<div class="form-group col-6 mb-1">
										<label class="pr-1  form-control-label">실적일자</label>&nbsp;&nbsp; <input
											type="date" name="search" class="form-control ">&nbsp;~&nbsp;
										<input type="date" name="search2" class="form-control">
									</div>
									<div class="form-group col-6 mb-1">
										<label class="pr-1  form-control-label">품번</label>&nbsp;&nbsp; <input
											type="text" id="productSearchId" name="search3" class="form-control ">
											<div class="input-group">
                                        	<div class="input-group-addon" id="productSearchPop" style="cursor: pointer;"><i class="ti-search"></i></div>
                                    	</div>
									</div>
									<div class="form-group col-6 mt-1">
										<label class="pr-1  form-control-label">지시번호</label>&nbsp;&nbsp;
										<input
											type="text" name="search4" class="form-control ">
									</div>
									<div class="form-group col-6 mb-1">
										<label class="pr-1  form-control-label">라인</label>&nbsp;&nbsp; 
											<div class="p-0 col">
												<select name="search5" id="select" class="form-control">
													<option>전체</option>
													<c:forEach var="lineDTO" items="${searchLine }">
                                                		<option value="${lineDTO.line_cd }">${lineDTO.line_nm}(${lineDTO.line_cd })</option>
                                                	</c:forEach>
												</select>
											</div>
									</div>
                                    <div class="col p-0">
										<input type="submit" class="btn btn-primary col-2 float-right ml-3" id="searchPerf" value="조회">
										<input type="reset" class="btn btn-secondary col-1 float-right reset" value="취소">
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
							<form action="${pageContext.request.contextPath}/performance/insertPerf" id="insertInstForm" method="post">
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
												<th scope="col">양품</th>
												<th scope="col">불량</th>
												<th scope="col">불량사유</th>
												<th scope="col">수주번호</th>
												<th scope="col">비고</th>
										</thead>
										<tbody>
											<tr>
												<td scope="row">
												<input type="text" id="insertInstCd" name="inst_cd" class="form-control" readonly>
												</td>
												<td>
												<input type="text" id="insertInstCd" name="inst_cd" value="${pageDTO.search4 }" placeholder="Inst Code" class="form-control bg-white" readonly>
												</td>
												<td><input type="text" id="insertPerfDate" disabled class="form-control" ></td>												
												<td><input type="text" id="insertLineNm" value="${instructionDTO.line_nm}" disabled class="form-control"></td>
												<td><input type="text" id="insertProdNm" value="${instructionDTO.prod_nm}" disabled class="form-control"></td>
												<td><input type="text" id="insertProdUnit" value="${instructionDTO.prod_unit}" disabled class="form-control"></td>
												<td><input type="text" id="insertPerfGd" value="0" class="form-control"></td>
												<td><input type="text" id="insertPerfErr" value="0" class="form-control"></td>
												<td>
												<div class="p-1 col">
												<select name="search5" id="select" class="form-control">
													<option>--</option>
													<option>기계이상</option>
													<option>재고부족</option>													
													<option>기타</option>													
												</select>
												</div>
												<td><input type="text" id="insertOrdCd" value="${instructionDTO.ord_cd}" disabled class="form-control"></td>
												<td><input type="text" id="insertPerfNote" class="form-control"></td>
											</tr>
										</tbody>
									</table>
									<input type="submit" class="btn btn-primary col-2 float-right ml-3" id="insertInstBtn" value="추가">
									<input type="button" class="btn btn-primary col-1 float-right ml-3" id="updateInstBtn" value="수정" disabled>
									<input type="reset"  class="btn btn-secondary col-1 float-right reset" id="resetInstBtn" value="취소">
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
												<th scope="col">양품</th>
												<th scope="col">불량</th>
												<th scope="col">불량사유</th>
												<th scope="col">수주번호</th>
												<th scope="col">업체</th>
												<th scope="col">비고</th>
												<th scope="col"></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="performanceDTO" items="${performanceCurrentInfo }">
													<tr class="data-row" data-prod-cd="${performanceDTO.prod_cd}" data-perf-cd="${performanceDTO.perf_cd}">
													<td>${performanceDTO.perf_cd }</td>
													<td>${performanceDTO.inst_cd }</td>
													<td><fmt:formatDate value="${performanceDTO.perf_date}" pattern="yyyy.MM.dd"/></td>
													<td>${performanceDTO.line_nm }</td>
													<td>${performanceDTO.prod_cd }</td>
													<td>${performanceDTO.prod_nm }</td>
													<td>${performanceDTO.prod_unit }</td>
													<td>${performanceDTO.perf_good }</td>
													<td>${performanceDTO.perf_err }</td>
													<td>${performanceDTO.perf_cause }</td>
													<td>${performanceDTO.ord_cd }</td> 
													<td>${performanceDTO.cli_nm }</td>
													<td>${performanceDTO.perf_note }</td>
													<td>
														<div class="input-group">
															<button id="editPerfBtn" class="btn btn-secondary" value="${performanceDTO.perf_cd }">수정</button>
														</div>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									
									<br><br>
									
									<b>생산실적 현황</b>
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
										<td colspan="4" style="text-align: center;">검색된 자료가 없습니다.</td>
										</tr>
										</tbody>
									</table>
								<!-- 페이징 처리 -->
								<div class="pageNum">
									<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
										<a
											href="${pageContext.request.contextPath}/performance/performanceCurrentInfo?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}">[10페이지
											이전]</a>
									</c:if>

									<c:forEach var="i" begin="${pageDTO.startPage }"
										end="${pageDTO.endPage }" step="1">
										<a
											href="${pageContext.request.contextPath}/performance/performanceCurrentInfo?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}">${i}</a>
									</c:forEach>

									<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
										<a
											href="${pageContext.request.contextPath}/performance/performanceCurrentInfo?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}">[10페이지
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
	<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script type="text/javascript">
	// 생산실적 현황 json 리스트
 	// 첫번째 표에서 데이터 클릭시 이벤트 리스너 추가
	$(document).on('click', '.data-row', function() {
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
		          var row = '<tr>' +'<td>' + data[i].r_prod_cd + '</td>' +'<td>' + data[i].r_prod_nm + '</td>' +'<td>' + data[i].r_prod_unit + '</td>' +
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
	
	$(document).on("click", "#productSearchPop", function(){
		// 새로운 윈도우 창을 띄움
		window.open(
				"${pageContext.request.contextPath }/product/productSearchPop",
				"productSearchPop", "width=800,height=650");
	});
	
	// 품번 검색 팝업창
	$(document).on("click", "#editPerfBtn", function(){
		console.log($(this).closest('tr').children('td:eq(6)').text());
		$(searchLineCd2).val('');
		$(searchLineNm).val('');
		$(insertProdCd).val('');
		$(insertProdNm).val('');
		$(insertProdUnit).val('');
		$(insertProdCount).val('');
		$(insertOrderCd).val('');
		$(insertClientNm).val('');
		
		$('#insertPerfCd').val($(this).closest('tr').children('td:eq(0)').text());
		$('#searchLineCd2').val($(this).closest('tr').children('td:eq(1)').text());
		$('#searchLineNm').val($(this).closest('tr').children('td:eq(2)').text());
		$('#insertOrderCd').val($(this).closest('tr').children('td:eq(3)').text());
		$('#insertProdCd').val($(this).closest('tr').children('td:eq(4)').text());
		$('#insertProdNm').val($(this).closest('tr').children('td:eq(5)').text());
		$('#insertProdUnit').val($(this).closest('tr').children('td:eq(6)').text());
		$('#insertInstSt').val($(this).closest('tr').children('td:eq(7)').text()).prop('selected', true);
		$('#insertProdCount').val($(this).closest('tr').children('td:eq(8)').text());
		$('#insertInstFcount').val($(this).closest('tr').children('td:eq(9)').text());
		$('#insertClientNm').val($(this).closest('tr').children('td:eq(11)').text());
		$("#insertInstForm").attr('action', '${pageContext.request.contextPath}/instruction/updateInst');
		$("#insertInstForm").attr('action', '${pageContext.request.contextPath}/instruction/updateInst');
		$("#insertInstForm").attr('action', '${pageContext.request.contextPath}/instruction/updateInst');
		$('#updateInstBtn').prop('disabled', false);
		$('#insertInstBtn').prop('disabled', true);
		$('#lineModalBtn').focus();

	});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>


</body>
</html>
