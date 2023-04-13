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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
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
<body>
<div class="col mt-3">
		<div class="col-lg">
			<div class="card">
				<div class="card-body card-block">
					<form action='${pageContext.request.contextPath}/order/orderPop' class="form-inline" method="get" id="ordSearchForm">
						<div class="form-group col">
							<div class="input-group">
								<label for="popCliNm" class="pr-1 form-control-label">수주 업체</label>
								<input type="text" id="popLineNm" name="popCliNm" placeholder="Client Name" class="form-control bg-white">
								<label for="popProdCd" class="pr-1 form-control-label">품목명</label>
								<input type="text" id="popProdCd" name="popProdCd" placeholder="Prod Code" class="form-control bg-white mr-4">
								<label for="popProdDate1" class="pr-1 form-control-label">수주일자</label>
								<input type="text" id="popProdDate1" name="popProdDate1" class="form-control">~
								<input type="text" id="popProdDate2" name="popProdDate2" class="form-control">
								<div class="input-group-btn">
								<input type	="submit" class="btn btn-primary ml-2" id="OrdSearchBtn" value="검색">
								</div>
							</div>
						</div>
						<div class="col p-0"></div>
					</form>
				</div>
			</div>
		</div>
<div class="col">
<form>
	<div class="card">
		<div class="card-body">
			<table class="table table-hover">
				<thead class="thead-dark">
					<tr>
						<th scope="col">수주번호</th>
						<th scope="col">상품코드</th>
						<th scope="col">상품명</th>
						<th scope="col">단위</th>
						<th scope="col">담당자</th>
						<th scope="col">거래처</th>
						<th scope="col">수주일자</th>
						<th scope="col">납품예정일</th>
						<th scope="col">수주량</th>
					</tr>
				</thead>
				<tbody id="orderTableBody">
					<c:forEach var="orderDTO" items="${orderList }">
						<tr id="infoOrderTr" class="data-row">
							<td id="ord_cd">${orderDTO.ord_cd }</td>
							<td>${orderDTO.prod_cd }</td>
							<td>${orderDTO.prod_nm }</td>
							<td>${orderDTO.prod_unit }</td>
							<td>${orderDTO.emp_nm}</td>
							<td>${orderDTO.cli_nm}</td>
							<td><fmt:formatDate value="${orderDTO.ord_date}" pattern="yyyy.MM.dd HH:mm"/></td>
							<td><fmt:formatDate value="${orderDTO.ord_d_date}" pattern="yyyy.MM.dd HH:mm"/></td>
							<td>${orderDTO.ord_count}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</form>
</div>
</div>
<div class="footer">
</div>	
<script
	src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script type="text/javascript">	
	$(document).on("click", "#infoOrderTr", function() {
		
		var tr1 = $(this);
		var td1 = tr1.children();
		
		popOrdCd = td1.eq(0).text();
		popProdCd = td1.eq(1).text();
		popProdNm = td1.eq(2).text();
		popProdUnit = td1.eq(3).text();
		popCliNm = td1.eq(5).text();
		popProdCount = td1.eq(8).text();

		$("#insertOrderCd", opener.document).val(popOrdCd);
		$("#insertProdCd", opener.document).val(popProdCd);
		$("#insertProdNm", opener.document).val(popProdNm);
		$("#insertProdUnit", opener.document).val(popProdUnit);
		$("#insertClientNm", opener.document).val(popCliNm);
		$("#insertProdCount", opener.document).val(popProdCount);

		self.close();
	});
	
	$(document).on("click", "#cancel", function() {
		self.close();
	});
</script>
</body>
</html>