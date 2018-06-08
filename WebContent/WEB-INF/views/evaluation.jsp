<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Base64"%>
<%@page import="vo.ClientVO"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"
	charset="UTF-8" />
<title>The best town for MY CHILD</title>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript">
	
</script>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
<link rel="stylesheet" href="assets/css/ready.css">
<link rel="stylesheet" href="assets/css/demo.css">
</head>
<style>
.select{
}
.weight{
display:none;
} 
.magic-checkbox{
display:none;
}
</style>
<body>
	<div class="wrapper">
		<div class="main-header">
			<div class="logo-header">
				<a href="/town/main.do" class="logo"> BEST for CHILD </a>
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button"
					data-toggle="collapse" data-target="collapse"
					aria-controls="sidebar" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<button class="topbar-toggler more">
					<i class="la la-ellipsis-v"></i>
				</button>
			</div>
			<nav class="navbar navbar-header navbar-expand-lg">
				<div class="container-fluid">

					<form class="navbar-left navbar-form nav-search mr-md-3" action="">
						<div class="input-group">
							<input type="text" placeholder="Search ..." class="form-control">
							<div class="input-group-append">
								<span class="input-group-text"> <i
									class="la la-search search-icon"></i>
								</span>
							</div>
						</div>
					</form>
					<ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
						<li class="nav-item dropdown hidden-caret"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="la la-envelope"></i>
						</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">Action</a> <a
									class="dropdown-item" href="#">Another action</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Something else here</a>
							</div></li>
						<li class="nav-item dropdown hidden-caret"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="la la-bell"></i> <span
								class="notification">3</span>
						</a>
							<ul class="dropdown-menu notif-box"
								aria-labelledby="navbarDropdown">
								<li>
									<div class="dropdown-title">You have 4 new notification</div>
								</li>
								<li>
									<div class="notif-center">
										<a href="#">
											<div class="notif-icon notif-primary">
												<i class="la la-user-plus"></i>
											</div>
											<div class="notif-content">
												<span class="block"> New user registered </span> <span
													class="time">5 minutes ago</span>
											</div>
										</a> <a href="#">
											<div class="notif-icon notif-success">
												<i class="la la-comment"></i>
											</div>
											<div class="notif-content">
												<span class="block"> Rahmad commented on Admin </span> <span
													class="time">12 minutes ago</span>
											</div>
										</a> <a href="#">
											<div class="notif-img">
												<img src="assets/img/profile2.jpg" alt="Img Profile">
											</div>
											<div class="notif-content">
												<span class="block"> Reza send messages to you </span> <span
													class="time">12 minutes ago</span>
											</div>
										</a> <a href="#">
											<div class="notif-icon notif-danger">
												<i class="la la-heart"></i>
											</div>
											<div class="notif-content">
												<span class="block"> Farrah liked Admin </span> <span
													class="time">17 minutes ago</span>
											</div>
										</a>
									</div>
								</li>
								<li><a class="see-all" href="javascript:void(0);"> <strong>See
											all notifications</strong> <i class="la la-angle-right"></i>
								</a></li>
							</ul></li>
							
						<%!ClientVO cvo=null; %>
						<%
						if (session.getAttribute("cvo") != null) {
								cvo = (ClientVO)session.getAttribute("cvo");
						%>
							<li class="nav-item dropdown">
							<a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false"> <img src="assets/img/profile.jpg" alt="user-img" width="36" class="img-circle"><span ><%=cvo.getC_FIRSTNAME() %></span></span> </a>
							<ul class="dropdown-menu dropdown-user">
								<li>
									<div class="user-box">
										<div class="u-img"><img src="assets/img/profile.jpg" alt="user"></div>
										<div class="u-text">
										<h4><%=cvo.getC_FIRSTNAME()%></h4>
										<p class="text-muted"><%=cvo.getC_ID()%></p>
										<a href="/town/evaluation.do"
											class="btn btn-rounded btn-danger btn-sm">Evaluation</a>
									</div>
								</div>
							</li>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="/town/profile.do"><i
								class="ti-user"></i> My Profile</a>
							<a class="dropdown-item" href="/town/profile_edit.do"></i> Edit Profile</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="/town/logout.do"><i class="fa fa-power-off"></i>
								Logout</a>
						</ul>
							<%
						}
							%>
					</ul>
				</div>
			</nav>
		</div>
		<div class="sidebar">
			<div class="scrollbar-inner sidebar-wrapper">
				<div class="user">
					<div class="photo">
						<img src="assets/img/profile.jpg">
					</div>
					<div class="info">
						<a class="" data-toggle="collapse" href="#collapseExample"
							aria-expanded="true"> <span> <%=cvo.getC_FIRSTNAME() %> <span class="user-level">Administrator</span>
								<span class="caret"></span>
						</span>
						</a>
						<div class="clearfix"></div>

						<div class="collapse in" id="collapseExample" aria-expanded="true"
							style="">
							<ul class="nav">
								<li><a> <span class="link-collapse">FIRSTNAME:
											<%=cvo.getC_FIRSTNAME() %></span>
								</a></li>
								<li><a> <span class="link-collapse">LASTNAME :
											<%=cvo.getC_LASTNAME() %></span>
								</a></li>
								<li><a> <span class="link-collapse">E-MAIL :
											<%=cvo.getC_ID() %></span>
								</a></li>
								<li><a> <span class="link-collapse">LOCATION :
											<%=cvo.getLO_NAME() %></span>
								</a></li>

							</ul>
						</div>
					</div>
				</div>
				<ul class="nav">
					<li class="nav-item update-pro"><a href="/town/evaluation.do">
							<button data-toggle="modal" data-target="#modalUpdate">
								<i class="la la-hand-pointer-o"></i>
								<p>ADD EVALUATION</p>
							</button>
					</a></li>
					<li class="nav-item active"><a href="evaluation_edit.do">
							<i class="la la-keyboard-o"></i>
							<p>UPDATE EVALUATION</p>
					</a></li>
					<li class="nav-item"><a href="profile_edit.do"> <i
							class="la la-table"></i>
							<p>EDIT PROFILE</p>
					</a></li>
					<li class="nav-item"><a href="/town/main.do"> <i
							class="la la-dashboard"></i>
							<p>GO TO MAIN</p>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<div class="content">
				<div class="container-fluid">
					<h4 class="page-title">Evaluation</h4>
