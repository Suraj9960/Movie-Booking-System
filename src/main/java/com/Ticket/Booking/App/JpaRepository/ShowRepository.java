package com.Ticket.Booking.App.JpaRepository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.Ticket.Booking.App.Entities.Movie;
import com.Ticket.Booking.App.Entities.Show;
import com.Ticket.Booking.App.Entities.Theater;

public interface ShowRepository extends JpaRepository<Show, Integer> {
	
	public List<Show> findByMovieAndTheaterAndDateOfShow(Movie movie, Theater theater, LocalDate dateOfShow);
	
	
	 @Query("SELECT s.bookedSeats FROM shows s WHERE s.sid = :showId")
	    List<Integer> findBookedSeatsForShow(int showId);
	 
	 public List<Show> findByMovie(Movie movie);
}
