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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
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
<script>
	function search(search,cd,nm,mat,unit) {
		<c:if test="${pop eq 'cliS' or pop eq 'empS' or pop eq 'prodS' }">
			opener.document.getElementById(search+"S_cd").value=cd;
			opener.document.getElementById(search+"S_nm").value=nm;
			document.searchPop.submit();
			self.close();
		</c:if>
		<c:if test="${pop eq 'cli' or pop eq 'emp' or pop eq 'prod' }">
			opener.document.getElementById(search+"_cd").value=cd;
			opener.document.getElementById(search+"_nm").value=nm;
			<c:if test="${pop eq 'prod'}">
			opener.document.getElementById(search+"_mat").value=mat;
			opener.document.getElementById(search+"_unit").value=unit;
			</c:if>
			document.searchPop.submit();
			self.close();
		</c:if>
		<c:if test="${pop eq 'cliO' or pop eq 'empO' or pop eq 'prodO' }">
			opener.document.getElementById(search+"_cd"+"${id}").value=cd;
			opener.document.getElementById(search+"_nm"+"${id}").value=nm;
			<c:if test="${pop eq 'prodO'}">
			opener.document.getElementById(search+"_unit"+"${id}").value=unit;
			</c:if>
			document.searchPop.submit();
			self.close();
		</c:if>
	}
