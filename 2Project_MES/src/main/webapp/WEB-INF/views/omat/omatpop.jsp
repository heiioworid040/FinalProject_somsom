<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>omatbeList</title>
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

<script type="text/javascript">
    function sendChildValue(prod_cd,omat_stg){
    	opener.document.getElementById("prod_cd").value = prod_cd;
    	opener.document.getElementById("omat_stg").value = omat_stg;

//     	opener.setChildValue(prod_cd);

    	self.close();

    	}
    </script>
</head>

<body>


		<div class="content">
		
		<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
<!-- 							<div class="card-header"> -->
<!-- 								<strong class="card-title">Table Head</strong> -->
<!-- 							</div> -->
							<div class="card-body">
													
					<div id="table_search">
							<form action="${pageContext.request.contextPath}/omat/omatpopsear" method="get">
							<input type="button" value="돌아가기"  class="btn btn-outline-link btn-sm"
							onclick="location.href='${pageContext.request.contextPath}/imat/imatpop'">
							<input type="text" name="search" class="input_box" placeholder="품번">
							<input type="text" name="search2" class="input_box" placeholder="품명">
							<input type="text" name="search3" class="input_box" placeholder="자재유형">
							<input type="submit" value="검색" class="btn btn-secondary btn-sm">
							</form>
							</div>
													
							</div>
						</div>
					</div>
				</div>
			</div>
		
			<div class="anomated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-body"> 
											<table class="table">
						<thead class="thead-dark">

							<tr>
								<th scope="col">품번</th>
								<th scope="col">품명</th>
								<th scope="col">자재유형</th>
								<th scope="col">단위</th>
								<th scope="col">재질</th>
								<th scope="col">규격</th>
								<th></th>
							</tr>

						</thead>
						<tbody>

							<c:forEach var="ProductDTO" items="${OmatprodList}">
								<tr>
									<td id="prod_cd">${ProductDTO.prod_cd}</td>
									<td id="prod_nm">${ProductDTO.prod_nm}</td>
									<td id="prod_mat">${ProductDTO.prod_mat}</td>
									<td>${ProductDTO.prod_unit}</td>
									<td>${ProductDTO.prod_text}</td>
									<td>${ProductDTO.prod_size}</td>
									<td><input type="button" value="제출" class="btn btn-secondary" onclick="sendChildValue('${ProductDTO.prod_cd}','${ProductDTO.prod_mat}')"></td>
									
								
								</tr>
							</c:forEach>
						</tbody>
					</table>
							<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
											<a href="${pageContext.request.contextPath}/omat/omatpop?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}">[이전페이지]</a>
																	
										</c:if>

										<c:forEach var="i" begin="${pageDTO.startPage }"
											end="${pageDTO.endPage }" step="1">
											<a
												href="${pageContext.request.contextPath}/omat/omatpop?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}">${i}</a>
										</c:forEach>

										<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
											<a
								href="${pageContext.request.contextPath}/omat/omatpop?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}">[다음페이지]</a>
										</c:if>
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
