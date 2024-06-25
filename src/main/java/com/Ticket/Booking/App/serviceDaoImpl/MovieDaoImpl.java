package com.Ticket.Booking.App.serviceDaoImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.liquibase.LiquibaseProperties.ShowSummary;
import org.springframework.boot.web.servlet.filter.OrderedRequestContextFilter;
import org.springframework.stereotype.Service;

import com.Ticket.Booking.App.Entities.Movie;
import com.Ticket.Booking.App.Entities.Show;
import com.Ticket.Booking.App.JpaRepository.MovieRepository;
import com.Ticket.Booking.App.JpaRepository.ShowRepository;
import com.Ticket.Booking.App.service.MovieDAO;

@Service
public class MovieDaoImpl implements MovieDAO {

	@Autowired
	private MovieRepository repository;
	
	@Autowired
	private ShowRepository showRepository;

	@Override
	public Movie addMovie(Movie movie) {

		return repository.save(movie);
	}

	@Override
	public List<Movie> getAllMovies() {

		return repository.findAll();
	}
	
	public List<Movie> getFirstThreeMovies() {
		List<Movie> allMovies = repository.findAll();

		// Return the first two movies
		return allMovies.subList(0, Math.min(allMovies.size(), 3));
	}
	

	@Override
	public void deleteById(int id) {
		Movie movie =  repository.findById(id).get();
		List<Show> shows = movie.getShows();
		shows.forEach(order -> showRepository.delete(order) );
		repository.delete(movie);
	}

	@Override
	public Movie findById(int id) {
		Optional<Movie> newMovie = repository.findById(id);
		Movie movie2 = newMovie.get();
		return movie2;
	}

	public List<Movie> getRandomFourMovies() {
		List<Movie> allMovies = repository.findAll();

		// Shuffle the list to get a random order
		List<Movie> shuffledMovies = shuffleList(allMovies);

		// Return the first four movies
		return shuffledMovies.subList(0, Math.min(shuffledMovies.size(), 4));
	}

	// Helper method to shuffle a list
	private <T> List<T> shuffleList(List<T> list) {
		Random random = new Random();
		for (int i = list.size() - 1; i > 0; i--) {
			int index = random.nextInt(i + 1);
			T temp = list.get(index);
			list.set(index, list.get(i));
			list.set(i, temp);
		}
		return list;
	}

	public List<Show> findByName(String movieName) {
		return repository.findShowsByMovieName(movieName);
	}

	public List<Movie> findMovies(String partialMovieName) {
		// Convert the input parameter to lowercase and uppercase
		String searchValue = partialMovieName.toLowerCase();

		// Retrieve the movie list
		List<Movie> movies = getAllMovies(); // Assuming you have a method to retrieve all movies

		// Create a list to store matching movies
		List<Movie> matchingMovies = new ArrayList<>();

		// Iterate through the movies to find the matching ones
		for (Movie movie : movies) {
			// Convert the movie name to lowercase for comparison
			String movieNameInDB = movie.getMovieName().toLowerCase();

			// Check if the movie name contains the search value
			if (movieNameInDB.contains(searchValue)) {
				matchingMovies.add(movie); // Add the movie to the list if found
			}
		}
		return matchingMovies; // Return the list of matching movies
	}

}
