<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order.css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
<script>
	$(document).ready(function(){
		first = $('.ord_cd').length+1;
		$('#btn_add').click(function(){
		num = $('.ord_cd').length+1;
			$('.orderInfo').append('<tr class="add"><td>'+num+'</td><td><input type="text" name="ord_cd" class="ord_cd" readonly></td><td><input type="text" id="cli_nm'+num+'" name="cli_nm" class="Ocli_nm" onclick="searchPop(\'cliO\',\''+num+'\')"><input type="hidden" id="cli_cd'+num+'" name="cli_cd"></td><td><input type="date" id="ord_date'+num+'" name="ord_date" class="Oord_date"></td><td><input type="text" id="emp_nm'+num+'" name="emp_nm" class="Oemp_nm" onclick="searchPop(\'empO\',\''+num+'\')"><input type="hidden" id="emp_cd'+num+'" name="emp_cd"></td><td><input type="text" id="prod_cd'+num+'" name="prod_cd" class="prod_cd" onclick="searchPop(\'prodO\',\''+num+'\')"></td><td><input type="text" id="prod_nm'+num+'" class="prod_nm"></td><td><input type="text" id="prod_unit'+num+'" class="prod_unit"></td><td><input type="date" id="ord_d_date'+num+'" name="ord_d_date" class="Oord_d_date"></td><td><input type="text" id="ord_count'+num+'" name="ord_count" class="ord_count"></td><td><input type="text" id="ship_count" class="ship_count" readonly></td><td></td></tr>');
		});
		
		$('#btn_cel').click(function(){
			$('.add').remove();
		});
		
		$('#btn_del').click(function(){
			if(!$("input:checked[id='ck']").prop("checked")){
				alert("삭제할 데이터를 선택하세요");
				return false;
			}
		});

		$('#btn_ins').click(function(){
			last = $('.ord_cd').length;
			
			for(i=first;i<=last;i++){
				if($('#cli_nm'+i).val()!=""||$('#ord_date'+i).val()!=""||$('#emp_nm'+i).val()!=""||$('#prod_cd'+i).val()!=""||$('#ord_count'+i).val()!=""){
					if($('#cli_nm'+i).val()==""){
					alert("거래처를 선택하세요.");
					return false;
					}
					if($('#ord_date'+i).val()==""){
					alert("수주일자를 입력하세요.");
					return false;
					}
					if($('#emp_nm'+i).val()==""){
					alert("담당자를 선택하세요.");
					return false;
					}
					if($('#prod_cd'+i).val()==""){
					alert("상품을 선택하세요.");
					return false;
					}
					if($('#ord_d_date'+i).val()==""){
					alert("납품예정일을 입력하세요.");
					return false;
					}
					if($('#ord_count'+i).val()==""){
					alert("수주량을 입력하세요.");
					return false;
					}
				}
			}
		});
	});
