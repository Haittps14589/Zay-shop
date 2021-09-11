<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
     <%request.setCharacterEncoding("UTF-8");%>
 <!-- Start Top Nav -->
 <c:set var="url"
		value="${pageContext.request.contextPath}/"></c:set>
<li class="pb-3"><a
	class="collapsed d-flex justify-content-between h3 text-decoration-none"
	href=""> ${param.name} <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
</a>
	<ul class="collapse show list-unstyled pl-3">
		<li><a class="text-decoration-none" href="${url}shop/${param.id}">Tất cả</a></li>
	</ul></li>