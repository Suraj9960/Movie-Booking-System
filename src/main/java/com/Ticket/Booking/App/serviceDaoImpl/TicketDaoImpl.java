package com.Ticket.Booking.App.serviceDaoImpl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Ticket.Booking.App.Entities.Ticket;
import com.Ticket.Booking.App.JpaRepository.TicketRepository;
import com.Ticket.Booking.App.service.TicketDAO;

@Service
public class TicketDaoImpl implements TicketDAO {
	
	@Autowired
	private TicketRepository repository;

	@Override
	public List<Ticket> geTickets() {
		return repository.findAll();
	}

	@Override
	public Ticket getById(int bookingId) {
		Optional<Ticket> ticket = repository.findById(bookingId);
		Ticket newTicket = ticket.get();
		return newTicket;
	}

	@Override
	public void deleteTicketById(int bookingId) {
		repository.deleteById(bookingId);
		
	}

	@Override
	public Ticket addTicket(Ticket ticket) {

		return repository.save(ticket);
	}
	
	
	public List<Ticket> findByUserName(String username){
		return repository.findByUsername(username);
	}

	

}
