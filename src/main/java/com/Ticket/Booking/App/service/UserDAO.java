package com.Ticket.Booking.App.service;

import java.util.List;

import com.Ticket.Booking.App.Entities.User;


public interface UserDAO {
	
	public User addUser(User user);
	
	public User getUserById(int id);
	
	public List<User> getAllUsers();
	
	public User getByEmail(String email);
	
	public List<User> getUsersByRole(String role);
	
	public void deleteUser(int userId);
	
	public User updateUser(User user);
	

}
