<li class="nav-item" role="presentation"><a
	${not empty param.home ? 'class="nav-link active"' : 'class="nav-link"' }
	href="/">Home</a></li>
<li class="nav-item" role="presentation"><a
	${not empty param.post ? 'class="nav-link active"' : 'class="nav-link"' }
	href="/posts">Create a post</a></li>
<li class="nav-item" role="presentation"><a
	${not empty param.authors ? 'class="nav-link active"' : 'class="nav-link"' }
	href="/authors">Authors</a></li>
<li role="presentation">
	<div class="btn-group" style="padding-top: 5px;">
		<button type="button" class="btn btn-default dropdown-toggle"
			data-toggle="dropdown">
			${param.user}&nbsp;<span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu">
			<li><a href="/logout">Logout</a></li>
		</ul>
	</div>
</li>