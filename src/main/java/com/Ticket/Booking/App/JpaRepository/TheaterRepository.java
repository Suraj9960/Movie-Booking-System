package com.Ticket.Booking.App.JpaRepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Ticket.Booking.App.Entities.Theater;

public interface TheaterRepository extends JpaRepository<Theater, Integer> {
	public Theater getBytname(String tname);

}