</script>
<body>
							<div class="search-text-div">
								<c:if test="${pop eq 'cli' or pop eq 'cliS' or pop eq 'cliO' }">
									<h3 class="search-text">거래처 조회</h3>
								</c:if>
								<c:if test="${pop eq 'emp' or pop eq 'empS' or pop eq 'empO' }">
									<h3 class="search-text">담당자 조회</h3>
								</c:if>
								<c:if test="${pop eq 'prod' or pop eq 'prodS' or pop eq 'prodO' }">
									<h3 class="search-text">상품 조회</h3>
								</c:if>
							</div>
		
		<!-- 	검색창 -->
		<div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card m-0">
							<div class="card-body card-block">
								<form action="${pageContext.request.contextPath }/order/searchPop" method="get" class="form-inline">
								<input type="hidden" name="pop" value="${pop }">
								<input type="hidden" name="id" value="${id }">
											<c:if test="${pop eq 'cli' or pop eq 'cliS' or pop eq 'cliO' }">
												<div class="search-div3">
													<span class="search-cl3">거래처코드</span><input type="text" id="cliS_cd" name="cd" placeholder="Client Code">
												</div>
												<div class="search-div3">
													<span class="search-cl3">거래처명</span><input type="text" id="cliS_nm" name="nm" placeholder="Client Name">
												</div>
												<div class="search-div3">
													<span class="search-cl3">거래처구분</span><select class="select-search" id="cliS_nm" name="info">
																					<option value="#">전체</option>
																					<option value="자사" ${pageDTO.search3 eq '자사' ? "selected":"" }>자사</option>
																					<option value="협력사" ${pageDTO.search3 eq '협력사' ? "selected":"" }>협력사</option>
																					<option value="고객사" ${pageDTO.search3 eq '고객사' ? "selected":"" }>고객사</option>
																					</select>
												</div>
											</c:if>
											
											<c:if test="${pop eq 'emp' or pop eq 'empS' or pop eq 'empO' }">
												<div class="search-div4">
													<span class="search-cl3">번호</span><input type="text" id="empS_cd" name="cd" placeholder="Emp Code">
												</div>
												<div class="search-div4">
													<span class="search-cl3">이름</span><input type="text" id="empS_cd" name="nm" placeholder="Emp Name">
												</div>
											</c:if>
											
											<c:if test="${pop eq 'prod' or pop eq 'prodS' or pop eq 'prodO' }">
												<div class="search-div4">
													<span class="search-cl3">상품코드</span><input type="text" id="prodS_cd" name="cd" placeholder="Prod Code">
												</div>
												<div class="search-div4">
													<span class="search-cl3">상품명</span><input type="text" id="prodS_nm" name="nm" placeholder="Prod Name">
												</div>
											</c:if>
											
									<c:if test="${pop eq 'emp' or pop eq 'empS' or pop eq 'empO' or pop eq 'prod' or pop eq 'prodS' or pop eq 'prodO' }">
										<div style="width: 25%">
											<input type="submit" class="btn btn-secondary float-right" value="조회">
										</div>
									</c:if>
									<c:if test="${pop eq 'cli' or pop eq 'cliS' or pop eq 'cliO' }">
										<div class="search-div2">
											<input type="submit" class="btn btn-secondary float-right" style="margin-top: 6px" value="조회">
										</div>
									</c:if>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 	검색창 -->
		
		<!-- .content -->
		<form action="${pageContext.request.contextPath }/order/orderInsert" name="searchPop" method="get">
		<div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-body">
								<table class="table table-striped table-bordered" id="hover_tb">
									<thead class="thead-dark">
										<tr>
											<c:if test="${pop eq 'cli' or pop eq 'cliS' or pop eq 'cliO' }">
												<th scope="col">거래처코드</th>
												<th scope="col">거래처명</th>
												<th scope="col">대표자</th>
												<th scope="col">구분</th>
											</c:if>
											<c:if test="${ pop eq 'emp' or pop eq 'empS' or pop eq 'empO' }">
												<th scope="col">담당자번호</th>
												<th scope="col">담당자</th>
											</c:if>
											<c:if test="${ pop eq 'prod' or pop eq 'prodS' or pop eq 'prodO' }">
												<th scope="col">상품코드</th>
												<th scope="col">상품명</th>
												<th scope="col">자재유형</th>
												<th scope="col">단위</th>
												<th scope="col">재질</th>
												<th scope="col">규격</th>
											</c:if>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="orderDTO" items="${popList }">
											<c:if test="${pop eq 'cli' or pop eq 'cliS' or pop eq 'cliO' }">
												<tr onclick="search('cli','${orderDTO.cli_cd }','${orderDTO.cli_nm }')">
													<td>${orderDTO.cli_cd }</td>
													<td>${orderDTO.cli_nm }</td>
													<td>${orderDTO.cli_boss }</td>
													<td>${orderDTO.cli_type }</td>
												</tr>
											</c:if>
											<c:if test="${ pop eq 'emp' or pop eq 'empS' or pop eq 'empO' }">
												<tr onclick="search('emp','${orderDTO.emp_cd}','${orderDTO.emp_nm }')">
													<td>${orderDTO.emp_cd }</td>
													<td>${orderDTO.emp_nm }</td>
												</tr>
											</c:if>
											<c:if test="${ pop eq 'prod' or pop eq 'prodS' or pop eq 'prodO' }">
												<tr onclick="search('prod','${orderDTO.prod_cd }','${orderDTO.prod_nm }','${orderDTO.prod_mat }','${orderDTO.prod_unit }')">
													<td>${orderDTO.prod_cd }</td>
													<td>${orderDTO.prod_nm }</td>
													<td>${orderDTO.prod_mat }</td>
													<td>${orderDTO.prod_unit }</td>
													<td>${orderDTO.prod_text }</td>
													<td>${orderDTO.prod_size }</td>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
								
								<!-- 페이징 -->
								<div class="pageNum">
									<c:if test="${pop eq 'cli' or pop eq 'cliS' or pop eq 'cliO' or pop eq 'prod' or pop eq 'prodS' or pop eq 'prodO' or pop eq 'emp' or pop eq 'empS' or pop eq 'empO' }">
										<c:if test="${empty cd and empty nm and empty info}">
											<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
												<a href="${pageContext.request.contextPath }/order/searchPop?pop=${pop }&pageNum=${pageDTO.startPage-pageDTO.pageBlock }&id=${id }&cd=${pageDTO.search }&nm=${pageDTO.search2 }&info=${pageDTO.search3 }">◁</a>
											</c:if>
											<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
												<c:if test="${i eq pageDTO.currentPage}">
													<strong>${i }</strong> 
												</c:if>
												<c:if test="${i ne pageDTO.currentPage}">
													<a href="${pageContext.request.contextPath }/order/searchPop?pop=${pop }&pageNum=${i}&id=${id }&cd=${pageDTO.search }&nm=${pageDTO.search2 }&info=${pageDTO.search3 }">${i }</a> 
												</c:if>
											</c:forEach>
											<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
											<a href="${pageContext.request.contextPath }/order/searchPop?pop=${pop }&pageNum=${pageDTO.startPage+pageDTO.pageBlock }&id=${id }&cd=${pageDTO.search }&nm=${pageDTO.search2 }&info=${pageDTO.search3 }">▷</a>
											</c:if>
										</c:if>
									</c:if>
								</div>
								<!-- 페이징 -->

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
		<!-- .content -->
		
</body>
</html>
