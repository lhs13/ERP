<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<body>
<%@include file="../includes/header.jsp" %>
<div class="content">
<div class="row">
   
      <div class="col-lg-12">
                    <div class="panel panel-default">
                    <div class="panel-heading"></div>
                       <div class="panel-body container">
                       <form action="/client/modify" method="get" id="modifyFrm">
                             <div class="form-group">
                                <label>Bno</label> <input class="form-control" readonly="readonly" value='<c:out value="${cli.cnum }"></c:out>'>  
                                <input type="hidden" value="${cli.cnum }" name="cnum">     
                             </div>
                             <div class="form-group">
                                <label>Client Name</label> <input class="form-control" name="cname" id="cname"  value='<c:out value="${cli.cname }"></c:out>'>                             
                             </div>
                             <div class="form-group">
                                <label>Project Field</label> <textarea class="form-control" rows="3" id="cfield" name="cfield" readonly="readonly"><c:out value="${cli.cfield }"></c:out></textarea>                            
                             </div>
                             <div class="form-group">
                                <label>Project Scale</label> <input class="form-control" name="scale" value='<c:out value="${cli.scale }"></c:out>'>
                                <input type="hidden" id="emp_num" name="emp_num"> 
                             </div>
                             <div class="form-group">
                                <label>Project Price</label> <input class="form-control" name="price"  value='<c:out value="${cli.price }"></c:out>'> 
                             </div>
                             <div class="form-group">
                                <label>Project RegDate</label> <input class="form-control" name="regdate" value='<c:out value="${cli.regdate }"></c:out>'> 
                             </div>
                             <div class="container-fluid">
                                <h1 class="text-center mb-3">Project Dispatcher</h1>
                                <div id="cliCou" class="carousel slide" data-ride="carousel">
                                <div class="carousel slide" data-ride="carousel">
                                   <div class="carousel-inner row w-100 mx-auto">
                                      <c:forEach items="${list }" varStatus="st" var="li">
                                         <c:if test="${st.index % 3 eq 0 }">
                                            <c:if test="${st.index eq 0 }">
                                               <div class="carousel-item active">
                                            </c:if>
                                            <c:if test="${st.index ne 0 }">
                                               <div class="carousel-item">
                                            </c:if>
                                         </c:if>
                                         <div class="card col-3 float-left ml-5" onclick="javascript:disOn(${li.emp_num});" id="dis${li.emp_num }" style="cursor:pointer;">
                                            <!-- <img alt="Card image cap" src="" class="card-img-top img-fluid"> -->
                                            <div class="card-body">
                                               <p>Name : [${li.emp_name }] </p><hr>
                                               <p>Department : [${li.emp_dir}]</p><hr>
                                               <p>Grade : [${li.emp_grade }] </p><hr>
                                               <p>Tel : [${li.emp_tel }] </p>
                                            </div>
                                         </div>
                                         
                                         <c:if test="${st.index % 3 eq 2 }">
                                         </div>
                                         </c:if>   
                                      </c:forEach>
                                      </div>
                                      <div>
                                      <input type="hidden" id="scaleDis" value="${cli.scale }">
                                      <c:if test="${cli.scale=='small' }">
                              <input id="smallDiv" type="hidden">
                                   </c:if>
                                   <c:if test="${cli.scale=='medium' }">
                                      <input id="mediumDiv1" type="hidden">
                                      <input id="mediumDiv2" type="hidden">
                                   </c:if>
                                   <c:if test="${cli.scale=='large' }">
                                      <input id="largeDiv1" type="hidden">
                                      <input id="largeDiv2" type="hidden">
                                      <input id="largeDiv3" type="hidden">
                                   </c:if>
                                   </div>
                                      <ul class="carousel-indicators">
                                 <li data-targer="#cliCou" data-slide-to="0" class="active"></li>
                                 <li data-targer="#cliCou" data-slide-to="1" ></li>
                                 <li data-targer="#cliCou" data-slide-to="2"></li>
                              </ul>
                              
                                       <a class="carousel-control-prev" href="#cliCou" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                  </a>
                                  <a class="carousel-control-next" href="#cliCou" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                  </a>
                                </div>
                                </div>
                                </div>
                             </div>
                               <sec:authorize access="isAuthenticated()">
                                <input type="button" id="modifyBtn" data-oper="modify" class="btn btn-default full-right" value="Modify">
                             </sec:authorize>
                             <button type="button" data-oper="list" class="btn btn-info full-right" onclick="location.href='/client/list'">List</button>
                          </div>
                          </form>
                          <!-- end panel body -->
                  </div>
                  <!-- end paneldefault body -->
      </div>
