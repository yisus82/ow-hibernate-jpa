<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link href="<c:url value="/assets/css/profile.css" />" rel="stylesheet">

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
								<jsp:param name="authors" value="authors" />
								<jsp:param name="user" value="${sessionScope.userLoggedIn.name}" />
							</jsp:include>
						</c:when>
						<c:otherwise>
							<jsp:include page="includes/menu.jsp">
								<jsp:param name="authors" value="authors" />
							</jsp:include>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>

		<c:forEach items="${authors}" var="author">
			<div class="row">
				<div
					class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1 toppad">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3 class="panel-title">${author.name}</h3>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-6 col-lg-6" align="center">
									<img alt="User's avatar"
										src="http://i.pravatar.cc/300?u=${author.email}"
										class="img-circle img-responsive">
								</div>
								<div class="col-md-6 col-lg-6">
									<table class="table table-user-information">
										<tbody>
											<tr>
												<td>Registration date:</td>
												<td><fmt:formatDate type="date"
														value="${author.registrationDate}" /></td>
											</tr>
											<tr>
												<td>City</td>
												<td>${author.city}</td>
											</tr>
											<tr>
												<td>Email</td>
												<td><a href="mailto:${author.email}">${author.email}</a></td>
											</tr>
											<tr>
												<td>Activity</td>
												<td>${fn:length(author.posts)}
													${(fn:length(author.posts) == 1) ? 'post' : 'posts'} -
													${fn:length(author.comments)} ${(fn:length(author.comments) == 1) ? 'comment' : 'comments'}
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>

		<footer class="footer">&copy; 2019 - Jesús Ángel Pérez-Roca Fernández (jprf.liceo@gmail.com)</footer>
	</div>

	<!-- /container -->
	<script src="webjars/jquery/3.4.0/jquery.min.js"></script>
	<script src="webjars/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>