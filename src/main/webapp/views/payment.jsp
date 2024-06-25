<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
	integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="../script.js"></script>
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

<title>Payment page</title>


</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="grid sm:px-10 lg:grid-cols-2 lg:px-20 xl:px-32 my-12">
		<div class="px-4 pt-8">
			<p class="text-xl font-medium">Booking Summary</p>
			<div
				class="mt-8 space-y-3 rounded-lg border bg-white px-2 py-4 sm:px-6">
				<div class=" rounded-lg bg-white sm:flex-row">
					<div class="text-center ">
						<img
							class=" h-[150px] w-[300px] rounded-md border object-cover object-center"
							src="../image/${movie.movieImageUrl}" alt="" />
					</div>
					<div class="flex w-full flex-col px-4 py-4 gap-3">
						<span class="font-semibold"><b class="text-red-700">Movie
								Name</b> : ${movie.movieName}</span> <span class="font-semibold"><b
							class="text-green-700">Show Name</b> : ${showName} -- (
							${showStart } , ${showEnd} )</span> <span class="font-semibold"><b
							class="text-yellow-700">Theater Name</b> : ${tname}</span> <span
							class="font-semibold"><b class="text-blue-700">Selected
								Seats</b> : ${selectedSeats}</span> <span class="font-semibold"><b
							class="text-purple-700">Total Price</b> : ${totalPrice}</span>
					</div>
				</div>
			</div>
		</div>
		<div class="mt-10 bg-gray-50 px-4 pt-8 lg:mt-0">
			<p class="text-xl font-medium">Payment Details</p>
			<div class="">
				<label for="email" class="mt-4 mb-2 block text-sm font-medium">Email</label>
				<div class="relative">
					<input type="hidden" id="ticketId" value="${ticketId}" /> <input
						type="email" id="email" name="email" value="${email}"
						class="w-full rounded-md border border-gray-200 px-4 py-3 pl-11 text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500" />
				</div>
				<label for="email" class="mt-4 mb-2 block text-sm font-medium">Total
					Price</label>
				<div class="relative">
					<input type="text" id="payment_field"
						placeholder="Enter amount here" value="${totalPrice}"
						class="w-full rounded-md border border-gray-200 px-4 py-3 pl-11 text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500" />
				</div>
			</div>
			<button onclick="paymentStart()"
				class="mt-4 mb-8 w-full rounded-md bg-gray-900 px-6 py-3 font-medium text-white">Checkout</button>
		</div>
	</div>

	<!-- Include jQuery -->

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

	<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<%@include file="footer.jsp"%>
</body>
</html>