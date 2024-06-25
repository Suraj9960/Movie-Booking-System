package com.Ticket.Booking.App.JpaRepository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Ticket.Booking.App.Entities.Ticket;


public interface TicketRepository extends JpaRepository<Ticket, Integer> {
	
	public List<Ticket> findByUsername(String username);
	
}
