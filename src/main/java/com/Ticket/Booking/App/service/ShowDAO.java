package com.Ticket.Booking.App.service;

import java.time.LocalDate;
import java.util.List;

import com.Ticket.Booking.App.Entities.Movie;
import com.Ticket.Booking.App.Entities.Show;
import com.Ticket.Booking.App.Entities.Theater;

public interface ShowDAO {
	public List<Show> getShows();

	public Show addShow(Show show);

	public void deleteById(int id);

	public List<Show> getShowsByMovieAndTheaterAndDate(Movie movie, Theater foundTheater, LocalDate dateOfShow);
	
	public Show findById(int showId);
	
	public List<Integer> bookedSeats(int sid);
	
	public List<Show>getByMovie(Movie movie);
}
