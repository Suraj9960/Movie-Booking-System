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
			<div class="font-bold font-Georgia text-[22px] pt-8">New Release
				Movies</div>
		</div>
		<div>

			<div
				class="p-10 grid grid-cols-1 sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-4 xl:grid-cols-4 gap-5">
				<!--Card 1-->
				<c:forEach items="${movies}" var="movie">
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