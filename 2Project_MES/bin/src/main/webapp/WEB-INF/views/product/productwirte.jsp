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
                                <h1>Table</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="${pageContext.request.contextPath}/product/productlist">조회</a></li>
                                     <li><a href="${pageContext.request.contextPath}/product/productwrite">추가</a></li>
                                    <li class="active">메인</li>
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
								<strong class="card-title">행 추가</strong>
							</div>
							<div class="card-body">
								<h1>생성</h1>
							<form action="${pageContext.request.contextPath}/product/productwritePro" method="post">
							<table border="1">
							<tr><td>품번</td>
							    <td><input type="text" name="prod_cd"></td></tr>
							<tr><td>품명</td>
							    <td><select name="prod_nm">
							    	<option value="">품명</option>
							    	<option value="인형">인형</option>
							    	<option value="바늘" selected="selected">바늘</option>
							    	<option value="기타">기타</option>
							</select></td></tr>   
							<tr><td>자재유형</td>
							    <td><select name="prod_mat">
							    	<option value="">자재유형</option>
							    	<option value="인형">인형</option>
							    	<option value="바늘" selected="selected">바늘</option>
							    	<option value="기타">기타</option>
							    	</select></td></tr>
							<tr><td>재고단위</td>
							    <td><select name="prod_unit">
							    	<option value="">단위</option>
							    	<option value="EA">EA</option>
							    	<option value="OP" selected="selected">OP</option>
							    	<option value="기타">기타</option>
							    	</select></td></tr>
							<tr><td>재질</td>
							    <td><select name="prod_text">
							    	<option value="">재질</option>
							    	<option value="천">천</option>
							    	<option value="유리" selected="selected">유리</option>
							    	<option value="기타">기타</option>
							    	</select></td></tr>
							<tr><td>규격</td>
							    <td><select name="prod_size">
							    	<option value="">규격</option>
							    	<option value="10*10">10*10</option>
							    	<option value="20*20" selected="selected">20*20</option>
							    	<option value="기타">기타</option>
							    	</select></td></tr>    	
							 <tr><td>매입단가</td>
							  <td><input type="text" name="prod_inprice" ></td></tr>
							   <tr><td>매입단가</td>
							  <td><input type="text" name="prod_outprice" ></td></tr>
							   <tr><td>현재고</td>
							  <td><input type="text" name="prod_count" ></td></tr>
							   <tr><td>비고</td>
							  <td><input type="text" name="prod_note"></td></tr>  	    				    	
							<tr><td colspan="2"><input type="submit" value="데이터전송"></td></tr>    
							</table>
						</form>
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