<!--///////////////////////////////////////////////////////////////////////////////////////////////////////////  -->
				<%if(request.getAttribute("evalmsg")!=null){ %>	
					<div class="card">
					<div class="form-group">
					<h1 class="page-title">${evalmsg}</h1>		
					</div></div>
					<%}else{
						%>			
					<form action="/town/insertEvaluation.do" method="get">
						<div class="row">
							<div class="col-md-6">
								<div class="card">
									<div class="card-header">
										<div class="card-title">Base Form Evaluation</div>
									</div>
									<div class="card-body">
										<div class="form-group">
											<label>Location: <%=cvo.getLO_NAME() %></label>
											
										</div>
										<div class="form-group">
											<label style="font: bold;">Surroundings</label>
										</div>
										<div class="form-group form-inline">
											<label for="su_dust" class="col-md-3 col-form-label">미세먼지<br>농도
											</label>
											<div class="col-md-9 p-0">
												<input type="number" min="0" max="10"
													class="form-control input-full" id="su_dust" name="su_dust"
													placeholder="Enter Grade(0~10)" required>
											</div>
										</div>
										<div class="form-group form-inline">
											<label for="su_green" class="col-md-3 col-form-label">녹지분포</label>
											<div class="col-md-9 p-0">
												<input type="number" min="0" max="10"
													class="form-control input-full" id="su_green" name="su_green"
													placeholder="Enter Grade(0~10)" required>
											</div>
										</div>
										<div class="form-group form-inline">
											<label for="su_hospital" class="col-md-3 col-form-label">의료기관<br>수
											</label>
											<div class="col-md-9 p-0">
												<input type="number" min="0" max="10"
													class="form-control input-full" id="su_hospital" name="su_hospital"
													placeholder="Enter Grade(0~10)" required>
											</div>
										</div>
										<div class="form-group form-inline">
											<label for="su_population" class="col-md-3 col-form-label">인구밀도</label>
											<div class="col-md-9 p-0">
												<input type="number" min="0" max="10"
													class="form-control input-full" id="su_population" name="su_population"
													placeholder="Enter Grade(0~10)" required>
											</div>
										</div>
										<div class="form-group form-inline">
											<label for="su_cctv" class="col-md-3 col-form-label">CCTV<br>수
											</label>
											<div class="col-md-9 p-0">
												<input type="number" min="0" max="10"
													class="form-control input-full" id="su_cctv" name="su_cctv"
													placeholder="Enter Grade(0~10)" required>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-md-6">
								<div class="card">
									<div class="card-body">
										<div class="form-group">
											<label style="font: bold;">Education</label>
										</div>
										<div class="form-group form-inline">
											<label for="ed_gym" class="col-md-3 col-form-label">체육시설<br>수
											</label>
											<div class="col-md-9 p-0">
												<input type="number" min="0" max="10"
													class="form-control input-full" id="ed_gym" name="ed_gym"
													placeholder="Enter Grade(0~10)" required>
											</div>
										</div>
										<div class="form-group form-inline">
											<label for="ed_facility_ratio"
												class="col-md-3 col-form-label">아동교육<br>시설 수
											</label>
											<div class="col-md-9 p-0">
												<input type="number" min="0" max="10"
													class="form-control input-full" id="ed_facility_ratio" name="ed_facility_ratio"
													placeholder="Enter Grade(0~10)" required>
											</div>
										</div>
										<div class="form-group form-inline">
											<label for="ed_facility_grade"
												class="col-md-3 col-form-label">어린이집<br>평가점수
											</label>
											<div class="col-md-9 p-0">
												<input type="number" min="0" max="10"
													class="form-control input-full" id="ed_facility_grade" name="ed_facility_grade"
													placeholder="Enter Grade(0~10)" required>
											</div>
										</div>

										<div class="form-group">
											<label style="font: bold;">Hazard</label>
										</div>
										<div class="form-group form-inline">
											<label for="ha_car" class="col-md-3 col-form-label">교통사고<br>수
											</label>
											<div class="col-md-9 p-0">
												<input type="number" min="0" max="10"
													class="form-control input-full" id="ha_car"  name="ha_car" 
													placeholder="Enter Grade(0~10)" required>
											</div>
										</div>
										<div class="form-group form-inline">
											<label for="ha_bar"
												class="col-md-3 col-form-label">유흥시설<br>수
											</label>
											<div class="col-md-9 p-0">
												<input type="number" min="0" max="10"
													class="form-control input-full" id="ha_bar" name="ha_bar"
													placeholder="Enter Grade(0~10)" required>
											</div>
										</div>
										<div class="form-group form-inline">
											<label for="crime"
												class="col-md-3 col-form-label">유아동 <br>범죄율
											</label>
											<div class="col-md-9 p-0">
												<input type="number" min="0" max="10"
													class="form-control input-full" id="crime" name="ha_crime"
													placeholder="Enter Grade(0~10)" required>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="card">
									<div class="card-body">
										<div class="card-action">
											<input type="submit" class="btn btn-success" value="Submit">
											<a href="/town/evaluation.do"><input type="reset" class="btn btn-danger" value="Cancel"></a>
							
										</div>
									</div>
								</div>
							</div>
						</div>
						</form>
					
						<%
						}
				  		%>
				</div>
			</div>

		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="modalUpdate" tabindex="-1" role="dialog"
		aria-labelledby="modalUpdatePro" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h6 class="modal-title">
						<i class="la la-frown-o"></i> Under Development
					</h6>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center">
					<p>
						Currently the pro version of the <b>Ready Dashboard</b> Bootstrap
						is in progress development
					</p>
					<p>
						<b>We'll let you know when it's done</b>
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>


<script src="assets/js/core/jquery.3.2.1.min.js"></script>
<script src="assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="assets/js/core/popper.min.js"></script>
<script src="assets/js/core/bootstrap.min.js"></script>
<script src="assets/js/plugin/chartist/chartist.min.js"></script>
<script
	src="assets/js/plugin/chartist/plugin/chartist-plugin-tooltip.min.js"></script>
<script src="assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
<script src="assets/js/plugin/jquery-mapael/jquery.mapael.min.js"></script>
<script src="assets/js/plugin/jquery-mapael/maps/world_countries.min.js"></script>
<script src="assets/js/plugin/chart-circle/circles.min.js"></script>
<script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<script src="assets/js/ready.min.js"></script>
<script src="assets/js/demo.js"></script>
<!-- select -->
<link href="css/magic-check.css" rel="stylesheet">
<!-- radio button -->
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="jquery.radiosforbuttons.js"></script>
</html>