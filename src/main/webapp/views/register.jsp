<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
	<div
		class="bg-gradient-to-br from-purple-700 min-h-screen bg-gray-50 flex flex-col justify-center py-12 sm:px-6 lg:px-8">
		<div class="sm:mx-auto sm:w-full sm:max-w-md">
			<img class="mx-auto h-10 w-auto"
				src="https://www.svgrepo.com/show/301692/login.svg" alt="Workflow">
			<h2
				class="mt-6 text-center text-3xl leading-9 font-extrabold text-gray-900">
				Create a new account</h2>
			<p class="mt-2 text-center text-md leading-5 text-gray-700 max-w">
				Or <a href="/signup"
					class="font-medium text-white hover:text-blue-500 focus:outline-none focus:underline transition ease-in-out duration-150">
					login to your account </a>
			</p>
		</div>

		<div class="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
			<div class="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
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
				<c:if test="${not empty failedMsg}">
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
								<p class="text-sm text-red-700 dark:text-neutral-400">${failedMsg }</p>
							</div>
						</div>
					</div>
					<c:remove var="failedMsg" scope="session" />
				</c:if>
				<form method="post" action="do-register"
					enctype="multipart/form-data">
					<div>
						<label for="email"
							class="block text-sm font-medium leading-5  text-gray-700">Name</label>
						<div class="mt-1 relative rounded-md shadow-sm">
							<input id="name" name="name" placeholder="John Doe" type="text"
								value="${user.name}"
								class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5">
							<c:if test="${not empty name}">
								<c:forEach items="${name}" var="error">
									<p class="my-1 text-red-700 text-[12px]">${error.defaultMessage}</p>
								</c:forEach>
							</c:if>
							<div
								class="hidden absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
								<svg class="h-5 w-5 text-red-500" fill="currentColor"
									viewBox="0 0 20 20">
                                <path fill-rule="evenodd"
										d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z"
										clip-rule="evenodd">
                                </path>
                            </svg>
							</div>
						</div>
					</div>

					<div class="mt-6">
						<label for="password_confirmation"
							class="block text-sm font-medium leading-5 text-gray-700">
							Username </label>
						<div class="mt-1 rounded-md shadow-sm">
							<input id="password_confirmation" name="username" type="text"
								value="${user.username}"
								class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5">
							<c:if test="${not empty username}">

								<p class="my-1 text-red-700 text-[12px]">${username.defaultMessage}</p>
							</c:if>
						</div>
					</div>

					<div class="mt-6">
						<label for="email"
							class="block text-sm font-medium leading-5  text-gray-700">
							Email address </label>
						<div class="mt-1 relative rounded-md shadow-sm">
							<input id="email" name="email" placeholder="user@example.com"
								type="email" value="${user.email}"
								class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5">
							<c:if test="${not empty email}">

								<p class="my-1 text-red-700 text-[12px]">${email.defaultMessage}</p>
							</c:if>

							<div
								class="hidden absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
								<svg class="h-5 w-5 text-red-500" fill="currentColor"
									viewBox="0 0 20 20">
                                <path fill-rule="evenodd"
										d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z"
										clip-rule="evenodd"></path>
                            </svg>
							</div>
						</div>
					</div>

					<div class="mt-6">
						<label for="password"
							class="block text-sm font-medium leading-5 text-gray-700">
							Password </label>
						<div class="mt-1 rounded-md shadow-sm">
							<input id="password" name="password" type="password"
								class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5">
							<c:if test="${not empty password}">

								<p class="my-1 text-red-700 text-[12px]">${password.defaultMessage}</p>
							</c:if>
						</div>
					</div>

					<div class="mt-6">
						<label for="password_confirmation"
							class="block text-sm font-medium leading-5 text-gray-700">
							Confirm Password </label>
						<div class="mt-1 rounded-md shadow-sm">
							<input id="password_confirmation" name="confirmPassword"
								type="password"
								class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5">
							<c:if test="${not empty Cpassword}">
								<p class="my-1 text-red-700 text-[12px]">${Cpassword.defaultMessage}</p>
							</c:if>
						</div>
					</div>
					<div class="mt-6">
						<label for="password_confirmation"
							class="block text-sm font-medium leading-5 text-gray-700">
							Upload Photo </label>
						<div class="mt-1 rounded-md shadow-sm">
							<input id="password_confirmation" name="imageUrl" type="file"
								value="${user.imageUrl}"
								class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5">
						</div>
					</div>
					<div class="mt-6">
						<label for="password_confirmation"
							class="block text-sm font-medium leading-5 text-gray-700">
							Address </label>
						<div class="mt-1 rounded-md shadow-sm">
							<input id="password_confirmation" name="address" type="text"
								value="${user.address}"
								class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5">
						</div>
					</div>
					<div class="mt-6">
						<input type="checkbox" class="form-check-input" id="exampleCheck1"
							name="checked"> <label class="form-check-label"
							for="exampleCheck1">Check me out</label>

					</div>

					<div class="mt-6">
						<span class="block w-full rounded-md shadow-sm">
							<button type="submit"
								class="w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition duration-150 ease-in-out">
								Create account</button>
						</span>
					</div>
				</form>

			</div>
		</div>
		<div class="text-center mt-4">
			<a href="/"
				class=" w-[200px] my-4  rounded-md p-2 bg-yellow-600 text-white"><i
				class="fa-solid fa-circle-left" style="color: #f7f9fd;"></i>&nbsp;Back
				TO Homepage</a>
		</div>
	</div>

</body>
</html>