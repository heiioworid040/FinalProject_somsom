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
	function fun1() {
		window.open('${pageContext.request.contextPath }/order/cliPop','cliPop','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=900,height=510,top=90,left=200')
	}
	function fun2() {
		window.open('${pageContext.request.contextPath }/order/empPop','empPop','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=600,height=510,top=90,left=200')
	}
	function fun3() {
		window.open('${pageContext.request.contextPath }/order/prodPop','prodPop','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=600,height=510,top=90,left=200')
	}
// 	function fun4(ord_cd) {
// 		alert(ord_cd);
// 		document.orderInsert2.submit();
// 	}
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
								<h1>수주관리</h1>
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
		<form action="${pageContext.request.contextPath }/order/orderInsert" name="orderInsert" method="get">
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
										<span class="search">업체 <input type="text" name="cli_cd"> <input type="text" readonly></span>
										<span class="search">담당자 <input type="text" name="emp_cd"> <input type="text" readonly></span>
									</div>
									<div class="search-450">
										<span class="search">수주일자 <input type="date" name="ord_date"> <input type="date" name="ord_date_end"></span>
										<span class="search">납품예정일 <input type="date" name="ord_d_date"> <input type="date" name="ord_d_date_end"></span>
									</div>
									<div class="search-500">
										<span class="search">품번 <input type=text name="prod_cd"> <input type=text readonly></span>
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
		
<%-- 		<form action="${pageContext.request.contextPath}/order/orderInsert" name="orderInsert2" method="get"> --%>
		<div class="content-div">
			<div class="search-result-div">
				<span class="search-result">총 n건</span>
			</div>
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">수주품목</strong>
							</div>
							<div class="card-body">
								<table class="table">
									<thead class="thead-dark">
										<tr>
											<th scope="col">수주업체코드</th>
											<th scope="col">수주업체</th>
											<th scope="col">수주일자</th>
											<th scope="col">납품예정일</th>
											<th scope="col">담당자코드</th>
											<th scope="col">담당자</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="orderDTO" items="${orderInsertList }">
<!-- 											<tr> -->
											<tr onclick="location.href='${pageContext.request.contextPath }/order/orderInsert?ord_cd=${orderDTO.ord_cd }'">
<%-- 												<td><input type="submit" name="ord_cd" value="${orderDTO.ord_cd}"></td> --%>
												<td>${orderDTO.cli_cd }</td>
												<td>${orderDTO.cli_nm }</td>
												<td>${orderDTO.ord_date }</td>
												<td>${orderDTO.ord_d_date }</td>
												<td>${orderDTO.emp_cd }</td>
												<td>${orderDTO.emp_nm }</td>
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
<!-- 		</form> -->
		<!-- .content -->
		
		<form action="${pageContext.request.contextPath }/order/orderInsertPro" method="POST">
		<div class="content-div">
			<div class="search-btn-div">
				<div class="btn-div">
					<button type="submit" class="btn-test" name="btn_add">추가</button>
					<button type="button" class="btn-test" name="btn_edit">수정</button>
					<button type="button" class="btn-test" name="btn_del">삭제</button>
				</div>
			</div>
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">수주품목상세</strong>
							</div>
							<div class="card-body">
								<table class="table">
									<thead class="thead-dark">
										<tr>
											<th scope="col">수주업체코드</th><td><input type="text" id="cli_cd" name="cli_cd" value="${orderDTO.cli_cd }" readonly><input type="text" id="cli_nm" value="${orderDTO.cli_nm }" readonly><button type="button" id="pop" value="cli" onclick="fun1('cli')">돋보기</button></td>
											<th scope="col">수주일자</th><td><input type="date" name="ord_date" value="${ord_date }"></td>
										</tr>
										<tr>
											<th scope="col">담당자</th><td><input type="text" id="emp_cd" name="emp_cd" value="${orderDTO.emp_cd }" readonly><input type="text" id="emp_nm" value="${orderDTO.emp_nm }" readonly><button type="button" id="pop" value="emp" onclick="fun2()">돋보기</button></td>
											<th scope="col">납품예정일</th><td><input type="date" name="ord_d_date" value="${ord_d_date }"></td>
										</tr>
									</thead>
								</table>
							</div>
							<div class="search-btn-div">
								<div class="btn-div">

								</div>
							</div>
							<div class="card-header">
								<strong class="card-title">수주정보</strong>
							</div>
							<div class="card-body">
								<table class="table">
									<thead class="thead-dark">
										<tr>
											<th scope="col"></th>
											<th scope="col">품번</th>
											<th scope="col">품명</th>
											<th scope="col">단위</th>
											<th scope="col">수량</th>
											<th scope="col">비고사항</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
											<tr>
												<td></td>
												<td>${orderDTO.prod_cd }</td>
												<td>${orderDTO.prod_nm }</td>
												<td>${orderDTO.prod_unit }</td>
												<td>${orderDTO.ord_count }</td>
												<td>${orderDTO.prod_note }</td>
<!-- 												<td><button type="button" class="btn-test" name="btn_can" value="del">-</button></td> -->
											</tr>
<%-- 										<c:if test="${!empty btn_can }"> --%>
											<tr>
												<td></td>
												<td><input type="text" id="prod_cd" name="prod_cd" readonly></td>
												<td><input type="text" id="prod_nm" readonly></td>
												<td><input type="text" id="prod_unit" readonly></td>
												<td><input type="text" id="ord_count" name="ord_count"></td>
												<td><input type="text" id="prod_note" readonly></td>
												<td><button type="reset" class="btn-test" name="btn_can" value="del">-</button></td>
											</tr>
<%-- 										</c:if> --%>
									</tbody>
								</table>
									<button type="button" class="btn_can" name="btn_can" value="add" onclick="fun3()">+</button>
									${btn_can }
<!-- 								<button type="button" class="btn-test" name="btn_can" value="edit">수정</button> -->
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
