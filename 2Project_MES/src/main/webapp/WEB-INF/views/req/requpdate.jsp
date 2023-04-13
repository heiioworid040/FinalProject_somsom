<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>clientInsert</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
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
	href="${pageContext.request.contextPath}/resources/css/client.css">

<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

<script>
	// 품번 검색 팝업창 
	function productSearchPop() {
		window
				.open(
						"${pageContext.request.contextPath }/product/productSearchPop2",
						"productSearchPop2", "width=800,height=650");
	}

	// 품번 검색 팝업창2
	function productSearchPop2() {
		window
				.open(
						"${pageContext.request.contextPath }/product/productSearchPop3",
						"productSearchPop3", "width=800,height=650");
	}

	function essential() {
		
		if (document.fr.prod_fcd.value == "") {
			alert("상위품번을 입력하세요.");
			document.fr.prod_fcd.focus();
			return false;
		}
		if (document.fr.prod_cd.value == "") {
			alert("하위품번을 입력하세요.");
			document.fr.prod_fcd.focus();
			return false;
		}
		if (document.fr.req_req.value == "") {
			alert("소요량을 입력하세요.");
			document.fr.req_req.focus();
			return false;
		}
		if (document.fr.req_add_emp.value == "") {
			alert("등록자를 입력하세요.");
			document.fr.req_add_emp.focus();
			return false;
		}
		if (document.fr.req_add_date.value == "") {
			alert("등록일을 선택하세요.");
			document.fr.req_add_date.focus();
			return false;
		}
		if (document.fr.req_edit_emp.value == "") {
			alert("수정자를 입력하세요.");
			document.fr.req_edit_emp.focus();
			return false;
		}
		if (document.fr.req_edit_date.value == "") {
			alert("변경일을 선택하세요.");
			document.fr.req_edit_date.focus();
			return false;
		}

		alert("수정이 완료되었습니다.");
	}
</script>

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
							<div class="page-title"></div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a
										href="${pageContext.request.contextPath}/req/reqlist">소요량
											리스트</a></li>
									<li class="active">메인</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<form action="${pageContext.request.contextPath }/req/requpdatePro"
			method="POST" name="fr" onsubmit="return essential()">
			<div class="content">
				<div class="animated fadeIn">
					<div class="row">
						<div class="col-lg">
							<div class="card">
								<div class="card-header">
									<strong class="card-title">소요량</strong>
								</div>
								<div class="card-body">
									<table id="bootstrap-data-table"
										class="table table-striped table-bordered">
										<thead class="thead-dark">
											<tr>
												<th socpe="col">#</th>
												<th scope="col">상위품번</th>
												<th scope="col">상위품명</th>
												<th scope="col">하위품번</th>
												<th scope="col">하위품명</th>
												<th scope="col">소요량</th>
												<th scope="col">등록자</th>
												<th scope="col">등록일</th>
												<th scope="col">수정자</th>
												<th scope="col">변경일</th>
											</tr>
										</thead>


										<tbody>
											<tr>
												<td><input type="hidden" name="req_num"
													value="${reqDTO.req_num}"></td>
												<td><input type="text" id="productSearchId"
													name="prod_fcd" value="${reqDTO.prod_fcd }" readonly
													style="width: 70px;"></td>
												<td><input type="text" id="productSearchName"
													name="prod_fnm" value="${reqDTO.prod_fnm }" readonly
													style="width: 70px;">
													<button type="button" onclick="productSearchPop()">검색</button></td>
												<td><input type="text" id="productSearchId2"
													name="prod_cd" style="width: 60px;"
													value="${reqDTO.prod_cd}"></td>
												<td><input type="text" id="productSearchName2"
													name="prod_nm" style="width: 100px;"
													value="${reqDTO.prod_nm}">
													<button type="button" onclick="productSearchPop2()">검색</button></td>
												<td><input type="text" name="req_req"
													value="${reqDTO.req_req}" style="width: 60px;"></td>
												<td><input type="text" name="req_add_emp"
													value="${reqDTO.req_add_emp}" style="width: 60px;"></td>
												<td><input type="date" name="req_add_date"
													value="${reqDTO.req_add_date}" style="width: 120px;"></td>
												<td><input type="text" name="req_edit_emp"
													value="${reqDTO.req_edit_emp}" style="width: 60px;"></td>
												<td><input type="date" name="req_edit_date"
													value="${reqDTO.req_edit_date}" style="width: 120px;"></td>
											</tr>
											<tr>
										</tbody>
									</table>
									<div class="btn-div float-right">
										<input type="submit" class="btn btn-secondary" value="수정">
										<input type="button" class="btn btn-secondary" value="취소"
											onclick="location.href='${pageContext.request.contextPath}/req/reqlist'">
									</div>
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