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
<script type="text/javascript">
	$(document).ready(function(){
		$('.orderInsertD').click(function(){
			var ord_cd = $(this).data('value');
			$.ajax({
				url:'${pageContext.request.contextPath }/order/orderInsertD',
				dataType:'json',
				data: {'ord_cd':ord_cd},
				success:function(data){
						$('input[id=ord_cd]').attr('value',data["ord_cd"]);
						$('input[id=emp_cd]').attr('value',data["emp_cd"]);
						$('input[id=emp_nm]').attr('value',data["emp_nm"]);
						$('input[id=cli_cd]').attr('value',data["cli_cd"]);
						$('input[id=cli_nm]').attr('value',data["cli_nm"]);
						$('input[id=ord_date]').attr('value',data["ord_date"]).attr('readonly',true);
						$('input[id=ord_d_date]').attr('value',data["ord_d_date"]);
						$('input[id=prod_cd]').attr('value',data["prod_cd"]);
						$('input[id=prod_nm]').attr('value',data["prod_nm"]);
						$('input[id=prod_mat]').attr('value',data["prod_mat"]);
						$('input[id=prod_unit]').attr('value',data["prod_unit"]);
						$('input[id=ord_count]').attr('value',data["ord_count"]);
				}
			});
		});
		
		$('#btn_cel').click(function(){
			$('input[id=ord_cd]').removeAttr('value');
			$('input[id=emp_cd]').removeAttr('value');
			$('input[id=emp_nm]').removeAttr('value');
			$('input[id=cli_cd]').removeAttr('value');
			$('input[id=cli_nm]').removeAttr('value');
			$('input[id=ord_date]').removeAttr('value').removeAttr('readonly');
			$('input[id=ord_d_date]').removeAttr('value');
			$('input[id=prod_cd]').removeAttr('value');
			$('input[id=prod_nm]').removeAttr('value');
			$('input[id=prod_mat]').removeAttr('value');
			$('input[id=prod_unit]').removeAttr('value');
			$('input[id=ord_count]').removeAttr('value');
		});
		
		$('#orderInsert').submit(function(){
			if($('#emp_cd').val()==""&&$('#cli_cd').val()==""&&$('#ord_date').val()==""&&$('#ord_d_date').val()==""&&$('#prod_cd').val()==""&&$('#ord_count').val()==""){
				alert("데이터가 없습니다")
				return false;
			}
			if($('#emp_cd').val()==""){
				alert("담당자 선택");
				return false;
			}
			if($('#cli_cd').val()==""){
            	alert("거래처 선택");
            	return false;
            }
			if($('#ord_date').val()==""){
            	alert("수주일자 입력");
            	return false;
            }
			if($('#ord_d_date').val()==""){
				alert("납품예정일 입력");
				return false;
            }
			if($('#ord_date').val()>$('#ord_d_date').val()){
				alert("납품예정일을 바르게 입력하세요");
            	return false;
    		}
			if($('#prod_cd').val()==""){
				alert("상품 선택");
				return false;
			}
			if($('#ord_count').val()==""){
				alert("수주량 입력");
				return false;
			}
			var num = /[0-9]/;
			if(!num.test($('#ord_count').val())){
				alert("숫자만 입력");
				return false;
			}
		});
	});
