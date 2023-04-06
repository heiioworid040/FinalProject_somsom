<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>imatbeList</title>
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

<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<script type="text/javascript">
	function chAll(target) {
		var chall = document.getElementById("chAll");
		var is_checked = chall.checked;
		if (is_checked) {
			chAllChecked();
		} else {
			chAllUnChecked();
		}
	}

	function chAllChecked() {
		document.querySelectorAll(".chkbox").forEach(function(v, i) {
			v.checked = true;
		});
	}

	function chAllUnChecked() {
		document.querySelectorAll(".chkbox").forEach(function(v, i) {
			v.checked = false;
		});
	}

	function test(num) {
		alert(num);
	}
</script>
</head>

<body>

	<script type="text/javascript">
		// function checkAll()  {
		// 	console.log("checkAll");
		// 	  const checkboxes 
		// 	       = document.getElementsByName('checkRow');

		// 	  checkboxes.forEach((checkbox) => {
		// 		  document.getElementsByName('check')[0].checked = checkAll.checked;
		// 	  })

		// $(document).ready(function() {
		// 	  // 버튼 클릭 이벤트 처리
		// 	  $("#add-row-btn").click(function() {
		// 	    var name = "새로운 이름";
		// 	    var age = "새로운 나이";

		// 	    $.ajax({
		// 	      type: "POST",
		// 	      url: "/addRow",
		// 	      data: { imat_cd:imat_cd, imat_date:imat_date, prod_cd:prod_cd  
		// 	    	  imat_stg:imat_stg,prod_unit:prod_unit,imat_stg:imat_stg,
		// 	    	  imat_count:imat_count, cli_cd:cli_cd,cli_nm:cli_nm,imat_note:imat_note},
		// 	      success: function(response) {
		// 	        // 서버에서 응답받은 HTML을 새로운 행으로 추가
		// 	        $("#my-table tbody").append(response);
		// 	      },
		// 	      error: function() {
		// 	        alert("오류가 발생했습니다.");
		// 	      }
		// 	    });
		// 	  });
		// 	});
	</script>


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




		<div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">Table Head</strong>
							</div>
							<div class="card-body">
								<form action="${pageContext.request.contextPath}/imat/delete"
									id="delete" method="get">
									<table class="table">
										<thead class="thead-dark">

											<tr>
												<th><input type="checkbox" name="check" id="chAll"
													onclick="chAll()"></th>
												<th scope="col">#</th>
												<th scope="col">품번</th>
												<th scope="col">품명</th>
												<th scope="col">자재유형</th>
												<th scope="col">단위</th>
												<th scope="col">현재고</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="ImatDTO" items="${IomatList}">
												<tr>
													<th><input type="checkbox" name="checkRow"
														id="${ImatDTO.imat_num}" value="${ImatDTO.imat_num}"
														class="chkbox"></th>
													<td>${ImatDTO.imat_num}</td>
													<td>${ImatDTO.prod_cd}</td>
													<td>${ImatDTO.prod_nm}</td>
													<td>${ImatDTO.prod_mat}</td>
													<td>${ImatDTO.prod_unit}</td>
													<td>${ImatDTO.iomat_count}</td>
													
												</tr>

												<!-- 										<tr> -->
												<!-- 											<th scope="row">1</th> -->
												<%--   											<td th:text="${imat_cd}"></td> --%>
												<%-- 											<td th:text="${imat_date}"></td> --%>
												<%-- 											<td th:text="${prod_cd}"></td> --%>
												<%-- 											<td th:text="${imat_stg}"></td> --%>
												<%-- 											<td th:text="${prod_unit}"></td> --%>
												<%-- 											<td th:text="${imat_stg}"></td> --%>
												<%-- 											<td th:text="${imat_count}"></td> --%>
												<%-- 											<td th:text="${cli_cd}"></td> --%>
												<%-- 											<td th:text="${cli_nm}"></td> --%>
												<%-- 											<td th:text="${imat_note}"></td> --%>
												<!-- 										</tr> -->
											</c:forEach>


										</tbody>


									</table>
								</form>
								<%-- 								<c:if test="${pageDTO.startPage > pageDTO.pageBlock }"> --%>
								<!-- 										<a -->
								<%-- 											href="${pageContext.request.contextPath}/imat/imatbeList?pageNum=${pageDTO.startPage - pageDTO.pageBlock }">[이전페이지]</a> --%>
								<%-- 									</c:if> --%>

								<%-- 									<c:forEach var="i" begin="${pageDTO.startPage }" --%>
								<%-- 										end="${pageDTO.endPage }" step="1"> --%>
								<!-- 										<a -->
								<%-- 											href="${pageContext.request.contextPath}/imat/imatbeList?pageNum=${i}">${i}</a> --%>
								<%-- 									</c:forEach> --%>

								<%-- 									<c:if test="${pageDTO.endPage < pageDTO.pageCount }"> --%>
								<!-- 										<a -->
								<%-- 											href="${pageContext.request.contextPath}/imat/imatbeList?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">[다음페이지]</a> --%>
								<%-- 									</c:if> --%>
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
