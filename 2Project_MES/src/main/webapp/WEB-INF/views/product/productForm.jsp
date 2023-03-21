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
                        <div class="page-header float-left">
                            <div class="page-title">
 
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">Dashboard</a></li>
                                    <li><a href="#">Table</a></li>
                                    <li class="active">Basic table</li>
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
							<div class="card-header">
								<strong class="card-title">품목별 현황</strong>
							</div>
							<div class="card-body">
								<table class="table" id="table2">
									<thead class="thead-dark">	
										<tr>
											<th scope="col">#</th>
											<th scope="col" >품번</th>
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
									<form action="${pageContext.request.contextPath}/product/insertPro" method="post">
										<c:forEach var="productDTO" items="${productList }"> 
										<tr>
											<th scope="row">1</th>
											<td>${productDTO.prod_cd}</td>
											<td>${productDTO.prod_nm}</td>
											<td>${productDTO.prod_mat}</td>
											<td>${productDTO.prod_unit}</td>
											<td>${productDTO.prod_text}</td>
											<td>${productDTO.prod_size}</td>
											<td>${productDTO.prod_inprice}</td>
											<td>${productDTO.prod_outprice}</td>
											<td>${productDTO.prod_count}</td>
											<td>${productDTO.prod_note}</td>
											<td><button class="delete-Btn">삭제</button></td>
										</tr>
										</c:forEach>
										</form>
									</tbody>
								</table>
								<div id="table-container"></div>
								<button id="add-row">추가</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div><!-- .content -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>			
<script>
//행추가
$(document).ready(function() { 
	  $("#add-row").click(function() { // add-row 눌렸을때 다음 펑션을 실행.
		  var newRow = '<tr><th><input type="text" name=""></th>'
		  +'<td><input type="text" name="prod_cd"></td>'
		  + '<td><input type="text" style="width: 50px; name="prod_nm"></td>'  
		  + '<td><input type="text" style="width: 50px; name="prod_mat"></td>'
		  +'<td><input type="text" style="width: 50px; name="prod_unit"></td>'
		  +'<td><input type="text" style="width: 50px; name="prod_text"></td>'
		  +'<td><input type="text" style="width: 50px; name="prod_size"></td>'
		  +'<td><input type="text" style="width: 50px; name="prod_inprice"></td>'
		  +'<td><input type="text" style="width: 50px; name="prod_outprice"></td>'
		  +'<td><input type="text" style="width: 50px; name="prod_count"></td>'
		  +'<td><input type="text" style="width: 50px; name="prod_note"></td>'
		  +'<td><button class="delete-Btn">삭제</button><button class-"submit-Btn">전송</button></td></tr>';
		    $('#table2').append(newRow);
	  });
	});
	
// 전송버튼	
// $(document).ready(function() {
//   $("#MyForm").submit(function(event) {
//     event.preventDefault(); // 기본 동작 방지
//     var formData = $(this).serialize(); // 폼 데이터 가져오기
//     $.ajax({
//       url: "./servlet-context", // 데이터를 전송할 서버 URL
//       type: "POST",
//       data: formData,
//       success: function(result) {
//       	alert('전송 되었습니다'); // 전송 결과 로그 출력
//       }
//     });
//   });
// });

// 테이블 행 삭제 
$('table').on('click', '.delete-Btn', function() {
    $(this).closest('tr').remove();
});
</script>		



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
