<!-- start header -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
</body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<!-- end header -->
<h2><c:out value="${error }"></c:out></h2>
<h2><c:out value="${logout }"></c:out></h2>
<div class="content">
	<div class="card">
		<div class="card-header card-header-primary">
			<h4 class="card-title">MY PAGE</h4>
			<p class="card-category">내 정보</p>
			
		</div>
		<div class="card-body">
			<p><c:out value="${error }"/></p>
			<p><c:out value="${logout }"/></p>
			
			<form action="/sign/memModify" method="post" role="form" id="frm">
			
			<fieldset>
			<input type="hidden" name="emp_num" id="emp_num" value="${user.emp_num }">
				<div class="row">
					<div class="col-md-4">					
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">
									<i class="material-icons">person_outline</i>
								</span>
							</div>
							<input type="text" class="form-control"  value="${user.emp_id }" readonly="readonly">
							<input type="hidden" name="emp_id" id="emp_id" value="${user.emp_id }">
						</div>						
					</div>
				</div><br>
				
				<div class="row">
					<div class="col-md-4">						
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">
									<i class="material-icons">lock</i>
								</span>
							</div>
							<input type="password"  name="emp_pass" id="emp_pass" class="form-control" >
						</div>						
					</div>
				</div><br>
				
				<div class="row">
					<div class="col-md-4">					
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">
									<i class="material-icons">assignment_ind</i>
								</span>
							</div>
							<input type="text" class="form-control"  name="emp_name" id="emp_name" value="${user.emp_name }" >
						</div>						
					</div>
				</div><br>
				
				<div class="row">
					<div class="col-md-4">					
						<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">
										<i class="material-icons">call</i>
									</span>
								</div>
								<input type="text" class="form-control"  name="emp_tel" id="emp_tel" value="${user.emp_tel }" >
						</div>						
					</div>
				</div>
				<br><br>
				
				<div class="row">
					<div class="col-md-4">					
						<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">
										<i class="material-icons">business_center</i>
									</span>
								</div>
								<div class="form-check form-check-radio">
									<label class="form-check-label">
										<input type="radio" name="emp_dir" id="emp_dir" value="personnal"> 인사팀 
									</label>
									<label class="form-check-label">
										<input type="radio" name="emp_dir" id="emp_dir" value="finance"> 재무팀 
									</label>
									<label class="form-check-label">
										<input type="radio" name="emp_dir" id="emp_dir" value="legal"> 법무팀 
									</label>
								</div>
						</div>						
					</div>
				</div><br>
				
				<div class="row">
					<div class="col-md-8">
						<div class="form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">
											<i class="material-icons">apartment</i>
										</span>
									</div>
								<input type="text" class="form-control"  name="emp_addr" id="addr" value="${user.emp_addr }">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button"onclick="javascript:goPopup()">주소 찾기</button>
								</span>
							</div>
						</div>
					</div>
				</div><br>
				
				<div class="row">
					<div class="col-md-4">					
						<div class="input-group">
								<div class="input-group-prepend">
									<!-- <span class="input-group-text">
										<i class="material-icons">star_half</i>
									</span> -->
								</div>
								<!-- <div class="form-check form-check-radio">
									<label class="form-check-label">
										<input type="radio" name="emp_grade" id="emp_grade" value="ROLE_USER"> USER
									</label>
									<label class="form-check-label">
										<input type="radio" name="emp_grade" id="emp_grade" value="ROLE_MEMBER"> MEMBER
									</label>
									<label class="form-check-label">
										<input type="radio" name="emp_grade" id="emp_grade" value="ROLE_ADMIN"> ADMIN 
									</label>
								</div> -->
						</div>						
					</div>
				</div>
				
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				
				<input type="button" class="btn btn-primary pull-right" value="update" id="updateBtn">
				
				</fieldset>
			</form>
		</div>
	</div>
</div>
	<script type="text/javascript">
		$(function(){
		   $("#updateBtn").on("click",function(e){
			   if(emp_pass.value==''){
					alert("기존 비밀번호를 입력하거나 새로운 비밀번호를 입력하세요.");
					return false;
				}
		      $("#frm").submit();
		      });
		   
		   $("input:radio[name='emp_grade']:radio[value='${user.emp_grade}']").attr("checked",true);
		   $("input:radio[name='emp_dir']:radio[value='${user.emp_dir}']").attr("checked",true);
		      
		});
		
		function goPopup() {
		   // 주소검색을 수행할 팝업 페이지를 호출합니다.
		   // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		   var pop = window.open("jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		   
		   // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
		}


		function jusoCallBack(roadFullAddr){
		      // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		      $("#addr").val(roadFullAddr);
		}
	</script>
	
	

<!-- start footer -->
<%@ include file="../includes/footer.jsp"%>
<!-- end footer -->
</html>