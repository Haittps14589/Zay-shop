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
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/cart/css/style.css"
	type="text/css">
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
</head>

<body>
	<script>
 $(document).ready(function(){
	 var total = document.getElementsByClassName("totals");
		var totalcart = 0;
		for(var i = 0; i < total.length;i++){
			totalcart += Number(total[i].value);
		}
		document.getElementById("totalCart").value = totalcart;
		document.getElementById("total-cart").innerHTML = new Intl.NumberFormat('vi', { maximumSignificantDigits: 3 ,style: 'currency', currency: 'VND'}).format(totalcart);
	});
 </script>
	<c:set var="url" value="${pageContext.request.contextPath}/" />

	<!-- top nav, header, modal -->
	<jsp:include page="/views/pages/header.jsp" />

	<!-- Page Add Section Begin -->
	<section class="page-add cart-page-add">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="page-breadcrumb">
						<h2>
							Cart<span>.</span>
						</h2>
					</div>
				</div>
				<div class="col-lg-8">
					<img src="${url}resources/assets/img/img_product/euro-oppo-830-300-830x300.png" style="height: 150px; width: 900px">
				</div>
			</div>
		</div>
	</section>
	<!-- Page Add Section End -->

	<!-- Cart Page Section Begin -->
	<div class="cart-page">
		<div class="container">
			<div class="cart-table">
				<table>
					<thead>
						<tr>
							<th class="product-h">Product</th>
							<th>Price</th>
							<th class="quan">Quantity</th>
							<th>Total</th>
							<th></th>
						</tr>
					</thead>

					<tbody>
						
						<c:forEach var="cartDetail" items="${sessionScope.cartDetails}"	varStatus="loop">
							<c:set var="id" value="${cartDetail.getProduct().getId()}"></c:set>
							<tr>
								<td class="product-col"><img
									src="${url}resources/assets/img/img_product/${cartDetail.getProduct().getImage()}"
									alt="">
									<div class="p-title">
										<h5>${cartDetail.getProduct().getName()}</h5>
									</div></td>
								<td class="price-col"><fmt:formatNumber type="number"
										value="${cartDetail.getProduct().getPrice()}" /></td>
								<td class="quantity-col">
									<div class="pro-qty">
										<button
											onclick="dereFunc('${loop.index}','${id}')"
											style="border: none; background: none;">-</button>
										<input type="text" value="${cartDetail.getquantity()}" name="quantity"
											id="${id}">
										<button
											onclick="location.href='${url}cart/increase?index=${loop.index}'"
											style="border: none; background: none;">+</button>

										<input type="text" class="totals" id="totals${id}"
											value="${cartDetail.getProduct().getPrice()*cartDetail.getquantity()}"
											style="display: none">
									</div>
								</td>

								<td class="total" id="total${id}"><fmt:formatNumber
										type="number"
										value="${cartDetail.getProduct().getPrice()*cartDetail.getquantity()}" />
									₫</td>
								<td class="product-close"
									onclick="deleteFunc('${loop.index}')">x</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="shopping-method">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">

							<div class="total-info">
								<div class="total-table">
									<table>
										<thead>
											<tr>
												<th class="total-cart">Total Cart</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="total-cart-p" id="total-cart">$39</td>
												<td style="display: none"><input name="totalCart" id="totalCart" value=""> </td>
											</tr>
										</tbody>
									</table>
									
									<c:choose >
										<c:when test="${sessionScope.cartDetails.size() == 0}">
											<div class="cart-btn">
										<div class="row">
											<div class="col-lg-6">
												<div class="coupon-input">
													<input type="text" placeholder="Bạn chưa có sản phẩm trong giỏ hàng" readonly>
												</div>
											</div>
											<div class="col-lg-5 offset-lg-1 text-left text-lg-right">
												<div class="site-btn update-btn" style="background: #22ca80;color: white;border-color: #22ca80" onclick="location.href='${url}shop'">Đến trang sản phẩm</div>		
											</div>
										</div>
									</div>
										</c:when>	
										<c:otherwise>
										
											<div class="cart-btn">
										<div class="row">
											<div class="col-lg-6">
												<div class="coupon-input">
													<input type="text" placeholder="Nhập mã giảm giá" >
												</div>
											</div>
											<div class="col-lg-5 offset-lg-1 text-left text-lg-right">
												<div class="site-btn update-btn" style="background: #22ca80;color: white;border-color: #22ca80" onclick="location.href='${url}cart/payment'">Thanh toán giỏ hàng</div>		
											</div>
										</div>
									</div>
										</c:otherwise>						
									
									</c:choose>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- Cart Page Section End -->

	<!-- Start Footer -->
	<jsp:include page="/views/pages/footer.jsp" />
	<!-- End Footer -->

	<script type="text/javascript">
		function deleteFunc(index){
			var result = confirm("Bạn có muốn bỏ sản phẩm này khỏi giỏ hàng?");
		    if (result == true) {
		    	window.location.href = "${url}cart/remove?index="+index;
		    }
		}
		
		function dereFunc(index, idDere){
			var quantity = document.getElementById(idDere).value;
			if(quantity-1 != 0){
				window.location.href = "${url}cart/decrease?index="+index;
			}else{
				var result = confirm("Bạn có muốn bỏ sản phẩm này khỏi giỏ hàng?");
			    if (result == true) {
			    	window.location.href = "${url}cart/decrease?index="+index;
			    }
			}
			
		}
	</script>

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
		
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<!-- Js Plugins -->
<script src="${pageContext.request.contextPath}/resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- message -->
<c:if test="${message != null}">
<script>
 $(document).ready(function(){
		$("#messageModal").modal('show');
	});
 </script>
</c:if>

<!-- Modal -->
<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Zay - Thông báo</h5>
      </div>
      <div class="modal-body">
        ${message}
      </div>
    </div>
  </div>
</div>

	<!-- End Script -->
</body>

</html>