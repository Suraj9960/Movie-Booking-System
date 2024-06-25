<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.tailwindcss.com"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
	integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet" href="../views/css/indexPage.css" />

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">



<title>Movie Ticket Booking System</title>

</head>
<body>
	<%@include file="navbar.jsp"%>
	<%@include file="File.jsp"%>

	<!-- ==============================   Popular Movies Section   ================================ -->

	<div class="container  mx-auto">
		<div class="flex justify-between">
			<div class="font-bold font-Georgia text-[22px] pt-8">POPULAR
				MOVIES</div>
			<div class="text-white font-bold text-[16px] py-4">
				<a class="bg-yellow-700 p-2 rounded-md" href="show-movie">Show
					All&nbsp;<i class="fa-regular fa-circle-right"
					style="color: #f0f2f5;"></i>
				</a>
			</div>
		</div>
		<div>

			<div
				class="p-10 grid grid-cols-1 sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-4 xl:grid-cols-4 gap-5">
				<!--Card 1-->
				<c:forEach items="${firstFourMovies}" var="movie">
					<div
						class="relative rounded overflow-hidden shadow-lg bg-cover bg-center h-[300px] w-full"
						style="background-image: url('../image/${movie.movieImageUrl}');">
						<div class="absolute inset-0 flex flex-col justify-between">
							<!-- Centered content -->
							<a href="/ticketBook">
								<div class="flex justify-center items-center h-full">
									<a href="book-ticket?id=${movie.id }"
										class="text-white hover:text-gray-300"> <i
										class="far fa-circle-play text-4xl"></i>
									</a>
								</div>
							</a>
							<!-- Bottom-left content -->
							<div class="p-2 font-serif text-[14px] font-bold">
								<h3 class="text-white">${movie.movieName}</h3>
								<p class="text-white">
									<i class="fa-solid fa-clock" style="color: #e8eaed;"></i>&nbsp;${movie.duration}
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>
	</div>
	<!-- ==============================   New Release Movies   ================================ -->
	<div class="flex justify-between mx-12 mb-4">
		<div class="font-bold font-Georgia text-[22px] pt-8 ">NEW
			RELEASE MOVIES</div>
		<div class="text-white font-bold text-[16px] py-4">
			<a class="bg-yellow-700 p-2 rounded-md" href="show-movie">Show
				All&nbsp;<i class="fa-regular fa-circle-right"
				style="color: #f0f2f5;"></i>
			</a>
		</div>
	</div>

	<div id="carouselExampleFade"
		class="carousel slide carousel-fade mb-12" data-bs-ride="carousel"
		data-bs-interval="3000">
		<div class="carousel-inner">
			<!-- Iterate over movies and generate carousel items -->
			<c:forEach items="${movies}" var="currentMovie" varStatus="status">
				<!-- Check if it's the first movie or a multiple of 4 to start a new carousel item -->
				<c:if test="${status.index == 0 || status.index % 4 == 0}">
					<div class="carousel-item ${status.index == 0 ? 'active' : ''}">
						<div class="container">
							<div class="row">
				</c:if>
				<!-- Generate card for the current movie -->
				<div class="col-md-3">
					<div
						class="card w-[300px] d-flex flex-column justify-content-between bg-black text-white">
						<!-- Image at the top -->
						<img src="../image/${currentMovie.movieImageUrl}"
							class="card-img-top w-[100%] max-h-[200px] mx-auto rounded-0 mt-0 ml-0 mr-0"
							alt="Movie Image">
						<!-- Content in the middle -->
						<div class="text-center">
							<!-- Center the movie name -->
							<h5 class="card-title font-bold text-[20px] ">${currentMovie.movieName}</h5>
						</div>
						<div
							class="card-body d-flex justify-content-between align-items-center">
							<div class="text-start px-1">
								<!-- Align the first element to the left -->
								<h5 class="card-title text-[14px]">${currentMovie.language }</h5>
							</div>
							<div class="text-end px-1">
								<!-- Align the second element to the right -->
								<p class="card-text text-[14px]">
									<i class="fa-regular fa-clock"></i>&nbsp;${currentMovie.duration}
								</p>
							</div>
						</div>



						<!-- Button at the bottom -->
						<div class="card-footer text-center mb-2">
							<a href="book-ticket?id=${currentMovie.id}"
								class="bg-red-600 p-2 rounded-md  ">Book Tickets&nbsp;<i class="fa-solid fa-circle-arrow-right" style="color: #efeff1;"></i></a>
						</div>
					</div>
				</div>
				<!-- Check if it's the last movie or the fourth movie in the set to close the carousel item -->
				<c:if
					test="${status.index == movies.size() - 1 || (status.index + 1) % 4 == 0}">
		</div>
	</div>
	</div>
	</c:if>
	</c:forEach>
	</div>

	<!-- Carousel controls -->

	</div>

	<%@include file="footer.jsp"%>

</body>
</html>