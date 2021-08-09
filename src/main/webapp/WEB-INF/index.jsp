<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Languages</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h3 class="text-info">All Languages:</h3>
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Creator</th>
					<th scope="col">Version</th>
					<th scope="col">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${getLanguages}" var="lang">
					<tr>
						<td scope="row"><a href="/languages/${lang.id}">${lang.name}</a></td>
						<td><c:out value="${lang.creator}" /></td>
						<td><c:out value="${lang.currentVersion}" /></td>
						<td>
							<form action="/languages/${lang.id}" method="post">
								<input type="hidden" name="_method" value="delete">
							<a class = "btn btn-info" href="/languages/${lang.id}/edit">Edit</a>
								<button class="btn btn-danger">Delete</button>
							</form></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<h3 class="text-info">Add a new language:</h3>
		<form:form action="/languages" method="post" modelAttribute="language">
			<div class="form-group">
				<p>
					<form:label path="name">Name</form:label>
					<form:errors path="name" />
					<form:input path="name" />
				</p>
				<p>
					<form:label path="creator">Creator</form:label>
					<form:errors path="creator" />
					<form:input path="creator" />
				</p>
				<p>
					<form:label path="currentVersion">Version</form:label>
					<form:errors path="currentVersion" />
					<form:input path="currentVersion" />
				</p>
				<input class="float-right mr-5 mt-3 btn btn-success" type="submit"
					value="Submit" />
			</div>
		</form:form>
	</div>
</body>
</html>