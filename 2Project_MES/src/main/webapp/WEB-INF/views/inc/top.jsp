<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>header</title>
</head>
<body>
        <!-- Header-->
        <header id="header" class="header">
            <div class="top-left p-0">
                <div class="navbar-header">
                    <a class="navbar-brand inline p-0" href="#"><img src="${pageContext.request.contextPath}/resources/images/logo1.png" class="ml-4" alt="Logo"></a>
                    <a class="navbar-brand hidden" href="#"><img src="${pageContext.request.contextPath}/resources/images/logo2.png" alt="Logo"></a>
                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                </div>
            </div>
            <div class="top-right">
                <div class="navbar-header">
                    <div class="navbar float-right pt-3">
                    ${sessionScope.emp_nm} ${sessionScope.emp_position}님 | <a class="navbar" href="${pageContext.request.contextPath}/employee/logout"><i class="fa fa-power-off "></i>Logout</a>
                    </div>
                </div>
            </div>
        </header><!-- /header -->
        <!-- Header-->
</body>
</html>