<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<title>Save Customer</title>
</head>
<body style='background-color: gray'>

	<div>

		<h2>
			<div class="shadow p-3 mb-3 bg-secondary text-white table-striped">Customer
				Relationship Management</div>
		</h2>

		<hr>
		<div class="container ">
			<a
				class="shadow-sm btn btn-outline-dark text-white btn-sm border border-warning"
				href="/CustomerRelationshipManagement/customer/list">Back to
				Customer List </a>
			<hr>
			<p class="h4 mb-4 ">Customer Details</p>

			<form action="/CustomerRelationshipManagement/customer/save"
				method="POST">

				<!-- Add hidden form field to handle update -->
				<input type="hidden" name="id" value="${Customer.id}" />

				<div class="form-inline">
					<input type="text" name="firstName" value="${Customer.firstName}"
						class="form-control mb-4 col-4" placeholder="First Name">



				</div>

				<div class="form-inline">

					<input type="text" name="lastName" value="${Customer.lastName}"
						class="form-control mb-4 col-4" placeholder="Last Name">



				</div>

				<div class="form-inline">

					<input type="text" name="email" value="${Customer.email}"
						class="form-control mb-4 col-4" placeholder="Email ID">



				</div>


				<button type="submit" class="btn btn-success col-2">Save</button>

			</form>

		</div>

	</div>
</body>
</html>