<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="co" uri="http://java.sun.com/jstl/core_rt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<body>

<div class="modal-content mr-5">
      			<div class="modal-header">
      				<div class="dropdown">
      					<button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Chatting DIR</button>
      					<div class="dropdown-menu">
      						<a class="dropdown-item" href="javascript:chatTeam('personnal');">personnal team</a>
      						<a class="dropdown-item" href="javascript:chatTeam('finance');">finance team</a>
      						<a class="dropdown-item" href="javascript:chatTeam('legal');">legal team</a>
      					</div>
      				</div>
      			</div>
      			<div class="modal-body">
      				<div class="container" id="chatTeamList">
	      			</div>
      			</div>
      			<div class="modal-footer">
      			</div>
      		</div>
      		
      		<div class="modal-content">
      			<div class="modal-header">
      			<input type="button" class="btn btn-info" id="chattinglistbtn" value="Chatting User List">
      				<button type="button" class="close" data-dismiss="modal" 
					aria-hidden="true">&times;</button>
      			</div>
      			<div class="modal-body">
	      			<div >
						<h5>Chatting Page (Side. : You. ${userid})</h5>
						<br>
					    	<br>
					    	<div class="well" style="height:280px;width:100%;overflow-y:auto;" id="chatdata">
					    		<!-- User Session Info Hidden -->
					    		<input type="hidden" value='${userid}' id="sessionuserid">
					    	</div>
	      			</div>
      			</div>
      			<div class="modal-footer">
      			<input type="text" id="message"/>
    		<input type="button" class="btn btn-primary" id="sendBtn" value="전송"/>
    		<input type="button" class="btn btn-danger" id="disBtn" value="연결끊기">
    		<input type="hidden" id="chatNumber" value="">
    		<input type="hidden" id="lastNum" value="">
      			</div>
      		</div>

</body>

<script type="text/javascript">
$(function()
{
/* 	$("#chattinglistbtn").click(function()
	{
		var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>채팅방 참여자 리스트</p>',{
			title: 'Chatting List',
			type: 'confirmation',
			print: false,
			width: 260,
			buttons: ['닫기'],
			onClose: function(caption){
				if(caption == '닫기'){
					//alert('yes click');
				}
			}
		});
    }); */
});
</script>
<script type="text/javascript">
//websocket을 지정한 URL로 연결
var sock= new SockJS("<c:url value='/echo'/>");
//websocket 서버에서 메시지를 보내면 자동으로 실행된다.
sock.onmessage = onMessage;
//websocket 과 연결을 끊고 싶을때 실행하는 메소드
sock.onclose = onClose;
$(function(){
	$("#message").keydown(function(key) {

		if (key.keyCode == 13) 
		{
		sendMessage();
		}

		});

	$("#sendBtn").click(function(){
		console.log('send message...');
        sendMessage();
    });
});
        
function sendMessage(){      
	//websocket으로 메시지를 보내겠다.
  	sock.send($("#message").val());   
  	$("#message").val("");  
}
            
//evt 파라미터는 websocket이 보내준 데이터다.
function onMessage(evt){  //변수 안에 function자체를 넣음.
	var data = evt.data;
	var sessionid = null;
	var message = null;
	var sid_id = $("#chatNumber").val();

	
	//문자열을 splite//
	var strArray = data.split('|');
	
	for(var i=0; i<strArray.length; i++){
		console.log('str['+i+']: ' + strArray[i]);
	}
	
	//current session id//
	var currentuser_session = $('#sessionuserid').val();
	console.log('current session id: ' + currentuser_session);
	
	sessionid = strArray[0]; //현재 메세지를 보낸 사람의 세션 등록//
	message = strArray[1]; //현재 메세지를 저장//
	
	//나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
	if(sessionid == sid_id)
   {
      var printHTML = "<div style='clear:both;'>";
      printHTML += "<div class='alert alert-warning float-left'>";
      printHTML += "<strong>["+sessionid+"] -> "+message+"</strong>";
      printHTML += "</div>";
      printHTML += "</div>";
      $("#chatdata").append(printHTML);
   }
   else
   {
      var printHTML = "<div style='clear:both;'>";
      printHTML += "<div class='alert alert-info float-right'>";
      printHTML += "<strong>["+sessionid+"] -> "+message+"</strong>";
      printHTML += "</div>";
      printHTML += "</div>";
      $("#chatdata").append(printHTML);
   } 
   /*
    else{
      
      var printHTML = "<div style='clear:both;'>";
      printHTML += "<div class='alert alert-warning float-right'>";
      printHTML += "<strong>["+sessionid+"] -> "+message+"</strong>";
      printHTML += "</div>";
      printHTML += "</div>";
      
      $("#chatdata").append(printHTML);
   } 
   */
	
	console.log('chatting data: ' + data);
  	/* sock.close(); */
}
    
function onClose(evt){
	$("#data").append("연결 끊김");
}
function chatTeam(emp_dir)
{
	$.getJSON(
		"/chat/chat_team",
		{
			"emp_dir":emp_dir
		},
		function(list)
		{
			$("#chatTeamList").empty();
			<sec:authentication property="principal.username" var="user_id"/>
			var html = "";
			
			for(var i=0;i<list.length;i++)
			{
				if(${user_id} != list[i].emp_id)
				{
				html += "<div class='card bg-primary text-white' id='aa"+i+"'   onclick='javascript:chatNum(\""+list[i].emp_id+"\", this.id);' style='width:250px'>";
				html += "<div class='card-body' style='cursor: pointer' >";
				html += "<h4 class='card-title'>"+list[i].emp_name+"</h4>";
				html += "<p>내용</p>";
				html += "</div>";
				html += "</div>";
				}
			}
			$("#chatTeamList").append(html);
			}
		); 
}
function chatNum(emp_id, obj)
{
	var last = $("#lastNum").val();
	if(last!="")
	{
		$("#"+last).removeClass("bg-danger");
		$("#"+last).addClass('bg-primary');
	}
	$("#"+obj).removeClass("bg-primary");
	$("#"+obj).addClass('bg-danger');
	$("#chatNumber").val(emp_id);
	$("#chatdata").empty();
	$("#lastNum").val(obj);
}
$(function(){
  	$("#disBtn").click(function(){
      		alert("Disconnet");
      		$("#chatdata").empty();
      		sock.close();
      		$("#chatModal").modal("hide");
      	});
  	});
</script>
</html>