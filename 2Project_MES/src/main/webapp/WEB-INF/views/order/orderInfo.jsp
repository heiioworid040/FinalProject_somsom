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
function searchPop(search) {
	if(search==1) window.open('${pageContext.request.contextPath }/order/searchPop?pop=cli','searchPop','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=900,height=510,top=90,left=200')
	else if(search==2) window.open('${pageContext.request.contextPath }/order/searchPop?pop=emp','searchPop','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=900,height=510,top=90,left=200')
	else window.open('${pageContext.request.contextPath }/order/searchPop?pop=prod','searchPop','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=900,height=510,top=90,left=200')
}
</script>
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
								<h1>수주현황</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="#">Dashboard</a></li>
									<li><a href="#">Table</a></li>
									<li class="active">Basic table</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<form action="${pageContext.request.contextPath }/order/orderInfo" method="get">
			<div class="content">
				<div class="search-btn-div">
					<button type="submit" class="search-btn">조회</button>
				</div>
				<div class="animated fadeIn">
					<div class="row">
						<div class="col-lg">
							<div class="card">
								<div class="card-body">
									<!--	(검색창 위치) -->
									<div class="search-500">
										<span class="search">업체 <input type="text" id="search_cli_cd" name="cli_cd" readonly> <input type="text" id="search_cli_nm" readonly><button type="button" onclick="searchPop(1)">돋보기</button></span>
										<span class="search">담당자 <input type="text" id="search_emp_cd" name="emp_cd" readonly> <input type="text" id="search_emp_nm" readonly><button type="button" onclick="searchPop(2)">돋보기</button></span>
									</div>
									<div class="search-450">
										<span class="search">수주일자 <input type="date" name="ord_date"> <input type="date" name="ord_date_end"></span>
										<span class="search">납품예정일 <input type="date" name="ord_d_date"> <input type="date" name="ord_d_date_end"></span>
									</div>
									<div class="search-500">
										<span class="search">품번 <input type=text id="search_prod_cd" name="prod_cd" readonly> <input type=text id="search_prod_nm" readonly><button type="button" onclick="searchPop(3)">돋보기</button></span>
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
		
		<form action="${pageContext.request.contextPath }/order/orderInfo" method="get">
		<div class="content">
			<div class="search-btn-div">
				<div class="btn-div">
					<button type="button" class="btn-test">추가</button>
					<button type="button" class="btn-test">수정</button>
					<button type="button" class="btn-test">삭제</button>
				</div>
			</div>
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">수주현황</strong>
							</div>
							<div class="card-body">
								<table class="table" id="hover_tb">
									<thead class="thead-dark">
										<tr>
											<th scope="col">수주번호</th>
											<th scope="col">업체</th>
											<th scope="col">수주일자</th>
											<th scope="col">담당자</th>
											<th scope="col">품번</th>
											<th scope="col">품명</th>
											<th scope="col">단위</th>
											<th scope="col">납품예정일</th>
											<th scope="col">수주량</th>
											<th scope="col">출하량</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="orderDTO" items="${orderList }">
											<tr>
												<th scope="row">${orderDTO.ord_cd }</th>
												<td>${orderDTO.cli_nm }</td>
												<td>${orderDTO.ord_date }</td>
												<td>${orderDTO.emp_nm }</td>
												<td>${orderDTO.prod_cd }</td>
												<td>${orderDTO.prod_nm }</td>
												<td>${orderDTO.prod_unit }</td>
												<td>${orderDTO.ord_d_date }</td>
												<td>${orderDTO.ord_count }</td>
												<td>${orderDTO.ship_count }</td>
											</tr>
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
