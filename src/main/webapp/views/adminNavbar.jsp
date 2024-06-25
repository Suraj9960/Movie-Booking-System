<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Navbar Page</title>
<!-- component -->
<style>
.header-links li span {
	position: relative;
	z-index: 0;
}

.header-links li span::before {
	content: '';
	position: absolute;
	z-index: -1;
	bottom: 2px;
	left: -4px;
	right: -4px;
	display: block;
	height: 6px;
}

.header-links li.active span::before {
	background-color: #fcae04;
}

.header-links li:not(.active):hover span::before {
	background-color: #ccc;
}
</style>
</head>
<body>
	<c:set var="user" value="${user}" />
	<header class="bg-white shadow-lg h-24  md:flex">
		<a href=""
			class="border flex-shrink-0 flex items-center justify-center px-4 lg:px-6 xl:px-8">
			<img class="w-[120px]"
			src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_YDnOpJoKBO4U4bu5Bwkk0Z6a9mkxKL2-Tw&s"
			alt="" />
		</a>
		<nav class="header-links contents font-semibold text-base lg:text-lg">
			<ul class="flex items-center ml-4 xl:ml-8 mr-auto">
				<li class="p-3 xl:p-6 active"><a href="homePage"> <span>Home</span>
				</a></li>
				<li class="p-3 xl:p-6"><a href="movie-list"> <span>Movies</span>
				</a></li>
				<li class="p-3 xl:p-6"><a href="theater-list"> <span>Theaters</span>
				</a></li>
				<li class="p-3 xl:p-6"><a href="show-list"> <span>Shows</span>
				</a></li>
				
			</ul>
		</nav>
		<div
			class="border flex items-center px-4 lg:px-6 xl:px-8 relative z-50">
			<div class="group inline-block relative">
				<button
					class="bg-blue-700 hover:bg-gray-700 text-white font-bold px-4 xl:px-6 py-2 xl:py-3 rounded"
					id="userDropdownButton">
					<c:out value="${user.name}" />
					<i class="fas fa-chevron-down ml-2"></i>
					<!-- Font Awesome icon for dropdown -->
				</button>
				<ul
					class="absolute hidden bg-white text-gray-800 shadow-lg rounded mt-2 py-1 w-32 z-50 right-0"
					id="userDropdownMenu">
					<li><a href="/logout" class="block px-4 py-2 text-sm">Logout</a></li>
				</ul>
			</div>
		</div>
	</header>

	<script>
		document.getElementById('userDropdownButton').addEventListener(
				'click',
				function() {
					document.getElementById('userDropdownMenu').classList
							.toggle('hidden');
				});
	</script>

</body>
</html>
