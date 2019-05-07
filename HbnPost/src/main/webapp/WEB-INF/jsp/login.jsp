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
<link href="<c:url value="/assets/css/login.css" />" rel="stylesheet">

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
								<jsp:param name="login" value="login" />
								<jsp:param name="user" value="${sessionScope.userLoggedIn.name}" />
							</jsp:include>
						</c:when>
						<c:otherwise>
							<jsp:include page="includes/menu.jsp">
								<jsp:param name="login" value="login" />
							</jsp:include>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>

		<div class="row">
			<div class="mx-auto col-sm-10 col-md-6">
				<form:form class="form-signin" method="POST" action="/login"
					modelAttribute="userLogin">
					<h2 class="form-signin-heading">Login form</h2>
					<div class="form-group row">
						<form:input type="email" id="inputEmail" class="form-control"
							placeholder="Email" path="email" required="required"
							autofocus="autofocus" />
					</div>
					<div class="form-group row">
						<form:input type="password" id="inputPassword"
							class="form-control" placeholder="Password" path="password"
							required="required" />
					</div>
					<div class="form-group row">
						<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
					</div>
				</form:form>
			</div>
		</div>

		<c:if test="${not empty error}">
			<div class="row">
				<div class="col-lg-6 col-lg-offset-3">
					<div class="alert alert-danger alert-dismissible"
						role="alert">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<c:out value="${error}" />
					</div>
				</div>
			</div>
		</c:if>
		<footer class="footer">&copy; 2019 - Jesús Ángel Pérez-Roca
			Fernández (jprf.liceo@gmail.com)</footer>
	</div>
	<!-- /container -->
	<script src="webjars/jquery/3.4.0/jquery.min.js"></script>
	<script src="webjars/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>