<!-- start header -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<!-- end header -->

<div class="content">
	<div class="card">
		<div class="card-header card-header-primary">
			<h4 class="card-title">LOGIN</h4>
			<p class="card-category">login page</p>
			
		</div>
		<div class="card-body">
			<p><c:out value="${error }"/></p>
			<p><c:out value="${logout }"/></p>
			<form action="/login" method="post">
			<fieldset>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="bmd-label-floating">ID</label>
							<input type="text" name="username" class="form-control" autofocus="autofocus">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="bmd-label-floating">PassWord</label>
							<input type="password" name="password" class="form-control">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<input type="checkbox" name="remember-me">
							<label>remember me</label>
						</div>
					</div>
				</div>
				<button type="submit" class="btn btn-primary pull-right">Login</button>
				</fieldset>
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
			</form>
		</div>
	</div>
</div>

<!-- start footer -->
<%@ include file="../includes/footer.jsp"%>
<!-- end footer -->