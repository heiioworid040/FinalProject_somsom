<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>shipCurrentInfo</title>
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

<!-- QR코드 라이브러리  -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
<!-- 엑셀 라이브러리  -->
<script src="https://cdn.jsdelivr.net/npm/xlsx/dist/xlsx.full.min.js"></script>
<script>
	//바코드 버튼 QR코드 출력 함수 
	function generateQrCode() {
		// 체크박스가 선택된 행들의 출하번호를 가져옴
		var checkedShipCds = [];
		jQuery('input[name="chk"]:checked').each(function() {
			checkedShipCds.push(jQuery(this).val());
		});

		// 출하번호가 선택되어 있지 않으면 경고창 출력 후 함수 종료
		if (checkedShipCds.length == 0) {
			alert("출하정보를 선택해주세요.");
			return;
		}

		// 출하정보가 하나 이상 선택되었을 때
		if (checkedShipCds.length > 1) {
			alert("출하정보를 하나만 선택해 주세요.");
			return;
		}

		// 첫 번째 출하번호를 이용하여 QR 코드 생성
		var qrcode = new QRCode(document.createElement("div"), {
			text : checkedShipCds[0],
			width : 256,
			height : 256,
			colorDark : "#000000",
			colorLight : "#ffffff",
			correctLevel : QRCode.CorrectLevel.H
		});

		// QR 코드 팝업창 띄우기
		var popup = window.open("", "qrcode_popup", "width=300, height=300");
		popup.document.body.appendChild(qrcode._el);
	}

	// 엑셀파일 다운 함수 
	function downloadExcel() {
		// SheetJS 라이브러리를 사용하여 새 워크북 객체를 생성
		var workbook = XLSX.utils.book_new();

		// SheetJS 라이브러리를 사용하여 새 시트 객체를 생성
		var sheet = XLSX.utils.table_to_sheet(document
				.getElementById('bootstrap-data-table'));

		// 워크북 객체에 시트를 추가
		XLSX.utils.book_append_sheet(workbook, sheet, 'Sheet1');

		// 엑셀 파일을 저장할 파일명을 지정
		var filename = 'shipCurr.xlsx';

		// 엑셀 파일을 생성하고 다운로드
		XLSX.writeFile(workbook, filename);
	}

	// 수주업체 검색 팝업창 
	function clientSearchPop() {
		var popup = window.open(
				"${pageContext.request.contextPath }/client/clientSearchPop",
				"clientSearchPop", "width=800,height=650");
	}

	// 품번 검색 팝업창 
	function productSearchPop() {
		window.open(
				"${pageContext.request.contextPath }/product/productSearchPop",
				"productSearchPop", "width=800,height=650");
	}

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
				alert("삭제할 출하현황을 선택하세요.");
				return;
			} else {
				if (confirm("선택한 출하현황을 삭제하시겠습니까?")) {
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
								<h1>영업관리</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="#">영업관리</a></li>
									<li class="active">출하현황</li>
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
									action="${pageContext.request.contextPath }/ship/shipCurrentInfo"
									method="get" class="form-inline">
									<div class="form-group col-6 mb-1">
										<label class="pr-1  form-control-label">출하일자</label>&nbsp;&nbsp;
										<input type="date" name="search" class="form-control">&nbsp;~&nbsp;
										<input type="date" name="search2" class="form-control">
									</div>
									<div class="form-group col-6 mb-1">
										<label class="pr-1  form-control-label">품번</label>&nbsp;&nbsp;
										<input type="text" id="productSearchId" name="search3"
											class="form-control ">
										<div class="input-group">
											<input type="button" class="btn btn-primary ml-2"
												onclick="productSearchPop()" style="cursor: pointer;"
												value="검색">

										</div>
									</div>
									<div class="form-group col-6 mt-1">
										<label class="pr-1  form-control-label">수주업체</label>&nbsp;&nbsp;
										<input type="text" id="clientSearchId" name="search4"
											class="form-control ">
										<div class="input-group">
											<input type="button" class="btn btn-primary ml-2"
												onclick="clientSearchPop()" style="cursor: pointer;"
												value="검색">
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
			action="${pageContext.request.contextPath}/ship/currDelete"
			method="post">
			<div class="content">
				<div style="width: 100%; height: 50px">
					<div class="btn-div float-right">
						<!-- 사원이 아닐때 (관리자, 파트장) 삭제 권한  -->
						<c:if test="${ ! empty sessionScope.emp_cd }">
							<c:if test="${sessionScope.emp_position ne '사원' }">
								<input type="button" class="btn btn-secondary" value="삭제"
									onclick="deleteMsg()">
							</c:if>
						</c:if>
						<input type="button" class="btn btn-secondary" value="바코드"
							onclick="generateQrCode()"> <input type="button"
							class="btn btn-primary" value="엑셀다운" onclick="downloadExcel()">
					</div>
				</div>
				<div class="animated fadeIn">
					<div class="row">
						<div class="col-lg">
							<div class="card">
								<div class="card-header">
									<strong class="card-title">출하현황</strong>
								</div>
								<div class="card-body">
									<table id="bootstrap-data-table"
										class="table table-striped table-bordered">
										<thead class="thead-dark">
											<tr>
												<th scope="col"><input id="allCheck" type="checkbox"
													onclick="allChk(this);" /></th>
												<th scope="col">출하번호</th>
												<th scope="col">출하일자</th>
												<th scope="col">거래처명</th>
												<th scope="col">상품코드</th>
												<th scope="col">상품이름</th>
												<th scope="col">단위</th>
												<th scope="col">수주번호</th>
												<th scope="col">수주량</th>
												<th scope="col">출하량</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="shipDTO" items="${shipCurrentInfo }">
												<tr>
													<th scope="row"><input type="checkbox" name="chk"
														value="${shipDTO.ship_cd }"></th>
													<td>${shipDTO.ship_cd }</td>
													<td><fmt:formatDate value="${shipDTO.ship_date}"
															pattern="yyyy.MM.dd" /></td>
													<td>${shipDTO.cli_nm }</td>
													<td>${shipDTO.prod_cd }</td>
													<td>${shipDTO.prod_nm }</td>
													<td>${shipDTO.prod_unit }</td>
													<td>${shipDTO.ord_cd }</td>
													<td>${shipDTO.ord_count }</td>
													<td>${shipDTO.ship_count }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

									<!-- 페이징 처리 -->
									<div class="pageNum">
										<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
											<a
												href="${pageContext.request.contextPath}/ship/shipCurrentInfo?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}">[10페이지
												이전]</a>
										</c:if>

										<c:forEach var="i" begin="${pageDTO.startPage }"
											end="${pageDTO.endPage }" step="1">
											<a
												href="${pageContext.request.contextPath}/ship/shipCurrentInfo?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}">${i}</a>
										</c:forEach>

										<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
											<a
												href="${pageContext.request.contextPath}/ship/shipCurrentInfo?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}">[10페이지
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
