<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>infoWi</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
    <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

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
	
 <div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">품목별 상세페이지</strong><br>
							</div>
							<table border="1">
							<tr><td>글번호</td><td>${productDTO.prod_number}</td></tr>
							<tr><td>품번</td><td>${productDTO.prod_cd}</td></tr>
							<tr><td>거래코드</td><td>${clientDTO.cli_cd}</td></tr>
							<tr><td>품명</td><td>${productDTO.prod_mat}</td></tr>
							<tr><td>자재유형</td><td>${productDTO.prod_nm}</td></tr>
							<tr><td>재고단위</td><td>${productDTO.prod_unit}</td></tr>
							<tr><td>재고재질</td><td>${productDTO.prod_text}</td></tr>
							<tr><td>규격</td><td>${productDTO.prod_size}</td></tr>
							<tr><td>매입단가</td><td>${productDTO.prod_inprice}</td></tr>
							<tr><td>매출단가</td><td>${productDTO.prod_outprice}</td></tr>
							<tr><td>현재고</td><td>${productDTO.prod_count}</td></tr>
							<tr><td>비고</td><td>${productDTO.prod_note}</td></tr>
							<tr><td colspan="2"></td></tr></table>
							<input type="button" value="창닫기" onClick="window.close()">
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div><!-- .content -->
		<div class="clearfix"></div>
		<!-- 푸터 넣는 곳 -->
		<jsp:include page="../inc/footer.jsp" />
		<!-- 푸터 넣는 곳 -->
	<!-- /#right-panel -->

	<!-- Right Panel -->

	<!-- Scripts -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>


</body>
</html>

