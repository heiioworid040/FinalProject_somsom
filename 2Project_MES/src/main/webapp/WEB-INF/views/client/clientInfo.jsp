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

<!-- 체크박스 모두 선택하는 함수  -->
<script type="text/javascript">
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
</script>

<!-- 추가 버튼 함수  -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$("#add-row")
								.click(
										function() {
											var newRow = '<tr><th></th>'
													+ '<td><input type="text" style="width: 100px; name="prod_cd"></td>'
													+ '<td><input type="text" style="width: 90px; name="prod_nm"></td>'
													+ '<td><input type="text" style="width: 50px; name="prod_mat"></td>'
													+ '<td><input type="text" style="width: 100px; name="prod_unit"></td>'
													+ '<td><input type="text" style="width: 60px; name="prod_text"></td>'
													+ '<td><input type="text" style="width: 80px; name="prod_size"></td>'
													+ '<td><input type="text" style="width: 60px; name="prod_inprice"></td>'
													+ '<td><input type="text" style="width: 60px; name="prod_outprice"></td>'
													+ '<td><input type="text" style="width: 130px; name="prod_count"></td>'
													+ '<td><input type="text" style="width: 110px; name="prod_note"></td>'
													+ '<td><input type="text" style="width: 110px; name="prod_note"></td>'
													+ '<td><input type="text" style="width: 120px; name="prod_note"></td>'
													+ '<td><input type="text" style="width: 110px; name="prod_note"></td>'
													+ '<td><input type="text" style="width: 180px; name="prod_note"></td>'
													+ '<td><button class-"submit-Btn">전송</button></td></tr>';
											$('#bootstrap-data-table').append(
													newRow);
										});
					});

	// 전송버튼	
	// $(document).ready(function() {
	//   $("#MyForm").submit(function(event) {
	//     event.preventDefault(); // 기본 동작 방지
	//     var formData = $(this).serialize(); // 폼 데이터 가져오기
	//     $.ajax({
	//       url: "./servlet-context", // 데이터를 전송할 서버 URL
	//       type: "POST",
	//       data: formData,
	//       success: function(result) {
	//       	alert('전송 되었습니다'); // 전송 결과 로그 출력
	//       }
	//     });
	//   });
	// });
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

		<div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-body">검색창</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- .content -->

		<div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">거래처</strong>
							</div>
							<div class="card-body">
							
								<!-- 체크박스로 선택해 글 여러개 삭제가능  -->
								<form action="${pageContext.request.contextPath}/client/delete"
									method="post">
									<input type="submit" value="삭제">

									<table id="bootstrap-data-table"
										class="table table-striped table-bordered">
										<thead class="thead-dark">
											<tr>
												<th scope="col"><input id="allCheck" type="checkbox"
													onclick="allChk(this);" /></th>
												<th scope="col">거래처코드</th>
												<th scope="col">거래처명</th>
												<th scope="col">거래처구분</th>
												<th scope="col">사업자번호</th>
												<th scope="col">업태</th>
												<th scope="col">종목</th>
												<th scope="col">대표자</th>
												<th scope="col">담당자</th>
												<th scope="col">주소</th>
												<th scope="col">상세주소</th>
												<th scope="col">전화번호</th>
												<th scope="col">휴대폰번호</th>
												<th scope="col">팩스번호</th>
												<th scope="col">이메일</th>
												<th scope="col">비고</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="clientDTO" items="${clientInfo }">
												<tr>
													<th scope="row"><input type="checkbox" name="chk"
														value="${clientDTO.cli_cd }"></th>
													<td>${clientDTO.cli_cd }</td>
													<td>${clientDTO.cli_nm }</td>
													<td>${clientDTO.cli_type }</td>
													<td>${clientDTO.cli_num }</td>
													<td>${clientDTO.cli_business }</td>
													<td>${clientDTO.cli_prod }</td>
													<td>${clientDTO.cli_boss }</td>
													<td>${clientDTO.cli_emp }</td>
													<td>${clientDTO.cli_addr }</td>
													<td>${clientDTO.cli_addr2 }</td>
													<td>${clientDTO.cli_tel }</td>
													<td>${clientDTO.cli_emp_tel }</td>
													<td>${clientDTO.cli_fax }</td>
													<td>${clientDTO.cli_email }</td>
													<td>${clientDTO.cli_note }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</form>
								<button id="add-row">추가</button>

								<!-- 페이징 처리 -->
								<div class="pageNum">
									<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
										<a
											href="${pageContext.request.contextPath}/client/clientInfo?pageNum=${pageDTO.startPage - pageDTO.pageBlock }">[10페이지
											이전]</a>
									</c:if>

									<c:forEach var="i" begin="${pageDTO.startPage }"
										end="${pageDTO.endPage }" step="1">
										<a
											href="${pageContext.request.contextPath}/client/clientInfo?pageNum=${i}">${i}</a>
									</c:forEach>

									<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
										<a
											href="${pageContext.request.contextPath}/client/clientInfo?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">[10페이지
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
