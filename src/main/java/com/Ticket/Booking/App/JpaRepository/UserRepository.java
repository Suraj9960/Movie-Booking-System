package com.Ticket.Booking.App.JpaRepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.Ticket.Booking.App.Entities.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	
	public User getUserByUsername(String username);
	
	public List<User>findByRole(String role);


}
