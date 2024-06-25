<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<title>Book Ticket</title>
<style>
/* Styling for the checkbox container */
.seat-selection-container {
	display: grid;
	grid-template-columns: repeat(10, 1fr);
	gap: 5px;
	margin-top: 10px;
}

/* Styling for the checkbox */
.seat-selection-container input[type="checkbox"] {
	display: none; /* Hide the default checkbox */
}

/* Styling for the checkbox label */
.seat-selection-container label {
	display: block;
	width: 30px;
	height: 30px;
	background-color: white;
	border: 2px solid #fff;
	border-radius: 5px;
	text-align: center;
	line-height: 30px;
	cursor: pointer;
}

/* Styling for the checked checkbox label */
.seat-selection-container input[type="checkbox"]:checked+label {
	background-color: white; /* Change background color when checked */
	color: white; /* Change text color when checked */
}
</style>

</head>
<body>
<%@include file="navbar.jsp" %>
	<c:set var="movie" value="${movie}" />
	<h1 class="text-center text-[20px] font-bold py-4">Movie Name :
		${movieName}</h1>



	<a href="/user/bookShow?id=${movie.id}"
		class="bg-yellow-700 p-2 rounded-lg text-white">Back</a>

	<div class="Container mx-auto mx-12 my-2 w-[300px] mb-2">
		<form id="myForm" method="post" action="bookingTickets">
		
				
		<input type="hidden" name="mid" value="${movie.id}"/>
		<input type="hidden" name="mname" value="${movieName}"/>
		<input type="hidden" name="tname" value="${tname}"/>
		<input type="hidden" name="sname" value="${showName}"/>
		<input type="hidden" name="date" value="${date}"/>
		<input type="hidden" name="tprice" value="${tprice}"/>
		<input type="hidden" name="sStart" value="${showStart}"/>
		<input type="hidden" name="SEnd" value="${showEnd}"/>
		<input type="hidden" name="SeatCount" value="${seatCount}"/>
		<input type="hidden" name="totalPrice" value="${totalPrice}"/>
		<input type="hidden" name="currKey" value="${currKey}">
			<c:set var="show" value="${show}" />
			<c:set var="theater" value="${theater}" />
			<input type="hidden" name="showId" value="${show.sid}"> <input
				type="hidden" name="theaterId" value="${theater.tid}">
			<div class="mb-2">
				<label for="date" class="block mb-2 text-sm font-bold">Booking
					Date</label> <input type="text" id="date" name="date" value="${date}"
					class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
					required />
			</div>
			<div class="mb-2">
				<label for="password" class="block mb-2 text-sm font-bold ">Theater
					Name</label> <input type="text" id="password" name="tname" value="${tname}"
					class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
					required />
			</div>
			<div class="mb-2">
				<label for="password" class="block mb-2 text-sm font-bold ">Show
					Time</label> <input type="text" id="password" name="sname" value="${showName}-(${showStart} , ${showEnd })"
					class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
					required />
			</div>
			<div class="mb-2">
				<label for="password" class="block mb-2 text-sm font-bold ">Per
					Seat Ticket Price</label> <input type="number" name="tprice" id="password"
					value="${tprice}"
					class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
					required />
			</div>
			<div class="mb-2">
				<label for="password" class="block mb-2 text-sm font-bold ">Number
					of Seats</label> <input type="number" id="password" name="seatCount" value="${seatCount }" 
					class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
					required />
			</div>
			<div class="mb-2">
				<label for="password" class="block mb-2 text-sm font-bold ">Seat
					Numbers</label> <input type="text" id="password" name="selected" value="${selectedSeats}"
					class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
					required />
			</div>
			
			<button type="submit" class=" rounded-lg mx-[80px] bg-red-600 text-white font-bold py-2 px-2">Book Ticket&nbsp;<i class="fa-solid fa-circle-arrow-right"></i></button>
		</form>
	</div>
	
	<%@include file="footer.jsp" %>
	<script>
		function submitForm() {
			// Submit the form using JavaScript
			document.getElementById("myForm").submit();
		}
	</script>





</body>
</html>