</script>
<script>
	function searchPop(search) {
		window.open('${pageContext.request.contextPath }/order/searchPop?pop='+search,'searchPop','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=900,height=787,top=90,left=200')
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
								<h1>수주관리</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="#">영업관리</a></li>
									<li class="active">수주관리</li>
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
								<form action="${pageContext.request.contextPath }/order/orderInsert" method="get" class="form-inline">
									<div class="search-div">
										<span class="search-cl">거래처</span><input type="text" id="cliS_cd" name="cli" placeholder="Client Code" readonly><input type="text" id="cliS_nm" placeholder="Client Name" readonly><button type="button" class="input-group-addon search-btn" style="cursor: pointer;" onclick="searchPop('cliS')"><i class="ti-search"></i></button>
									</div>
									<div class="search-div">
										<span class="search-cl2">수주일자</span><input type="date" id="ordS_date" name="ord_date"><input type="date" id="ordS_date_end" name="ord_date_end">
									</div>
									<div class="search-div">
										<span class="search-cl">담당자</span><input type="text" id="empS_cd" name="emp" placeholder="Emp Code" readonly><input type="text" id="empS_nm" placeholder="Emp Name" readonly><button type="button" class="input-group-addon search-btn" style="cursor: pointer;" onclick="searchPop('empS')"><i class="ti-search"></i></button>
									</div>
									<div class="search-div2">
										<span class="search-cl">납품예정일</span><input type="date" id="ordS_d_date" name="ord_d_date"><input type="date" id="ordS_d_date_end" name="ord_d_date_end">
										<input type="submit" class="btn btn-primary float-right" style="margin-top: 6px" value="검색">
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
		<div class="content-div div-left">
			<div class="search-result-div">
				<span class="search-result">총 ${pageDTO.count }건</span>
			</div>
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">수주품목</strong>
							</div>
							<div class="card-body">
								<table class="table table-striped table-bordered" id="hover_tb">
									<thead class="thead-dark">
										<tr>
											<th scope="col">수주번호</th>
											<th scope="col">거래처</th>
											<th scope="col">수주일자</th>
											<th scope="col">납품예정일</th>
											<th scope="col">담당자</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="orderDTO" items="${orderInsertList }">
											<tr class="orderInsertD" data-value="${orderDTO.ord_cd }">
												<td>${orderDTO.ord_cd }</td>
												<td>${orderDTO.cli_nm }</td>
												<td><fmt:formatDate pattern="yyyy-MM-dd" value="${orderDTO.ord_date }"/></td>
												<td><fmt:formatDate pattern="yyyy-MM-dd" value="${orderDTO.ord_d_date }"/></td>
												<td>${orderDTO.emp_nm }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- .content -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
		<form action="${pageContext.request.contextPath }/order/orderInsertPro" id="orderInsert" method="POST">
		<div class="content-div div-right">
			<div style="width: 100%; height: 50px">
					<button type="reset" id="btn_cel" class="btn btn-secondary float-right"  style="margin: 2px">취소</button>
					<button type="submit" id="btn_del" name="btn_del" value="del" class="btn btn-primary float-right"  style="margin: 2px">삭제</button>
					<button type="submit" id="btn_add" name="btn_add" value="add" class="btn btn-primary float-right" style="margin: 2px">저장</button>
			</div>
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">수주품목상세</strong>
							</div>
							<div class="card-body">
								<table class="table">
									<thead class="thead-dark">
										<tr>
											<th scope="col">수주번호</th><td><input type="text" id="ord_cd" name="ord_cd" class="ord_cd" readonly></td>
											<td></td><td></td>
										</tr>
										<tr>
											<th scope="col">담당자</th><td><input type="text" id="emp_cd" name="emp_cd" class="emp_cd" value="${orderDTO.emp_cd }" readonly><input type="text" id="emp_nm" class="emp_nm" value="${orderDTO.emp_nm }" readonly><button type="button" class="input-group-addon search-btn" style="cursor: pointer;" onclick="searchPop('emp')"><i class="ti-search"></i></button></td>
											<th scope="col">수주일자</th><td><input type="date" id="ord_date" name="ord_date" class="ord_date" value="${ord_date }"></td>
										</tr>
										<tr>
											<th scope="col">거래처</th><td><input type="text" id="cli_cd" name="cli_cd" class="cli_cd" value="${orderDTO.cli_cd }" readonly><input type="text" id="cli_nm" value="${orderDTO.cli_nm }" class="cli_nm" readonly><button type="button" class="input-group-addon search-btn" style="cursor: pointer;" onclick="searchPop('cli')"><i class="ti-search"></i></button></td>
											<th scope="col">납품예정일</th><td><input type="date" id="ord_d_date" name="ord_d_date" class="ord_d_date" value="${ord_d_date }"></td>
										</tr>
									</thead>
								</table>
							</div>
							<div class="search-btn-div">
								<div class="btn-div">

								</div>
							</div>
							<div class="card-header">
								<strong class="card-title">수주정보</strong>
							</div>
							<div class="card-body">
								<table class="table">
									<thead class="thead-dark">
										<tr>
											<th scope="col"></th>
											<th scope="col">상품코드</th>
											<th scope="col">상품명</th>
											<th scope="col">자재유형</th>
											<th scope="col">단위</th>
											<th scope="col">수량</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
											<tr>
												<td></td>
												<td><input type="text" id="prod_cd" name="prod_cd" class="prod_cd" value="${orderDTO.prod_cd }" readonly></td>
												<td><input type="text" id="prod_nm" class="prod_nm" value="${orderDTO.prod_nm }" readonly></td>
												<td><input type="text" id="prod_mat" class="prod_mat" value="${orderDTO.prod_mat }" readonly></td>
												<td><input type="text" id="prod_unit" class="prod_unit" value="${orderDTO.prod_unit }" readonly></td>
												<td><input type="text" id="ord_count" class="ord_count" value="${orderDTO.ord_count }" name="ord_count"></td>
<!-- 												<td><button type="reset" class="btn-test" name="btn_can" value="del">-</button></td> -->
<!-- 												<td><button type="button" class="btn-test" name="btn_can" value="del">-</button></td> -->
											</tr>
									</tbody>
								</table>
								<c:if test="${empty orderDTO.prod_cd }">
								
									<button type="button" class="input-group-addon search-btn" value="add" onclick="searchPop('prod')" style="cursor: pointer;" onclick="searchPop('empS')"><i class="ti-search"></i></button>
<!-- 									<button type="button" class="btn_can" name="btn_can" value="add" onclick="searchPop('prod')">+</button> -->
								</c:if>
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
