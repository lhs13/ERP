<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@ include file="../includes/header.jsp" %>
<body>
<div class="content">
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            
                            <%-- <sec:authorize access="isAuthenticated()">
                            <button type="button" class="btn btn-xs pull-right" onclick="location.href='/board/register'">Register New Board</button>
                        	</sec:authorize> --%>
                        	
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive container">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead class="primary">
                                        <tr>
                                            <th style="width:20px; text-align:center;">#NUM</th>
                                            <th style="width:500px; text-align:center;">TITLE</th>
                                            <th style="text-align:center;">DEPARTMENT</th>
                                            <th style="text-align:center;">WRITER</th>
                                            <th style="text-align:center;">REGDATE</th>
                                            <sec:authorize access="isAuthenticated()">
                                            <th style="text-align:center;">#Check</th>
                                            </sec:authorize>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${list }" var="board">                                                            
                                        <tr style="cursor:pointer" onclick="location.href='/board/get?bno=${board.bno}'">
                                            <td style="text-align:center;"><c:out value="${board.bno }" /></td>
                                            <td>                                           
                                            	<c:out value="${board.title }" /> <b>[ <c:out value="${board.replyCnt }"></c:out> ]</b>                                            
                                            </td> 
                                            <td style="text-align:center;"><c:out value="${board.department }" /></td>
                                            <td style="text-align:center;"><c:out value="${board.writer }" /></td>
                                            <td style="text-align:center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.created }" /></td>
                                            <sec:authorize access="isAuthenticated()">
                                            <td style="text-align:center;">
                                            <c:forEach items="${checkList }" var="check">
                                            	<c:if test="${check.bno == board.bno }">
                                            	<sec:authentication property="principal.username" var="user_id"/>
                                            		<c:if test="${check.emp_id== user_id }">
                                            			<i class="material-icons">check</i>
                                            		</c:if>
                                            	</c:if>
                                            </c:forEach>
                                            </td>
                                            </sec:authorize>
                                        </tr>
                                         </c:forEach>
                                    </tbody>
                                </table>
                                
                                <div class="row">
                                	<div class="col-lg-12">
                                		<div class="dropdown" style="display:inline-block">
                                			<button  class="btn btn-primary dropdown-toggle" id="depLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                			Department Category <span class="caret"></span> </button>
                                			<ul class="dropdown-menu" role="menu" aria-labelledy="depLabel">
                                				<li class="presentation">
                                					<a role="menuitem" tabindex="-1" href="/board/notice">Full View</a>
                                				</li>
                                				<li class="presentation">
                                					<a role="menuitem" tabindex="-1" href="/board/notice?type=personnal">Personnel Department</a>
                                				</li>
                                				<li class="presentation">
                                					<a role="menuitem" tabindex="-1" href="/board/notice?type=finance">Finance Department</a>
                                				</li>
                                				<li class="presentation">
                                					<a role="menuitem" tabindex="-1" href="/board/notice?type=legal">The Legal Department</a>
                                				</li>
                                			</ul>
                                		</div>
                                		
                                		<div style="display:inline-block; float:right">
	                                		<sec:authorize access="isAuthenticated()">
	                                			<button type="button" class="btn btn-xs pull-right" onclick="location.href='/board/register'">Register New Board</button>
	                                		</sec:authorize>
                                		</div>
                                		
                                	</div>
                                </div><br>
                                
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
                                	
                                	<form action="/board/notice" id="actionForm" method="get">
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
                
                <div class="modal fade" id="myModal" tabindex="-1 "role="dialog" aria-labelledy="myModalLabel" aria-hidden=true>
                	<div class="modal-dialog">
                		<div class="modal-content">
                			<div class="modal-header">
                				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                					&times;
                				</button>
                				<h4 class="modal-title" id="myModalLabel">Message!!</h4>
                			</div>
                			<div class="modal-body">처리가 완료되었습니다</div>
                			<div class="modal-footer">
                				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                				<button type="button" class="btn btn-primary">Save changes</button>
                			</div>
                		</div>
                		<!-- modal content -->
                	</div>
                	<!-- modal dialog -->
                </div>
	</div>
 </div>
 <script type="text/javascript">
	$(function(){
		var actionForm = $("#actionForm");
		$(".page-item a").on("click",function(e){
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
			});
		});
 </script>
<%@ include file="../includes/footer.jsp" %>
</body>
