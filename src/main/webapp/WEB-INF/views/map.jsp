<!-- start header -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
</body>
<%@ include file="includes/header.jsp"%>
<!-- end header -->

<div class="content">

	<div class="card">
		
		<div class="card-header card-header-primary">
			<h4 class="card-title">오시는 길</h4>
		</div>
		
		<div class="card-body">
			<div class="content">
				<div class="container">
					<!-- 지도 div -->
					<div id="map-canvas" style="height:700px; width:700px; float:left; margin-right:30px"></div>
					
					<!-- 글자 div -->
					<div>
						<br><br><br>
					 	<ul>
					 		<li>
					 			<h4>주소</h4>
					 			<span>(47291) 부산광역시 부산진구 중앙대로 708</span>
					 			<hr>
					 		</li>
					 		<li>
					 			<h4>대표전화</h4>
					 			<span>051-000-0000</span>
					 			<hr>
					 		</li>
					 		<li>
					 			<h4>팩스번호</h4>
					 			<span>051-000-0000</span>
					 			<hr>
					 		</li>
					 		<li>
					 			<h4>버스 이용 시</h4>
					 			<span>
					 				서면/진구 방면 : 38, 40, 83, 83-1, 108, 131, 1001<br>
					 				북구/사상구 방면 : 108<br>
					 				동래/연산 방면 : 51, 83-1, 131, 155<br>
					 				해운대/기장 방면 : 38, 39, 40, 1001, 1003<br>
					 				중구/서구/영도구 방면 : 38, 1001<br>
					 				광안2동우편취급국 혹은 금련산역 정류장에서 하차
					 			</span>
					 			<hr>
					 		</li>
					 		<li>
					 			<h4>지하철 이용 시</h4>
					 			<span>금련산역 2번 출구로 나와서 수영로타리 방면으로 130m 직진</span>
					 		</li>
					 	</ul>
					</div>
					
				</div>
			</div>	
		</div>
		
	</div>
</div>
<!-- start footer -->
<%@ include file="includes/footer.jsp"%>
<!-- end footer -->
</html>