<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<%@ include file="../includes/header.jsp"%>
<body>
<div class="content">
      <div class="row container" style="margin-left:230px;">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           <sec:authorize access="isAuthenticated()">
                              <button type="button" class="btn btn-primary pull-right" onclick="location.href='javascript:disReset();'" style="margin-bottom:20px; margin-right:15px;">Dispathcer Reset</button>
                            <!-- <button type="button" class="btn btn-xs pull-right" onclick="location.href='/client/register'">Register New Board</button> -->
                            </sec:authorize>
                        </div>
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive container">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead class="primary">
                                        <tr>
                                            <th>#Client Number</th>
                                            <th>Client Name</th>
                                            <th>Project Field</th>
                                            <th>Project Scale</th>
                                            <th>Project Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${list }" var="cli">                                                            
                                        <tr style="cursor:pointer" onclick="location.href='/client/get?cnum=${cli.cnum}'">
                                            <td><c:out value="${cli.cnum }" /></td>
                                            <td> <c:out value="${cli.cname }" />  </td>
                                            <td><c:out value="${cli.cfield }" /></td>
                                            <td><c:out value="${cli.scale }" /></td>
                                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${cli.regdate }" /></td>
                                        </tr>
                                         </c:forEach>
                                    </tbody>
                                </table>
                                
                                <div class="row">
                                   <div class="col-lg-12">
                                      <div class="dropdown" style="display:inline-block">
                                         <button  class="btn btn-primary dropdown-toggle" id="depLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                         	Department Category <span class="caret"></span>
                                         </button>
                                         <ul class="dropdown-menu" role="menu" aria-labelledy="depLabel">
                                            <li class="presentation">
                                               <a role="menuitem" tabindex="-1" href="#">Full View</a>
                                            </li>
                                            <li class="presentation">
                                               <a role="menuitem" tabindex="-1" href="#">Small Scale</a>
                                            </li>
                                            <li class="presentation">
                                               <a role="menuitem" tabindex="-1" href="#">Medium Scale </a>
                                            </li>
                                            <li class="presentation">
                                               <a role="menuitem" tabindex="-1" href="#">Large Scale</a>
                                            </li>
                                         </ul>
                                      </div>
                                      
                                      <div style="display:inline-block; float:right">
                                      <sec:authorize access="isAuthenticated()">
		                            	<button type="button" class="btn btn-xs pull-right" onclick="location.href='/client/register'">Register New Board</button>
		                              </sec:authorize>
		                              </div>
		                              
                                   </div>
                                </div>
                                <!-- pageNation -->
                               <div class="pull-right">
                                	<ul class="pagination">
                                		
                                		<c:if test="${page.prev }">
                                			<li class="page-item disabled">
                                			<a class="page-link" href="${page.startPage -1 }">Previous</a>
                                			</li>
                                		</c:if>
                                		<c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">
                                			<li class="page-item ${page.cri.pageNum == num?'active':'' }">
                                			<a class="page-link" href="${num }">${num }</a>
                                			</li>
                                		</c:forEach>
                                		<c:if test="${page.next }">
                                			<li class="page-item">
                                			<a class="page-link" href="${page.endPage+1 }">Next</a>
                                			</li>
                                		</c:if>
                                	</ul>
                                	
                                	<form action="/client/list" id="actionForm" method="get">
                                		<input type="hidden" name="pageNum" value='${page.cri.pageNum }'>
                                		<input type="hidden" name="amount" value='${page.cri.amount }'>
                                	</form>
                                </div>
                                
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
            
   </div>
   </div>
</body>
 <script type="text/javascript">
   $(function(){
      var actionForm = $("#actionForm");
      $(".page-item a").on("click",function(e){
         e.preventDefault();
         actionForm.find("input[name='pageNum']").val($(this).attr("href"));
         actionForm.submit();
         });
      });
   function disReset(){
      $.ajax({
         url : "/client/reset",
         type : "get",
         success : function(e)
         {
            alert("Reset Success");
         },
         error : function(e){
            alert("error");
            }
         });
      }
 </script>
<%@ include file="../includes/footer.jsp"%>
</html>