</div>
<%@include file="../includes/footer.jsp" %>
<script type="text/javascript">
$(function(){
   $("#modifyBtn").click(function()
   {
      var total = ''; 
      if($("#scaleDis").val() == 'large')
      {
         for(var i=1;i<4;i++)
         {
            if($("#largeDiv"+i).val()!=''){
               total = total+$("#largeDiv"+i).val()+"/";
               }
         }
      }
      else if($("#scaleDis").val() == 'medium')
      {
         for(var i=1;i<3;i++)
         {
            if($("#mediumDiv"+i).val()!='')
               {
                  total = total+$("#mediumDiv"+i).val()+"/";
               }
         }
      }
      else if($("#scaleDis").val() == 'small'){
            total = $("#smallDiv").val();
         }
      $("#emp_num").val(total);
      $("#modifyFrm").submit();
   }); 
});
function disOn(emp_num)
{
   if($("#dis"+emp_num).attr('class')=="card col-3 float-left ml-5 bg-danger")
   {
      if($("#scaleDis").val() == 'large')
      {
         for(var i=1;i<4;i++)
         {
            if($("#largeDiv"+i).val()==emp_num)
            {
               $("#largeDiv"+i).val('');
               $("#dis"+emp_num).removeClass('bg-danger');
               break;
            }
         }
      }
      else if($("#scaleDis").val() == 'medium')
      {
         for(var i=1;i<3;i++)
         {
            if($("#mediumDiv"+i).val()==emp_num)
            {
               $("#mediumDiv"+i).val('');
               $("#dis"+emp_num).removeClass('bg-danger');
               break;
            }
         }
      }
      else if($("#scaleDis").val() == 'small')
      {
         $("#smallDiv").val('');
         $("#dis"+emp_num).removeClass('bg-danger');
      }
   }
   else if($("#dis"+emp_num).attr('class')=="card col-3 float-left ml-5")
   {
      if($("#scaleDis").val() == 'large')
      {
         var count = 0;
         for(var i=1;i<5;i++)
         {
            if(count==3)
            {
               alert('Full Of Dispatch');
               break;   
            }
            if($("#largeDiv"+i).val()=='')
            {
               $("#largeDiv"+i).val(emp_num);
               $("#dis"+emp_num).addClass('bg-danger');
               break;
            }
            else if($("#largeDiv"+i).val()!='')
            {
               count = count+1;
            }      
         }
         
      }
      
      else if($("#scaleDis").val() == 'medium')
      {
         var count = 0;
         for(var i=1;i<5;i++)
         {
            if(count==2)
            {
               alert('Full Of Dispatch');
               break;   
            }
            if($("#mediumDiv"+i).val()=='')
            {
               $("#mediumDiv"+i).val(emp_num);
               $("#dis"+emp_num).addClass('bg-danger');
               break;
            }
            else if($("#mediumDiv"+i).val()!='')
            {
               count = count+1;
            }      
         }
      }
      else if($("#scaleDis").val() == 'small')
      {
         if($("#smallDiv").val()=='')
         {
            $("#smallDiv").val(emp_num);
            $("#dis"+emp_num).addClass('bg-danger');
         }
         else if($("#smallDiv").val()!='')
         {
            alert("Full Of Dispatch");
         }   
      }
   }
};
</script>
</body>
</html>