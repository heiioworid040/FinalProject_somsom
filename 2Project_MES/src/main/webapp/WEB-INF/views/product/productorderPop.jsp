<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!--     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<script>
	function cli(cli_cd) {
		opener.document.getElementById("cli_cd").value=cli_cd;
		document.cliPop.submit();
		self.close();
	}
</script>
<style>
.type07 {
  font-family: Arial, sans-serif;
  background-color: #f2f2f2;
}

/* Style the table header cells */
.type07 th {
  background-color: #333;
  color: #fff;
  font-weight: bold;
  padding: 10px;
  text-align: center;
}

/* Style the table body cells */
.type07 td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: center;
}

/* Style the table rows on hover */
.type07 tbody tr:hover {
  background-color: #ddd;
}

/* Style the table rows on click */
.type07 tbody tr:active {
  background-color: #ccc;
}


</style>

<body>
								<div class="breadcrumbs">
								<form action="${pageContext.request.contextPath }/product/productwirte" name="cliPop" method="get">		
										<table class="type07">
										  <thead>
										  <tr>
											<c:if test="${pop eq 'cli' }">
												<th scope="col">업체코드</th>
												<th scope="col">업체명</th>
												<th scope="col">구분</th>
											</c:if>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="productDTO" items="${popList }">
											<c:if test="${pop eq 'cli' }">
												<tr onclick="cli('${productDTO.cli_cd }')">
													<td>${productDTO.cli_cd }</td>
													<td>${productDTO.cli_nm }</td>
													<td>${productDTO.cli_type }</td>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
									</table>
									</form>
								</div>
		<!-- .content -->
</body>
</html>
