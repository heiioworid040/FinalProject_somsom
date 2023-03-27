<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="update" action="${pageContext.request.contextPath}/code/updatePro" method="post">
<input type="submit" value="저장">
그룹코드:<input type="text" name=code_grp value="${codeDTO.code_grp}" ><br>
크룹코드명:<input type="text" name=code_grp_nm value="${codeDTO.code_grp_nm}" ><br>
코드:<input type="text" name=code_cd value="${codeDTO.code_cd}" ><br>
코드명:<input type="text" name=code_nm value="${codeDTO.code_nm}" ><br>
비고:<input type="text" name=code_note value="${codeDTO.code_note}" ><br>
</form>
</body>
</html>