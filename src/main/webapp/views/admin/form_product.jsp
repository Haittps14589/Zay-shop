<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    <%request.setCharacterEncoding("UTF-8");%>
    <c:set var="url" value="${pageContext.request.contextPath}/"/>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
	<jsp:include page="/views/admin/pages/header-slidebar.jsp"/>
	<div class="page-wrapper">
		
            <div class="col-sm-12 col-md-6" style="margin-left: 25%;">
                 <div class="card">
                     <div class="card-body">
                         <h4 class="card-title">Sản phẩm</h4>
                         <form method="post" enctype="multipart/form-data">
	                        <div class="form-group file-upload">
								<label for="">Hình:</label>
								<div class="file-upload-content" ${product.getImage() == null?'style="display: none"':''}>
									<img class="file-upload-image" src="${url}resources/assets/img/img_product/${product.getImage()}" alt="your image" style="height: 100px;width: 100px; margin-left: 45%"/>
									<div class="image-title-wrap" style="margin-left: 45%; margin-bottom: 10px">
										<button type="button" onclick="removeUpload();document.getElementById('imageName').innerHTML ='';" class="btn btn-warning" class="remove-image">
											Xóa hình
										</button>
									</div>
								</div>
								<div class="input-group mb-3" class="image-upload-wrap">
								  <div class="input-group-prepend">
								    <span class="input-group-text">Chọn hình</span>
								  </div>
								  <div class="custom-file">
								    <input type="file"  class="custom-file-input" class="file-upload-input" id="customFile" onchange="readURL(this);" accept="image/*" name="image">
								    <label class="custom-file-label" for="inputGroupFile01" id="imageName"></label>
								  </div>
							   </div>
							</div>
							
							
						  
						  <div class="form-group">
						    <label for="formGroupExampleInput">Mã</label>
						    <input type="text" name="id" class="form-control" id="formGroupExampleInput" value="${product.getId()}">
						  </div>
						  <div class="form-group">
						    <label for="formGroupExampleInput">Tên</label>
						    <input type="text" name="name" class="form-control" id="formGroupExampleInput" value="${product.getName()}">
						  </div>
						  <div class="input-group mb-3">
							  <input type="number" name="price" class="form-control" aria-label="Amount (to the nearest dollar)" value="${product.getPrice()}">
							  <div class="input-group-prepend">
							    <span class="input-group-text">vnđ</span>
							  </div>
							</div>
						  <div class="form-group">
						    <label for="exampleFormControlTextarea1">Mô tả</label>
						    <textarea class="form-control" name="description"   id="exampleFormControlTextarea1" rows="3">${product.getDescription()}</textarea>
						  </div>
						  <div class="form-group">
						    <label for="exampleFormControlSelect1">Danh mục</label>
						    <select class="form-control" id="exampleFormControlSelect1" name="category_id">
						     <option value="1">chọn danh mục</option>
						    <c:forEach var="category" items="${categorys}">
						    	<c:if test=""></c:if>
						      <option value="${category.getId()}" ${product.getCategory().getId() == category.getId()?"selected":""}>${category.getName()}</option>
						    </c:forEach>
						    </select>
						    
						  </div>
							
						  <div class="form-group">
						    <label for="formGroupExampleInput">Giảm giá</label>
						    <input type="text" name="discount" class="form-control" id="formGroupExampleInput" value="${product.getDiscount()}">
						  </div>
						  
						  <div class="form-group">
						    <label for="formGroupExampleInput">Số lượng</label>
						    <input type="number" name="inventory" class="form-control" id="formGroupExampleInput" value="${product.getInventory()}">
						  </div>
						  
						<button type="submit" class="btn btn-success" formaction="${url}admin/cre-upd/product">OK</button>
						<button type="submit" class="btn btn-warning" formaction="${url}admin/form/product">làm mới</button>
						</form>
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
    <script src="${pageContext.request.contextPath}/resources/admin/dist/js/imagechooser.js"></script>
    <!--This page plugins -->
    <script src="${pageContext.request.contextPath}/resources/admin/assets/extra-libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/dist/js/pages/datatable/datatable-basic.init.js"></script>
</body>
</html>