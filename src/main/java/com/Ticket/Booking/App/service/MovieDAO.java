package com.Ticket.Booking.App.service;

import java.util.List;

import com.Ticket.Booking.App.Entities.Movie;
import com.Ticket.Booking.App.Entities.Show;
import com.Ticket.Booking.App.Entities.Theater;

public interface MovieDAO {

	public Movie addMovie(Movie movie);

	public List<Movie> getAllMovies();

	public void deleteById(int id);

	public Movie findById(int id);
	
	public List<Movie> getRandomFourMovies();
	
	public List<Show> findByName(String movieName);
	
	public List<Movie> findMovies(String partialMovieName);
}
