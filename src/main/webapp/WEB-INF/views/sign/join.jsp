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
			<h4 class="card-title">JOIN</h4>
			<p class="card-category">회원가입</p>
			
		</div>
		<div class="card-body">
			<p><c:out value="${error }"/></p>
			<p><c:out value="${logout }"/></p>
			<form action="/sign/memberInsert" method="post" role="form" id="frm">
			<fieldset>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="bmd-label-floating">아이디를 입력하세요</label>
								<div class="input-group">
									<!-- 아이디 중복체크 후 콜백으로 뿌리기 -->
									<input type="text" class="form-control" id="id" readonly="readonly">
									<input type="hidden" name="emp_id" id="hiddenID" class="form-control">
									
									<span class="input-group-btn">
										<input type="button"  class="btn btn-info btn-round" id="goIDcheck" value="중복체크">
									</span>
							</div>
						</div> 
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="bmd-label-floating">사용할 비밀번호를 입력하세요</label>
							<input type="password" name="emp_pass" id="emp_pass" class="form-control">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="bmd-label-floating">이름 입력하세요</label>
							<input type="text" name="emp_name" id="emp_name" class="form-control" autofocus="autofocus">
						</div> 
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="bmd-label-floating">전화번호를 입력하세요</label>
							<input type="text" name="emp_tel" id="emp_tel" class="form-control">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="bmd-label-floating">부서를 선택하세요</label>
								<div class="form-check form-check-radio">
									<label class="form-check-label">
									<input type="radio" name="emp_dir" value="personnal"> 인사팀 
							</label>
							<label class="form-check-label">
									<input type="radio" name="emp_dir" value="finance"> 재무팀 
							</label>
							<label class="form-check-label">
									<input type="radio" name="emp_dir" value="legal"> 법무팀 
							</label>
						</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8">
						<div class="form-group">
							<label class="bmd-label-floating">주소를 입력하세요</label>
								<div class="input-group">
									<input type="text" name="emp_addr" id="addr" class="form-control">
									<span class="input-group-btn">
										<button class="btn btn-default" type="button"onclick="javascript:goPopup()">주소 찾기</button>
									</span>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-check form-check-radio">
							<label>USER GRADE</label>
							<label class="form-check-label">
								<input type="radio" name="emp_grade" value="ROLE_USER"> user 
							</label>
							<label class="form-check-label">
								<input type="radio" name="emp_grade" value="ROLE_MEMBER"> member 
							</label>
							<label class="form-check-label">
								<input type="radio" name="emp_grade" value="ROLE_ADMIN"> admin 
							</label>
						</div>
					</div>
				</div>
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<input type="button" class="btn btn-primary pull-right"  id="joinBtn" value="Join"/>
				</fieldset>
			</form>
		</div>
	</div>
</div>

<!-- modal start -->
<div class="modal" id="idcheckmodal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">ID CHECK</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p align="center">사용할 ID를 입력하세요</p>
        <input type="text" class="form-control" name="idchecktext" id="idchecktext">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="idchecksearchbtn">검사</button>
      </div>
    </div>
  </div>
</div>
<!-- modal end -->


	<script type="text/javascript">
		
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
		
		$("#goIDcheck").on("click",function(e){
			$("#idcheckmodal").modal("show");
		});
		
		$(function(){
			
			$("#idchecksearchbtn").click(function(){
				$.ajax({
					type : "get",
					url : "/sign/checkID",
					data : {"checkedID" : $("#idchecktext").val()},
					success : function(result){
						if(result=="true"){
							$("#id").val($("#idchecktext").val());
							$("#hiddenID").val($("#idchecktext").val());
							$("#idcheckmodal").modal("hide");
						}
						else if(result=="false"){
							alert("사용중인 ID입니다.");
							$("#idchecktext").val("");
						}
					},
					error : function(e){
						alert("에러발생");
					}
				});
			});
		 	
			var id = document.getElementById("id");
			var emp_pass = document.getElementById("emp_pass");
			var emp_name = document.getElementById("emp_name");
			var emp_tel = document.getElementById("emp_tel");
			var addr = document.getElementById("addr");
			//var emp_grade = document.getElementById("emp_grade"); 
			
			$("#joinBtn").click(function(){
				
				if(id.value==''){
					alert("아이디를 입력하세요.");
					return false;
				}
				
				if(emp_pass.value==''){
					alert("비밀번호를 입력하세요.");
					return false;
				}
				
				if(emp_name.value==''){
					alert("이름을 입력하세요.");
					return false;
				}
				
				if(emp_tel.value==''){
					alert("전화번호를 입력하세요.");
					return false;
				}
				
				if($(':radio[name="emp_dir"]:checked').length < 1){
					alert('부서명을 선택해주세요');
					return false;
				}
				
				if(addr.value==''){
					alert("주소를 입력하세요.");
					return false;
				}
				
				if($(':radio[name="emp_grade"]:checked').length < 1){
					alert('사용자 등급을 선택해주세요');
					return false;
				}
				$("#frm").submit();
			});
			
		})	;

		
	</script>
	
	

<!-- start footer -->
<%@ include file="../includes/footer.jsp"%>
<!-- end footer -->
</html>