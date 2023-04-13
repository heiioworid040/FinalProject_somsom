<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>team3</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cs-skin-elastic.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/search.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order.css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>
<script>
function fun1() {
	   let check = false;
	   with(document.ckDelete) {
	      if(ck.length==undefined) {
	         if(ck.checked) { check = true; }
	      } else {
	         for(let i=0;i<ck.length;i++) {
	            if(ck[i].checked) { check = true; } }
	      } if(!check) {
	      alert("삭제할 게시글을 선택하세요");
	         return;
	      } else {
	         if(confirm("삭제처리 하시겠습니까?")) { submit(); }
	      } } }

function fun2() {
	   if($("input:checked[id='ckAll']").prop("checked")) {
	    $("input[type=checkbox]").prop("checked", true); 
	   }else {
	    $("input[type=checkbox]").prop("checked", false); 
	   }
	}
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
							<div class="page-title">
								<h1>기준정보</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="#">기준정보</a></li>
									<li class="active">소요량</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

<!-- 검색어 -->								
<%
request.setCharacterEncoding("UTF-8");
String search =request.getParameter("search");
%>
		<div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card m-0">
							<div class="card-body card-block">
								<form action="${pageContext.request.contextPath}/req/reqlist" class="form-inline" method="GET">
									<div class="form-group col-6 mb-1">
										<label class="pr-1 form-control-label">등록자</label>&nbsp;&nbsp;<input
											type="text" name="search" class="form-control" placeholder="Emp Name">
									</div>
									<div class="col p-0">
										<button type="submit" class="btn btn-primary float-right ml-3" value="search">검색</button>
										<input type="reset" class="btn btn-secondary float-right reset" value="취소">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<!-- 검색어 끝 -->	

	<div class="content">
		<div style="width:100%; height:50px">
			<button type="button" class="btn btn-primary float-right" style="margin: 2px" onclick="location.href='${pageContext.request.contextPath}/req/reqinsert'">추가</button>
		</div>
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card m-0">
<%
if(search==null){
	%>                
							<div class="card-header">
								<strong class="card-title">품목별 현황</strong><br>
							</div>
<%}else{ %>
							<div class="card-header">
								<strong class="card-title">품목별 검색결과</strong><br>
							</div>
	<%
}
%> 									
							<div class="card-body card-block">
								<table id="bootstrap-data-table"
										class="table table-striped table-bordered">
									<thead class="thead-dark">	
										<tr>												
											<th scope="col" >상위품번</th>
											<th scope="col" >상위품명</th>
											<th scope="col" >하위품번</th>
											<th scope="col" >하위품명</th>
											<th scope="col" >소요량</th>
											<th scope="col" >등록자</th>
											<th scope="col">등록일</th>
											<th scope="col">수정자</th>
											<th scope="col">변경일</th>
											<th scope="col" style="width:150px">버튼</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="reqDTO" items="${reqList}"> 
										<tr>
											<td>${reqDTO.prod_fcd}</td>
											<td>${reqDTO.prod_fnm}</td>
											<td>${reqDTO.prod_cd}</td>
											<td>${reqDTO.prod_nm}</td>
											<td>${reqDTO.req_req}</td>
											<td>${reqDTO.req_add_emp}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd" value="${reqDTO.req_add_date}"/></td>
											<td>${reqDTO.req_edit_emp}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd" value="${reqDTO.req_edit_date}"/></td>
											<td>
											<div style="display: inline-block;">
										  <form name="updateModal" action="${pageContext.request.contextPath}/req/requpdate" method="get" onsubmit="return confirm('수정하시겠습니까?')">
										    <input type="hidden" name="req_num" value="${reqDTO.req_num}">
										    <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal2">수정</button>
										  </form>
										</div>
										<div style="display: inline-block;">
									  	<form name="deleteModal" action="${pageContext.request.contextPath}/req/reqdeletePro" method="get" onsubmit="return confirm('삭제하시겠습니까?')">
									    <input type="hidden" name="req_num" value="${reqDTO.req_num}">
									    <button type="submit" class="btn btn-secondary" data-toggle="modal" data-target="#deleteModal">삭제</button>
									  	</form>
										</div></td>
						
										</tr></c:forEach>
									</tbody>
								</table>
		                         <!-- 페이징 -->
		                        <div id="pageNum2" style="text-align: center;">
    								<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
        							<a href="${pageContext.request.contextPath}/req/reqlist?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}">Prev</a>
    								</c:if>
								    <c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
								        <c:if test="${i eq pageDTO.currentPage}">
								            <strong>${i}</strong>
								        </c:if>
								        <c:if test="${i ne pageDTO.currentPage}">
								            <a href="${pageContext.request.contextPath}/req/reqlist?pageNum=${i}&search=${pageDTO.search}">${i}</a>
								        </c:if>
								    </c:forEach>
								    <c:if test="${pageDTO.endPage < pageDTO.pageCount }">
								        <a href="${pageContext.request.contextPath}/req/reqlist?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}">Next</a>
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
	<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

</body>
</html>
