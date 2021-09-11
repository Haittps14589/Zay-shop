<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>

<head>
<title>Zay Shop - Product List Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/assets/img/favicon.ico">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/templatemo.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/fontawesome.min.css">

<!-- Custom CSS -->
<link
	href="${pageContext.request.contextPath}/resources/profile/css/style.css"
	rel="stylesheet">
<!-- color CSS -->
<link
	href="${pageContext.request.contextPath}/resources/profile/css/colors/default.css"
	id="theme" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!--

    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
</head>

<body>
	<c:set var="url" value="${pageContext.request.contextPath}/" />
<c:if test="${cartDetailsByCart != null}">
<script>
      $(document).ready(function(){
		$("#myModal").modal('show');
	});
    </script>
</c:if>
	<!-- top nav, header, modal -->
	<jsp:include page="/views/pages/header.jsp" />

	<!-- Start Content -->
	<div class="row">
		<div class="col-md-4 col-xs-12">


			<div class="col-md-8 col-xs-12">
				<div class="white-box">
					<form class="form-horizontal form-material" method="post">
						<div class="form-group">
							<label class="col-md-12">Họ tên</label>
							<div class="col-md-12">
								<input type="text" placeholder="${user.getFullname()}"
									class="form-control form-control-line">
							</div>
						</div>
						<div class="form-group">
							<label for="example-email" class="col-md-12">Email</label>
							<div class="col-md-12">
								<input type="email" placeholder="${user.getEmail()}"
									class="form-control form-control-line" name="example-email"
									id="example-email">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-12">Mật khẩu</label>
							<div class="col-md-12">
								<input type="password" value="${user.getPassword()}"
									class="form-control form-control-line">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-12">Số điện thoại</label>
							<div class="col-md-12">
								<input type="text" placeholder="${user.getPhone()}"
									class="form-control form-control-line">
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-12">
								<button class="btn btn-success">Update Profile</button>
								<button class="btn btn-danger" formaction="${url}user/sign-out">Đăng
									xuất</button>
							</div>

						</div>
					</form>
				</div>
			</div>

		</div>
		<div class="col-md-8 col-xs-12">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">Danh sách đơn hàng</h4>

							<div class="table-responsive">
								<table id="zero_config"
									class="table table-striped table-bordered no-wrap">
									<thead>
										<tr>
											<th>Mã giỏ hàng</th>
											<th>Mã khách hàng</th>
											<th>Tổng tiền</th>
											<th>Ngày tạo</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="cart" items="${History_Carts}">
											<tr>
												<td><a href="${url}user?id=${cart.getId()}">${cart.getId()}</a></td>
												<td>${cart.getUser_id()}</td>
												<td><fmt:formatNumber type="number"
														value="${cart.getTotal()}" /></td>
												<td>${cart.getDate()}</td>
											</tr>
										</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Content -->
		
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
	<!-- Start Footer -->
	<jsp:include page="/views/pages/footer.jsp" />
	<!-- End Footer -->

	<!-- Start Script -->

    <script src="${pageContext.request.contextPath}/resources/admin/assets/extra-libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/dist/js/pages/datatable/datatable-basic.init.js"></script>
	<!-- End Script -->
</body>

</html>