<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
    <!-- This page plugin CSS -->
    <link href="${pageContext.request.contextPath}/resources/admin/assets/extra-libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/admin/dist/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>Zay - Danh sách đơn hàng</title>
</head>
<body>
<c:if test="${cartDetailsByCart != null}">
<script>
      $(document).ready(function(){
		$("#myModal").modal('show');
	});
    </script>
</c:if>
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
                                <h4 class="card-title">Danh sách đơn hàng</h4>
                                
                                <div class="table-responsive">
                                    <table id="zero_config" class="table table-striped table-bordered no-wrap">
                                        <thead>
                                            <tr>
                                                <th>Mã người dùng</th>
                                                <th>Mật khẩu</th>
                                                <th>Họ tên</th>
                                                <th>email</th>
                                                <th>điện thoại</th>
                                                <th>vai trò</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="user" items="${users}">
                                            <tr>
                                                <td>${user.getId()}</td>
                                               	<td>${user.getPassword()}</td>
                                               	<td>${user.getFullname()}</td>
                                               	<td>${user.getEmail()}</td>
                                               	<td>${user.getPhone()}</td>
                                               	<td>${user.isRole()==true?'admin':'khách hàng'}</td>
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


<div class="container">
  
  <!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Chi tiết giỏ hàng</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
          <table class="table table-striped">
    <thead>
      <tr>
		<th class="product-h">Product</th>
		<th>Price</th>
		<th class="quan">Quantity</th>
		<th>Total</th>
	</tr>
    </thead>
    <tbody>
    <c:forEach var="cartDetail" items="${cartDetailsByCart}"	varStatus="loop">
      <tr>
        <td class="product-col"><img style="height: 50px; width: 50px"
			src="${url}resources/assets/img/img_product/${cartDetail.getProduct().getImage()}"
			alt=""> </td>
			<td>
			<div class="p-title">
				<h5>${cartDetail.getProduct().getName()}</h5>
			</div></td>
			<td>${cartDetail.getquantity()}</td>
			<td><fmt:formatNumber type="number"
										value="${cartDetail.getProduct().getPrice()}" /></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
 
  </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
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