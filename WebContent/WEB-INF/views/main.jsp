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
.select {
	
}

.weight {
	display: none;
}

.magic-checkbox {
	display: none;
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
										</a> 
										<a href="#">
											<div class="notif-icon notif-success">
												<i class="la la-comment"></i>
											</div>
											<div class="notif-content">
												<span class="block"> Rahmad commented on Admin </span> <span
													class="time">12 minutes ago</span>
											</div>
										</a> 
										<a href="#">
											<div class="notif-img">
												<img src="assets/img/profile2.jpg" alt="Img Profile">
											</div>
											<div class="notif-content">
												<span class="block"> Reza send messages to you </span> <span
													class="time">12 minutes ago</span>
											</div>
										</a> 
										<a href="#">
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
								</a>
								</li>
							</ul>
						</li>
						
						<%
							if (session.getAttribute("cvo") != null) {
								ClientVO cvo = (ClientVO) session.getAttribute("cvo");
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
						<!-- /.dropdown-user -->
						
						<%
							} else {
						%>
						<li class="nav-item"><a class="nav-link"
							href="/town/login.do"><i class="fa fa-fw fa-sign-out"></i>Login
						</a></li>
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
					<%
					if (session.getAttribute("cvo") != null) {
						ClientVO cvo = (ClientVO) session.getAttribute("cvo");
					%>
					<div class="photo">
						<img src="assets/img/profile.jpg">
					</div>

					<div class="info">
						<a class="" data-toggle="collapse" href="#collapseExample"
							aria-expanded="true"> <span><%=cvo.getC_FIRSTNAME()%>
								<span class="caret"></span> </span>
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
								<li><a href="/town/evaluation.do"> <span
										class="link-collapse"> Evaluations</span>
								</a></li>
							</ul>
						</div>
					</div>
					<%
						}
					%>
				</div>
				<!-- ===================================================================== -->
				<form method="get" action="/town/town.do">
					<ul class="nav">
						<li class="nav-item active"><a> <i
								class="la la-dashboard"></i>
								<p>Location</p>
						</a></li>
						<li><div>
								<input class="magic-checkbox" type="checkbox" name="location"
									id="l0" value="0"> <label class="text" for="l0">전체
								</label> <input class="magic-checkbox" type="checkbox" name="location"
									id="l1" value="1"> <label class="text" for="l1">
									강남구 </label> <input class="magic-checkbox" type="checkbox"
									name="location" id="l2" value="2"> <label class="text"
									for="l2"> 강동구 </label> <input class="magic-checkbox"
									type="checkbox" name="location" id="l3" value="3"> <label
									class="text" for="l3"> 강북구 </label> <input
									class="magic-checkbox" type="checkbox" name="location" id="l4"
									value="4"> <label class="text" for="l4"> 강서구 </label> <input
									class="magic-checkbox" type="checkbox" name="location" id="l5"
									value="5"> <label class="text" for="l5"> 관악구 </label> <input
									class="magic-checkbox" type="checkbox" name="location" id="l6"
									value="6"> <label class="text" for="l6"> 광진구 </label> <input
									class="magic-checkbox" type="checkbox" name="location" id="l7"
									value="7"> <label class="text" for="l7"> 구로구 </label> <input
									class="magic-checkbox" type="checkbox" name="location" id="l8"
									value="8"> <label class="text" for="l8"> 금천구 </label> <input
									class="magic-checkbox" type="checkbox" name="location" id="l9"
									value="9"> <label class="text" for="l9"> 노원구 </label> <input
									class="magic-checkbox" type="checkbox" name="location" id="l10"
									value="10"> <label class="text" for="l10"> 도봉구
								</label> <input class="magic-checkbox" type="checkbox" name="location"
									id="l11" value="11"> <label class="text" for="l11">
									동대문구 </label> <input class="magic-checkbox" type="checkbox"
									name="location" id="l12" value="12"> <label
									class="text" for="l12"> 동작구 </label> <input
									class="magic-checkbox" type="checkbox" name="location" id="l13"
									value="13"> <label class="text" for="l13"> 마포구
								</label> <input class="magic-checkbox" type="checkbox" name="location"
									id="l14" value="14"> <label class="text" for="l14">
									서대문구 </label> <input class="magic-checkbox" type="checkbox"
									name="location" id="l15" value="15"> <label
									class="text" for="l15"> 서초구 </label> <input
									class="magic-checkbox" type="checkbox" name="location" id="l16"
									value="16"> <label class="text" for="l16"> 성동구
								</label> <input class="magic-checkbox" type="checkbox" name="location"
									id="l17" value="17"> <label class="text" for="l17">
									성북구 </label> <input class="magic-checkbox" type="checkbox"
									name="location" id="l18" value="18"> <label
									class="text" for="l18"> 송파구 </label> <input
									class="magic-checkbox" type="checkbox" name="location" id="l19"
									value="19"> <label class="text" for="l19"> 양천구
								</label> <input class="magic-checkbox" type="checkbox" name="location"
									id="l20" value="20"> <label class="text" for="l20">
									영등포구 </label> <input class="magic-checkbox" type="checkbox"
									name="location" id="l21" value="21"> <label
									class="text" for="l21"> 용산구 </label> <input
									class="magic-checkbox" type="checkbox" name="location" id="l22"
									value="22"> <label class="text" for="l22"> 은평구
								</label> <input class="magic-checkbox" type="checkbox" name="location"
									id="l23" value="23"> <label class="text" for="l23">
									종로구 </label> <input class="magic-checkbox" type="checkbox"
									name="location" id="l24" value="24"> <label
									class="text" for="l24"> 중구 </label> <input
									class="magic-checkbox" type="checkbox" name="location" id="l25"
									value="25"> <label class="text" for="l25"> 중랑구
								</label>

							</div></li>

						<li class="nav-item"><a> <i class="la la-table"></i>
								<p>Surroundings</p> <span class="badge badge-count"></span>
						</a></li>
						<li><input class="magic-checkbox" type="checkbox"
							name="surroundings" id="s0" value="0"> <label
							class="text" for="s0"> 전체 </label>
							<div class='select'>
								<input class="magic-checkbox" type="checkbox"
									name="surroundings" id="s1" value="1"> <label
									class="text" for="s1">미세먼지농도 </label>
								<div class="weight">
									<input class="magic-radio" type="radio" name="su_w1" id="s1h"
										value="10"> <label for="s1h">상</label> <input
										class="magic-radio" type="radio" name="su_w1" id="s1m"
										value="7" checked> <label for="s1m">중</label> <input
										class="magic-radio" type="radio" name="su_w1" id="s1l"
										value="3"> <label for="s1l">하</label>
								</div>
							</div>

							<div class='select'>
								<input class="magic-checkbox" type="checkbox"
									name="surroundings" id="s2" value="2"> <label
									class="text" for="s2"> 녹지분포 </label>
								<div class="weight">
									<input class="magic-radio" type="radio" name="su_w2" id="s2h"
										value="10"> <label for="s2h">상</label> <input
										class="magic-radio" type="radio" name="su_w2" id="s2m"
										value="7" checked> <label for="s2m">중</label> <input
										class="magic-radio" type="radio" name="su_w2" id="s2l"
										value="3"> <label for="s2l">하</label>
								</div>
							</div>

							<div class='select'>
								<input class="magic-checkbox" type="checkbox"
									name="surroundings" id="s3" value="3"> <label
									class="text" for="s3"> 의료기관수 </label>
								<div class="weight">
									<input class="magic-radio" type="radio" name="su_w3" id="s3h"
										value="10"> <label for="s3h">상</label> <input
										class="magic-radio" type="radio" name="su_w3" id="s3m"
										value="7" checked> <label for="s3m">중</label> <input
										class="magic-radio" type="radio" name="su_w3" id="s3l"
										value="3"> <label for="s3l">하</label>
								</div>
							</div>

							<div class='select'>
								<input class="magic-checkbox" type="checkbox"
									name="surroundings" id="s4" value="4"> <label
									class="text" for="s4"> 인구밀도 </label>
								<div class="weight">
									<input class="magic-radio" type="radio" name="su_w4" id="s4h"
										value="10"> <label for="s4h">상</label> <input
										class="magic-radio" type="radio" name="su_w4" id="s4m"
										value="7" checked> <label for="s4m">중</label> <input
										class="magic-radio" type="radio" name="su_w4" id="s4l"
										value="3"> <label for="s4l">하</label>
								</div>
							</div>

							<div class='select'>
								<input class="magic-checkbox" type="checkbox"
									name="surroundings" id="s5" value="5"> <label
									class="text" for="s5"> CCTV수</label>
								<div class="weight">
									<input class="magic-radio" type="radio" name="su_w5" id="s5h"
										value="10"> <label for="s5h">상</label> <input
										class="magic-radio" type="radio" name="su_w5" id="s5m"
										value="7" checked> <label for="s5m">중</label> <input
										class="magic-radio" type="radio" name="su_w5" id="s5l"
										value="3"> <label for="s5l">하</label>
								</div>
							</div></li>

						<li class="nav-item"><a> <i class="la la-keyboard-o"></i>
								<p>Education</p>
						</a></li>
						<li><input class="magic-checkbox" type="checkbox"
							name="education" id="e0" value="0"> <label class="text"
							for="e0"> 전체 </label>
							<div class='select'>
								<input class="magic-checkbox" type="checkbox" name="education"
									id="e1" value="1"> <label class="text" for="e1">
									체육시설 </label>
								<div class="weight">
									<input class="magic-radio" type="radio" name="ed_w1" id="e1h"
										value="10"> <label for="e1h">상</label> <input
										class="magic-radio" type="radio" name="ed_w1" id="e1m"
										value="7" checked> <label for="e1m">중</label> <input
										class="magic-radio" type="radio" name="ed_w1" id="e1l"
										value="3"> <label for="e1l">하</label>
								</div>
							</div>

							<div class='select'>
								<input class="magic-checkbox" type="checkbox" name="education"
									id="e2" value="2"> <label class="text" for="e2">
									유아동관련 시설수 </label>
								<div class="weight">
									<input class="magic-radio" type="radio" name="ed_w2" id="e2h"
										value="10"> <label for="e2h">상</label> <input
										class="magic-radio" type="radio" name="ed_w2" id="e2m"
										value="7" checked> <label for="e2m">중</label> <input
										class="magic-radio" type="radio" name="ed_w2" id="e2l"
										value="3"> <label for="e2l">하</label>
								</div>
							</div>

							<div class='select'>
								<input class="magic-checkbox" type="checkbox" name="education"
									id="e3" value="3"> <label class="text" for="e3">
									어린이집 평가점수 </label>
								<div class="weight">
									<input class="magic-radio" type="radio" name="ed_w3" id="e3h"
										value="10"> <label for="e3h">상</label> <input
										class="magic-radio" type="radio" name="ed_w3" id="e3m"
										value="7" checked> <label for="e3m">중</label> <input
										class="magic-radio" type="radio" name="ed_w3" id="e3l"
										value="3"> <label for="e3l">하</label>
								</div>
							</div>
						<li class="nav-item"><a> <i class="la la-th"></i>
								<p>Hazard</p> <span class="badge badge-count"></span>
						</a></li>
						<li><input class="magic-checkbox" type="checkbox"
							name="harzard" id="h0" value="0"> <label class="text"
							for="h0"> 전체 </label>
							<div class='select'>
								<input class="magic-checkbox" type="checkbox" name="harzard"
									id="h1" value="1"> <label class="text" for="h1">
									교통사고수 </label>
								<div class="weight">
									<input class="magic-radio" type="radio" name="ha_w1" id="h1h"
										value="10"> <label for="h1h">상</label> <input
										class="magic-radio" type="radio" name="ha_w1" id="h1m"
										value="7" checked> <label for="h1m">중</label> <input
										class="magic-radio" type="radio" name="ha_w1" id="h1l"
										value="3"> <label for="h1l">하</label>
								</div>
							</div>
							<div class='select'>
								<input class="magic-checkbox" type="checkbox" name="harzard"
									id="h2" value="2"> <label class="text" for="h2">
									유흥업소 수 </label>
								<div class="weight">
									<input class="magic-radio" type="radio" name="ha_w2" id="h2h"
										value="10"> <label for="h2h">상</label> <input
										class="magic-radio" type="radio" name="ha_w2" id="h2m"
										value="7" checked> <label for="h2m">중</label> <input
										class="magic-radio" type="radio" name="ha_w2" id="h2l"
										value="3"> <label for="h2l">하</label>
								</div>
							</div>

							<div class='select'>
								<input class="magic-checkbox" type="checkbox" name="harzard"
									id="h3" value="3"> <label class="text" for="h3">
									유아동범죄율 </label>
								<div class="weight">
									<input class="magic-radio" type="radio" name="ha_w3" id="h3h"
										value="10"> <label for="h3h">상</label> <input
										class="magic-radio" type="radio" name="ha_w3" id="h3m"
										value="7" checked> <label for="h3m">중</label> <input
										class="magic-radio" type="radio" name="ha_w3" id="h3l"
										value="3"> <label for="h3l">하</label>
								</div>
							</div></li>

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
					<div class="row"></div>
					<div class="row">
						<div class="col-md-9" style="flex: 0 0 0; max-width: 100%;">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Seoul Map</h4>
									<p class="card-category">Map of the distribution of the
										best town</p>
								</div>
								<div class="card-body" style="width: 2000px; height: 300px">
									<div id="map" style="width: 100%">
										<jsp:include page="jido.html" flush="false" />
										<span>Alternative content for the map</span>
									</div>
								</div>
							</div>
						</div>
					</div>

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
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
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
<script>
	$(document).ready(function() {

		/* $(".weight").hide(); */

		$(".select").click(function(e) {
			//e.preventDefault();
			e.stopPropagation();
			$(this).children(".weight").show();
			/*  if( $(this).children(".weight").is(":visible")){
			 if( $(this).children(".weight").){
			
			  $(this).children(".weight").hide();
			}else{
			$(this).children(".weight").show();
			}
			 */

			/* if( $(this).children(".weight").css('visibility',"hidden")){
			  	$(this).children(".weight").css('visibility',"visible");
			  }else{
			  	(this).children(".weight").css('visibility',"hidden")
			} */

			/*  if($('.weight').css('display')=="none"){
			 	$(".weight").show();
			}else{
				$(".weight").hide();
			} */
		});

	});
</script>

</html>