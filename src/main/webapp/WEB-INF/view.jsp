<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<h1 class="text-info">
			<c:out value="${language.name}" />
		</h1>
		<p>
			Creator:
			<c:out value="${language.creator}" />
		</p>
		<p>
			Language:
			<c:out value="${language.currentVersion}" />
		</p>
		<a href="/languages/${language.id}/edit" class="btn btn-info">Edit</a>
		<form action="/languages/${language.id}" method="post">
			<input type="hidden" name="_method" value="delete"> 
			<input class="btn btn-danger" type="submit" value="Delete">
		</form>
	</div>
</body>
</html>