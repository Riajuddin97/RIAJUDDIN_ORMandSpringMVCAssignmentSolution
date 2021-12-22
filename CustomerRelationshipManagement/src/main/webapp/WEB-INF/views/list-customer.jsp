<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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


<title>Customer Relationship Management</title>

</head>


<body style='background-color: gray'>

	<div>
		<h2>
			<div
				class="shadow p-3 mb-3 bg-secondary text-white border border-dark">Customer
				Relationship Management</div>


		</h2>

		<!-- Add a search form -->

		<form action="/CustomerRelationshipManagement/customer/search"
			class="form-inline">

			<div class="col-lg-12" style="text-align: center">

				<!-- Add a button -->
				<a href="/CustomerRelationshipManagement/customer/showFormForAdd"
					class="shadow-sm btn btn-outline-dark btn-sm text-white border border-5 border-warning ">
					Add Customer </a>
			</div>

		</form>
		<hr>

		<c:choose>
			<c:when test="${fn:length(Customer) > 0}">

				<h50>
				<table class="shadow-sm table table-dark text-white table-striped">

					<thead class="table-secondary text-dark" style="text-align: center">
						<tr>
							<th>Customer-ID</th>
							<th>FirstName</th>
							<th>LastName</th>
							<th>Email</th>
							<th>Action</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${Customer}" var="tempCustomer">
							<tr class="col-lg-12" style="text-align: center">
								<td><c:out value="${tempCustomer.id}" /></td>
								<td><c:out value="${tempCustomer.firstName}" /></td>
								<td><c:out value="${tempCustomer.lastName}" /></td>
								<td><c:out value="${tempCustomer.email}" /></td>
								<td>
									<!-- Add "update" button/link --> <a
									href="/CustomerRelationshipManagement/customer/showFormForUpdate?customerId=${tempCustomer.id}"
									class="shadow-sm btn btn-outline-warning  btn-sm "> Update
								</a> <!-- Add "delete" button/link --> <a
									href="/CustomerRelationshipManagement/customer/delete?customerId=${tempCustomer.id}"
									class="shadow-sm btn btn btn-outline-danger btn-sm"
									onclick="if (!(confirm('Are you sure you want to delete this Student?... you cant retrive this...'))) return false">
										Delete </a>

								</td>

							</tr>
						</c:forEach>


					</tbody>
					</h50>

				</table>
			</c:when>
			<c:otherwise>
				<div class="col-lg-12" style="text-align: center">
					<span
						class="shadow d-block p-1 bg text-dark bg-gray border border-light ">No
						CUSTOMERS yet. Click on ADD CUSTOMER to a New CUSTOMER</span>

				</div>
			</c:otherwise>
		</c:choose>


	</div>

</body>
</html>