<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../includes/header.jsp"%>
<div class="content container">
	<div class="card">
		<div class="card-header card-header-info">
			<h4 class="card-title">Client Register</h4>
			<p class="card-category">Reg</p>
		</div>
	</div>
	<div class="card-body">
	<div class="row">
		<form action="/client/register" method="post" id="cfrm">
		<div class="row">
			<div class="col-md-4">
			<div class="form-group">
				<label for="regCname">Client Name</label>
				<input type="text" id="regCname" name="cname" class="form-controll" aria-describedby="CnameHelp" placeholder="Register Client Name">
				<small id="CnameHelp" class="form-text text-muted">Please enter your customer</small>
			</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">	
			<div class="form-check form-check-radio">
				<label>Project Field</label>
				<label class="form-check-label">
					<input type="radio" name="cfield" value="web"> Web Project 
				</label>
				<label class="form-check-label">
					<input type="radio" name="cfield" value="design"> Design Project 
				</label>
				<label class="form-check-label">
					<input type="radio" name="cfield" value="etc"> Etc Project 
				</label>
			</div>
		</div>
		</div>	
		<div class="row">
			<div class="col-md-4">	
			<div class="form-check form-check-radio">
				<label>Project Scale</label>
				<label class="form-check-label">
					<input type="radio" name="scale" value="large"> Large Project 
				</label>
				<label class="form-check-label">
					<input type="radio" name="scale" value="medium"> Medium Project 
				</label>
				<label class="form-check-label">
					<input type="radio" name="scale" value="small"> Small Project 
				</label>
			</div>
		</div>
		</div>
		<div class="row">
			<div class="col-md-4">	
			<div class="form-group">
				<label for="regPrice">Project Price</label>
				<input type="text" id="regPrice" name="price" class="form-controll" aria-describedby="PriceHelp" placeholder="Register Client Price">
				<small id="PriceHelp" class="form-text text-muted">Please enter project price</small>
			</div>
		</div>
		</div>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<button type="submit" class="btn btn-info pull-right">Register</button>	
		</form>
	</div>
	</div>
	
</div>
<%@ include file="../includes/footer.jsp"%>
</html>