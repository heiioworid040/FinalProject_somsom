<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>lineModal</title>
<!--     <meta name="description" content="Ela Admin - HTML5 Admin Template"> -->
<!--     <meta name="viewport" content="width=device-width, initial-scale=1"> -->

<!--     <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png"> -->
<!--     <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png"> -->

<!--     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css"> -->
<!--     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"> -->
<!--     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css"> -->
<!--     <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css"> -->
<!--     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css"> -->
<!--     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css"> -->
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cs-skin-elastic.css"> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"> --%>

<!--     <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'> -->
</head>
<body>
<div class="modal fade" id="lineModal" tabindex="-1" role="dialog"
	aria-labelledby="largeModalLabel" style="display: none;"
	aria-hidden="true">
	<div class="modal-dialog modal-xl" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title inline-block" id="largeModalLabel">Large
					Modal</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="col">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">Table Head</strong>
							</div>
							<div class="card-body">
								<table class="table">
									<thead class="thead-dark">
										<tr>
											<th scope="col">라인코드</th>
											<th scope="col">라인명</th>
											<th scope="col">공정</th>
											<th scope="col">작업장</th>
											<th scope="col">정렬순서</th>
											<th scope="col">설비상태</th>
											<th scope="col">비고</th>
										</tr>
									</thead>
									<tbody id="lineTableBody">

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				<button type="button" class="btn btn-primary">Confirm</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>
