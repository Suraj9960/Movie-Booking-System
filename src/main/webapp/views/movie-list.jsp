<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List of Movies</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<script src="https://cdn.tailwindcss.com"></script>

</head>
<body>
	<%@include file="adminNavbar.jsp"%>
	<div class="container-fluid mt-10 mx-auto max-w-7xl px-4">
		<div class="text-right">
			<a href="add-movie" class="bg-red-500 text-white px-2 py-2 rounded">Add
				New Movie</a>
		</div>
		<div class="text-center">
			<c:if test="${not empty succMsg}">
				<div
					class="mx-auto max-w-xs bg-white border border-gray-200 rounded-xl shadow-lg dark:bg-neutral-800 dark:border-neutral-700"
					role="alert">
					<div class="flex p-4">
						<div class="flex-shrink-0">
							<svg class="flex-shrink-0 w-4 h-4 text-teal-500 mt-0.5"
								xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
								fill="currentColor">
                                <path fill-rule="evenodd"
									d="M16 10a6 6 0 1 1-12 0 6 6 0 0 1 12 0zM7.293 8.293a1 1 0 0 1 1.414 0L10 9.586l1.293-1.293a1 1 0 1 1 1.414 1.414L11.414 11l1.293 1.293a1 1 0 1 1-1.414 1.414L10 12.414l-1.293 1.293a1 1 0 1 1-1.414-1.414L8.586 11 7.293 9.707a1 1 0 0 1 0-1.414z"
									clip-rule="evenodd" />
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
							<svg class="flex-shrink-0 w-4 h-4 text-red-500 mt-0.5"
								xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
								fill="currentColor">
                                <path fill-rule="evenodd"
									d="M16 10a6 6 0 1 1-12 0 6 6 0 0 1 12 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"
									clip-rule="evenodd" />
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
				class="py-4 text-green-700 text-2xl font-bold border-b-2 border-black">All
				Movies</h1>
			<div class="overflow-x-auto">
				<table
					class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
					<thead class="font-bold text-black">
						<tr>
							<th scope="col" class="px-6 py-3">Movie Photo</th>
							<th scope="col" class="px-6 py-3">Movie name</th>
							<th scope="col" class="px-6 py-3">Release Date</th>
							<th scope="col" class="px-6 py-3">Actors</th>
							<th scope="col" class="px-6 py-3">Actress</th>
							<th scope="col" class="px-6 py-3">Details</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${movies}" var="movie">
							<tr class="text-black">
								<td class="px-6 py-4"><img class="w-24 h-12 object-cover"
									src="../image/${movie.movieImageUrl}"></td>
								<td class="px-6 py-4">${movie.movieName }</td>
								<td class="px-6 py-4">${movie.releaseDate }</td>
								<td class="px-6 py-4">${movie.actor }</td>
								<td class="px-6 py-4">${movie.actress }</td>
								<td class="px-6 py-4"><a
									href="delete-movie?id=${movie.id }"
									class="bg-red-700 py-2 px-2 text-white"><i
										class="fa-solid fa-trash"></i>&nbsp;Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
