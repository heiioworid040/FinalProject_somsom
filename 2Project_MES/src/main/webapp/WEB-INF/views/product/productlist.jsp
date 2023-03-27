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
				
				
        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
<%
request.setCharacterEncoding("UTF-8");
String search =request.getParameter("search");
if(search==null){
	%>           
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>품목 리스트</h1>
                            </div>
                        </div>  
                    </div>
<%}else{ %>
                         <div class="page-header float-left">
                            <div class="page-title">
                                <h1>검색결과</h1>
                            </div>
                        </div>  
                    </div>
	<%
}
%> 	                    
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="${pageContext.request.contextPath}/product/productlist">조회</a></li>
                                    <li><a href="${pageContext.request.contextPath}/product/productwrite">추가</a></li>
                                    <li><a href="${pageContext.request.contextPath}/home.jsp">메인</a></li>                                 
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%
if(search==null){
	%>                
 <div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">품목별 현황</strong><br>
							</div>
						</div>
					</div>
				</div>
			</div>
<%}else{ %>
 <div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">품목별 검색결과</strong><br>
							</div>
	<%
}
%> 															
							<div class="card-body">
								<table class="table" id="table2" border="1">
									<thead class="thead-dark">	
										<tr>
											<th scope="col" >#</th>
											<th scope="col" >품목코드</th>
											<th scope="col" >거래처코드</th>
											<th scope="col" >품명</th>
											<th scope="col">자재유형</th>
											<th scope="col">재고단위</th>
											<th scope="col">재질</th>
											<th scope="col">규격</th>
											<th scope="col">매입단가</th>
											<th scope="col">매출단가</th>
											<th scope="col">현재고</th>
											<th scope="col">비고</th>
											<th scope="col">버튼 종류</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="productDTO" items="${productList}">
										<tr>
										<th scope="row"><input type="checkbox" name="chk"
											id="chk" value="${productDTO.prod_number}">
											<td><a href="${pageContext.request.contextPath}/product/productcontext?prod_number=${productDTO.prod_number}">${productDTO.prod_cd}</a></td>
											<td>${productDTO.cli_cd}</td>
											<td>${productDTO.prod_nm}</td>
											<td>${productDTO.prod_mat}</td>
											<td>${productDTO.prod_unit}</td>
											<td>${productDTO.prod_text}</td>
											<td>${productDTO.prod_size}</td>
											<td>${productDTO.prod_inprice}</td>
											<td>${productDTO.prod_outprice}</td>
											<td>${productDTO.prod_count}</td>
											<td>${productDTO.prod_note}</td>
											<td>
										  <div style="display: inline-block;">
										  <form name="updateModal" action="${pageContext.request.contextPath}/product/productupdate" method="get" onsubmit="return confirm('수정하시겠습니까?')">
										    <input type="hidden" name="prod_number" value="${productDTO.prod_number}">
										    <button type="submit" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#exampleModal2">수정</button>
										  </form>
										</div>
										<div style="display: inline-block;">
									  	<form name="deleteModal" action="${pageContext.request.contextPath}/product/productdeletePro" method="get" onsubmit="return confirm('삭제하시겠습니까?')">
									    <input type="hidden" name="prod_number" value="${productDTO.prod_number}">
									    <button type="submit" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteModal">삭제</button>
									  </form>
									</div>
										</td></tr></c:forEach>
									</tbody>
								</table>
								<!-- 검색어 -->								
								<div id="table_search">
								<form action="${pageContext.request.contextPath}/product/productlist" method="GET">
								<input type="text" name="search" class="input_box" placeholder="품목코드별 검색기능">
								<input type="submit" value="search" class="btn">
								</form>
								</div>								
								<!-- 검색끝 -->								
								<!-- 페이징 처리 -->
								<div class="pageNum">
								<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
								<a href="${pageContext.request.contextPath}/product/productlist?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}">Prev</a>
								</c:if>
								
								<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
								<a href="${pageContext.request.contextPath}/product/productlist?pageNum=${i}">${i}</a>
								</c:forEach>
								
								<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
								<a href="${pageContext.request.contextPath}/product/productlist?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}">Next</a>
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
<%-- 		<jsp:include page="../inc/footer.jsp" /> --%>
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