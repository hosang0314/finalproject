<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="vo.ClientVO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>evaluation - Ready Bootstrap Dashboard</title>
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<script>
$(document).ready(function () {	
	<%
		ClientVO cvo = null;
		int lo_id_val = 0;
		if (session.getAttribute("cvo") != null) {
			cvo = (ClientVO) session.getAttribute("cvo");
			lo_id_val = cvo.getLO_ID();
	%>
	<%-- alert('<%= lo_id_val %>'); --%>
	$('select.LO_ID option[value=' + <%= lo_id_val %> + ']').attr('selected', 'selected');
	<%
		}
	%>
	<%System.out.println("cvo : " + cvo.toString());%>
});
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
<%-- 						<%!ClientVO cvo = null;%>
						<%
							if (session.getAttribute("cvo") != null) {
								cvo = (ClientVO) session.getAttribute("cvo");
						%> --%>
						<li class="nav-item dropdown"><a
							class="dropdown-toggle profile-pic" data-toggle="dropdown"
							href="#" aria-expanded="false"> <img
								src="assets/img/profile.jpg" alt="user-img" width="36"
								class="img-circle"><span><%=cvo.getC_FIRSTNAME()%></span></span>
						</a>
							<ul class="dropdown-menu dropdown-user">
								<li>
									<div class="user-box">
										<div class="u-img">
											<img src="assets/img/profile.jpg" alt="user">
										</div>
										<div class="u-text">
											<h4><%=cvo.getC_FIRSTNAME()%></h4>
											<p class="text-muted"><%=cvo.getC_ID()%></p>
											<a href="evaluation.html"
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
							</ul> <!-- /.dropdown-user --></li>
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
							aria-expanded="true"> <span> <%=cvo.getC_FIRSTNAME()%>
								<!-- <span class="user-level">Administrator</span> --> <span
								class="caret"></span>
						</span>
						</a>
						<div class="clearfix"></div>

						<div class="collapse in" id="collapseExample" aria-expanded="true"
							style="">
							<ul class="nav">
								<li><a> <span class="link-collapse">FIRSTNAME: <%=cvo.getC_FIRSTNAME()%></span>
								</a></li>
								<li><a> <span class="link-collapse">LASTNAME : <%=cvo.getC_LASTNAME()%></span>
								</a></li>
								<li><a> <span class="link-collapse">E-MAIL : <%=cvo.getC_ID()%></span>
								</a></li>
								<li><a> <span class="link-collapse">LOCATION : <%=cvo.getLO_NAME()%></span>
								</a></li>

							</ul>
						</div>
					</div>
				</div>
<%-- 				<%
					}
				%> --%>
				<ul class="nav">
					<li class="nav-item update-pro"><a href="evaluation.html">
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
					<h4 class="page-title">evaluation</h4>
					<div class="row">
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<div class="card-title">Base Form Control</div>
								</div>
								<div class="card-body">
									<div class="form-group">
										<label for="email">Email Address</label> <input type="email"
											class="form-control" id="email" placeholder="Enter Email"
											value="<%=cvo.getC_ID()%>" readonly="readonly"> <small
											id="emailHelp" class="form-text text-muted">We'll
											never share your email with anyone else.</small>
									</div>
									<div class="form-group">
										<label for="password">Password</label> <input type="password"
											class="form-control" id="password" placeholder="Password"
											value="<%=cvo.getC_PW()%>">
									</div>
									<div class="form-group">
										<label for="email">First Name</label> <input type="email"
											class="form-control" id="firstname" placeholder="First Name"
											value="<%=cvo.getC_FIRSTNAME()%>">
									</div>
									<div class="form-group">
										<label for="email">Last Name</label> <input type="email"
											class="form-control" id="lastname" placeholder="Last Name"
											value="<%=cvo.getC_LASTNAME()%>">
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">지역코드</label> <select
											name="LO_ID" id= "LO_ID" class= "LO_ID">
											<option value="1">강남구</option>
											<option value="2">강동구</option>
											<option value="3">강북구</option>
											<option value="4">강서구</option>
											<option value="5">관악구</option>
											<option value="6">광진구</option>
											<option value="7">구로구</option>
											<option value="8">금천구</option>
											<option value="9">노원구</option>
											<option value="10">도봉구</option>
											<option value="11">동대문구</option>
											<option value="12">동작구</option>
											<option value="13">마포구</option>
											<option value="14">서대문구</option>
											<option value="15">서초구</option>
											<option value="16">성동구</option>
											<option value="17">성북구</option>
											<option value="18">송파구</option>
											<option value="19">양천구</option>
											<option value="20">영등포구</option>
											<option value="21">용산구</option>
											<option value="22">은평구</option>
											<option value="23">종로구</option>
											<option value="24">중구</option>
											<option value="25">중랑구</option>
										</select>
									</div>
									<!-- <div class="form-group form-inline">
											<label for="inlineinput" class="col-md-3 col-form-label">Inline Input</label>
											<div class="col-md-9 p-0">
												<input type="text" class="form-control input-full" id="inlineinput" placeholder="Enter Input">
											</div>
										</div>
										<div class="form-group has-success">
											<label for="successInput">Success Input</label>
											<input type="text" id="successInput" value="Success" class="form-control">
										</div>
										<div class="form-group has-error has-feedback">
											<label for="errorInput">Error Input</label>
											<input type="text" id="errorInput" value="Error" class="form-control">
											<small id="emailHelp" class="form-text text-muted">Please provide a valid informations.</small>
										</div>
										<div class="form-group">
											<label for="disableinput">Disable Input</label>
											<input type="text" class="form-control" id="disableinput" placeholder="Enter Input" disabled>
										</div> -->
									<div class="form-check">
										<label>Gender</label><br /> <label class="form-radio-label">
											<input class="form-radio-input" type="radio"
											name="optionsRadios" value="" checked=""> <span
											class="form-radio-sign">Male</span>
										</label> <label class="form-radio-label ml-3"> <input
											class="form-radio-input" type="radio" name="optionsRadios"
											value=""> <span class="form-radio-sign">Female</span>
										</label>
									</div>
									<div class="form-group">
										<label class="control-label"> Static </label>
										<!---->
										<p class="form-control-static">
											<%=cvo.getC_ID()%></p>
										<!---->
										<!---->
									</div>
									<div class="form-group">
										<label for="exampleFormControlSelect1">Example select</label>
										<select class="form-control" id="exampleFormControlSelect1">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
									<div class="form-group">
										<label for="exampleFormControlSelect2">Example
											multiple select</label> <select multiple class="form-control"
											id="exampleFormControlSelect2">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
									<div class="form-group">
										<label for="exampleFormControlFile1">Example file
											input</label> <input type="file" class="form-control-file"
											id="exampleFormControlFile1">
									</div>
									<div class="form-group">
										<label for="comment">Comment</label>
										<textarea class="form-control" id="comment" rows="5">

												</textarea>
									</div>
									<div class="form-check">
										<label class="form-check-label"> <input
											class="form-check-input" type="checkbox" value=""> <span
											class="form-check-sign">Agree with terms and
												conditions</span>
										</label>
									</div>
								</div>
								<div class="card-action">
									<button class="btn btn-success">Submit</button>
									<button class="btn btn-danger">Cancel</button>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<div class="card-title">Form Control Styles</div>
								</div>
								<div class="card-body">
									<div class="form-group">
										<label for="squareInput">Square Input</label> <input
											type="text" class="form-control input-square"
											id="squareInput" placeholder="Square Input">
									</div>
									<div class="form-group">
										<label for="squareSelect">Square Select</label> <select
											class="form-control input-square" id="squareSelect">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
									<div class="form-group">
										<label for="pillInput">Pill Input</label> <input type="text"
											class="form-control input-pill" id="pillInput"
											placeholder="Pill Input">
									</div>
									<div class="form-group">
										<label for="pillSelect">Pill Select</label> <select
											class="form-control input-pill" id="pillSelect">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
									<div class="form-group">
										<label for="solidInput">Solid Input</label> <input type="text"
											class="form-control input-solid" id="solidInput"
											placeholder="Solid Input">
									</div>
									<div class="form-group">
										<label for="solidSelect">Solid Select</label> <select
											class="form-control input-solid" id="solidSelect">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
								</div>
								<div class="card-action">
									<button class="btn btn-success">Submit</button>
									<button class="btn btn-danger">Cancel</button>
								</div>
							</div>
							<div class="card">
								<div class="card-header">
									<div class="card-title">Form Control Styles</div>
								</div>
								<div class="card-body">
									<div class="form-group">
										<label for="largeInput">Large Input</label> <input type="text"
											class="form-control form-control-lg" id="largeInput"
											placeholder="Large Input">
									</div>
									<div class="form-group">
										<label for="largeInput">Default Input</label> <input
											type="text" class="form-control form-control"
											id="defaultInput" placeholder="Default Input">
									</div>
									<div class="form-group">
										<label for="smallInput">Small Input</label> <input type="text"
											class="form-control form-control-sm" id="smallInput"
											placeholder="Small Input">
									</div>
									<div class="form-group">
										<label for="largeSelect">Large Select</label> <select
											class="form-control form-control-lg" id="largeSelect">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
									<div class="form-group">
										<label for="defaultSelect">Default Select</label> <select
											class="form-control form-control" id="defaultSelect">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
									<div class="form-group">
										<label for="smallSelect">Small Select</label> <select
											class="form-control form-control-sm" id="smallSelect">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
								</div>
								<div class="card-action">
									<button class="btn btn-success">Submit</button>
									<button class="btn btn-danger">Cancel</button>
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
							<li class="nav-item"><a class="nav-link" href="#">
									Licenses </a></li>
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
</html>