<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"  uri ="http://www.springframework.org/security/tags" %> 

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="/resources/img/apple-icon.png">
  <link rel="icon" type="image/png" href="/resources/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
   	ERP Project
  </title>
  <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="/resources/css/material-dashboard.css?v=2.1.2" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="/resources/demo/demo.css" rel="stylesheet" />
  <!-- 제이쿼리 -->
   <script src="/resources/js/core/jquery.min.js"></script>
   <!-- 웹 소켓 -->
   <script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
	<!-- zebra -->
	<script src="/resources/js/dialog/zebra_dialog.src.js"></script>
	<link rel="stylesheet" href="/resources/css/dialog/zebra_dialog.css" type="text/css"/>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script><!-- msie문제해결 -->
</head>

<body class="">
  <div class="wrapper">
    <div class="sidebar" data-color="purple" data-background-color="white" data-image="/resources/img/sidebar-1.jpg">
      
      <div class="logo"><a href="/" class="simple-text logo-normal">
          ERP SYSTEM
        </a></div>
      <div class="sidebar-wrapper">
        <ul class="nav">
        
        <sec:authorize access="isAuthenticated()">
          <li class="nav-item">
            <a class="nav-link" href="/board/notice">
              <i class="material-icons">N</i>
              <p>Notice Board</p>
            </a>
          </li>
         </sec:authorize>
          
        <sec:authorize access="isAuthenticated()">          
          <li class="nav-item">
            <a class="nav-link" href="/client/list">
              <i class="material-icons">content_paste</i>
              <p>Client List</p>
            </a>
          </li>
         </sec:authorize>
          
          <sec:authorize access="hasRole('ROLE_ADMIN')">  
          <li class="nav-item ">
            <a class="nav-link" href="/personnalTeamOnly/personListPage">
              <i class="material-icons">library_books</i>
              <p>ADMIN Only</p>
            </a>
          </li>
          </sec:authorize>
          
          <sec:authorize access="isAuthenticated()">   
          <li class="nav-item ">
            <a class="nav-link" href="javascript:chatOn()">
              <i class="material-icons">bubble_chart</i>
              <p>Chatting</p>
            </a>
          </li>
          </sec:authorize>
          
          <li class="nav-item ">
            <a class="nav-link" href="/map">
              <i class="material-icons">location_ons</i>
              <p>Maps</p>
            </a>
          </li>
          
          <sec:authorize access="isAnonymous()">
          <li class="nav-item ">
            <a class="nav-link" href="/sign/join">
              <i class="material-icons">language</i>
              <p>Member Join</p>
            </a>
          </li>
          </sec:authorize>
          
        </ul>
      </div>
    </div>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <!-- <div class="navbar-wrapper">
            <a class="navbar-brand" href="javascript:;">Dashboard</a>
          </div> -->
          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end">
            <form class="navbar-form">
              <!-- <div class="input-group no-border">
                <input type="text" value="" class="form-control" placeholder="Search...">
                <button type="submit" class="btn btn-white btn-round btn-just-icon">
                  <i class="material-icons">search</i>
                  <div class="ripple-container"></div>
                </button>
                 
              </div> -->
            </form>
            <ul class="navbar-nav">
              
              <li class="nav-item dropdown">
                <a class="nav-link" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="material-icons">notifications</i>
                  <span class="notification">6</span>
                  <p class="d-lg-none d-md-block">
                    Some Actions
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="#">알림메세지출력부</a>
                </div>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link" href="javascript:;" id="navbarDropdownProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="material-icons">person</i>
                  <p class="d-lg-none d-md-block">
                    Account
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownProfile">
               <sec:authorize access="isAuthenticated()">
                  <a class="dropdown-item" href="/sign/mypage">Profile</a>
                    </sec:authorize>
                  <div class="dropdown-divider"></div>
                  <sec:authorize access="isAuthenticated()">
						<a class="dropdown-item" href="javascript:logOut();">Logout</a>
                  </sec:authorize>
                  <sec:authorize access="isAnonymous()">
                  		<a class="dropdown-item" href="/sign/customLogin">Login</a>
                  </sec:authorize>
                </div>
                <form action="/logout" method="post" id="logFrm">
               		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
                </form>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      
      <!-- 채팅창 -->
      <div class="modal fade" id="chatModal" tabindex="-1" role="dialog"
      aria-labelledby="chatModalLabel" aria-hidden="true">
      	<div class="modal-dialog modal-lg d-flex" id="chatModalBody">
      		
      	</div>
      </div>
      
      <script type="text/javascript">
      	function logOut(){
      		$("#logFrm").submit();
      	}
      	function chatOn(){
          	$.ajax({
              	url : "/chat",
              	type : "get",
              	success : function(result){
                  	$("#chatModalBody").html(result);
                  	$("#chatModal").modal("show");
                  	},
                error : function(){
                    }
              	});
          	}
      </script>
      <!-- End Navbar -->