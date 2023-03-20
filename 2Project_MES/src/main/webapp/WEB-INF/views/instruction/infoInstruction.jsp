<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>infoInstruction</title>
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
        
        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>생산관리</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">생산관리</a></li>
                                    <li class="active">작업지시</li>
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
							<div class="card-body">
								검색창
							</div>
						</div>
					</div>
				</div>
			</div>
		</div><!-- .content -->
		
        <div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">작업지시</strong>
							</div>
							<div class="card-body">
								<table id="bootstrap-data-table" class="table table-striped table-bordered">
									<thead class="thead-dark">
										<tr>
											<th scope="col">#</th>
											<th scope="col">라인</th>
											<th scope="col">라인명</th>
											<th scope="col">품번</th>
											<th scope="col">품명</th>
											<th scope="col">단위</th>
											<th scope="col">지시상태</th>
											<th scope="col">지시수량</th>
											<th scope="col">수주번호</th>
											<th scope="col">업체명</th>
											<th scope="col">생산량</th>
											<th scope="col">양품</th>
											<th scope="col">불량</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="wiDTO" items="${wiList }">
										<tr>
											<th scope="row">${wiDTO.inst_cd }</th>
											<td>${wiDTO.line_cd }</td>
											<td>${lineDTO.line_nm }</td>
											<td>${productDTO.prod_cd }</td>
											<td>${productDTO.prod_nm }</td>
											<td>${productDTO.prod_unit }</td>
											<td>${wiDTO.inst_st }</td>
											<td>${wiDTO.inst_count }</td>
											<td>${orderDTO.ord_num }</td>
											<td>업체명</td>
											<td>${wiDTO.inst_fcount }</td>
											<td>0</td>
											<td>0</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>

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
	</div>
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
