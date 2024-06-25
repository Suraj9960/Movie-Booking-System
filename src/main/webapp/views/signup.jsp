<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<script src="https://cdn.tailwindcss.com"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
	<div
		class="bg-gradient-to-br from-purple-700 to-pink-500 min-h-screen flex flex-col justify-center items-center">
		<div class="bg-white rounded-lg shadow-lg p-8 max-w-md mt-2">
			<h1 class="text-[22px] font-bold text-center text-red-600 mb-8">Login
				Here .....</h1>
			<c:if test="${param.logout ne null}">
				<div
					class=" mx-auto max-w-xs bg-white border border-gray-200 rounded-xl shadow-lg dark:bg-neutral-800 dark:border-neutral-700"
					role="alert">
					<div class="flex p-4">
						<div class="flex-shrink-0">
							<svg class="flex-shrink-0 size-4 text-teal-500 mt-0.5"
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" viewBox="0 0 16 16">
          <path
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"></path>
        </svg>
						</div>
						<div class="ms-3">
							<p class="text-sm text-green-700 font-bold">Logout
								Successfully</p>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${param.error ne null}">
				<div
					class=" mx-auto max-w-xs bg-white border border-gray-200 rounded-xl shadow-lg dark:bg-neutral-800 dark:border-neutral-700"
					role="alert">
					<div class="flex p-4">
						<div class="flex-shrink-0">
							<svg class="flex-shrink-0 size-4 text-red-500 mt-0.5"
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" viewBox="0 0 16 16">
          <path
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"></path>
        </svg>
						</div>
						<div class="ms-3">
							<p class="text-sm text-red-700 dark:text-neutral-400">Invalid
								Username and Password , Please try again...</p>
						</div>
					</div>
				</div>
			</c:if>

			<form class="space-y-6" action="/signup" method="post">
				<div>
					<label class="block text-gray-700 font-bold mb-2" for="email">
						Username </label> <input
						class="w-full px-4 py-2 rounded-lg border border-gray-400"
						id="email" name="username" type="text">
				</div>
				<div>
					<label class="block text-gray-700 font-bold mb-2" for="password">
						Password </label> <input
						class="w-full px-4 py-2 rounded-lg border border-gray-400"
						id="password" name="password" type="password">
				</div>
				<div>
					<button
						class="w-full bg-purple-700 hover:bg-purple-900 text-white font-bold py-2 px-4 rounded-lg">
						Log In</button>
				</div>
			</form>
			<div class="mt-6 text-blue-700 text-center">
				<a href="/registerForm" class="hover:underline font-bold">New
					User,Sign up Here</a>
			</div>

		</div>
		<a href="/" class=" my-4 rounded-md p-2 bg-yellow-600 text-white"><i
			class="fa-solid fa-circle-left" style="color: #f7f9fd;"></i>&nbsp;Back TO Homepage</a>
	</div>
	
</body>
</html>