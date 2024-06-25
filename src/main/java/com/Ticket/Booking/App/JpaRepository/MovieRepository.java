package com.Ticket.Booking.App.JpaRepository;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.Ticket.Booking.App.Entities.Movie;
import com.Ticket.Booking.App.Entities.Show;

public interface MovieRepository extends JpaRepository<Movie, Integer> {
	
	 @Query("SELECT s FROM shows s WHERE s.movie.movieName = :movieName")
	    public List<Show> findShowsByMovieName(@Param("movieName") String movieName);
	
	 public Movie findMovieByMovieName(String movieName);
}
