<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    <%request.setCharacterEncoding("UTF-8");%>
    <c:set var="url"
		value="${pageContext.request.contextPath}/"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
     <title>Adminmart Template - The Ultimate Multipurpose admin template</title>
    <!-- This page plugin CSS -->
    <link href="${pageContext.request.contextPath}/resources/admin/assets/extra-libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/admin/dist/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
	<jsp:include page="/views/admin/pages/header-slidebar.jsp"/>
	<div class="page-wrapper">
		<div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">Basic Initialisation</h4>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item"><a href="index.html" class="text-muted">Home</a></li>
                                    <li class="breadcrumb-item text-muted active" aria-current="page">Library</li>
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
            
            <div class="container-fluid">
            	<div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Danh sách sản phẩm</h4>
                                
                                <div class="table-responsive">
                                    <table id="zero_config" class="table table-striped table-bordered no-wrap">
                                        <thead>
                                            <tr>
                                            	<th>hình</th>
                                                <th>Mã</th>
                                                <th>Tên</th>
                                                <th>giá</th>
                                                <th>danh mục</th>
                                                <th>số lượng</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="product" items="${products}">
                                            <tr>
                                            	<td><img style="width: 50px; height: 50px" src="${pageContext.request.contextPath}/resources/assets/img/img_product/${product.getImage()}"></td>
                                                <td>${product.getId()}</td>
                                                <td><a href="${url}admin/form/product?id=${product.getId()}">${product.getName()}</a></td>
                                                <td>${product.getPrice()}</td>
                                                <td>${product.getCategory().getName()}</td>
                                                <td>${product.getInventory()}</td>
                                                <td><a href="${url}admin/delete/product?id=${product.getId()}"><i class="bi bi-x-square"></i></a></td>
                                            </tr>
                                            </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             <footer class="footer text-center text-muted">
                All Rights Reserved by Adminmart. Designed and Developed by <a
                    href="https://wrappixel.com">WrapPixel</a>.
            </footer>
	</div>
</div>


<script src="${pageContext.request.contextPath}/resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/admin/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <!-- apps -->
    <script src="${pageContext.request.contextPath}/resources/admin/dist/js/app-style-switcher.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/dist/js/feather.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/admin/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <!-- themejs -->
    <!--Menu sidebar -->
    <script src="${pageContext.request.contextPath}/resources/admin/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/admin/dist/js/custom.min.js"></script>
    <!--This page plugins -->
    <script src="${pageContext.request.contextPath}/resources/admin/assets/extra-libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/dist/js/pages/datatable/datatable-basic.init.js"></script>
</body>
</html>