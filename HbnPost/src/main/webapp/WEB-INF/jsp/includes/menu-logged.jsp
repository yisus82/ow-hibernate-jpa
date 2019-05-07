<li class="nav-item" role="presentation"><a
	${not empty param.post ? 'class="nav-link active"' : 'class="nav-link"' }
	href="/posts">Create a post</a></li>
<li class="nav-item" role="presentation"><a
	${not empty param.authors ? 'class="nav-link active"' : 'class="nav-link"' }
	href="/authors">Authors</a></li>
<li class="nav-item" role="presentation"><a class="nav-link"
	href="/logout">Logout</a></li>