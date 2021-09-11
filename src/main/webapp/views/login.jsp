<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    <%request.setCharacterEncoding("UTF-8");%>
    
<!DOCTYPE html>
<html>

<head>
    <title>Zay Shop - Product List Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/img/favicon.ico">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/templatemo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/fontawesome.min.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/login/css/main.css">
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
</head>

<body>

<c:set var="url"
		value="${pageContext.request.contextPath}/"/>

	<!-- top nav, header, modal -->
    <jsp:include page="/views/pages/header.jsp"/>

    <!-- Start Content -->
    <div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-85 p-b-20">
				<form class="login100-form validate-form" action="${url}user/sign-in" method="post">
					<span class="login100-form-title p-b-70">
						Welcome
					</span>
					<span class="login100-form-avatar">
						<a class="navbar-brand text-success logo h1 align-self-center" href="${url}home">
			                Zay
			            </a>
					</span>

					<div class="wrap-input100 validate-input m-t-85 m-b-35" data-validate = "Enter username">
						<input class="input100" type="text" name="username">
						<span class="focus-input100" data-placeholder="Username"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-50" data-validate="Enter password">
						<input class="input100" type="password" name="password">
						<span class="focus-input100" data-placeholder="Password"></span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" id="loginbtn">
							Login
						</button>
					</div>

					<ul class="login-more p-t-190">
						<li class="m-b-8">
							<span class="txt1">
								Forgot
							</span>

							<a href="#" class="txt2">
								Username / Password?
							</a>
						</li>

						<li>
							<span class="txt1">
								Don’t have an account?
							</span>

							<a href="" data-toggle="modal" data-target="#CreateModal" class="txt2">
								Sign up
							</a>
						</li>
					</ul>
				</form>
			</div>
		</div>
	</div>
	
	
	<div id="dropDownSelect1"></div>
    <!-- End Content -->

    <!-- Start Footer -->
    <jsp:include page="/views/pages/footer.jsp"/>
	<!-- End Footer -->
	    <jsp:include page="/views/pages/messageModal.jsp"></jsp:include>
	    
	    <div id="CreateModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="post">
				<div class="modal-header">						
					<h4 class="modal-title">Tạo tài khoản</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<div class="form-group">
						<label>Tài khoản</label>
						<input type="text" name="id" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Mật khẩu</label>
						<input type="text" name="password" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Họ và tên</label>
						<input type="text" name="fullname" class="form-control" required>
					</div>
					<div class="form-group">
						<label>email</label>
						<input type="email" name="email" class="form-control" required>
					</div>	
					<div class="form-group">
						<label>Số điện thoại</label>
						<input type="number" name="phone" class="form-control" required>
					</div>
					<div class="form-group">
						<input type="radio" value="false" name="admin" checked><label>Khách hàng</label>
					</div>			
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="hủy">
					<input type="submit" class="btn btn-success" value="Tạo tài khoản" formaction="${url}user/sign-up">
				</div>
			</form>
		</div>
	</div>
</div>
	    
	    
	    
	    
	    
	    
	    
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <!-- Start Script -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery-1.11.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/templatemo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/custom.js"></script>
    
    <!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/login/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/resources/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/login/js/main.js"></script>
    <!-- End Script -->
    
    
    

</body>

</html>