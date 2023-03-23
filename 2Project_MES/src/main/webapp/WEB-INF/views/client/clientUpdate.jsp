<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/client/updatePro" method="post">

거래처코드 : <input type="text" name="cli_cd" value="${clientDTO.cli_cd}" readonly><br>
거래처명 : <input type="text" name="cli_nm" value="${clientDTO.cli_nm}"><br>
거래처구분 : <input type="text" name="cli_type" value="${clientDTO.cli_type}"><br>
사업자번호 : <input type="text" name="cli_num" value="${clientDTO.cli_num}"><br>
업태 : <input type="text" name="cli_business" value="${clientDTO.cli_business}"><br>
종목 : <input type="text" name="cli_prod" value="${clientDTO.cli_prod}"><br>
대표자 : <input type="text" name="cli_boss" value="${clientDTO.cli_boss}"><br>
담당자 : <input type="text" name="cli_emp" value="${clientDTO.cli_emp}"><br>
주소 : <input type="text" name="cli_addr" value="${clientDTO.cli_addr}"><br>
상세주소 : <input type="text" name="cli_addr2" value="${clientDTO.cli_addr2}"><br>
전화번호 : <input type="text" name="cli_tel" value="${clientDTO.cli_tel}"><br>
휴대폰번호 : <input type="text" name="cli_emp_tel" value="${clientDTO.cli_emp_tel}"><br>
팩스번호 : <input type="text" name="cli_fax" value="${clientDTO.cli_fax}"><br>
이메일 : <input type="text" name="cli_email" value="${clientDTO.cli_email}"><br>
비고 : <input type="text" name="cli_note" value="${clientDTO.cli_note}"><br>

<input type="submit" value="수정">

</form>

</body>
</html>