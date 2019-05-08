<%@ page language="java" contentType="text/html; charset=UTF-8"
	session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
			<c:if test="${not empty sessionScope.userLoggedIn}">
				<span class="navbar-text"> ${sessionScope.userLoggedIn.name}</span>
			</c:if>
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

		<div class="jumbotron">
			<h1>HbnPost, a blog about Hibernate</h1>
			<p class="lead">Tutorials, information and tips about the best
				persistence technology for Java and .Net</p>
			<c:if test="${empty sessionScope.userLoggedIn}">
				<p>
					<a class="btn btn-lg btn-success" href="/signup" role="button">Register</a>
				</p>
			</c:if>
		</div>

		<c:forEach items="${postList}" var="postItem">
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<h1>
						<a href="/posts/${postItem.id}">${postItem.title}</a>
					</h1>
					<div>
						<img alt="User's avatar"
						src="http://i.pravatar.cc/50?u=${postItem.author.email}"
						class="rounded-circle img-fluid img-thumbnail"> <span>${postItem.author.name}</span>
					</div>
					<div style="clear: both; margin-bottom: 10px;"></div>
					<c:if test="${not empty postItem.url}">
						<p>
							<a href="${postItem.url}">${postItem.url}</a>
						</p>
					</c:if>
					<div class="dotdotdot">
						<p>${postItem.content}</p>
					</div>
					<div>
						<span class="badge badge-pill badge-primary">Posted on <fmt:formatDate type="date"
								value="${postItem.date}" /> at <fmt:formatDate type="time"
								value="${postItem.date}" /></span> <span class="badge badge-pill badge-info">${(fn:length(postItem.comments) gt 0) ? fn:length(postItem.comments) : 'No '}
							${(fn:length(postItem.comments) == 1) ? 'comment' : 'comments'}</span>
					</div>
					<hr>
				</div>
			</div>
		</c:forEach>
		<footer class="footer">&copy; 2019 - Jesús Ángel Pérez-Roca
			Fernández (jprf.liceo@gmail.com)</footer>
	</div>
	<!-- /container -->
	<script src="webjars/jquery/3.4.0/jquery.min.js"></script>
	<script src="webjars/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
	<script src="/assets/js/jquery.dotdotdot.min.js"></script>
	<script>
		$(document).ready(function() {
			$(".dotdotdot").dotdotdot({
				height : 150
			});
		});
	</script>
</body>
</html>