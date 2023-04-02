<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	function searchPop(search) {
	window.open('${pageContext.request.contextPath }/order/searchPop?pop='+search,'searchPop','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=900,height=510,top=90,left=200')
	}

function fun1() {
	   let check = false;
	   with(document.ckDelete) {
	      if(ck.length==undefined) {
	         if(ck.checked) { check = true; }
	      } else {
	         for(let i=0;i<ck.length;i++) {
	            if(ck[i].checked) { check = true; } }
	      } if(!check) {
	      alert("삭제할 게시글을 선택하세요");
	         return;
	      } else {
	         if(confirm("삭제처리 하시겠습니까?")) { submit(); }
	      } } }

function fun2() {
	   if($("input:checked[id='ckAll']").prop("checked")) {
	    $("input[type=checkbox]").prop("checked", true); 
	   }else {
	    $("input[type=checkbox]").prop("checked", false); 
	   }
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
									<li><a href="#">영업관리</a></li>
									<li class="active">수주현황</li>
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
								<form action="${pageContext.request.contextPath }/order/orderInfo" method="get" class="form-inline">
									<div class="search-div">
										<span class="search-cl">거래처</span><input type="text" id="cliS_cd" name="cli" readonly><input type="text" id="cliS_nm" readonly><button type="button" class="input-group-addon search-btn" style="cursor: pointer;" onclick="searchPop('cliS')"><i class="ti-search"></i></button>
									</div>
									<div class="search-div">
										<span class="search-cl2">수주일자</span><input type="date" id="ord_date" name="ord_date"><input type="date" id="ord_date_end" name="ord_date_end">
									</div>
									<div class="search-div">
										<span class="search-cl">담당자</span><input type="text" id="empS_cd" name="emp" readonly><input type="text" id="empS_nm" readonly><button type="button" class="input-group-addon search-btn" style="cursor: pointer;" onclick="searchPop('empS')"><i class="ti-search"></i></button>
									</div>
									<div class="search-div">
										<span class="search-cl">납품예정일</span><input type="date" id="ord_d_date" name="ord_d_date"><input type="date" id="ord_d_date_end" name="ord_d_date_end">
									</div>
									<div class="search-div">
										<span class="search-cl2">품목</span><input type="text" id="prodS_cd" name="prod" readonly><input type="text" id="prodS_nm" readonly><button type="button" class="input-group-addon search-btn" style="cursor: pointer;" onclick="searchPop('prodS')"><i class="ti-search"></i></button>
									</div>
									<div style="width: 50%">
										<input type="submit" class="btn btn-secondary float-right" value="조회">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 	검색창 -->
		
		<!-- .content -->
		<form action="${pageContext.request.contextPath }/order/orderInfo" method="get">
		<div class="content">
			<div style="width: 100%; height: 50px">
				<button type="button" class="btn btn-secondary float-right"  style="margin: 2px" onclick="fun1()">삭제</button>
				<button type="button" class="btn btn-secondary float-right" style="margin: 2px">수정</button>
				<button type="button" class="btn btn-secondary float-right" style="margin: 2px">추가</button>
			</div>
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">수주현황</strong>
							</div>
							<div class="card-body">
								<table id="hover_tb" class="table table-striped table-bordered">
									<thead class="thead-dark">
										<tr>
											<th scope="col"></th>
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
											<th scope="col"><input type="checkbox" id="ckAll" name="ckAll" onclick="fun2()"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="orderDTO" items="${orderList }" varStatus="status">
												<tr>
													<th scope="col">${status.count }</th>
													<th>${orderDTO.ord_cd }</th>
													<td>${orderDTO.cli_nm }</td>
													<td><fmt:formatDate pattern="yyyy-MM-dd" value="${orderDTO.ord_date }"/></td>
													<td>${orderDTO.emp_nm }</td>
													<td>${orderDTO.prod_cd }</td>
													<td>${orderDTO.prod_nm }</td>
													<td>${orderDTO.prod_unit }</td>
													<td><fmt:formatDate pattern="yyyy-MM-dd" value="${orderDTO.ord_d_date }"/></td>
													<td>${orderDTO.ord_count }</td>
													<td>${orderDTO.ship_count }</td>
													<td><input type="checkbox" id="ck" name="ck" value="${orderDTO.ord_cd }"></td>
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