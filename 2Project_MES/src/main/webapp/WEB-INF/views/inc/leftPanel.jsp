<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>leftPanel</title>
</head>
<body>
    <!-- Left Panel -->

    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="menu-title">메뉴</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>생산 관리</a>
                        <ul class="sub-menu children dropdown-menu">
                        	<li><i class="fa fa-puzzle-piece"></i><a class="linkurl" href="${pageContext.request.contextPath}/instruction/infoInst">작업 지시</a></li>
                            <li><i class="fa fa-id-badge"></i><a href="${pageContext.request.contextPath}/performance/performanceCurrentInfo">생산 실적 현황</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>자재 관리</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-table"></i><a href="${pageContext.request.contextPath}/iomat/iomatList">자재 재고 현황</a></li>
                            <li><i class="fa fa-table"></i><a href="${pageContext.request.contextPath}/imat/imatbeList">자재 입고</a></li>
                            <li><i class="fa fa-table"></i><a href="${pageContext.request.contextPath}/omat/omatbeList">자재 출고</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>기준정보</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-th"></i><a href="${pageContext.request.contextPath}/product/productlist">품목 정보</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="${pageContext.request.contextPath}/req/reqlist">소요량</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="${pageContext.request.contextPath}/line/lineInfo">라인 정보</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="${pageContext.request.contextPath}/client/clientInfo">거래처 정보</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-tasks"></i>영업 관리</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-fort-awesome"></i><a href="${pageContext.request.contextPath}/order/orderInsert">수주 관리</a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="${pageContext.request.contextPath}/order/orderInfo">수주 현황</a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="${pageContext.request.contextPath}/ship/shipInfo">출하 관리</a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="${pageContext.request.contextPath}/ship/shipCurrentInfo">출하 현황</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>시스템 관리</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-line-chart"></i><a href="${pageContext.request.contextPath}/employee/employeeList">사용자 관리</a></li>
                            <li><i class="menu-icon fa fa-area-chart"></i><a href="${pageContext.request.contextPath}/code/codeList">공통 코드 관리</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>
    <!-- /#left-panel -->
</body>
</html>