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
<title><c:out value="${language.name}" /></title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<form action="/languages/${language.id}" method="post">
			<input type="hidden" name="_method" value="delete"> <a
				href="/languages" class="float-right mt-3 mr-4 btn btn-primary">Dashboard</a>
			<button class="btn btn-danger float-right mt-3 mr-3">Delete</button>
		</form>
		<h1>
			Edit
			<c:out value="${language.name}"></c:out>
		</h1>
		<form:form class="form-group" action="/languages/${language.id}"
			method="post" modelAttribute="language">
			<input type="hidden" name="_method" value="put">
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
		</form:form>
	</div>
</body>
</html>