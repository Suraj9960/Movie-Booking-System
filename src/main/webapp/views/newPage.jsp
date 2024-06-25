<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.Ticket.Booking.App.serviceDaoImpl.TheaterDaoImpl"%>
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
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:set var="movie" value="${movie}" />
	<c:set var="show" value="${show}" />
	<h1 class="text-center text-[20px] font-bold py-4">Movie Name :
		${movie.movieName}</h1>

	<a href="/user/book-show?id=${movie.id}"
		class="rounded-md mx-[80px] p-2 bg-yellow-600 text-white"><i
		class="fa-solid fa-circle-left" style="color: #f7f9fd;"></i>&nbsp;Back</a>

	<div class="container mt-4 mx-auto mb-4">

		<div class="text-center mb-4">
			<button class="w-12 h-8 bg-black rounded-lg "></button>
			<b class="text-center  px-2">Available</b>
			<button class="w-12 h-8 bg-red-700 rounded-lg"></button>
			<b class=" px-2">Selected</b>
		</div>


		<form action="bookSeats" method="post" id="bookingForm">
			<input type="hidden" name="seatList" value="${seatList}"> <input
				type="hidden" name="currKey" value="${currKey}"> <input
				type="hidden" name="selectedShow" value="${showId}"> <input
				type="hidden" name="tseats" value="${theater_seats}"> <input
				type="hidden" name="dateOfShow" value="${showdate}"> <input
				type="hidden" name="id" value="${movie.id}"> <input
				type="hidden" name="theaterName" value="${tname}"> <input
				type="hidden" name="selectedSeatsCount" id="selectedSeatsCount"
				value="0"> <input type="hidden" name="selectedSeats"
				id="selectedSeats">

			<!-- Ensure theater name, show name, and date are passed as hidden inputs -->
			<p class="text-center my-8 font-bold text-green-700">Theater Name
				: ${tname}</p>
			<div class="text-black">
				<!-- Seat selection checkboxes -->
				<table class="mx-auto">
					<c:forEach items="${currKey}" var="entry">
						<tr>
							<!-- Display the key in the first column -->
							<td>${entry.key}</td>
							<!-- Iterate over the list of integers and display them in subsequent columns -->
							<c:forEach items="${entry.value}" var="seatNumber">
								<td><label class="inline-block mr-2 position-relative">
										<input type="checkbox" name="seat"
										class="w-12 h-12 text-[18px] rounded-full mx-2 my-2 text-center"
										onclick="updateSelectedSeatsCount()"> <span
										class="text-sm position-absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 rounded-md">${entry.key}-${seatNumber}</span>
								</label></td>
							</c:forEach>
						</tr>
					</c:forEach>
				</table>


			</div>


			<!-- Display selected seats count -->
			<p class="p-4">
				<b class="font-bold text-[18px]">Total Selected Seats:</b> <span
					id="selectedSeatsDisplay"><b class="text-red-700">0</b></span>
			</p>
			<!-- Hidden input field to store selected seats -->
			<input type="hidden" name="selectedSeats" id="selectedSeats">

			<button type="submit"
				class=" p-2 bg-red-700 text-white font-bold mx-[220px] rounded-lg">
				Confirm Now&nbsp;<i class="fa-solid fa-circle-right"
					style="color: #e8eaed;"></i>
			</button>
		</form>
	</div>

	<%@include file="footer.jsp"%>
	<script>
		function updateSelectedSeatsCount() {
			var selectedSeatsDisplay = document
					.getElementById("selectedSeatsDisplay");
			var selectedSeatsCount = document
					.getElementById("selectedSeatsCount");
			var selectedSeatsInput = document.getElementById("selectedSeats");
			var selectedSeatsDisplayList = document
					.getElementById("selectedSeatsDisplayList");

			var checkboxes = document.getElementsByName("seat");
			var selectedSeatNumbers = [];
			var count = 0;
			var selectedSeatDetails = [];

			for (var i = 0; i < checkboxes.length; i++) {
				if (checkboxes[i].checked) {
					var seatNumber = checkboxes[i].nextElementSibling.textContent;
					var seatKey = checkboxes[i].closest("tr").firstElementChild.textContent;
					selectedSeatNumbers.push(seatNumber);
					selectedSeatDetails.push(`${seatKey}-${seatNumber}`);
					count++;
				}
			}

			selectedSeatsDisplay.textContent = count;
			selectedSeatsCount.value = count;
			selectedSeatsInput.value = selectedSeatNumbers.join(",");

			// Display selected seats list
			selectedSeatsDisplayList.textContent = selectedSeatDetails
					.join(", ");
		}
	</script>

</body>
</html>
