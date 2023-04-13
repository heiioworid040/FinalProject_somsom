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
<script type="text/javascript">
	// 필수입력 제어	
	function essential() {
		
		if (document.fr.prod_nm.value == "") {
			alert("품명을 입력하세요.");
			document.fr.prod_nm.focus();
			return false;
		}
		if (document.fr.prod_mat.value == "자재유형") {
			alert("자재유형을 선택하세요.");
			document.fr.prod_mat.focus();
			return false;
		}
		if (document.fr.prod_unit.value == "단위") {
			alert("재고단위를 선택하세요.");
			document.fr.prod_unit.focus();
			return false;
		}
		if (document.fr.prod_text.value == "") {
			alert("재질을 입력하세요.");
			document.fr.prod_text.focus();
			return false;
		}
		if (document.fr.prod_size.value == "규격") {
			alert("규격을 선택하세요.");
			document.fr.prod_size.focus();
			return false;
		}

		if (document.fr.prod_inprice.value == "") {
			alert("매입단가를 입력하세요.");
			document.fr.prod_inprice.focus();
			return false;
		}
		if (document.fr.prod_outprice.value == "") {
			alert("매출단가를 입력하세요.");
			document.fr.prod_outprice.focus();
			return false;
		}
		if (document.fr.prod_count.value == "") {
			alert("현재고를 입력하세요.");
			document.fr.prod_count.focus();
			return false;
		}

		alert("추가 완료되었습니다.");

	}
	

	function orderPop(order) {
		
		if(order==1) window.open('${pageContext.request.contextPath }/product/productorderPop?pop=cli','cliPop','width=600,height=500')
	
	}
	</script>

<style>
table {
  background-color: #f9f9f9;
  border: 1px solid #ddd;
  font-weight: bold;
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

th {
  background-color: #4CAF50;
  color: white;
}
</style>
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
								<h3>추가</h3>
							</div>
							<div class="card-body">
							<form action="${pageContext.request.contextPath}/product/productwritePro" method="post" name="fr" onsubmit="return essential()">
							<table border="1">
							<tr><td>품목코드</td>

							    <td><input name="prod_cd" placeholder="P001 형식으로 자동생성" readonly></td></tr>

							<tr><td>품명<span style="color:red">*</span></td>
							    <td><input type="text" name="prod_nm"></td></tr>
							<tr><td>거래처코드</td>
							 <td><input type="text" id="cli_cd" name="cli_cd" value="${productDTO.cli_cd }" readonly placeholder="ex)완제품일 경우 선택X">

							 	 <button type="button" id="pop" value="cli" onclick="orderPop(1)">돋보기</button></td></tr>
							<tr><td>자재유형</td>
							    <td><select name="prod_mat">
							    	<option value="자재유형">자재유형</option>
							    	<option value="완제품">완제품</option>
							    	<option value="원자재">원자재</option>
							    	<option value="부자재">부자재</option>
							    	</select></td></tr>
							<tr><td>재고단위</td>
							    <td><select name="prod_unit">
							    	<option value="단위" selected="selected">단위</option>
							    	<option value="EA">EA</option>
							    	<option value="PK">PK</option>
							    	<option value="기타">기타</option>
							    	</select></td></tr>
							<tr><td>재질</td>
							    <td><input type="text" name="prod_text"></td></tr>
							<tr><td>규격</td>
							    <td><select name="prod_size">
							    	<option value="규격" selected="selected">규격</option>
							    	<option value="10*10">10*10</option>
							    	<option value="20*20">20*20</option>
							    	<option value="20*20">30*30</option>
							    	<option value="기타">기타</option>
							    	</select></td></tr>    	
							 <tr><td>매입단가<span style="color:red">*</span></td>
							  <td><input type="text" name="prod_inprice" pattern="[0-9]+"></td></tr>
							   <tr><td>매출단가<span style="color:red">*</span></td>
							  <td><input type="text" name="prod_outprice" pattern="[0-9]+"></td></tr>
							   <tr><td>현재고<span style="color:red">*</span></td>
							  <td><input type="text" name="prod_count" pattern="[0-9]+"></td></tr>
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
<script type="text/javascript">
function openProductClie() {
	  var url = "${pageContext.request.contextPath}/product/productclie";
	  window.open(url, "_blank", "width=1100, height=700");
	}

</script>

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
