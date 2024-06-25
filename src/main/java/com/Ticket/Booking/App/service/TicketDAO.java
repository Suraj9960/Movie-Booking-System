package com.Ticket.Booking.App.service;

import java.util.List;
import java.util.Optional;

import com.Ticket.Booking.App.Entities.Ticket;

public interface TicketDAO {
	public List<Ticket> geTickets();
	
	public Ticket getById(int bookingId);
	
	public void deleteTicketById(int bookingId);
	
	public Ticket addTicket(Ticket ticket);
	
	public List<Ticket> findByUserName(String username);
}
