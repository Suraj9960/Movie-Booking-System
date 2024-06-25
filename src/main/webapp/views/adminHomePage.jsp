<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script src="https://cdn.tailwindcss.com"></script>
<title>Ticket Booking App</title>
<style>
* {
	font-family: "Poppins", sans-serif;
}
</style>
</head>
<body>
<%@include file="adminNavbar.jsp" %>
	<div class="flex">
		<!-- sidebar -->
		<div class="w-64 h-screen overflow-hidden">
			<div class="flex flex-col justify-between h-full px-5 py-8">
				<div class="mx-auto">

					<!-- menu items -->
					<div class="mx-auto mt-14 text-center">
						<a href="homePage"
							class="flex items-center gap-2 text-black  mb-3 hover:bg-red-700 px-2 py-2 rounded-md hover:text-white ">
							<i class="fa-solid fa-circle-user"></i>&nbsp;Admin Dashboard
						</a> <a href="movie-list"
							class="flex items-center gap-2 text-black mb-3 hover:bg-red-700 px-2 py-2 rounded-md hover:text-white">
							<i class="fa-solid fa-film"></i>&nbsp;Movies
						</a> <a href="theater-list"
							class="flex items-center gap-2 text-black mb-3 hover:bg-red-700 px-2 py-2 rounded-md hover:text-white">
							<i class="fa-solid fa-box"></i>&nbsp;Theaters
						</a> <a href="show-list"
							class="flex items-center gap-2 text-black mb-3 hover:bg-red-700 px-2 py-2 rounded-md hover:text-white">
							<i class="fa-brands fa-youtube"></i>&nbsp;Shows
						</a>
						 <a href="booking-list"
							class="flex items-center gap-2 text-black mb-3 hover:bg-red-700 px-2 py-2 rounded-md hover:text-white">
							<i class="fa-solid fa-ticket"></i>&nbsp;All Bookings
						</a>
						 <a href="user-transctions"
							class="flex items-center gap-2 text-black mb-3 hover:bg-red-700 px-2 py-2 rounded-md hover:text-white">
							<i class="fa-solid fa-ticket"></i>&nbsp;All Transactions
						</a>
						 <a href="user-list"
							class="flex items-center gap-2 text-black mb-3 hover:bg-red-700 px-2 py-2 rounded-md hover:text-white">
							<i class="fa-solid fa-users"></i>&nbsp;All Users
						</a>
						 <a href="/logout"
							class="flex items-center gap-2 text-black mb-3 hover:bg-red-700 px-2 py-2 rounded-md hover:text-white">
							<i class="fa-solid fa-right-from-bracket"></i>&nbsp;Logout
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- main -->
		<div class="bg-red-50 w-full h-screen overflow-y-scroll p-8">
			<!-- top bar -->
			
			<div class="flex items-center gap-5 justify-center text-center mt-[100px]">
			<div class="bg-gray-200 w-[210px] h-[120px] rounded-md ">
			<p class="mt-8 font-bold py-1">${Mcount}</p>
			<p class="font-bold text-red-700">Movies</p>
			</div>
			<div class="bg-gray-200 w-[210px] h-[120px] rounded-md ">
			<p class="mt-8 font-bold py-1">${Tcount}</p>
			<p class="font-bold text-blue-700">Theaters</p>
			</div>
			</div>
			
		</div>
	</div>
</body>
</html>