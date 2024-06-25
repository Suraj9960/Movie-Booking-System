<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.tailwindcss.com"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<%@include file="navbar.jsp"%>
<body>

	<c:if test="${not empty failedMsg}">
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
					<p class="text-sm text-red-700 dark:text-neutral-400">${failedMsg }</p>
				</div>
			</div>
		</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<div
		class="max-w-4xl flex items-center h-auto  flex-wrap mx-auto my-32 lg:my-0 mt-12">

		<!--Main Col-->
		<div id="profile"
			class=" mt-12 w-full lg:w-3/5 rounded-lg lg:rounded-l-lg lg:rounded-r-none shadow-2xl bg-white opacity-75 mx-6 lg:mx-0">


			<div class="p-4 md:p-12 text-center lg:text-left">
				<!-- Image for mobile view-->

				<h1 class="text-3xl font-bold pt-8 lg:pt-0">${user.name}</h1>
				<div
					class="mx-auto lg:mx-0 w-4/5 pt-3 border-b-2 border-green-500 opacity-25"></div>
				<p
					class="pt-4 text-base font-bold flex items-center justify-center lg:justify-start">
					<svg class="h-4 fill-current text-green-700 pr-4"
						xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                        <path
							d="M9 12H1v6a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-6h-8v2H9v-2zm0-1H0V5c0-1.1.9-2 2-2h4V2a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v1h4a2 2 0 0 1 2 2v6h-9V9H9v2zm3-8V2H8v1h4z" />
                    </svg>
					${user.username}
				</p>
				<p
					class="pt-4 text-base font-bold flex items-center justify-center lg:justify-start">
					<svg class="h-4 fill-current text-green-700 pr-4"
						xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                        <path
							d="M9 12H1v6a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-6h-8v2H9v-2zm0-1H0V5c0-1.1.9-2 2-2h4V2a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v1h4a2 2 0 0 1 2 2v6h-9V9H9v2zm3-8V2H8v1h4z" />
                    </svg>
					${user.email}
				</p>
				<p
					class="pt-4 text-gray-600 text-xs lg:text-sm flex items-center justify-center lg:justify-start">
					<svg class="h-4 fill-current text-green-700 pr-4"
						xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                        <path
							d="M10 20a10 10 0 1 1 0-20 10 10 0 0 1 0 20zm7.75-8a8.01 8.01 0 0 0 0-4h-3.82a28.81 28.81 0 0 1 0 4h3.82zm-.82 2h-3.22a14.44 14.44 0 0 1-.95 3.51A8.03 8.03 0 0 0 16.93 14zm-8.85-2h3.84a24.61 24.61 0 0 0 0-4H8.08a24.61 24.61 0 0 0 0 4zm.25 2c.41 2.4 1.13 4 1.67 4s1.26-1.6 1.67-4H8.33zm-6.08-2h3.82a28.81 28.81 0 0 1 0-4H2.25a8.01 8.01 0 0 0 0 4zm.82 2a8.03 8.03 0 0 0 4.17 3.51c-.42-.96-.74-2.16-.95-3.51H3.07zm13.86-8a8.03 8.03 0 0 0-4.17-3.51c.42.96.74 2.16.95 3.51h3.22zm-8.6 0h3.34c-.41-2.4-1.13-4-1.67-4S8.74 3.6 8.33 6zM3.07 6h3.22c.2-1.35.53-2.55.95-3.51A8.03 8.03 0 0 0 3.07 6z" />
                    </svg>
					Your Location - ${user.address}
				</p>
				<p class="pt-8 text-sm">Totally optional short description about
					yourself, what you do and so on.</p>

				<div class="pt-12 pb-8">
					<button data-modal-target="authentication-modal-int"
						data-modal-toggle="authentication-modal"
						class=" font-bold bg-green-700 text-white p-2 rounded-full"
						type="button">Update Profile</button>
				</div>

				<!-- Use https://simpleicons.org/ to find the svg for your preferred product -->

			</div>

		</div>

		<!--Img Col-->
		<div class="w-full lg:w-2/5">
			<!-- Big profile image for side bar (desktop) -->
			<img src="../UserImage/${user.imageUrl }"
				class="rounded-none lg:rounded-lg shadow-2xl hidden lg:block">
			<!-- Image from: http://unsplash.com/photos/MP0IUfwrn0A -->

		</div>


		<!-- Pin to top right corner -->
		<div class="absolute top-0 right-0 h-12 w-18 p-4">
			<button class="js-change-theme focus:outline-none">🌙</button>
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
						Update User Profile</h3>
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
					<form class="px-2 py-4 max-w-md mx-auto" action="update-profile"
						method="post">
						<input type="hidden" name="id" value="${user.id}">
						<div class="relative z-0 w-full mb-5 group">
							<input type="text" name="name" id="showName"
								value="${user.name }"
								class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
								placeholder=" " /> <label for="showName"
								class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Full
								Name </label>
						</div>
						<div class="relative z-0 w-full mb-5 group">
							<input type="text" name="username" id="showName"
								value="${user.username }"
								class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
								placeholder=" " /> <label for="showName"
								class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Username
							</label>
						</div>
						<div class="relative z-0 w-full mb-5 group">
							<input type="email" name="email" id="showName"
								value="${user.email }"
								class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
								placeholder=" " /> <label for="showName"
								class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">User
								Email </label>
						</div>
						<div class="relative z-0 w-full mb-5 group">
							<input type="password" name="password" id="showName" value="${user.password }"
								class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
								placeholder=" " /> <label for="showName"
								class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Password
							</label>
						</div>
						<div class="relative z-0 w-full mb-5 group">
							<input type="password" name="cPassword" id="showName"value="${user.password }"
								class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
								placeholder=" " /> <label for="showName"
								class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Confirm
								Password </label>
						</div>
						<button type="submit"
							class="my-2 mx-auto text-white bg-green-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Update
							Profile</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="https://unpkg.com/popper.js@1/dist/umd/popper.min.js"></script>
	<script src="https://unpkg.com/tippy.js@4"></script>
	<script>
        //Init tooltips
		tippy('.link',{
		  placement: 'bottom'
		})

		//Toggle mode
		const toggle = document.querySelector('.js-change-theme');
		const body = document.querySelector('body');
		const profile = document.getElementById('profile');
		
		
		toggle.addEventListener('click', () => {

		  if (body.classList.contains('text-gray-900')) {
			toggle.innerHTML = "☀️";
			body.classList.remove('text-gray-900');
			body.classList.add('text-gray-100');
			profile.classList.remove('bg-white');
			profile.classList.add('bg-gray-900');
		  } else
		  {
			toggle.innerHTML = "🌙";
			body.classList.remove('text-gray-100');
			body.classList.add('text-gray-900');
			profile.classList.remove('bg-gray-900');			
			profile.classList.add('bg-white');
			
		  }
		});
		
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