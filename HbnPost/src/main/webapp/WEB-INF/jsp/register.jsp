<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="Blog about Hibernate">
<meta name="author" content="Jesús Ángel Pérez-Roca Fernández">

<title>HbnPost</title>

<!-- Bootstrap core CSS -->
<link href="webjars/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value="/assets/css/jumbotron-narrow.css" />"
	rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>
	<div class="container-fluid">
		<nav class="navbar navbar-dark bg-primary">
			<a class="navbar-brand" href="/">HbnPost</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarText" aria-controls="navbarText"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarText">
				<ul class="navbar-nav mr-auto">
					<c:choose>
						<c:when test="${not empty sessionScope.userLoggedIn}">
							<jsp:include page="includes/menu-logged.jsp" flush="true">
								<jsp:param name="home" value="home" />
								<jsp:param name="user" value="${sessionScope.userLoggedIn.name}" />
							</jsp:include>
						</c:when>
						<c:otherwise>
							<jsp:include page="includes/menu.jsp">
								<jsp:param name="home" value="home" />
							</jsp:include>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>

		<div class="mx-auto col-sm-10 col-md-6">
			<div class="text-center">
				<h3>
					<b>Register</b>
				</h3>
			</div>
			<form:form id="register-form" action="/register" method="post"
				modelAttribute="userRegister" role="form">
				<div class="form-group row">
					<form:input type="text" name="name" id="name" tabindex="1"
						class="form-control" placeholder="Name" path="name"
						required="required" />
				</div>
				<div class="form-group row">
					<form:input type="text" name="city" id="city" tabindex="2"
						class="form-control" placeholder="City, Country" path="city"
						required="required" />
				</div>
				<div class="form-group row">
					<form:input type="email" name="email" id="email" tabindex="4"
						class="form-control" placeholder="Email" path="email"
						required="required" />
				</div>
				<div class="form-group row">
					<form:input type="password" name="password" id="password"
						tabindex="5" class="form-control" placeholder="Password"
						path="password" required="required" />
				</div>
				<div class="form-group row">
					<input type="password" name="confirm-password"
						id="confirm-password" tabindex="6" class="form-control"
						placeholder="Confirm Password" data-rule-equalTo="#password">
				</div>
				<div class="form-group row">
					<input type="submit" name="register-submit" id="register-submit"
						tabindex="9"
						class="form-control btn btn-primary"
						value="Register">
				</div>
				<input type="hidden" class="hide" name="token" id="token"
					value="7c6f19960d63f53fcd05c3e0cbc434c0">
			</form:form>
		</div>

		<footer class="footer">&copy; 2019 - Jesús Ángel Pérez-Roca
			Fernández (jprf.liceo@gmail.com)</footer>
	</div>

	<!-- /container -->
	<script src="webjars/jquery/3.4.0/jquery.min.js"></script>
	<script src="webjars/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
	<script src="/assets/js/jquery.validate.min.js"></script>
	<script>
		$(document).ready(function() {
			$("#register-form").validate();
		});
	</script>
</body>
</html>