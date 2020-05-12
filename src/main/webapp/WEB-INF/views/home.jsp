<!-- start header -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="includes/header.jsp"%>
<!-- end header -->

<div class="content">
	<div id="demo" class="carousel slide" data-ride="carousel" style="interval:2000">
		
		<div class="carousel-inner row" style="height:600px; margin-left:3px">
			<div class="carousel-item active">
				<div class="card">
					<img alt="First slide" src="/resources/img/1.jpg" class="card-img-top img-fluid" style="height:600px;">
					<div class="card-body">
						<h4 class="card-title">Card1</h4>
						 <p class="card-text">This is a longer card with supporting text below as a natural
						  lead-in to additional content. This content is a little bit longer.</p>
           				 <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
           				 
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="row">
      				<div class="col-lg-12">
                    <div class="panel panel-default justify-content-center" style="margin-top:150px">
                    	<div class="panel-heading"  style="margin-left:250px"><h3 class="text-success">THE LATEST NOTICE</h3></div>
                    	<div class="panel-body container">
                    			<div class="form-group">
                    				<label>Bno</label> <input class="form-control" readonly="readonly" value='<c:out value="${reNotice.bno }"></c:out>'>  
                    			</div>
                    			<div class="form-group">
                    				<label>Title</label> <input class="form-control" name="title"  readonly="readonly" value='<c:out value="${reNotice.title }"></c:out>'>                    			
                    			</div>
                    			<div class="form-group">
                    				<label>Text Area</label> <textarea class="form-control" rows="3"  name="content" readonly="readonly"><c:out value="${reNotice.content }"></c:out></textarea>                   			
                    			</div>
                    			<div class="form-group">
                    				<label>Writer</label> <input class="form-control" readonly="readonly" value='<c:out value="${reNotice.writer }"></c:out>'> 
                    			</div>
                    			
                   	 	</div>
      				</div>
		</div>
</div>
			</div>
			<div class="carousel-item">
				<div class="row" id="daumContent">
				</div>
			</div>
		</div>
		
		<ul class="carousel-indicators">
			<li data-targer="#demo" data-slide-to="0" class="active"></li>
			<li data-targer="#demo" data-slide-to="1" ></li>
			<li data-targer="#demo" data-slide-to="2"></li>
		</ul>
		
		<a class="carousel-control-prev " href="#demo" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		
		<a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
			<div class="row justify-content-center" style="margin-top:20px">
			<input type="text" class="form-control" id="searchDaum"/>
			<button id="gogoSer" class="btn btn-white btn-round btn-just-icon"><i class="material-icons">search</i></button>
		</div>
</div>
<!-- start footer -->
<%@ include file="includes/footer.jsp"%>
<!-- end footer -->
</html>