<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<body>
<%@include file="../includes/header.jsp" %>
<div class="content">
            <!-- /.row -->
<div class="row">
      <div class="col-lg-11 container" style="margin-left:20px">
                    <div class="panel panel-default">
                    
                    	<div class="panel-body">
                    		<form action="/board/register" role="form" method="post" id="regFrm">
                    			<div class="form-group">
                    				<label>Title</label> <input class="form-control" id="title" name="title" placeholder="제목">                    			
                    			</div>
                    			<div class="form-group">
                    				<label>Text Area</label> <textarea class="form-control" id="content" rows="3" name="content" > </textarea>                  			
                    			</div>
                    			<div class="form-group">
                    			<sec:authentication property="principal.username" var="user_id"/>
                    				<label>Writer</label> <input class="form-control" value="${user_id }" readonly="readonly">
                    				<input type="hidden" id="writer" name="writer" value="${user_id }"> 
                    				<input type="hidden" id="department" name="department" value="${memVO.emp_dir }"/>
                    			</div>
                    			
                    			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
                    			
                    			<div class="pull-right">
                    				<button type="button" id="regBtn" class="btn btn-primary">Submit</button>
                    				<button type="reset" class="btn btn-default">Reset</button>
                    			</div>
                    			
                    		</form>
                   	 	</div>
                   	 	<!-- end panel body -->
      				</div>
      				<!-- end paneldefault body -->
		</div>
</div>
      <div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-labelledy="" aria-hidden="true" >
      	<div class="modal-dialog">
      		<div class="modal-content">
      			<div class="modal-header">
      				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
      				&times;
      				</button>
      				<h4 class="modal-title" id="checkModalLabel">Check Your Pass</h4>
      			</div>
      			
      			<div class="modal-body"></div>
      			
      			<div class="modal-footer">
      				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      				<button type="button" class="btn btn-danger">Register</button>
      			</div>
      		</div>
      	</div>
      </div>
</div>         
<script type="text/javascript">
	$(function(){
		$("#regBtn").click(function(){
			if($("#title").val()==""){
				alert("Please enter the title");
				$("#title").focus();
				}
			else if($("#content").val()==""){
				alert("Please enter the content");
				$("#content").focus();
				}
			else if($("#writer").val()==""){
				alert("Please enter the writer");
				$("#writer").focus();
				}
			else{
				$("#regFrm").submit();
				}
			});
	});
</script>               
<%@include file="../includes/footer.jsp" %>
</body>
</html>