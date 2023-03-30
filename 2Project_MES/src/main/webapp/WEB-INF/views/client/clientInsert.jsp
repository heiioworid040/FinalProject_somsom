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

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	// 필수입력 제어	
	function essential() {

		if (document.fr.cli_nm.value == "") {
			alert("거래처명을 입력하세요.");
			document.fr.cli_nm.focus();
			return false;
		}

		if (document.fr.cli_num.value == "") {
			alert("사업자번호를 입력하세요.");
			document.fr.cli_num.focus();
			return false;
		}

		if (document.fr.cli_num.value.length != 10) {
			alert("사업자번호 10자리를 입력하세요.");
			document.fr.cli_num.focus();
			return false;
		}

		if (document.fr.cli_business.value == "") {
			alert("업태를 입력하세요.");
			document.fr.cli_business.focus();
			return false;
		}

		if (document.fr.cli_prod.value == "") {
			alert("종목을 입력하세요.");
			document.fr.cli_prod.focus();
			return false;
		}

		if (document.fr.cli_boss.value == "") {
			alert("대표자를 입력하세요.");
			document.fr.cli_boss.focus();
			return false;
		}

		if (document.fr.cli_emp.value == "") {
			alert("담당자를 입력하세요.");
			document.fr.cli_emp.focus();
			return false;
		}

		if (document.fr.cli_addr.value == "") {
			alert("주소를 입력하세요.");
			document.fr.cli_addr.focus();
			return false;
		}

		if ($('.spanResult').text() !== "사용 가능한 사업자번호입니다.") {
		    alert("사업자번호 중복확인을 해주세요.");
		    return false;
		  }

		alert("추가 완료되었습니다.");

	}

	// 사업자번호 중복확인 
	$(function() {
		$('.dup')
				.click(
						function() {
							var cli_num = $('.cli_num').val();
							$
									.ajax({
										url : "${pageContext.request.contextPath}/client/clientDupCheck",
										type : "post",
										data : {
											"cli_num" : cli_num
										},
										success : function(data) {
											if (data == "success") {
												$('.spanResult').text(
														"사용 가능한 사업자번호입니다.")
														.css("color", "blue");
											} else {
												$('.spanResult').text(
														"이미 등록된 사업자번호입니다.")
														.css("color", "red");
											}
										}
									});
						});
	});

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
							<div class="card-header">
								<strong class="card-title">거래처</strong>
							</div>
							<div class="card-body">
								<form
									action="${pageContext.request.contextPath}/client/insertPro"
									method="post" name="fr" onsubmit="return essential()">
									<table id="bootstrap-data-table"
										class="table table-striped table-bordered">
										<thead class="thead-dark">
											<tr>
												<th scope="col">거래처코드</th>
												<th scope="col">거래처명</th>
												<th scope="col">구분</th>
												<th scope="col">사업자번호</th>
												<th scope="col">업태</th>
												<th scope="col">종목</th>
												<th scope="col">대표자</th>
												<th scope="col">담당자</th>
												<th scope="col">주소</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>자동생성</td>
												<td><input type="text" name="cli_nm"
													placeholder="예)서울원단" style="width: 105px;"></td>
												<td><select name="cli_type" id="select"
													class="form-control" style="width: 100px;">
														<option value="협력사">협력사</option>
														<option value="고객사">고객사</option>
														<option value="자사">자사</option>
												</select></td>
												<td><input type="text" pattern="[0-9]+" name="cli_num"
													class="cli_num" style="width: 100px;" placeholder="10자리 숫자"
													maxlength="10" onblur="$('.dup').click()"></td>
												<td><input type="text" name="cli_business"
													style="width: 110px;" placeholder="예)제조업"></td>
												<td><input type="text" name="cli_prod"
													style="width: 75px;" placeholder="예)원단"></td>
												<td><input type="text" name="cli_boss"
													style="width: 60px;"></td>
												<td><input type="text" name="cli_emp"
													style="width: 60px;"></td>
												<td><input type="text" name="cli_addr"
													style="width: 110px;" placeholder="예)서울 종로구"></td>
											</tr>
										</tbody>
									</table>
									<input type="button" class="btn btn-primary dup"
										value="사업자번호 중복확인"> &nbsp;<span class="spanResult"></span>
									<div class="btn-div float-right">
										<input type="submit" class="btn btn-secondary" value="추가">
										<input type="button" class="btn btn-secondary" value="취소"
											onclick="location.href='${pageContext.request.contextPath}/client/clientInfo'">
									</div>
								</form>

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
