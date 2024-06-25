package com.Ticket.Booking.App.serviceDaoImpl;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Ticket.Booking.App.Entities.Movie;
import com.Ticket.Booking.App.Entities.Show;
import com.Ticket.Booking.App.Entities.Theater;
import com.Ticket.Booking.App.JpaRepository.ShowRepository;
import com.Ticket.Booking.App.service.ShowDAO;

@Service
public class ShowDaoImpl implements ShowDAO {
	
	@Autowired
	private ShowRepository repository;

	@Override
	public List<Show> getShows() {

		return repository.findAll();
	}

	@Override
	public Show addShow(Show show) {
		
		return repository.save(show);
	}

	@Override
	public void deleteById(int id) {
		repository.deleteById(id);
		
	}

	@Override
	public List<Show> getShowsByMovieAndTheaterAndDate(Movie movie, Theater foundTheater, LocalDate dateOfShow) {
		
		return repository.findByMovieAndTheaterAndDateOfShow(movie, foundTheater, dateOfShow);
	}
	
	

	public Show findById(int showId) {
		Optional<Show> show = repository.findById(showId);
		Show show2 = show.get();
		return show2;
	}
	
	public List<Integer> bookedSeats(int sid){
		return repository.findBookedSeatsForShow(sid);
	}

	@Override
	public List<Show> getByMovie(Movie movie) {
	
		return repository.findByMovie(movie);
	}
	
}
