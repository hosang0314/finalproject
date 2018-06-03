<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Base64"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"
	charset="UTF-8" />
<title>Ready Bootstrap Dashboard</title>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		//전체선택 체크박스 클릭
		$("#allCheck").click(function() {
			//만약 전체 선택 체크박스가 체크된상태일경우
			if ($("#allCheck").prop("checked")) {
				//해당화면에 전체 checkbox들을 체크해준다
				$("input[type=checkbox]").prop("checked", true);
				// 전체선택 체크박스가 해제된 경우
			} else {
				//해당화면에 모든 checkbox들의 체크를해제시킨다.
				$("input[type=checkbox]").prop("checked", false);
			}
		})
	})
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
[data-toggle="buttons-checkbox"]>.btn>input[type="checkbox"] {
	display: none;
	color: white;
}
</style>
<body>
	<div class="wrapper">
		<div class="main-header">
			<div class="logo-header">
				<a href="index.html" class="logo"> Ready Dashboard </a>
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
						<%	String userId = (String) session.getAttribute("userId");
 							if (userId != null) {
 						%>
						<li class="nav-item dropdown"><a
							class="dropdown-toggle profile-pic" data-toggle="dropdown"
							href="#" aria-expanded="false"> <img
								src="assets/img/profile.jpg" alt="user-img" width="36"
								class="img-circle"><span>Hizrian</span></span>
						</a> 
						<li id="loginli" class="nav-link"><%=userId%></li>
						<ul class="dropdown-menu dropdown-user">
								<li>
									<div class="user-box">
										<div class="u-img">
											<img src="assets/img/profile.jpg" alt="user">
										</div>
										<div class="u-text">
											<h4>Hizrian</h4>
											<p class="text-muted">hello@themekita.com</p>
											<a href="profile.html"
												class="btn btn-rounded btn-danger btn-sm">View Profile</a>
										</div>
									</div>
								</li>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#"><i class="ti-user"></i> My
									Profile</a>
								<a class="dropdown-item" href="#"></i> My Balance</a>
								<a class="dropdown-item" href="#"><i class="ti-email"></i>
									Inbox</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#"><i class="ti-settings"></i>
									Account Setting</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#exampleModal"><i class="fa fa-power-off"></i>
									Logout</a>
							</ul> <!-- /.dropdown-user --></li>
						<%
							} else {
						%>
						<li class="nav-item"><a class="nav-link" href="login.html"><i
								class="fa fa-fw fa-sign-out"></i>Login </a></li>
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
							aria-expanded="true"> <span> Hizrian <span
								class="user-level">Administrator</span> <span class="caret"></span>
						</span>
						</a>
						<div class="clearfix"></div>

						<div class="collapse in" id="collapseExample" aria-expanded="true"
							style="">
							<ul class="nav">
								<li><a href="#profile"> <span class="link-collapse">My
											Profile</span>
								</a></li>
								<li><a href="#edit"> <span class="link-collapse">Edit
											Profile</span>
								</a></li>
								<li><a href="#settings"> <span class="link-collapse">Settings</span>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- ===================================================================== -->
				<form method="get" action="/final/town.do">
					<ul class="nav">
						<li class="nav-item active"><a> <i
								class="la la-dashboard"></i>
								<p>Location</p>
						</a></li>
						<li> 전체선택 <input type="checkbox" id="allCheck"
							class="location-ck" /></li> 
						<li> 대단하구 <input type="checkbox" class="location-ck" /> </li> 
						<li> 상당하구 <input type="checkbox" class="location-ck" /> </li> 
						<li> 서초구 <input type="checkbox" class="location-ck" /> </li> 
						<li> 강남구 <input type="checkbox" class="location-ck" /> </li> 
						<li> 성동구 <input type="checkbox" class="location-ck" /> </li>
						<!-- <table> 
							<tr> 
								<td> 전체선택 : <input type="checkbox" id="allCheck"/></td> 
							</tr> 
							<tr> 
								<td> 대단하구 <input type="checkbox"/> </td> 
									</tr> <tr> 
								<td> 상당하구 <input type="checkbox"/> </td> 
									</tr> <tr> 
								<td> 서초구 <input type="checkbox"/> </td> 
									</tr> <tr> 
								<td> 강남구 <input type="checkbox"/> </td> 
									</tr> <tr> 
								<td> 성동구 <input type="checkbox"/> </td> 
							</tr> 
						</table> -->

<!-- 						<li><a><select id="location" name="area1" size="10"
								multiple required>
									<option value="0">전체</option>
									<option value="1">대단하구</option>
									<option value="2">상당하구</option>
									<option value="3">서초구</option>
									<option value="4">강남구</option>
									<option value="5">성동구</option>
									<option value="6">중구</option>
									<option value="7">영등포구</option>
							</select> </a></li> -->
						<li class="nav-item"><a> <i class="la la-table"></i>
								<p>Surroundings</p> <span class="badge badge-count"></span>
						</a></li>
						<li><select name="area2" multiple>
								<option value="1">미세먼지농도</option>
								<option value="2">녹지조성도</option>
						</select> 
						<select name="su_w1">
								<option value="10">상</option>
								<option value="7" selected>중</option>
								<option value="3">하</option>
						</select> <br>가중치:<select name="su_w2">
								<option value="10">상</option>
								<option value="7" selected>중</option>
								<option value="3">하</option>
						</select></li>
						<li class="nav-item"><a> <i class="la la-keyboard-o"></i>
								<p>Education</p> <span class="badge badge-count">50</span> <select
								name="area3" size="10" style="width: 100%; display: block"
								multiple="multiple">
									<option value="1">체육시설</option>
									<option value="2">도서관 수</option>
									<option value="3">아동 관련 시실 수</option>
									<option value="4">어린이집 평가점수</option>
							</select>
						</a></li>
						<li>가중치:<select name="ed_w1">
								<option value="10">상</option>
								<option value="7" selected>중</option>
								<option value="3">하</option>
						</select> <br>가중치:<select name="ed_w2">
								<option value="10">상</option>
								<option value="7" selected>중</option>
								<option value="3">하</option>
						</select> <br>가중치:<select name="ed_w3">
								<option value="10">상</option>
								<option value="7" selected>중</option>
								<option value="3">하</option>
						</select> <br>가중치:<select name="ed_w4">
								<option value="10">상</option>
								<option value="7" selected>중</option>
								<option value="3">하</option>
						</select>
						</li>
						<li class="nav-item"><a> <i class="la la-th"></i>
								<p>Hazard</p> <span class="badge badge-count">6</span> <select
								name="area4" size="10" style="width: 100%" multiple="multiple">
									<option value="1">교통사고 수</option>
									<option value="2">유흥시설 수</option>
									<option value="3">혐오시설 수</option>
									<option value="4">아동범죄율</option>
							</select>
						</a></li>
						<li>가중치:<select name="ha_w1">
								<option value="10">상</option>
								<option value="7" selected>중</option>
								<option value="3">하</option>
						</select> <br>가중치:<select name="ha_w2">
								<option value="10">상</option>
								<option value="7" selected>중</option>
								<option value="3">하</option>
						</select> <br>가중치:<select name="ha_w3">
								<option value="10">상</option>
								<option value="7" selected>중</option>
								<option value="3">하</option>
						</select><br>가중치:<select name="ha_w4">
								<option value="10">상</option>
								<option value="7" selected>중</option>
								<option value="3">하</option>
						</select>
						</li>
						<!-- <li class="nav-item"><a> <i class="la la-bell"></i>
								<p>Crime</p> <span class="badge badge-success">3</span> <select
								name="area5" size="10" style="width: 100%" multiple="multiple">
									<option value="1">납치</option>
									<option value="2">폭행</option>
									<option value="3">살인</option>
							</select>
						</a></li>
						<li>가중치:<select name="cr_w1">
								<option value="10">상</option>
								<option value="7" selected>중</option>
								<option value="3">하</option>
						</select> <br>가중치:<select name="cr_w2">
								<option value="10">상</option>
								<option value="7" selected>중</option>
								<option value="3">하</option>
						</select> <br>가중치:<select name="cr_w3">
								<option value="10">상</option>
								<option value="7" selected>중</option>
								<option value="3">하</option>
						</select>
						</li> -->
						<li class="nav-item update-pro">
							<button>
								<i class="la la-hand-pointer-o"></i>
								<p>Find The Best</p>
							</button>
						</li>
					</ul>
				</form>
			</div>
		</div>
		<div class="main-panel">
			<div class="content">
				<div class="container-fluid">
					<h4 class="page-title">Dashboard</h4>
					<div class="row">
						<!-- 	<div class="col-md-3">
							<div class="card card-stats card-warning">
								<div class="card-body ">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="la la-users"></i>
											</div>
										</div>
										<div class="col-7 d-flex align-items-center">
											<div class="numbers">
												<p class="card-category">Visitors</p>
												<h4 class="card-title">1,294</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="card card-stats card-success">
								<div class="card-body ">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="la la-bar-chart"></i>
											</div>
										</div>
										<div class="col-7 d-flex align-items-center">
											<div class="numbers">
												<p class="card-category">Sales</p>
												<h4 class="card-title">$ 1,345</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="card card-stats card-danger">
								<div class="card-body">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="la la-newspaper-o"></i>
											</div>
										</div>
										<div class="col-7 d-flex align-items-center">
											<div class="numbers">
												<p class="card-category">Subscribers</p>
												<h4 class="card-title">1303</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="card card-stats card-primary">
								<div class="card-body ">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="la la-check-circle"></i>
											</div>
										</div>
										<div class="col-7 d-flex align-items-center">
											<div class="numbers">
												<p class="card-category">Order</p>
												<h4 class="card-title">576</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						 -->
						<!-- <div class="col-md-3">
								<div class="card card-stats">
									<div class="card-body ">
										<div class="row">
											<div class="col-5">
												<div class="icon-big text-center icon-warning">
													<i class="la la-pie-chart text-warning"></i>
												</div>
											</div>
											<div class="col-7 d-flex align-items-center">
												<div class="numbers">
													<p class="card-category">Number</p>
													<h4 class="card-title">150GB</h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card card-stats">
									<div class="card-body ">
										<div class="row">
											<div class="col-5">
												<div class="icon-big text-center">
													<i class="la la-bar-chart text-success"></i>
												</div>
											</div>
											<div class="col-7 d-flex align-items-center">
												<div class="numbers">
													<p class="card-category">Revenue</p>
													<h4 class="card-title">$ 1,345</h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card card-stats">
									<div class="card-body">
										<div class="row">
											<div class="col-5">
												<div class="icon-big text-center">
													<i class="la la-times-circle-o text-danger"></i>
												</div>
											</div>
											<div class="col-7 d-flex align-items-center">
												<div class="numbers">
													<p class="card-category">Errors</p>
													<h4 class="card-title">23</h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card card-stats">
									<div class="card-body">
										<div class="row">
											<div class="col-5">
												<div class="icon-big text-center">
													<i class="la la-heart-o text-primary"></i>
												</div>
											</div>
											<div class="col-7 d-flex align-items-center">
												<div class="numbers">
													<p class="card-category">Followers</p>
													<h4 class="card-title">+45K</h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div> -->
					</div>
					<div class="row">
						<!-- <div class="col-md-3">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Task</h4>
									<p class="card-category">Complete</p>
								</div>
								<div class="card-body">
									<div id="task-complete" class="chart-circle mt-4 mb-3"></div>
								</div>
								<div class="card-footer">
									<div class="legend">
										<i class="la la-circle text-primary"></i> Completed
									</div>
								</div>
							</div>
						</div>
						 -->
						<div class="col-md-9" style="flex: 0 0 0; max-width: 100%;">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Seoul Map</h4>
									<p class="card-category">Map of the distribution of the
										best town</p>
								</div>
								<div class="card-body">
									<div class="mapcontainer">
										<div class="map">
											<span>Alternative content for the map</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 	<div class="row row-card-no-pd">
						<div class="col-md-4">
							<div class="card">
								<div class="card-body">
									<p class="fw-bold mt-1">My Balance</p>
									<h4>
										<b>$ 3,018</b>
									</h4>
									<a href="#"
										class="btn btn-primary btn-full text-left mt-3 mb-3"><i
										class="la la-plus"></i> Add Balance</a>
								</div>
								<div class="card-footer">
									<ul class="nav">
										<li class="nav-item"><a class="btn btn-default btn-link"
											href="#"><i class="la la-history"></i> History</a></li>
										<li class="nav-item ml-auto"><a
											class="btn btn-default btn-link" href="#"><i
												class="la la-refresh"></i> Refresh</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md-5">
							<div class="card">
								<div class="card-body">
									<div class="progress-card">
										<div class="d-flex justify-content-between mb-1">
											<span class="text-muted">Profit</span> <span
												class="text-muted fw-bold"> $3K</span>
										</div>
										<div class="progress mb-2" style="height: 7px;">
											<div class="progress-bar bg-success" role="progressbar"
												style="width: 78%" aria-valuenow="78" aria-valuemin="0"
												aria-valuemax="100" data-toggle="tooltip"
												data-placement="top" title="78%"></div>
										</div>
									</div>
									<div class="progress-card">
										<div class="d-flex justify-content-between mb-1">
											<span class="text-muted">Orders</span> <span
												class="text-muted fw-bold"> 576</span>
										</div>
										<div class="progress mb-2" style="height: 7px;">
											<div class="progress-bar bg-info" role="progressbar"
												style="width: 65%" aria-valuenow="60" aria-valuemin="0"
												aria-valuemax="100" data-toggle="tooltip"
												data-placement="top" title="65%"></div>
										</div>
									</div>
									<div class="progress-card">
										<div class="d-flex justify-content-between mb-1">
											<span class="text-muted">Tasks Complete</span> <span
												class="text-muted fw-bold"> 70%</span>
										</div>
										<div class="progress mb-2" style="height: 7px;">
											<div class="progress-bar bg-primary" role="progressbar"
												style="width: 70%" aria-valuenow="70" aria-valuemin="0"
												aria-valuemax="100" data-toggle="tooltip"
												data-placement="top" title="70%"></div>
										</div>
									</div>
									<div class="progress-card">
										<div class="d-flex justify-content-between mb-1">
											<span class="text-muted">Open Rate</span> <span
												class="text-muted fw-bold"> 60%</span>
										</div>
										<div class="progress mb-2" style="height: 7px;">
											<div class="progress-bar bg-warning" role="progressbar"
												style="width: 60%" aria-valuenow="60" aria-valuemin="0"
												aria-valuemax="100" data-toggle="tooltip"
												data-placement="top" title="60%"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="card card-stats">
								<div class="card-body">
									<p class="fw-bold mt-1">Statistic</p>
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center icon-warning">
												<i class="la la-pie-chart text-warning"></i>
											</div>
										</div>
										<div class="col-7 d-flex align-items-center">
											<div class="numbers">
												<p class="card-category">Number</p>
												<h4 class="card-title">150GB</h4>
											</div>
										</div>
									</div>
									<hr />
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="la la-heart-o text-primary"></i>
											</div>
										</div>
										<div class="col-7 d-flex align-items-center">
											<div class="numbers">
												<p class="card-category">Followers</p>
												<h4 class="card-title">+45K</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					 -->
					<div class="row">
						<div class="col-md-4">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Radial Graph</h4>
									<p class="card-category">The best town</p>
								</div>
								<div class="card-body">
									<!-- <div id="monthlyChart" class="chart chart-pie"></div> -->
									<%
										if (request.getAttribute("radial_graph") != null) {
											byte src[] = (byte[]) request.getAttribute("radial_graph");
									%>
									<img
										src="data:image/jpg;base64, <%=Base64.getEncoder().encodeToString(src)%>"
										width="100%" height="100%">
									<%
										}
									%>
								</div>
							</div>
						</div>
						<div class="col-md-8">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Bar Graph</h4>
									<p class="card-category">Top 3 towns</p>
								</div>
								<div class="card-body">
									<!-- <div id="salesChart" class="chart"></div> -->
									<%
										if (request.getAttribute("bar_graph") != null) {
											byte src[] = (byte[]) request.getAttribute("bar_graph");
									%>
									<img
										src="data:image/jpg;base64, <%=Base64.getEncoder().encodeToString(src)%>"
										width="100%" height="100%">
									<%
										}
									%>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6" style="max-width: 100%;">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Table</h4>
									<p class="card-category">Detail information of the
										variables</p>
								</div>
								<div class="card-body">
									<table
										class="table table-head-bg-success table-striped table-hover">
										<%
											if (request.getAttribute("table") != null) {
												String table[][] = (String[][]) request.getAttribute("table");
												String variable[] = (String[]) request.getAttribute("variable");
										%>
										<thead>
											<tr>
											<th scope="col">ID</th>
										<%
											for (int i = 0; i < variable.length; i++) {
										%>
												<th scope="col"><%=variable[i]%></th>	
										<%
												}
											%>
										       <!--  <th scope="col">순위</th> -->
											</tr>
										</thead>
										<tbody>
										<%
											for (int i = 0; i < table[0].length; i++) {
										%>
												<tr>
										<%
											for (int j = 0; j < table.length; j++) {
										%>
												<td><%=table[j][i]%></td>			
										<%
														}
													%>
												</tr>
										<%
											}
											}
										%>	
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- <div class="col-md-6">
							<div class="card card-tasks">
								<div class="card-header ">
									<h4 class="card-title">Tasks</h4>
									<p class="card-category">To Do List</p>
								</div>
								<div class="card-body ">
									<div class="table-full-width">
										<table class="table">
											<thead>
												<tr>
													<th>
														<div class="form-check">
															<label class="form-check-label"> <input
																class="form-check-input  select-all-checkbox"
																type="checkbox" data-select="checkbox"
																data-target=".task-select"> <span
																class="form-check-sign"></span>
															</label>
														</div>
													</th>
													<th>Task</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>
														<div class="form-check">
															<label class="form-check-label"> <input
																class="form-check-input task-select" type="checkbox">
																<span class="form-check-sign"></span>
															</label>
														</div>
													</td>
													<td>Planning new project structure</td>
													<td class="td-actions text-right">
														<div class="form-button-action">
															<button type="button" data-toggle="tooltip"
																title="Edit Task"
																class="btn btn-link <btn-simple-primary">
																<i class="la la-edit"></i>
															</button>
															<button type="button" data-toggle="tooltip"
																title="Remove" class="btn btn-link btn-simple-danger">
																<i class="la la-times"></i>
															</button>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-check">
															<label class="form-check-label"> <input
																class="form-check-input task-select" type="checkbox">
																<span class="form-check-sign"></span>
															</label>
														</div>
													</td>
													<td>Update Fonts</td>
													<td class="td-actions text-right">
														<div class="form-button-action">
															<button type="button" data-toggle="tooltip"
																title="Edit Task"
																class="btn btn-link <btn-simple-primary">
																<i class="la la-edit"></i>
															</button>
															<button type="button" data-toggle="tooltip"
																title="Remove" class="btn btn-link btn-simple-danger">
																<i class="la la-times"></i>
															</button>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-check">
															<label class="form-check-label"> <input
																class="form-check-input task-select" type="checkbox">
																<span class="form-check-sign"></span>
															</label>
														</div>
													</td>
													<td>Add new Post</td>
													<td class="td-actions text-right">
														<div class="form-button-action">
															<button type="button" data-toggle="tooltip"
																title="Edit Task"
																class="btn btn-link <btn-simple-primary">
																<i class="la la-edit"></i>
															</button>
															<button type="button" data-toggle="tooltip"
																title="Remove" class="btn btn-link btn-simple-danger">
																<i class="la la-times"></i>
															</button>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-check">
															<label class="form-check-label"> <input
																class="form-check-input task-select" type="checkbox">
																<span class="form-check-sign"></span>
															</label>
														</div>
													</td>
													<td>Finalise the design proposal</td>
													<td class="td-actions text-right">
														<div class="form-button-action">
															<button type="button" data-toggle="tooltip"
																title="Edit Task"
																class="btn btn-link <btn-simple-primary">
																<i class="la la-edit"></i>
															</button>
															<button type="button" data-toggle="tooltip"
																title="Remove" class="btn btn-link btn-simple-danger">
																<i class="la la-times"></i>
															</button>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="card-footer ">
									<div class="stats">
										<i class="now-ui-icons loader_refresh spin"></i> Updated 3
										minutes ago
									</div>
								</div>
							</div>
						</div>
					 -->
					</div>
				</div>
			</div>
			<footer class="footer">
				<div class="container-fluid">
					<nav class="pull-left">
						<ul class="nav">
							<li class="nav-item"><a class="nav-link"
								href="http://www.themekita.com"> ThemeKita </a></li>
							<li class="nav-item"><a class="nav-link" href="#"> Help
							</a></li>
							<li class="nav-item"><a class="nav-link"
								href="https://themewagon.com/license/#free-item"> Licenses </a>
							</li>
						</ul>
					</nav>
					<div class="copyright ml-auto">
						2018, made with <i class="la la-heart heart text-danger"></i> by <a
							href="http://www.themekita.com">ThemeKita</a>
					</div>
				</div>
			</footer>
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
	<!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="login.html">Logout</a>
          </div>
        </div>
      </div>
    </div>
</body>
<script>
	$(function() {
		$('select').listbox({
			'searchbar' : true
		});
	});
</script>

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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="src/listbox.css" rel="stylesheet">
<script src="src/listbox.js"></script>

</html>