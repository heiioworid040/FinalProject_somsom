<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>imatinsert</title>
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
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js">
	$(document).ready(function() {
		$('#largeModal').on('shown.bs.modal', function() {
			$.ajax({
				url : '/imat/ImatprodList',
				type : 'GET',
				success : function(data) {
					// display data in the modal body
					$('.modal-body').html(data);
				}
			});
		});
	});

	// $(document).ready(function(){
	// $('#insert').submit(function(){

	// 	if($('.id').val()==""){
	// 		alert("아이디 입력하세요");
	// 		$('.id').focus();
	// 		return false;
	// 	}
	//     if($('.imat_code').val()==""){
	//     	alert("비밀번호 입력하세요");
	// 		$('.pass').focus();
	// 		return false;
	//     }

	//     if($('.pass2').val()==""){
	//     	alert("비밀번호2 입력하세요");
	// 		$('.pass2').focus();
	// 		return false;
	//     }

	//     if($('.name').val()==""){
	//     	alert("이름 입력하세요");
	// 		$('.name').focus();
	// 		return false;
	//     }

	//     if($('.email').val()==""){
	//     	alert("이메일 입력하세요");
	// 		$('.email').focus();
	// 		return false;
	//     }

	//     if($('.email2').val()==""){
	//     	alert("이메일2 입력하세요");
	// 		$('.email2').focus();
	// 		return false;
	//     }

	//     if($('.email').val() != $('.email2').val()){
	//     	alert("이메일 틀림");
	// 		$('.email2').focus();
	// 		return false;
	//     }

	// });
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



		<div class="animated fadeIn">
			<div class="row">
				<div class="col-lg">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">Table Head</strong>
						</div>
						<div class="card-body">
							<!--<table class="table" > -->
							<!-- 									<thead class="thead-dark"> -->

							<!-- 										<tr> -->
							<!-- 											<th scope="col">상품코드</th> -->
							<!-- 											<th scope="col">유형</th> -->
							<!-- 											<th scope="col">거래처명</th> -->
							<!-- 											<th scope="col">담당자명</th> -->
							<!-- 											<th scope="col">품목명</th> -->
							<!-- 											<th scope="col">납기일자</th> -->
							<!-- 											<th scope="col">입고예정수량</th> -->
							<!-- 											<th scope="col">거래처코드</th> -->
							<!-- 											<th scope="col">거래처명</th> -->
							<!-- 											<th scope="col">비고</th> -->
							<!-- 										</tr> -->
							<!-- 									</thead> -->
							<!-- 									<tbody> -->

							<!-- 										<tr> -->
							<!-- 											<td></td> -->
							<!-- 											<td></td> -->
							<!-- 											<td></td> -->
							<!-- 											<td></td> -->
							<!-- 											<td></td> -->
							<!-- 											<td></td> -->
							<!-- 											<td></td> -->
							<!-- 											<td></td> -->
							<!-- 											<td></td> -->
							<!-- 											<td></td> -->
							<!-- 										</tr> -->
							<!-- 									</tbody> -->
							<!-- 								</table> -->

							<!-- 						<table class="table1" > -->
							<!-- 									<thead class="thead-dark1"> -->


							<!-- 										<tr> -->
							<!-- 											<th scope="col">품번</th> -->
							<!-- 											<th scope="col">품명</th> -->
							<!-- 											<th scope="col">자재유형</th> -->
							<!-- 											<th scope="col">단위</th> -->
							<!-- 											<th scope="col">재질</th> -->
							<!-- 											<th scope="col">규격</th> -->
							<!-- 										</tr> -->

							<!-- 									</thead> -->
							<!-- 									<tbody> -->

							<%-- 									<c:forEach var="ProductDTO" items="${ImatprodList1}"> --%>
							<!-- 										<tr> -->
							<%-- 											<td>${ProductDTO.prod_cd}</td> --%>
							<%-- 											<td>${ProductDTO.prod_nm}</td> --%>
							<%-- 											<td>${ProductDTO.prod_mat}</td> --%>
							<%-- 											<td>${ProductDTO.prod_unit}</td> --%>
							<%-- 											<td>${ProductDTO.prod_text}</td> --%>
							<%-- 											<td>${ProductDTO.prod_size}</td> --%>
							<!-- 										</tr> -->
							<%-- 									</c:forEach> --%>
							<!-- 									</tbody> -->
							<!-- 								</table> -->
							<button type="button" data-toggle="modal"
								data-target="#largeModal">품번선택</button>
							<form
								action="${pageContext.request.contextPath}/imat/imatinsertPro"
								id="insert" method="post">
								<fieldset>
									<label>입고번호</label> <input type="text" name="imat_cd"
										class="imat_cd"><br> <label>상품코드</label> <input
										type="text" name="prod_cd" class="prod_cd"><br> <label>입고창고</label>
									<input type="text" name="imat_stg" class="imat_stg"><br>
									<label>입고수량</label><input type="text" name="imat_count"
										class="imat_count"><br> <label>비고</label><input
										type="text" name="imat_note" class="imat_note"><br>
								</fieldset>
								<div class="clear"></div>
								<div id="buttons">
									<input type="submit" value="Submit" class="submit"> <input
										type="reset" value="Cancel" class="cancel">
								</div>
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

	<div class="modal fade" id="largeModal" tabindex="-1" role="dialog"
		aria-labelledby="largeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="largeModalLabel">품목 선택</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<table class="table">
						<thead class="thead-dark">

							<tr>
								<th scope="col">품번</th>
								<th scope="col">품명</th>
								<th scope="col">자재유형</th>
								<th scope="col">단위</th>
								<th scope="col">재질</th>
								<th scope="col">규격</th>
							</tr>

						</thead>
						<tbody>

							<c:forEach var="ProductDTO" items="${ImatprodList}">
								<tr>
									<td>${ProductDTO.prod_cd}</td>
									<td>${ProductDTO.prod_nm}</td>
									<td>${ProductDTO.prod_mat}</td>
									<td>${ProductDTO.prod_unit}</td>
									<td>${ProductDTO.prod_text}</td>
									<td>${ProductDTO.prod_size}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary">Confirm</button>
				</div>
			</div>
		</div>
	</div>

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
