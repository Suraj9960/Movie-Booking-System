<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Booking Page</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<script src="https://cdn.tailwindcss.com"></script>
<style>
/* Custom CSS for the table */
.responsive-table {
	overflow-x: auto;
	width: 100%;
}

table {
	border-collapse: collapse;
	width: 100%;
	border: 1px solid #e2e8f0;
}

th, td {
	border: 1px solid #e2e8f0;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f3f4f6;
	font-weight: bold;
	color: #4b5563;
}

tr:nth-child(even) {
	background-color: #f8fafc;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid mt-[40px]">
		<div class="text-center">
			<h1
				class="py-4 text-green-700 text-[22px] font-bold border-b-2 border-black">My
				Bookings</h1>
			<div class="responsive-table">
				<table
					class="text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
					<thead>
						<tr>
							<th scope="col">Booking Id</th>
							<th scope="col">Movie Name</th>
							<th scope="col">Show Name</th>
							<th scope="col">User Name</th>
							<th scope="col">Booking Date</th>
							<th scope="col">Total Price</th>
							<th scope="col">Theater Name</th>
							<th scope="col">Status</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${tickets}" var="ticket">
							<tr>
								<td>${ticket.bookingId }</td>
								<td>${ticket.moviename }</td>
								<td>${ticket.show_name }</td>
								<td>${ticket.username }</td>
								<td>${ticket.date }</td>
								<td>${ticket.totalPrice }</td>
								<td>${ticket.theater_name }</td>
								<td>${ticket.status }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
