package com.Ticket.Booking.App.JpaRepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Ticket.Booking.App.Entities.MapEntry;

public interface MapEntryRepository extends JpaRepository<MapEntry, Integer> {

	 List<MapEntry> findByTheaterNameAndMovieNameAndMapKey(String theaterName, String movieName, String mapKey);
	 
	 List<MapEntry> findByTheaterNameAndMovieName(String theaterName, String movieName);
}
