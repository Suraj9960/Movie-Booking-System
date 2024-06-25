<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Page</title>
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<%@include file="adminNavbar.jsp"%>

<div class="mt-10 mx-auto max-w-lg px-4">
    <h1 class="text-center text-3xl font-bold mb-8">Add New Movie</h1>
    <form action="add-movie" method="post" enctype="multipart/form-data">
        <div class="mb-4">
            <label for="movieName" class="block text-sm font-semibold text-gray-700">Movie Name</label>
            <input id="movieName" type="text" name="movieName" placeholder="Enter Movie Name"
                class="block w-full mt-1 px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500">
        </div>
        <div class="mb-4">
            <label for="releaseDate" class="block text-sm font-semibold text-gray-700">Release Date</label>
            <input id="releaseDate" type="date" name="releaseDate" placeholder="Select date"
                class="block w-full mt-1 px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500">
        </div>
        <div class="flex flex-wrap -mx-3 mb-6">
            <div class="w-full md:w-1/2 px-3 mb-4">
                <label for="language" class="block text-sm font-semibold text-gray-700">Language Type</label>
                <input id="language" type="text" name="language" placeholder="Enter language of Movie"
                    class="block w-full mt-1 px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500">
            </div>
            <div class="w-full md:w-1/2 px-3 mb-4">
                <label for="director" class="block text-sm font-semibold text-gray-700">Director</label>
                <input id="director" type="text" name="director" placeholder="Enter Director Name"
                    class="block w-full mt-1 px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500">
            </div>
            <div class="w-full md:w-1/2 px-3 mb-4">
                <label for="actor" class="block text-sm font-semibold text-gray-700">Actors</label>
                <input id="actor" type="text" name="actor" placeholder="Enter Actors Name"
                    class="block w-full mt-1 px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500">
            </div>
            <div class="w-full md:w-1/2 px-3 mb-4">
                <label for="actress" class="block text-sm font-semibold text-gray-700">Actress</label>
                <input id="actress" type="text" name="actress" placeholder="Enter Actress Name"
                    class="block w-full mt-1 px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500">
            </div>
            <div class="w-full md:w-1/2 px-3 mb-4">
                <label for="description" class="block text-sm font-semibold text-gray-700">Description</label>
                <input id="description" type="text" name="description" placeholder="Enter Movie Description"
                    class="block w-full mt-1 px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500">
            </div>
            <div class="w-full md:w-1/2 px-3 mb-4">
                <label for="duration" class="block text-sm font-semibold text-gray-700">Duration</label>
                <input id="duration" type="text" name="duration" placeholder="Enter Movie Duration"
                    class="block w-full mt-1 px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500">
            </div>
            <div class="w-full px-3 mb-4">
                <label for="trailerUrl" class="block text-sm font-semibold text-gray-700">Trailer Url</label>
                <input id="trailerUrl" type="text" name="trailerUrl" placeholder="Enter Trailer Url"
                    class="block w-full mt-1 px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500">
            </div>
            <div class="w-full px-3 mb-4">
                <label for="movieImageUrl" class="block text-sm font-semibold text-gray-700">Upload Movie Photo</label>
                <input id="movieImageUrl" type="file" name="movieImageUrl"
                    class="block w-full mt-1 px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500">
            </div>
        </div>
        <button type="submit"
            class="w-full bg-red-500 hover:bg-blue-800 text-white font-semibold px-4 py-2 rounded-md focus:outline-none focus:ring-2 focus:ring-red-500">
            Add Movie
        </button>
    </form>
</div>

</body>
</html>
