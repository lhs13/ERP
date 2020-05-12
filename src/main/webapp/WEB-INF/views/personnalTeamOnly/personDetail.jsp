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

<%-- <h2><c:out value="${error }"></c:out></h2>
<h2><c:out value="${logout }"></c:out></h2> --%>
<div class="content">
   <div class="card">
      <div class="card-header card-header-primary">
         <h4 class="card-title">${perVO.emp_name}님의 인사정보입니다.</h4>
         <!-- <p class="card-category">내 정보</p> -->
         
      </div>
      <div class="card-body">
         <p><c:out value="${error }"/></p>
         <p><c:out value="${logout }"/></p>
         
         <form action="/personnalTeamOnly/personUP"  method="post"  role="form" enctype="multipart/form-data" id="perDeForm">
         
         <fieldset>
         
         <input type="hidden" name="emp_num" id="emp_num" value="${perVO.emp_num }">
         
         <input type="file" name="Mfile" id="Mfile" style="margin-left:23px;"><br>
         
            <!-- per_ThumImg start -->
            <div class="inputArea">
               <label for="per_pic"> </label>
               <img src="/resources/imgUpload/${perVO.per_fileName }" style="width:210px; height:264px; margin:20px;">
            </div>
           <%-- <%=request.getRealPath("/") %> --%>
            <!-- per_ThumImg end -->
            
            <!-- emp_name -->
            <div class="row">
               <div class="col-md-4">               
                  <div class="input-group">
                     <div class="input-group-prepend">
                        <span class="input-group-text">
                           <i class="material-icons">person_outline</i>
                        </span>
                     </div>
                     <input type="text" class="form-control"  name="emp_name" id="emp_name" value="${perVO.emp_name }" >
                  </div>                  
               </div>
            </div><br>
            
            <!-- emp_dir -->
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
            
            <!-- 직책(per_pos) -->
            <div class="row">
               <div class="col-md-8">               
                  <div class="input-group">
                        <div class="input-group-prepend">
                           <span class="input-group-text">
                              <i class="material-icons">business_center</i>
                           </span>
                        </div>
                        <div class="form-check form-check-radio">
                           <label class="form-check-label">
                              <input type="radio" name="per_pos"  value="Staff"> 사원
                           </label>
                           <label class="form-check-label">
                              <input type="radio" name="per_pos"  value="AssistantManager"> 주임
                           </label>
                           <label class="form-check-label">
                              <input type="radio" name="per_pos" value="Chief"> 계장
                           </label>
                           <label class="form-check-label">
                              <input type="radio" name="per_pos"  value="Manager"> 과장
                           </label>
                           <label class="form-check-label">
                              <input type="radio" name="per_pos"  value="GeneralManager"> 부장
                           </label>
                           <label class="form-check-label">
                              <input type="radio" name="per_pos" value="Director"> 이사
                           </label>
                           <label class="form-check-label">
                              <input type="radio" name="per_pos"  value="President"> 사장
                           </label>
                           <label class="form-check-label">
                              <input type="radio" name="per_pos"  value="Chirman"> 회장
                           </label>
                        </div>
                  </div>                  
               </div>
            </div><br>
            
            <!-- 연봉(per_sal) -->
            <div class="row">
               <div class="col-md-4">               
                  <div class="input-group">
                        <div class="input-group-prepend">
                           <span class="input-group-text">
                              <i class="material-icons">attach_money</i>
                           </span>
                        </div>
                        <input type="text" class="form-control"  name="per_sal" id="per_sal" value="${perVO.per_sal }"  placeholder="단위 : 만 원">
                  </div>                  
               </div>
            </div> <br>
            
            <!-- 입사일(per_day) -->
            <div class="row">
               <div class="col-md-4">               
                  <div class="input-group">
                        <div class="input-group-prepend">
                           <span class="input-group-text">
                              <i class="material-icons">work</i>
                           </span>
                        </div>
                        <input type="text" class="form-control"  name="per_day" id="per_day" value="${perVO.per_day }" placeholder="yyyymmdd">
                  </div>                  
               </div>
            </div><br>
            
            <!-- 퇴사일(per_reg) -->
            <div class="row">
               <div class="col-md-4">               
                  <div class="input-group">
                        <div class="input-group-prepend">
                           <span class="input-group-text">
                              <i class="material-icons">work_off</i>
                           </span>
                        </div>
                        <input type="text" class="form-control"  name="per_reg" id="per_reg" value="${perVO.per_reg }" placeholder="yyyymmdd">
                  </div><br>                  
               </div>
            </div>
            
            <!-- 계좌번호(per_acc) -->
            <div class="row">
               <div class="col-md-4">               
                  <div class="input-group">
                        <div class="input-group-prepend">
                           <span class="input-group-text">
                              <i class="material-icons">monetization_on</i>
                           </span>
                        </div>
                        <input type="text" class="form-control"  name="per_acc" id="per_acc" value="${perVO.per_acc }" >
                  </div>                  
               </div>
            </div><br>
            
            <!-- emp_grade -->
            <div class="row">
               <div class="col-md-4">               
                  <div class="input-group">
                        <div class="input-group-prepend">
                           <span class="input-group-text">
                              <i class="material-icons">star_half</i>
                           </span>
                        </div>
                        <div class="form-check form-check-radio">
                           <label class="form-check-label">
                              <input type="radio" name="emp_grade"  value="ROLE_USER"> USER
                           </label>
                           <label class="form-check-label">
                              <input type="radio" name="emp_grade" value="ROLE_MEMBER"> MEMBER
                           </label>
                           <label class="form-check-label">
                              <input type="radio" name="emp_grade"  value="ROLE_ADMIN"> ADMIN 
                           </label>
                        </div>
                  </div>                  
               </div>
            </div>
            
            <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
            <input type="button" class="btn btn-primary pull-right" id="modfiyBtn" value="UPDATE">
            
            </fieldset>
         </form>
      </div>
   </div>
</div>

   <script type="text/javascript">
       $(function(){
          /*$("#modfiyBtn").click(function(){
            alert("modify");
            $("#modifyFrm").submit();
         }); */
         
         $("input:radio[name='emp_grade']:radio[value='${perVO.emp_grade}']").attr("checked",true);
         $("input:radio[name='emp_dir']:radio[value='${perVO.emp_dir}']").attr("checked",true);
         $("input:radio[name='per_pos']:radio[value='${perVO.per_pos}']").attr("checked",true);
            
         $("#per_pic").change(function(){
            if(this.files && this.files[0]){
               var reader = new FileReader;
               reader.onload = function(data){
                  $(".select_img img").attr("src", data.target.result).width(300);
               }
               reader.readAsDataURL(this.files[0]);
            }
         });
         
         $("#modfiyBtn").click(function(){
            if(emp_name.value==''){
               alert("이름을 입력하세요");
               return false;
            }
            
            if($(':radio[name="emp_dir"]:checked').length<1){
               alert("부서명을 선택하세요");
               return false;
            }
            
            if($(':radio[name="emp_grade"]:checked').length<1){
               alert("사용자 등급을 선택하세요");
               return false;
            }
            $("#perDeForm").submit();
         })
      });
   </script>
   
   
   

<!-- start footer -->
<%@ include file="../includes/footer.jsp"%>
<!-- end footer -->
</html>