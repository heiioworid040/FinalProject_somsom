<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
    
    <script type="text/javascript">
    function sendChildValue(prod_cd,imat_stg){
    	opener.document.getElementById("prod_cd").value = prod_cd;
    	opener.document.getElementById("imat_stg").value = imat_stg;

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
							<div class="card-header">
								<strong class="card-title">Table Head</strong>
							</div>
							<div class="card-body">
							<table class="table" id="prodtable">
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
									<td>${ProductDTO.prod_cd}			
									</td>
									<td>${ProductDTO.prod_nm}</td>
									<td>${ProductDTO.prod_mat}</td>
									<td>${ProductDTO.prod_unit}</td>
									<td>${ProductDTO.prod_text}</td>
									<td>${ProductDTO.prod_size}</td>
									<td><input type="button" value="제출" onclick="sendChildValue('${ProductDTO.prod_cd}','${ProductDTO.prod_mat}')"></td>
<!-- 									<td> -->
<%-- 									<form action="${pageContext.request.contextPath}/imat/imatpopPro?prod_cd=${ProductDTO.prod_cd}" id="submitform" method="get"> --%>
<!-- 									<input type="submit" value="제출"> -->
<!-- 									</form> -->
<!-- 									</td> -->
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
