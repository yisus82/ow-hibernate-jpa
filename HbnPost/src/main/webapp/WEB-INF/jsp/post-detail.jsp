<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"
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
	<div class="container">
		<div class="header clearfix">
			<nav>
				<ul class="nav nav-pills pull-right">
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
			</nav>
			<h3 class="text-muted">HbnPost</h3>
		</div>

		<div class="row">
			<div class="col-md-12 col-lg-12">
				<h1>${post.title}</h1>
				<div>
					<div class="pull-right" style="padding: 10px 0 0 5px;">${post.author.name}</div>
					<img alt="User's avatar"
						src="http://i.pravatar.cc/50?u=${post.author.email}"
						class="img-circle img-responsive pull-right">
					<p></p>
				</div>
				<div style="clear: both; margin-bottom: 10px;"></div>
				<p>${post.content}</p>
				<div>
					<span class="badge">Posted on <fmt:formatDate type="date"
							value="${post.date}" /> at <fmt:formatDate type="time"
							value="${post.date}" /></span>
				</div>
				<hr>
			</div>
		</div>


		<div class="row comment">
			<div class="col-md-12 col-lg-12">
				<div class="well">
					<h4>What do you think about this article?</h4>
					<c:choose>
						<c:when test="${not empty sessionScope.userLoggedIn}">
							<form:form method="POST" modelAttribute="commentForm"
								id="comment-form" action="/posts/comment" role="form">
								<form:input type="hidden" id="post_id" name="post_id"
									path="post_id" value="${post.id}" />
								<div class="input-group">
									<form:input type="text"
										class="form-control input-sm chat-input"
										placeholder="Insert your comment..." path="content"
										required="required" />
									<span class="input-group-btn" id="comment-button">
										<button type="submit" class="btn btn-primary btn-sm">
											Comment</button>
									</span>
								</div>
							</form:form>
						</c:when>
						<c:otherwise>
							<h5>You need to log in in order to comment on this article</h5>
						</c:otherwise>
					</c:choose>
					<hr data-brackets-id="12673">
					<ul data-brackets-id="12674" id="sortable"
						class="list-unstyled ui-sortable">
						<c:if test="${not empty post.comments}">
							<c:forEach items="${post.comments}" var="comment">
								<li class="ui-state-default"><strong
									class="pull-left primary-font">${comment.user.name}</strong> <small
									class="pull-right text-muted"> <span
										class="glyphicon glyphicon-time"></span> <fmt:formatDate
											type="date" value="${comment.date}" /> at <fmt:formatDate
											type="time" value="${comment.date}" />
								</small> <br /> ${comment.text} <br /></li>
							</c:forEach>
						</c:if>
					</ul>
				</div>
			</div>
		</div>

		<footer class="footer">&copy; 2019 - Jesús Ángel Pérez-Roca
			Fernández (jprf.liceo@gmail.com)</footer>
	</div>

	<!-- /container -->
	<script src="/webjars/jquery/3.4.0/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>