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
			<c:if test="${not empty succMsg}">
				<div
					class="mx-auto max-w-xs bg-white border border-gray-200 rounded-xl shadow-lg dark:bg-neutral-800 dark:border-neutral-700"
					role="alert">
					<div class="flex p-4">
						<div class="flex-shrink-0">
							<svg class="flex-shrink-0 size-4 text-teal-500 mt-0.5"
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" viewBox="0 0 16 16">
                                <path
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z">
                                </path>
                            </svg>
						</div>
						<div class="ms-3">
							<p class="text-sm text-green-700 font-bold">${succMsg }</p>
						</div>
					</div>
				</div>
				<c:remove var="succMsg" scope="session" />
			</c:if>
			<c:if test="${not empty failMsg}">
				<div
					class="mx-auto max-w-xs bg-white border border-gray-200 rounded-xl shadow-lg dark:bg-neutral-800 dark:border-neutral-700"
					role="alert">
					<div class="flex p-4">
						<div class="flex-shrink-0">
							<svg class="flex-shrink-0 size-4 text-red-500 mt-0.5"
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" viewBox="0 0 16 16">
                                <path
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z">
                                </path>
                            </svg>
						</div>
						<div class="ms-3">
							<p class="text-sm text-red-700 dark:text-neutral-400">${failMsg }</p>
						</div>
					</div>
				</div>
				<c:remove var="failedMsg" scope="session" />
			</c:if>
			<h1
				class="py-4 text-green-700 text-3xl font-bold border-b-2 border-black">All
				Users</h1>
			<div class="overflow-x-auto">
				<table
					class="w-full table-auto text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
					<thead class="font-bold text-black">
						<tr>
							<th scope="col" class="px-6 py-3">User Name</th>
							<th scope="col" class="px-6 py-3">Email Address</th>
							<th scope="col" class="px-6 py-3">Role</th>
							<th scope="col" class="px-6 py-3">Operations</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${users}" var="user">
							<tr>
								<td class="px-6 py-3">${user.name }</td>
								<td class="px-6 py-3">${user.email }</td>
								<td class="px-6 py-3">${user.role }</td>
								<td class="px-6 py-3"><a href="delete-user?id=${user.id }"
									class="bg-red-700 text-white p-2">Delete User</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
