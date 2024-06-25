<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Page</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
	<%@include file="adminNavbar.jsp"%>
	<div class="container mx-auto px-4 mt-10">
		<div class="text-right">
			<button data-modal-target="authentication-modal-int"
				data-modal-toggle="authentication-modal"
				class="bg-red-500 text-white px-2 py-2 rounded" type="button">Add
				New Show</button>
		</div>
		<div class="text-center">
			<c:if test="${not empty succMsg}">
				<div
					class="mx-auto max-w-xs bg-white border border-gray-200 rounded-xl shadow-lg dark:bg-neutral-800 dark:border-neutral-700"
					role="alert">
					<div class="flex p-4">
						<div class="flex-shrink-0">
							<svg class="flex-shrink-0 size-4 text-teal-500 mt-0.5"
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" viewBox="0 0 16 16">
                                <path
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z">
                                </path>
                            </svg>
						</div>
						<div class="ms-3">
							<p class="text-sm text-green-700 font-bold">${succMsg }</p>
						</div>
					</div>
				</div>
				<c:remove var="succMsg" scope="session" />
			</c:if>
			<c:if test="${not empty failMsg}">
				<div
					class="mx-auto max-w-xs bg-white border border-gray-200 rounded-xl shadow-lg dark:bg-neutral-800 dark:border-neutral-700"
					role="alert">
					<div class="flex p-4">
						<div class="flex-shrink-0">
							<svg class="flex-shrink-0 size-4 text-red-500 mt-0.5"
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" viewBox="0 0 16 16">
                                <path
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z">
                                </path>
                            </svg>
						</div>
						<div class="ms-3">
							<p class="text-sm text-red-700 dark:text-neutral-400">${failMsg }</p>
						</div>
					</div>
				</div>
				<c:remove var="failedMsg" scope="session" />
			</c:if>
			<h1
				class="py-4 text-green-700 text-3xl font-bold border-b-2 border-black">All
				Shows</h1>
			<div class="overflow-x-auto">
				<table
					class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
					<thead class="font-bold text-black">
						<tr>
							<th scope="col" class="px-6 py-3">Show name</th>
							<th scope="col" class="px-6 py-3">Start Time</th>
							<th scope="col" class="px-6 py-3">End Time</th>
							<th scope="col" class="px-6 py-3">Details</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${shows}" var="show">
							<tr class="text-black">
								<td class="px-6 py-4">${show.showName }</td>
								<td class="px-6 py-4">${show.showStartTime }</td>
								<td class="px-6 py-4">${show.showEndTime }</td>
								<td class="px-6 py-4"><a href="delete-show?id=${show.sid }"
									class="bg-red-700 py-2 px-2 text-white"><i
										class="fa-solid fa-trash"></i>&nbsp;Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- Main modal for add shows -->
	<div id="authentication-modal-int" tabindex="-1" aria-hidden="true"
		class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 bottom-0 left-0 z-50 flex justify-center items-center bg-gray-900 bg-opacity-50">
		<div class="relative p-4 w-full max-w-md">
			<!-- Modal content -->
			<div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
				<!-- Modal header -->
				<div
					class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600 my-4">
					<h3
						class="text-center text-xl font-semibold text-gray-900 dark:text-white">
						Add Shows</h3>
					<button type="button"
						class="end-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"
						data-modal-hide="authentication-modal-int">
						<svg class="w-3 h-3" aria-hidden="true"
							xmlns="http://www.w3.org/2000/svg" fill="none"
							viewBox="0 0 14 14">
                            <path stroke="currentColor"
								stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
								d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                        </svg>
						<span class="sr-only">Close modal</span>
					</button>
				</div>
				<!-- Modal body for adding new movie -->
				<div class="p-4 md:p-5">
					<form class="px-2 py-4 max-w-md mx-auto" action="add-show"
						method="post">
						<div class="relative z-0 w-full mb-5 group">
							<input type="text" name="showName" id="showName"
								class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
								placeholder=" " />
							<label for="showName"
								class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Show
								Name</label>
						</div>
						<div class="relative z-0 w-full mb-5 group">
							<input type="date" name="dateOfShow" id="dateOfShow"
								class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
								placeholder=" "  />
							<label for="dateOfShow"
								class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Date
								of Show</label>
						</div>
						<div class="relative z-0 w-full mb-5 group">
							<input type="time" name="showStartTime" id="showStartTime"
								class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
								placeholder=" " />
							<label for="showStartTime"
								class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Start
								Time</label>
						</div>
						<div class="relative z-0 w-full mb-5 group">
							<input type="time" name="showEndTime" id="showEndTime"
								class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
								placeholder=" "  />
							<label for="showEndTime"
								class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">End
								Time</label>
						</div>
						<div class="relative z-0 w-full mb-5 group">
							<label for="theaterId">Select Theater:</label><br> <select
								id="theaterId" name="theaterId"
								class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer">
								<option value="">Select Theater</option>
								<c:forEach items="${theaters}" var="theater">
									<option value="${theater.tid}">${theater.tid}-
										${theater.tname}</option>
								</c:forEach>
							</select>
						</div>
						<div class="relative z-0 w-full mb-5 group">
							<label for="movieId">Select Movie:</label><br> <select
								id="movieId" name="movieId"
								class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer">
								<option value="">Select Movie</option>
								<c:forEach items="${movies}" var="movie">
									<option value="${movie.id}">${movie.id}-
										${movie.movieName}</option>
								</c:forEach>
							</select>
						</div>
						<button type="submit"
							class="my-2 mx-auto text-white bg-green-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Add
							Show</button>
					</form>
				</div>
			</div>
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
