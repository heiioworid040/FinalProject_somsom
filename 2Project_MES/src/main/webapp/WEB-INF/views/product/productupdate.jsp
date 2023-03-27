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

		if (document.fr.prod_cd.value == "") {
			alert("품목코드를 입력하세요.");
			document.fr.prod_cd.focus();
			return false;
		}

		if (document.fr.prod_nm.value == "") {
			alert("품명을 선택하세요.");
			document.fr.cli_num.focus();
			return false;
		}
		if (document.fr.prod_mat.value == "") {
			alert("자재유형을 선택하세요.");
			document.fr.prod_cd.focus();
			return false;
		}
		if (document.fr.prod_unit.value == "") {
			alert("재고단위을 선택하세요.");
			document.fr.prod_unit.focus();
			return false;
		}
		if (document.fr.prod_text.value == "") {
			alert("재질을 선택하세요.");
			document.fr.prod_text.focus();
			return false;
		}
		if (document.fr.prod_size.value == "") {
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

		alert("수정 완료되었습니다.");

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
                                <h1>수정페이지</h1>
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
								<strong class="card-title">행 수정</strong>
							</div>
							<div class="card-body">
							<form action="${pageContext.request.contextPath }/product/productupdatePro" method="POST" name="fr" onsubmit="return essential()">	
							<input type="hidden" name="prod_number" value="${productDTO.prod_number }">
							<table border="1">
							<tr><td>품번</td>
							    <td><input type="text" name="prod_cd" value="${productDTO.prod_cd}"></td></tr>
								<tr><td>품명</td>
		                          <td><select name="prod_nm">
							      <option value="">품명</option>
							      <option value="인형" <c:if test="${productDTO.prod_nm == '인형'}">selected</c:if>>인형</option>
							      <option value="바늘" <c:if test="${productDTO.prod_nm == '바늘'}">selected</c:if>>바늘</option>
							      <option value="기타" <c:if test="${productDTO.prod_nm == '기타'}">selected</c:if>>기타</option>
							    </select>
							  </td>
							</tr>  
							<tr><td>자재유형</td>
							    <td><select name="prod_mat">
							    	<option value="">자재유형</option>
							    	<option value="완제품" <c:if test="${productDTO.prod_mat == '완제품'}">selected</c:if>>완제품</option>
							    	<option value="부자재" <c:if test="${productDTO.prod_mat == '부자재'}">selected</c:if>>부자재</option>
							    	<option value="기타" <c:if test="${productDTO.prod_mat == '기타'}">selected</c:if>>기타</option>
							    	</select></td></tr>
							<tr><td>재고단위</td>
							    <td><select name="prod_unit">
							    	<option value="">단위</option>
							    	<option value="EA" <c:if test="${productDTO.prod_unit == 'EA'}">selected</c:if>>EA</option>
							    	<option value="OP" <c:if test="${productDTO.prod_unit == 'OP'}">selected</c:if>>OP</option>
							    	<option value="기타" <c:if test="${productDTO.prod_unit == '기타'}">selected</c:if>>기타</option>
							    	</select></td></tr>
							<tr><td>재질</td>
							    <td><select name="prod_text">
							    	<option value="">재질</option>
							    	<option value="천" <c:if test="${productDTO.prod_text == '천'}">selected</c:if>>천</option>
							    	<option value="유리" <c:if test="${productDTO.prod_text == '유리'}">selected</c:if>>유리</option>
							    	<option value="기타" <c:if test="${productDTO.prod_text == '기타'}">selected</c:if>>기타</option>
							    	</select></td></tr>
							<tr><td>규격</td>
							    <td><select name="prod_size">
							    	<option value="">규격</option>
							    	<option value="10*10" <c:if test="${productDTO.prod_size == '10*10'}">selected</c:if>>10*10</option>
							    	<option value="20*20" <c:if test="${productDTO.prod_size == '20*20'}">selected</c:if>>20*20</option>
							    	<option value="기타" <c:if test="${productDTO.prod_size == '기타'}">selected</c:if>>기타</option>
							    	</select></td></tr>    	
							 <tr><td>매입단가</td>
							  <td><input type="text" name="prod_inprice" value="${productDTO.prod_inprice}"></td></tr>
							   <tr><td>매출단가</td>
							  <td><input type="text" name="prod_outprice" value="${productDTO.prod_outprice}"></td></tr>
							   <tr><td>현재고</td>
							  <td><input type="text" name="prod_count" value="${productDTO.prod_count}" readonly="readonly"></td></tr>
							   <tr><td>비고</td>
							  <td><input type="text" name="prod_note" value="${productDTO.prod_note}"></td></tr>  	    				    	
							<tr><td colspan="2"><input type="submit" value="데이터수정"></td></tr>  
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
