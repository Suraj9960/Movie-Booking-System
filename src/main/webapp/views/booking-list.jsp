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
</head>
<body>
	<%@include file="adminNavbar.jsp"%>
	<div class="container mx-auto px-4 mt-10">
		<div class="text-center">
			<h1
				class="py-4 text-green-700 text-3xl font-bold border-b-2 border-black">All
				Bookings</h1>
			<div class="overflow-x-auto">
				<table
					class="w-full table-auto text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
					<thead class="font-bold text-black">
						<tr>
							<th scope="col" class="px-6 py-3">Booking Id</th>
							<th scope="col" class="px-6 py-3">Movie Name</th>
							<th scope="col" class="px-6 py-3">Show Name</th>
							<th scope="col" class="px-6 py-3">User Name</th>
							<th scope="col" class="px-6 py-3">Booking Date</th>
							<th scope="col" class="px-6 py-3">Total Price</th>
							<th scope="col" class="px-6 py-3">Theater Name</th>
							<th scope="col" class="px-6 py-3">Payment Id</th>
							<th scope="col" class="px-6 py-3">Status</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${tickets}" var="ticket">
							<tr>
								<td class="px-6 py-3">${ticket.bookingId }</td>
								<td class="px-6 py-3">${ticket.moviename }</td>
								<td class="px-6 py-3">${ticket.show_name }</td>
								<td class="px-6 py-3">${ticket.username }</td>
								<td class="px-6 py-3">${ticket.date }</td>
								<td class="px-6 py-3">${ticket.totalPrice }</td>
								<td class="px-6 py-3">${ticket.theater_name }</td>
								<td class="px-6 py-3">${ticket.payment_id }</td>
								<td class="px-6 py-3">${ticket.status }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
