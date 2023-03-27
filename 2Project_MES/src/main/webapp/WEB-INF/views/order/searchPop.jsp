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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/search.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order.css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
</head>
<script>
	function cli(cli_cd,cli_nm) {
		opener.document.getElementById("search_cli_cd").value=cli_cd;
		opener.document.getElementById("search_cli_nm").value=cli_nm;
		document.orderPop.submit();
		self.close();
	}
	function emp(emp_cd,emp_nm) {
		opener.document.getElementById("search_emp_cd").value=emp_cd;
		opener.document.getElementById("search_emp_nm").value=emp_nm;
		document.orderPop.submit();
		self.close();
	}
	function prod(prod_cd,prod_nm) {
		opener.document.getElementById("search_prod_cd").value=prod_cd;
		opener.document.getElementById("search_prod_nm").value=prod_nm;
		document.orderPop.submit();
		self.close();
	}
</script>
<body>
		<div class="breadcrumbs">
			<div class="breadcrumbs-inner">
				<div class="row m-0">
					<div class="col-sm-4">
						<div class="page-header float-left">
							<div class="page-title">
								<c:if test="${pop eq 'cli' }">
									<h3>거래처 조회</h3>
								</c:if>
								<c:if test="${pop eq 'emp' }">
									<h3>담당자 조회</h3>
								</c:if>
								<c:if test="${pop eq 'prod' }">
									<h3>품목 조회</h3>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<form action="${pageContext.request.contextPath }/order/searchPop" method="get">
			<div class="content">
				<div class="animated fadeIn">
					<div class="row">
						<div class="col-lg">
							<div class="card">
								<div class="card-body">
									<!--	(검색창 위치) -->
									<div class="search-div">
										<div class="search-div-o">
											<c:if test="${pop eq 'cli' }">
												<span class="search">업체코드 <input type="text" name="prod_cd"></span>
												<span class="search">업체명 <input type="text" name="prod_nm"></span>
												<span class="search">업체구분 <select class="select-search" name="info">
																				<option value="">전체</option>
																				<option value="cli_ja">자사</option>
																				<option value="cli_h">협력사</option>
																				<option value="cli_go">고객사</option>
																			</select></span>
											</c:if>
											<c:if test="${pop eq 'emp' }">
												<span class="search">사번 <input type="text" name="emp_cd"></span>
												<span class="search">이름 <input type="text" name="emp_nm"></span>
											</c:if>
											<c:if test="${pop eq 'prod' }">
												<span class="search">품번 <input type="text" name="prod_cd"></span>
												<span class="search">품명 <input type="text" name="prod_nm"></span>
												<span class="search">자재유형 <select class="select-search" name="info">
																				<option value="">전체</option>
																				<option value="prod_wan">완제품</option>
																				<option value="prod_bu">부자재</option>
																			</select></span>
											</c:if>
										</div>
										<button type="submit" class="search-btn">조회</button>
									</div>
									<!-- 이 이상 긁는건 너무 템플릿에만의존적인 것 같아 나머지 기능은 직접 개발합시다 파이팅! -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- .content -->
		
		<form action="${pageContext.request.contextPath }/order/orderInsert" name="orderPop" method="get">
		<div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-body">
								<table class="table" id="hover_tb">
									<thead class="thead-dark">
										<tr>
											<c:if test="${pop eq 'cli' }">
												<th scope="col">업체코드</th>
												<th scope="col">업체명</th>
												<th scope="col">대표자</th>
												<th scope="col">E-MAIL</th>
											</c:if>
											<c:if test="${ pop eq 'emp' }">
												<th scope="col">사용자사번</th>
												<th scope="col">사용자명</th>
											</c:if>
											<c:if test="${ pop eq 'prod' }">
												<th scope="col">상품코드</th>
												<th scope="col">상품이름</th>
												<th scope="col">자재유형</th>
												<th scope="col">단위</th>
												<th scope="col">재질</th>
												<th scope="col">규격</th>
											</c:if>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="orderDTO" items="${popList }">
											<c:if test="${pop eq 'cli' }">
												<tr onclick="cli('${orderDTO.cli_cd }','${orderDTO.cli_nm }')">
													<td>${orderDTO.cli_cd }</td>
													<td>${orderDTO.cli_nm }</td>
													<td>${orderDTO.cli_boss }</td>
													<td>${orderDTO.cli_email }</td>
												</tr>
											</c:if>
											<c:if test="${ pop eq 'emp' }">
												<tr onclick="emp('${orderDTO.emp_cd}','${orderDTO.emp_nm }')">
													<td>${orderDTO.emp_cd }</td>
													<td>${orderDTO.emp_nm }</td>
												</tr>
											</c:if>
											<c:if test="${ pop eq 'prod' }">
												<tr onclick="prod('${orderDTO.prod_cd }','${orderDTO.prod_nm }')">
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
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
		<!-- .content -->
		
<!-- 	<div style="text-align : center;"> -->
<%-- 		<c:if test="${pageDTO.startPage>pageDTO.pageBlock}"> --%>
<%-- 			<a href="${pageContext.request.contextPath}/order/cliPop?pageNum=${pageDTO.startPage-pageDTO.pageBlock}">◀</a> --%>
<%-- 		</c:if> --%>

<%-- 		<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1"> --%>
<%-- 			<a href="${pageContext.request.contextPath}/order/cliPop?pageNum=${i}">${i}</a> --%>
<%-- 		</c:forEach> --%>

<%-- 		<c:if test="${pageDTO.endPage<pageDTO.pageCount}"> --%>
<%-- 			<a href="${pageContext.request.contextPath}/order/cliPop?pageNum=${pageDTO.startPage+pageDTO.pageBlock}">▶</a> --%>
<%-- 		</c:if> --%>
<!-- 	</div> -->
</body>
</html>
