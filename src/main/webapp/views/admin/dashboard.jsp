<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    <%request.setCharacterEncoding("UTF-8");%>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/img/favicon.ico">
    <title>Zay - Quản trị viên</title>
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/admin/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/admin/dist/css/style.min.css" rel="stylesheet">

</head>

<body>
<c:set var="url"
		value="${pageContext.request.contextPath}/"/>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
        
         <!-- Start Topbar header, logo, slide bar-->
        	<jsp:include page="/views/admin/pages/header-slidebar.jsp"></jsp:include>
         <!-- End Topbar header, logo, slide bar-->

        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Good Morning ${user.getFullname()}</h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="col-5 align-self-center">
                        <div class="customize-input float-right">
                            <select class="custom-select custom-select-set form-control bg-white border-0 custom-shadow custom-radius">
                                <option selected>Aug 19</option>
                                <option value="1">July 19</option>
                                <option value="2">Jun 19</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
               
                
               
                <!-- *************************************************************** -->
                <!-- Start Top Leader Table -->
                <!-- *************************************************************** -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center mb-4">
                                    <h4 class="card-title">Sản phẩm bán chạy theo tháng ${month}</h4>
                                    <div class="ml-auto">
                                        <div class="dropdown sub-dropdown">
                                            <button class="btn btn-link text-muted dropdown-toggle" type="button"
                                                id="dd1" data-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false">
                                                <i data-feather="more-vertical"></i>
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dd1">
                                                <a class="dropdown-item" href="?month=1">1</a>
                                                <a class="dropdown-item" href="?month=2">2</a>
                                                <a class="dropdown-item" href="?month=3">3</a>
                                                <a class="dropdown-item" href="?month=4">4</a>
                                                <a class="dropdown-item" href="?month=5">5</a>
                                                <a class="dropdown-item" href="?month=6">6</a>
                                                <a class="dropdown-item" href="?month=7">7</a>
                                                <a class="dropdown-item" href="?month=8">8</a>
                                                <a class="dropdown-item" href="?month=9">9</a>
                                                <a class="dropdown-item" href="?month=10">10</a>
                                                <a class="dropdown-item" href="?month=11">11</a>
                                                <a class="dropdown-item" href="?month=12">12</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table no-wrap v-middle mb-0">
                                        <thead>
                                            <tr class="border-0">
                                                <th class="border-0 font-14 font-weight-medium text-muted">Hình
                                                </th>
                                                <th class="border-0 font-14 font-weight-medium text-muted px-2">Mã sản phẩm
                                                </th>
                                                <th class="border-0 font-14 font-weight-medium text-muted">Tên sản phẩm</th>
                                                <th class="border-0 font-14 font-weight-medium text-muted text-center">
                                                    giá sản phẩm
                                                </th>
                                                <th class="border-0 font-14 font-weight-medium text-muted text-center">
                                                    số lượng bán
                                                </th>
                                                <th class="border-0 font-14 font-weight-medium text-muted">Tổng tiền</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item" items="${RP_Products}">
                                            <tr>
                                                <td class="border-top-0 px-2 py-4">
                                                    <div class="d-flex no-block align-items-center">
                                                        <div class="mr-3"><img
                                                                src="${pageContext.request.contextPath}/resources/assets/img/img_product/${item.getImage_product()}"
                                                                alt="user" class="rounded-circle" width="45"
                                                                height="45" /></div>
                                                    </div>
                                                </td>
                                                <td class="border-top-0 text-muted px-2 py-4 font-14">${item.getId_product()}</td>
                                                <td class="border-top-0 px-2 py-4">
                                                    ${item.getName_product()}
                                                </td>
                                                <td class="border-top-0 text-center px-2 py-4"><fmt:formatNumber type="number" value="${item.getPrice_product()}" /></td>
                                                <td
                                                    class="border-top-0 text-center font-weight-medium text-muted px-2 py-4">
                                                    ${item.getQuantity()}
                                                </td>
                                                <td class="font-weight-medium text-dark border-top-0 px-2 py-4"><fmt:formatNumber type="number" value="${item.getPrice_product() * item.getQuantity()}" />
                                                </td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- *************************************************************** -->
                <!-- End Top Leader Table -->
                <!-- *************************************************************** -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center text-muted">
                All Rights Reserved by Adminmart. Designed and Developed by <a
                    href="https://wrappixel.com">WrapPixel</a>.
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="${pageContext.request.contextPath}/resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <!-- apps -->
    <script src="${pageContext.request.contextPath}/resources/admin/dist/js/app-style-switcher.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/dist/js/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/admin/dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/admin/assets/extra-libs/c3/d3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/assets/extra-libs/c3/c3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/dist/js/pages/dashboards/dashboard1.min.js"></script>
</body>

</html>