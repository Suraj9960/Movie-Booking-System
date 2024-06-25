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
				Transactions</h1>
			<div class="overflow-x-auto">
				<table
					class="w-full table-auto text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
					<thead class="font-bold text-black">
						<tr>
							<th scope="col" class="px-6 py-3">User Name</th>
							<th scope="col" class="px-6 py-3">Order Id</th>
							<th scope="col" class="px-6 py-3">Payment Id</th>
							<th scope="col" class="px-6 py-3">Amount (INR)</th>
							<th scope="col" class="px-6 py-3">Status</th>
							<th scope="col" class="px-6 py-3">Date & Time</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orders}" var="order">
							<tr>
								<td class="px-6 py-3">${order.userName }</td>
								<td class="px-6 py-3">${order.orderId }</td>
								<td class="px-6 py-3">${order.payment_id }</td>
								<td class="px-6 py-3">${order.amount }</td>
								<td class="px-6 py-3">${order.status }</td>
								<td class="px-6 py-3">${order.dateTime }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
