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
                           
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive container">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead class="primary">
                                        <tr>
                                            <th style="text-align:center;">#NUM</th>
                                            <th style="text-align:center;">부서</th>
                                            <th style="text-align:center;">이름</th>
                                            <th>#수정완료여부</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
	                                    <c:forEach items="${plist }" var="person">                                                          
	                                        <tr style="cursor:pointer" onclick="location.href='/personnalTeamOnly/personDetail?emp_num=${person.emp_num}'">
	                                            <td style="width:20px; text-align:center;"><c:out value="${person.emp_num }" /> </td>
	                                            
	                                            <td style="width:200px; text-align:center;"><c:out value="${person.emp_dir }"/> </td>
	                                            
	                                            <td style="width:250px; text-align:center;"><c:out value="${person.emp_name }" /> </td>
	                                           
	                                            <td>
	                                            	<c:choose>
	                                            		<c:when test="${empty person.emp_name }"><span class="text-danger">수정중</span></c:when>
	                                            		<c:when test="${empty person.emp_dir }"><span class="text-danger">수정중</span></c:when>
	                                            		<c:when test="${empty person.per_pos }"><span class="text-danger">수정중</span></c:when>
	                                            		<c:when test="${empty person.per_sal }"><span class="text-danger">수정중</span></c:when>
	                                            		<c:when test="${empty person.per_day }"><span class="text-danger">수정중</span></c:when>
	                                            		<c:when test="${empty person.per_acc }"><span class="text-danger">수정중</span></c:when>
	                                            		<c:otherwise><span class="text-success">수정완료</span></c:otherwise>
	                                            	</c:choose>
	                                            	
	                                            </td>
	                                        </tr>
	                                    </c:forEach>
                                    </tbody>
                                </table>
                                
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
                                	
                                	<form action="/personnalTeamOnly/personListPage" id="actionForm" method="get">
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
