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

	<!-- ==============================   Popular Movies Section   ================================ -->

	<div class="container  mx-auto">
		<div class="flex justify-between">
			<div class="font-bold font-Georgia text-[22px] pt-8">New
				Release Movies</div>
		</div>
		<div>

			<c:if test="${noMovieFound}">
				<div class="text-center mx-[450px]">
					<img class="text-center w-[300px] "
						src="data:image/jpeg;base64,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">
				</div>
				<p class="text-center  text-red-700 text-[20px] font-bold">!! NO
					MOVIE FOUND !!</p>
				<p class="text-center mt-4">
					<a href="../user/index"
						class="font-bold bg-green-700 text-white p-2 rounded-full ">!!
						Go To Home & Enjoy !!</a>
				</p>
			</c:if>
			<div
				class="p-10 grid grid-cols-1 sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-4 xl:grid-cols-4 gap-5">

				<!--Card 1-->
				<c:forEach items="${foundMovie}" var="movie">
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

	<%@include file="footer.jsp"%>

</body>
</html>