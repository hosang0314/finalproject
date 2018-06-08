<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>SB Admin - Start Bootstrap Template</title>
<!-- Bootstrap core CSS-->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
	<div class="container">
		<div class="card card-register mx-auto mt-5">
			<%
				String msg = (String) request.getAttribute("msg");
				if (msg != null) {
			%>
			<div class="card-header">
				Register an Account (<%=msg%>)
			</div>
			<%
				} else {
			%>
			<div class="card-header">Register an Account</div>
			<%
				}
			%>
			<div class="card-body">
				<form method="post" action="/town/register.do">
					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<label for="firstname">First name</label> <input
									class="form-control" id="firstname" type="text"
									name="C_FIRSTNAME" aria-describedby="nameHelp"
									placeholder="Enter first name" required>
							</div>
							<div class="col-md-6">
								<label for="Lastname">Last name</label> <input
									class="form-control" id="Lastname" type="text"
									name="C_LASTNAME" aria-describedby="nameHelp"
									placeholder="Enter last name">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label> <input
							class="form-control" id="exampleInputEmail1" type="email"
							name="C_ID" aria-describedby="emailHelp"
							placeholder="Enter email" required>
					</div>
					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<label for="exampleInputPassword1">Password</label> <input
									class="form-control" id="exampleInputPassword1" type="password"
									name="C_PW" placeholder="Password" required>
							</div>
							<div class="col-md-6">
								<label for="exampleConfirmPassword">Confirm password</label> <input
									class="form-control" id="exampleConfirmPassword"
									name="confirmPassWord" type="password"
									placeholder="Confirm password" required>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">지역코드</label> <select name="LO_ID">
							<option value="1" selected="selected">강남구</option>
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
					<input class="btn btn-primary btn-block" type="submit"
						value="Register">
				</form>
				<div class="text-center">
					<a class="d-block small mt-3" href="/town/login.do">Login Page</a> <a
						class="d-block small" href="forgot-password.jsp">Forgot
						Password?</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
</body>

</html>