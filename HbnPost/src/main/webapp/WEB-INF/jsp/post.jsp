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
<link href="<c:url value="/assets/css/post-form.css" />"
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
								<jsp:param name="post" value="post" />
								<jsp:param name="user" value="${sessionScope.userLoggedIn.name}" />
							</jsp:include>
						</c:when>
						<c:otherwise>
							<jsp:include page="includes/menu.jsp">
								<jsp:param name="post" value="post" />
							</jsp:include>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>

		<div class="row">
			<div class="mx-auto col-sm-10 col-md-6">
				<form:form method="POST" modelAttribute="post" action="/posts"
					role="form" id="contact-form" class="contact-form">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<form:input type="text" class="form-control" name="title"
									id="title" placeholder="Title" path="title" required="required"
									autofocus="autofocus" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<form:input type="url" class="form-control" name="url" id="url"
									placeholder="URL (optional)" path="url" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<form:textarea class="form-control textarea" rows="3"
									name="text" id="text" placeholder="Content" path="content"></form:textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 mb-5">
							<button type="submit" class="btn main-btn pull-right">Create
								post</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>

		<footer class="footer">&copy; 2019 - Jesús Ángel Pérez-Roca
			Fernández (jprf.liceo@gmail.com)</footer>
	</div>

	<!-- /container -->
	<script src="webjars/jquery/3.4.0/jquery.min.js"></script>
	<script src="webjars/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.ckeditor.com/ckeditor5/12.1.0/classic/ckeditor.js"></script>
	<script>
		$(function() {
			ClassicEditor.create(document.querySelector('#text'))
		});
	</script>
</body>
</html>