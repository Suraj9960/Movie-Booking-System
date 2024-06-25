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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" />

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.3/jspdf.umd.min.js"></script>

<title>Ticket</title>
</head>
<body>

	<%@include file="navbar.jsp"%>

	<div class="container">
		<div id="content">
			<div
				class="pdf-content max-w-lg bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700 my-8 mx-auto ">

				<p class="font-bold text-[24px] text-center my-4">Movie Booking
					System</p>

				<a href="#"> <img class="rounded-t-lg"
					src="../image/${movie.movieImageUrl }" alt="" /></a>
				<div class="p-5">
					<h5 class="my-4">
						<b class="text-pink-700">User Name :</b> <b class="text-[14px]">${ticket.username}</b>
					</h5>
					<h5 class="my-4">
						<b class="text-red-700">Movie Name :</b> <b class="text-[14px]">${ticket.moviename}</b>
					</h5>
					<h5 class="my-4 ">
						<b class="text-yellow-600">Show Name :</b> <b>${ticket.show_name}</b>
					</h5>
					<h5 class="my-4 ">
						<b class="text-green-600">Theater Name :</b> <b>${ticket.theater_name}</b>
					</h5>
					<h5 class="my-4">
						<b class="text-blue-600">Selected Seats :</b> <b>${ticket.selectedSeat}</b>
					</h5>
					<h5 class="my-4">
						<b class="text-orange-600">Total Price :</b> <b>${ticket.totalPrice}</b>
					</h5>
					<h5 class="my-4">
						<b class="text-red-700">Date of Show :</b> <b>${ticket.date}</b>
					</h5>
					<h5 class="my-4">
						<b class="text-purple-700">Ticket Status :</b> <b>${ticket.status}</b>
					</h5>
					<h5 class="my-4">
						<b class="text-green-600">Payment Id :</b> <b>${ticket.payment_id}</b>
					</h5>
					<h5 class="my-4">
						<b class="text-orange-600">Order Id :</b> <b>${ticket.bookingId}</b>
					</h5>
				</div>
			</div>
		</div>

		<button id="btn-one"
			class=" mx-[530px] mb-2  inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
			Download Ticket
			<svg class="rtl:rotate-180 w-3.5 h-3.5 ms-2" aria-hidden="true"
				xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
            <path stroke="currentColor" stroke-linecap="round"
					stroke-linejoin="round" stroke-width="2"
					d="M1 5h12m0 0L9 1m4 4L9 9" />
        </svg>
		</button>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"
		integrity="sha512-BNaRQnYJYiPSqHHDb58B0yaPfCu+Wgds8Gp/gU33kqBtgNS4tSPHuGibyoeqMV/TJlSKda6FXzoEyYGjTe+vXA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script>
document.addEventListener('DOMContentLoaded', function () {

	document.querySelector('#btn-one').addEventListener('click', function () {
	    html2canvas(document.querySelector('#content')).then((canvas) => {
	        let base64image = canvas.toDataURL('image/png');
	        // console.log(base64image);
	        let pdf = new jsPDF('l', 'px', [1600, 1131]); // Change 'p' to 'l' for landscape orientation

	        // Calculate position to align image at center
	        let xPos = (pdf.internal.pageSize.width - canvas.width * 0.75) / 2; // Adjust scale factor (0.75) as needed
	        let yPos = 15;

	        // Increase the size of the image and align at center
	        pdf.addImage(base64image, 'PNG', xPos, yPos, canvas.width * 0.75, canvas.height * 0.75); // Adjust scale factor (0.75) as needed

	        pdf.save('Movie_Ticket.pdf');
	    });
	});


});
</script>

</body>
</html>
