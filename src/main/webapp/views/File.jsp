<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Responsive Carousel</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer">
<style>
.carousel-item {
	text-align: center;
	width: 100%;
}

.carousel-item img {
	width: 98%;
	height: 350px; /* You can adjust the height as needed */
	/* Ensure images maintain aspect ratio and cover the container */
	margin: 10px;
	margin-left: 13px;
	border-radius: 30px;
}

.carousel-item h2 {
	color: #fff;
	font-size: 28px;
	margin-bottom: 20px;
}

.watch-trailer-btn {
	background-color: #ea0606;
	color: #fff;
	border: none;
	border-radius: 50px;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
}
</style>
</head>
<body>
	<div id="carouselExampleIndicators" class="carousel slide mb-2 mt-4 mx-12"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<c:forEach items="${movies}" var="movie" varStatus="status">
				<div class="carousel-item${status.index == 0 ? ' active' : ''}">
					<div class="position-relative">
						<img src="../image/${movie.movieImageUrl}" class=""
							alt="Image ${status.index + 1}">
						<div class="content absolute left-0 top-20 mx-[200px]">
							<h2 class="font-bold mb-3 font-serif text-[28px]">${movie.description}</h2>
							<button data-modal-target="authentication-modal-${status.index}"
								type="button"
								class="watch-trailer-btn text-Sans-serif font-bold ">
								<i class="fa-solid fa-circle-play" style="color: #eaecf1;"></i>&nbsp;Watch
								Trailer
							</button>
						</div>

						<div id="authentication-modal-${status.index}" tabindex="-1"
							aria-hidden="true"
							class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 bottom-0 left-0 z-50 flex justify-center items-center bg-gray-900 bg-opacity-50 w-[]">
							<div class="p-4 fixed inset-0 flex justify-center items-center">
								<div class="bg-white rounded-lg shadow w-[1000px] h-[500px]">
									<div class="flex items-center justify-between p-4 border-b">
										<h3 class="text-center text-xl font-semibold text-gray-900">Movie:
											${movie.movieName}</h3>
										<button type="button"
											onclick="closeModal('authentication-modal-${status.index}')"
											class="text-gray-400 hover:bg-gray-200 hover:text-gray-900 rounded-lg p-2">
											<i class="fas fa-times"></i> <span class="sr-only">Close
												modal</span>
										</button>
									</div>
									<div class="p-4">
										<iframe width="100%" height="315" src="${movie.trailerUrl}"
											frameborder="0" allowfullscreen></iframe>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<script>
    const modalToggleButtons = document.querySelectorAll('.watch-trailer-btn');

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

    function closeModal(modalId) {
        const modal = document.getElementById(modalId);
        if (modal) {
            modal.classList.add('hidden');
            modal.setAttribute('aria-hidden', 'true');
        }
    }
</script>
</body>
</html>
