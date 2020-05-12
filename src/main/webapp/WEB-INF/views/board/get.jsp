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
                   <div class="panel-body container text-center">
                      <form action="/board/modify" method="post">
                        <div class="form-group">
                           <label>Bno</label> <input class="form-control" readonly="readonly" value='<c:out value="${board.bno }"></c:out>'>  
                           <input type="hidden" value="${board.bno }" name="bno">     
                        </div>
                        <div class="form-group">
                           <label>Title</label> <input class="form-control" name="title" id="title" value='<c:out value="${board.title }"></c:out>'>                             
                        </div>
                        <div class="form-group">
                           <label>Text Area</label> <textarea class="form-control" rows="3" id="content" name="content" ><c:out value="${board.content }"></c:out></textarea>                            
                        </div>
                        <div class="form-group">
                        <sec:authentication property="principal.username" var="user_id" />
                           <label>Writer</label> <input class="form-control" readonly="readonly" value='<c:out value="${user_id }"></c:out>'> 
                           <input type="hidden" value="${user_id }" name="writer">                            
                        </div>
                      <sec:authorize access="isAuthenticated()">
                           <input type="submit" data-oper="modify" class="btn btn-default" value="Modify">
                        </sec:authorize>
                        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
                        <button type="button" data-oper="list" class="btn btn-info" onclick="location.href='/board/notice'">List</button>
                        </form>
                      </div>
           </div>
   </div>
</div>
<!-- 댓글 -->
<div class="container">
<div class="row">
   <div class="col-lg-12">
      <!-- panel -->
      <div class="panel panel-default">
         <div class="panel-heading">
            <i class="fa fa-comments fa-fw"></i>Reply
            <button id="addReplyBtn" class="btn btn-primary btn-xs- pull-right">New Reply</button>
         </div>
         
         <!-- panel heading -->
         <div class="panel-body">
            <ul class="chat">
               <!-- start reply -->
               <li class="left clearfix" data-rno='12'>
                  <div>
                  <div class="header">
                     <strong class="primary-font">user00</strong>
                     <small class="pull-right text-muted">2018-01-01 13:13</small>
                  </div>
                  <p>Good Job!</p>
                  </div>
                  </li>
                  <!-- end reply -->
            </ul>
            <!-- end ul -->
         </div>
         <div class="panel-footer">
         
         </div>
      </div>
   </div>
