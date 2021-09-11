<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
</head>

<body>

	<c:set var="url" value="${pageContext.request.contextPath}/" />

	<!-- top nav, header, modal -->
	<jsp:include page="/views/pages/header.jsp" />

	<!-- Start Content -->
	<div class="container py-5">
		<div class="row">

			<!-- Start Category -->
			<div class="col-lg-3">
				<h1 class="h2 pb-4">Categories</h1>
				<ul class="list-unstyled templatemo-accordion">
					<c:forEach var="category" items="${categorys}">
						<jsp:include page="/views/pages/category.jsp">
							<jsp:param value="${category.getName()}" name="name" />
							<jsp:param value="${category.getId()}" name="id" />
						</jsp:include>
					</c:forEach>
				</ul>
			</div>
			<!-- End Category -->

			<div class="col-lg-9">
				<div class="row">
					<div class="col-md-6">
						<ul class="list-inline shop-top-menu pb-3 pt-1">
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none mr-3" href="${url}shop">All</a>
							</li>
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none mr-3"
								href="${url}shop/dtdd">Điện thoại</a></li>
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none"
								href="${url}shop/dong-ho">Phụ kiện</a></li>
						</ul>
					</div>
					<div class="col-md-6 pb-4">
						<div class="d-flex">
							<select class="form-control">
								<option>Featured</option>
								<option>A to Z</option>
								<option>Item</option>
							</select>
						</div>
					</div>
				</div>

				<!-- Start list product -->
				<div class="row">
					<c:forEach var="product" items="${products}">
						<jsp:include page="/views/pages/product_item.jsp">
							<jsp:param value="${product.getCategory().getId()}"
								name="category_id" />
							<jsp:param value="${product.getId()}" name="id" />
							<jsp:param value="${product.getName()}" name="name" />
							<jsp:param value="${product.getPrice()}" name="price" />
							<jsp:param value="${product.getDiscount()}" name="discount" />
							<jsp:param value="${product.getImage()}" name="img" />
						</jsp:include>
					</c:forEach>
				</div>
				<!-- End list product -->

				<form action="${url}shop" method="post">
					<div class="row">
						<ul class="pagination pagination-lg justify-content-end">

							<li class="page-item"><input
								class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
								name="page" type="submit" value="1"></li>
							<li class="page-item"><input
								class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
								name="page" type="submit" value="2"></li>
							<li class="page-item"><input
								class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
								name="page" type="submit" value="3"></li>
						</ul>
					</div>
				</form>
			</div>

		</div>
	</div>
	<!-- End Content -->

	<!-- Start Footer -->
	<jsp:include page="/views/pages/footer.jsp" />
	<!-- End Footer -->

	<!-- Start Script -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery-1.11.0.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/templatemo.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/custom.js"></script>
	<!-- End Script -->
	<script src="${pageContext.request.contextPath}/resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<c:if test="${message != null}">
<script>
 $(document).ready(function(){
		$("#messageModal").modal('show');
	});
 </script>
</c:if>
<!-- Modal -->
<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Zay - Thông báo</h5>
        
      </div>
      <div class="modal-body">
        ${message}
      </div>
      <div class="modal-footer">
        
        <button type="button" class="btn btn-primary" onclick="location.href='${url}cart'">Đi đến giỏ hàng</button>
      </div>
    </div>
  </div>
</div>

</body>

</html>