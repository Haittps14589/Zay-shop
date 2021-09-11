<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    <%request.setCharacterEncoding("UTF-8");%>
    <c:if test="${message != null}">
<script>
 $(document).ready(function(){
		$("#messageEmployeeModal").modal('show');
	});
 </script>
</c:if>
<div id="messageEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
				<div class="modal-header">						
					<h4 class="modal-title">Manager system</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<p>${message}</p>
				
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-success" data-dismiss="modal" value="Cancel">
				</div>
		</div>
	</div>
</div>