</div>
</div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
               aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
         </div>
         <div class="modal-body">
            <div class="form-group">
               <label>Reply</label> <input class="form-control"  id="reply" name='reply'
                  value='New Reply!!!!'>
            </div>
            <div class="form-group">
               <label>Replyer</label> <input class="form-control" id="replyer" name='replyer'
                  value='replyer'>
            </div>
            
            <div class="form-group">
               <label>Reply Date</label> <input class="form-control"
                  name='replyDate' value='2018-01-01 13:13'>
            </div>
         </div>
         
         <div class="modal-footer">
            <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
            <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
            <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
            <button id='modalCloseBtn' type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         </div>
      </div>
      <!-- /.modal-content -->
   </div>
   <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">
   $(document).ready(function(){

            var bnoValue = '<c:out value="${board.bno}" />';
            var replyUL = $(".chat");

            showList(1);

            function showList(page) {

               console.log("show list " + page);

               replyService.getList(
                           {
                              bno : bnoValue,
                              page : page || 1
                           },
                           function(replyCnt, list) {

                              console.log("replyCnt: "+ replyCnt);
                              console.log("list: " + list);
                              console.log(list);

                              if (page == -1) {
                                 pageNum = Math.ceil(replyCnt / 10.0);
                                 showList(pageNum);
                                 return;
                              }

                              var str = "";

                              if (list == null|| list.length == 0) {
                                 return;
                              }

                              for (var i = 0, len = list.length || 0; i < len; i++) {
                                 str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
                                 str += "  <div><div class='header'><strong class='primary-font'>["
                                       + list[i].rno
                                       + "] "
                                       + list[i].replyer
                                       + "</strong>";
                                 str += "    <small class='pull-right text-muted'>"
                                       + replyService
                                             .displayTime(list[i].replyDate)
                                       + "</small></div>";
                                 str += "    <p>"
                                       + list[i].reply
                                       + "</p></div></li>";
                              }

                              replyUL.html(str);

                              showReplyPage(replyCnt);

                           });//end function

            }//end showList
            var pageNum = 1;
            var replyPageFooter = $(".panel-footer");

            function showReplyPage(replyCnt) {

               var endNum = Math.ceil(pageNum / 10.0) * 10;
               var startNum = endNum - 9;

               var prev = startNum != 1;
               var next = false;

               if (endNum * 10 >= replyCnt) {
                  endNum = Math.ceil(replyCnt / 10.0);
               }

               if (endNum * 10 < replyCnt) {
                  next = true;
               }
               // alert("endNum :"+ endNum)

               var str = "<ul class='pagination pull-right'>";

               if (prev) {
                  str += "<li class='page-item'><a class='page-link' href='"
                        + (startNum - 1)
                        + "'>Previous</a></li>";
               }

               for (var i = startNum; i <= endNum; i++) {

                  var active = pageNum == i ? "active" : "";

                  str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"
                        + i + "</a></li>";
               }

               if (next) {
                  str += "<li class='page-item'><a class='page-link' href='"
                        + (endNum + 1) + "'>Next</a></li>";
               }

               str += "</ul></div>";

               console.log(str);

               replyPageFooter.html(str);
            }


            replyPageFooter.on("click", "li a", function(e) {
               e.preventDefault();
               console.log("page click");

               var targetPageNum = $(this).attr("href");

               console.log("targetPageNum: " + targetPageNum);

               pageNum = targetPageNum;

               showList(pageNum);
            });

            var modal = $(".modal");
            var modalInputReply = modal.find("input[name='reply']");
            var modalInputReplyer = modal.find("input[name='replyer']");
            var modalInputReplyDate = modal.find("input[name='replyDate']");
            
            var modalModBtn = $("#modalModBtn");
            var modalRemoveBtn = $("#modalRemoveBtn");
            var modalRegisterBtn = $("#modalRegisterBtn");

            var replyer = null;

            <sec:authorize access="isAuthenticated()">

            replyer = '<sec:authentication property="principal.username" />';

            </sec:authorize>

            var csrfHeaderName = "${_csrf.headerName}";
            var csrfTokenValue= "${_csrf.token}";

            $(document).ajaxSend(function(e,xhr,options){
               xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
            });
            
            $("#addReplyBtn").on("click", function(e) {
               
               modal.find("input").val("");
               modal.find("input[name='replyer']").val(replyer);
               modalInputReplyDate.closest("div").hide();
               modal.find("button[id !='modalCloseBtn']").hide();
               
               modalRegisterBtn.show();
               
               $(".modal").modal("show");
            });
               

            replyUL.on("click","li",function(e){
               var rno = $(this).data("rno");
               
               replyService.get(rno,function(reply)
                  {
                  modalInputReply.val(reply.reply);
                  modalInputReplyer.val(reply.replyer);
                  modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly","readonly");
                  modal.data("rno",reply.rno);

                  modal.find("button[id != 'modalCloseBtn']").hide();
                  modalModBtn.show();
                  modalRemoveBtn.show();

                  $("#myModal").modal("show");
                  });
               });
            
            
            modalRegisterBtn.on("click", function(e) {
               var reply = {
                  reply : modalInputReply.val(),
                  replyer : modalInputReplyer.val(),
                  bno : bnoValue
               };
               replyService.add(reply, function(result) {
                  
                  alert(result);
                  
                  modal.find("input").val("");
                  modal.modal("hide");

                  showList(-1);
               });
            });
            
            modalModBtn.on("click",function(e){

               var originalReplyer = modalInputReplyer.val();
               
               var reply = {rno:modal.data("rno"), 
                     reply: modalInputReply.val(),
                     replyer : originalReplyer};

               if(!replyer){
                  alert("로그인후 수정이 가능합니다");
                  modal.modal("hide");
                  return;
                  }

               if(replyer != originalReplyer){
                  alert("자신이 작성한 댓글에서 삭제가 가능합니다");
                  modal.modal("hide");
                  return;

                  }

               replyService.update(reply, function(result){
                  alert(result);
                  modal.modal("hide");
                  showList(pageNum);
                  });
               });

            modalRemoveBtn.on("click",function(e){
               var rno = modal.data("rno");

               if(!replyer){
                     alert("로그인 이후에 삭제가 가능합니다");
                     modal.modal("hide");
                     return;
                  }
               
               var originalReplyer = modalInputReplyer.val();

               console.log("Original Replyer : "+originalReplyer);//댓글의 원래 작성자

               if(replyer != originalReplyer){
                  alert("자신이 작성한 댓글에서 삭제가 가능합니다");
                  modal.modal("hide");
                  return;

                  }
               
               replyService.remove(rno, originalReplyer,function(result){
                  alert(result);
                  modal.modal("hide");
                  showList(pageNum);
                  });
               });
});//doucument
               
</script>
<script type="text/javascript">
$(document).ready(function(){
   var openForm = $("openForm");

   $("button[data-oper='modify']").on("click",function(){
      openForm.attr("action","/board/modify").submit();
      });

   $("button[data-oper='list']").on("click",function(){
      openForm.find("#bno").remove();
      openForm.attr("action","/board/list").submit();
      openFrom.submit();
      });
      <c:if test="${user_id == board.writer}">
      $("#title").attr("readonly",false);
   
      $("#content").attr("readonly",false);
      </c:if>
})
</script>
<%@include file="../includes/footer.jsp" %>
</body>
</html>