</script>
<script>
	function searchPop(search, id) {
	window.open('${pageContext.request.contextPath }/order/searchPop?pop='+search+'&id='+id,'searchPop','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=900,height=787,top=90,left=200')
	}

	function fun2() {
		if($("input:checked[id='ckAll']").prop("checked")) {
			$("input[id=ck]").prop("checked", true); 
		}else {
			$("input[id=ck]").prop("checked", false); 
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
								<h1>수주현황</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="#">영업관리</a></li>
									<li class="active">수주현황</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 	검색창 -->
		<div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card m-0">
							<div class="card-body card-block">
								<form action="${pageContext.request.contextPath }/order/orderInfo" method="get" name="orderSearch" class="form-inline">
									<div class="search-div">
										<span class="search-cl">거래처</span><input type="text" id="cliS_cd" name="cli" placeholder="Client Code" readonly><input type="text" id="cliS_nm" placeholder="Client Name" readonly><button type="button" class="input-group-addon search-btn" style="cursor: pointer;" onclick="searchPop('cliS')"><i class="ti-search"></i></button>
									</div>
									<div class="search-div">
										<span class="search-cl2">수주일자</span><input type="date" id="ordS_date" name="ord"> ~ <input type="date" id="ordS_date_end" name="ord_end">
									</div>
									<div class="search-div">
										<span class="search-cl">담당자</span><input type="text" id="empS_cd" name="emp" placeholder="Emp Code" readonly><input type="text" id="empS_nm" placeholder="Emp Name" readonly><button type="button" class="input-group-addon search-btn" style="cursor: pointer;" onclick="searchPop('empS')"><i class="ti-search"></i></button>
									</div>
									<div class="search-div">
										<span class="search-cl">납품예정일</span><input type="date" id="ordS_d_date" name="ord_d"> ~ <input type="date" id="ordS_d_date_end" name="ord_d_end">
									</div>
									<div class="search-div">
										<span class="search-cl2">품목</span><input type="text" id="prodS_cd" name="prod" placeholder="Prod Code" readonly><input type="text" id="prodS_nm" placeholder="Prod Name" readonly><button type="button" class="input-group-addon search-btn" style="cursor: pointer;" onclick="searchPop('prodS')"><i class="ti-search"></i></button>
									</div>
									<div class="search-div2 form-inline">
										<span class="search-cl2">출하여부</span><div style="margin-top:5px"><input type="checkbox" name="ship" value="ship" ${pageDTO.search8 eq 'ship' ? "checked":"" }></div><span style="margin-left:4px">완료</span>
										<div style="width: 74.7%">
										<input type="submit" class="btn btn-primary float-right" value="검색">
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 	검색창 -->
		
		<!-- .content -->
		<form action="${pageContext.request.contextPath }/order/orderInfoPro" id="orderInfo" method="post">
		<div class="content">
			<div style="width: 100%; height: 50px">
					<button type="reset" id="btn_cel" class="btn btn-secondary float-right"  style="margin: 2px">취소</button>
					<button type="submit" id="btn_del" name="btn" value="del" class="btn btn-primary float-right"  style="margin: 2px">삭제</button>
					<button type="submit" id="btn_ins" name="btn" value="ins" class="btn btn-primary float-right" style="margin: 2px">저장</button>
					<c:if test="${pageDTO.search8 ne 'ship' }">
					<button type="button" id="btn_add" name="btn" value="add" class="btn btn-primary float-right" style="margin: 2px">추가</button>
					</c:if>
			</div>
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">수주현황</strong>
							</div>
							<div class="card-body">
								<table class="table table-striped table-bordered">
									<thead class="thead-dark">
										<tr>
											<th scope="col" style="width: 44px"></th>
											<th scope="col">수주번호</th>
											<th scope="col">거래처</th>
											<th scope="col">수주일자</th>
											<th scope="col">담당자</th>
											<th scope="col">상품코드</th>
											<th scope="col">상품명</th>
											<th scope="col">단위</th>
											<th scope="col">납품예정일</th>
											<th scope="col">수주량</th>
											<th scope="col">출하량</th>
											<th scope="col"><input type="checkbox" id="ckAll" name="ckAll" onclick="fun2()"></th>
										</tr>
									</thead>
									<tbody class="orderInfo">
										<c:forEach var="orderDTO" items="${orderList }" varStatus="status">
												<tr>
													<td scope="col" data-count="${status.count }">${status.count }</td>
													<td><input type="text" id="ord_cd" name="ord_cd${status.count }" class="ord_cd" value="${orderDTO.ord_cd }" readonly></td>
													<td><input type="text" id="cli_nm${status.count }" name="cli_nm${status.count }" class="Ocli_nm" value="${orderDTO.cli_nm }" onclick="searchPop('cliO','${status.count }')" readonly>
														<input type="hidden" id="cli_cd${status.count }" name="cli_cd${status.count }" value="${orderDTO.cli_cd }"></td>
													<td><input type="date" id="ord_date" name="ord_date${status.count }" class="Oord_date" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${orderDTO.ord_date }"/>" readonly></td>
													<td><input type="text" id="emp_nm${status.count }" name="emp_nm${status.count }" class="Oemp_nm" value="${orderDTO.emp_nm }" onclick="searchPop('empO','${status.count }')" readonly>
														<input type="hidden" id="emp_cd${status.count }" name="emp_cd${status.count }" value="${orderDTO.emp_cd }"></td>
													<td><input type="text" id="prod_cd${status.count }" name="prod_cd${status.count }" class="prod_cd" value="${orderDTO.prod_cd }" onclick="searchPop('prodO','${status.count }')" readonly></td>
													<td><input type="text" id="prod_nm${status.count }" class="prod_nm" value="${orderDTO.prod_nm }" readonly></td>
													<td><input type="text" id="prod_unit${status.count }" class="prod_unit" value="${orderDTO.prod_unit }" readonly></td>
													<td><input type="date" id="ord_d_date" name="ord_d_date${status.count }" class="Oord_d_date" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${orderDTO.ord_d_date }"/>"></td>
													<td><input type="text" id="ord_count" name="ord_count${status.count }" class="ord_count" value="${orderDTO.ord_count }"></td>
													<td><input type="text" id="ship_count" name="ship_count" class="ship_count" value="${orderDTO.ship_count }" readonly></td>
													<td><input type="checkbox" id="ck" name="ck" value="${status.count },${orderDTO.ord_cd }"></td>
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
		</form>
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