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

<link rel="stylesheet" href="../views/css/indexPage.css" />

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
	<h1 class="text-center text-[18px] font-bold my-2 py-4">Display
		Movie Details</h1>
	<a href="/user/index"
		class="rounded-md mx-[80px] p-2 bg-yellow-600 text-white"><i
		class="fa-solid fa-circle-left" style="color: #f7f9fd;"></i>&nbsp;Back</a>
	<div class="container mt-12 flex">

		<div class="mx-12">
			<c:set var="movie" value="${movie}" />
			<div class="text-center rounded-lg ">
				<img class="rounded-lg  " src="../image/${movie.movieImageUrl}" />
			</div>

		</div>
		<c:set var="movie" value="${movie}" />
		<div class=" my-4 mx-12">
			<p class="py-2 ">
				<b class="text-[16px] font-bold">Movie Name : </b>${movie.movieName }</p>
			<p class="py-2 ">
				<b class="text-[16px] font-bold">Release Date : </b>${movie.releaseDate }</p>
			<p class="py-2 ">
				<b class="text-[16px] font-bold">Language : </b>${movie.language }</p>
			<p class="py-2">
				<b class="text-[16px] font-bold">Director : </b>${movie.director}</p>
			<p class="py-2 ">
				<b class="text-[16px] font-bold">Actor : </b>${movie.actor}</p>
			<p class="py-2">
				<b class="text-[16px] font-bold">Actress : </b>${movie.actress }</p>
			<p class="py-2">
				<b class="text-[16px] font-bold">Description : </b>${movie.description }</p>
			<p class="py-2">
				<b class="text-[16px] font-bold">Duration : </b>${movie.duration }</p>
			<p class="py-2">
				<b class="text-[16px] font-bold">Trailer : </b>
				<button data-modal-target="authentication-modal-int"
					data-modal-toggle="authentication-modal" type="button">Show
					Trailer</button>
			</p>
			<div id="authentication-modal-int" tabindex="-1" aria-hidden="true"
				class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 bottom-0 left-0 z-50 flex justify-center items-center bg-gray-900 bg-opacity-50 w-[]">
				<div class="p-4 fixed inset-0 flex justify-center items-center">
					<div class="bg-white rounded-lg shadow w-[1000px] h-[500px]">
						<div class="flex items-center justify-between p-4 border-b">
							<h3 class="text-center text-xl font-semibold text-gray-900">Movie:
								${movie.movieName}</h3>
							<button type="button"
								class="end-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"
								data-modal-hide="authentication-modal-int">
								<svg class="w-3 h-3" aria-hidden="true"
									xmlns="http://www.w3.org/2000/svg" fill="none"
									viewBox="0 0 14 14">
                        <path stroke="currentColor"
										stroke-linecap="round" stroke-linejoin="round"
										stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                    </svg>
								<span class="sr-only">Close modal</span>
							</button>
						</div>
						<div class="p-4">
							<iframe width="100%" height="315" src="${movie.trailerUrl}"
								frameborder="0" allowfullscreen></iframe>
						</div>
					</div>
				</div>
			</div>
			<button
				class="bg-green-600 text-white p-2 my-4 mx-[70px] text-mono font-bold rounded-md"
				type="submit">
				<a href="book-show?id=${movie.id }">Book Show</a>&nbsp;<i
					class="fa-solid fa-circle-right" style="color: #e8eaed;"></i>
			</button>

		</div>
	</div>

	<!-- JavaScript to handle modal toggling -->
	<script>
    const modalToggleButtons = document.querySelectorAll('[data-modal-toggle]');

    modalToggleButtons.forEach(button => {
        button.addEventListener('click', () => {
            const modalId = button.dataset.modalTarget;
            const modal = document.getElementById(modalId);

            if (modal) {
                modal.classList.toggle('hidden');
                modal.setAttribute('aria-hidden', modal.classList.contains('hidden'));
            }
        });
    });

    // JavaScript to handle modal closing
    const modalHideButtons = document.querySelectorAll('[data-modal-hide]');

    modalHideButtons.forEach(button => {
        button.addEventListener('click', () => {
            const modalId = button.dataset.modalHide;
            const modal = document.getElementById(modalId);

            if (modal) {
                modal.classList.add('hidden');
                modal.setAttribute('aria-hidden', 'true');
            }
        });
    });
</script>

</body>
</html>