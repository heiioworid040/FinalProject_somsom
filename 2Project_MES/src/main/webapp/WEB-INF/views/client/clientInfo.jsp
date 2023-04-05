<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>clientInfo</title>
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
	href="${pageContext.request.contextPath}/resources/css/client.css">

<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

<script type="text/javascript">
	// 체크박스 모두 선택하는 함수
	function allChk(obj) {
		var chkObj = document.getElementsByName("chk");
		var rowCnt = chkObj.length - 1;
		var check = obj.checked;
		if (check) {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox")
					chkObj[i].checked = true;
			}
		} else {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox") {
					chkObj[i].checked = false;
				}
			}
		}
	}

	// 체크박스 삭제 메시지 
	function deleteMsg() {
		let check = false;
		with (document.chkDelete) {
			if (chk.length == undefined) {
				if (chk.checked) {
					check = true;
				}
			} else {
				for (let i = 0; i < chk.length; i++) {
					if (chk[i].checked) {
						check = true;
					}
				}
			}
			if (!check) {
				alert("삭제할 거래처를 선택하세요.");
				return;
			} else {
				if (confirm("선택한 거래처를 삭제하시겠습니까?")) {
					submit();
				}
			}
		}
	}
</script>
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
								<h1>기준정보 관리</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="#">기준정보 관리</a></li>
									<li class="active">거래처</li>
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
								<form
									action="${pageContext.request.contextPath }/client/clientInfo"
									method="get" class="form-inline">
									<div class="form-group col-6 mb-1">
										<label class="pr-1 form-control-label">거래처코드</label>&nbsp;&nbsp;<input
											type="text" name="search" class="form-control ">
									</div>
									<div class="form-group col-6 mb-1">
										<label class="pr-1  form-control-label">거래처명</label>&nbsp;&nbsp;<input
											type="text" name="search2" class="form-control ">
									</div>
									<div class="form-group col-6 mt-1">
										<label class="pr-1  form-control-label">거래처구분</label>&nbsp;&nbsp;
										<div class="p-0 col">
											<select name="search3" id="select" class="form-control">
												<option>전체</option>
												<option value="협력사">협력사</option>
												<option value="고객사">고객사</option>
												<option value="자사">자사</option>
											</select>
										</div>
									</div>
									<div class="col p-0">
										<input type="submit"
											class="btn btn-primary col-2 float-right ml-3" value="검색">
									</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
		<!-- 	검색창 -->
		
		<!-- 체크박스로 선택해 글 여러개 삭제가능  -->
		<form name="chkDelete"
			action="${pageContext.request.contextPath}/client/delete"
			method="post">
			<div class="content">
				<div style="width: 100%; height: 50px">
					<c:if test="${ ! empty sessionScope.emp_cd }">
						<c:if test="${sessionScope.emp_position ne '사원' }">
							<div class="btn-div float-right">
								<input type="button" class="btn btn-primary" value="추가"
									onclick="location.href='${pageContext.request.contextPath}/client/insert'">
								<input type="button" class="btn btn-secondary" value="삭제"
									onclick="deleteMsg()">
							</div>
						</c:if>
					</c:if>
				</div>
				<div class="animated fadeIn">
					<div class="row">
						<div class="col-lg">
							<div class="card">
								<div class="card-header">
									<strong class="card-title">거래처</strong>
								</div>
								<div class="card-body">
									<table id="bootstrap-data-table"
										class="table table-striped table-bordered">
										<thead class="thead-dark">
											<tr>
												<!-- 사원이 아닐때 (관리자, 파트장) 삭제 권한  -->
												<c:if test="${ ! empty sessionScope.emp_cd }">
													<c:if test="${sessionScope.emp_position ne '사원' }">
														<th scope="col"><input id="allCheck" type="checkbox"
															onclick="allChk(this);" /></th>
													</c:if>
												</c:if>
												<th scope="col">거래처코드</th>
												<th scope="col">거래처명</th>
												<th scope="col">구분</th>
												<th scope="col">사업자번호</th>
												<th scope="col">업태</th>
												<th scope="col">종목</th>
												<th scope="col">대표자</th>
												<th scope="col">담당자</th>
												<th scope="col">주소</th>
												<!-- 사원이 아닐때 (관리자, 파트장) 수정 권한  -->
												<c:if test="${ ! empty sessionScope.emp_cd }">
													<c:if test="${sessionScope.emp_position ne '사원' }">
														<th scope="col"></th>
													</c:if>
												</c:if>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="clientDTO" items="${clientInfo }">
												<tr>
													<!-- 사원이 아닐때 (관리자, 파트장) 삭제 권한  -->
													<c:if test="${ ! empty sessionScope.emp_cd }">
														<c:if test="${sessionScope.emp_position ne '사원' }">
															<th scope="row"><input type="checkbox" name="chk"
																id="chk" value="${clientDTO.cli_cd }"></th>
														</c:if>
													</c:if>
													<td>${clientDTO.cli_cd }</td>
													<td>${clientDTO.cli_nm }</td>
													<td>${clientDTO.cli_type }</td>
													<td>${clientDTO.cli_num }</td>
													<td>${clientDTO.cli_business }</td>
													<td>${clientDTO.cli_prod }</td>
													<td>${clientDTO.cli_boss }</td>
													<td>${clientDTO.cli_emp }</td>
													<td>${clientDTO.cli_addr }</td>
													<!-- 사원이 아닐때 (관리자, 파트장) 수정 권한  -->
													<c:if test="${ ! empty sessionScope.emp_cd }">
														<c:if test="${sessionScope.emp_position ne '사원' }">
															<td><input type="button" class="btn btn-secondary"
																value="수정"
																onclick="location.href='${pageContext.request.contextPath}/client/update?cli_cd=${clientDTO.cli_cd}'"></td>
														</c:if>
													</c:if>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									
									<!-- 페이징 처리 -->
									<div class="pageNum">
										<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
											<a
												href="${pageContext.request.contextPath}/client/clientInfo?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}">[10페이지
												이전]</a>
										</c:if>

										<c:forEach var="i" begin="${pageDTO.startPage }"
											end="${pageDTO.endPage }" step="1">
											<a
												href="${pageContext.request.contextPath}/client/clientInfo?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}">${i}</a>
										</c:forEach>

										<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
											<a
												href="${pageContext.request.contextPath}/client/clientInfo?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}">[10페이지
												다음]</a>
										</c:if>
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
