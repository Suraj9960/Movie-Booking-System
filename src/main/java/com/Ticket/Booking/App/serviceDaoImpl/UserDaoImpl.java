package com.Ticket.Booking.App.serviceDaoImpl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Ticket.Booking.App.Entities.Orders;
import com.Ticket.Booking.App.Entities.User;
import com.Ticket.Booking.App.JpaRepository.OrdersRepository;
import com.Ticket.Booking.App.JpaRepository.UserRepository;
import com.Ticket.Booking.App.service.UserDAO;

@Service
public class UserDaoImpl implements UserDAO {
	
	@Autowired
	private UserRepository repository;
	
	@Autowired
	private OrdersRepository ordersRepository;

	@Override
	public User addUser(User user) {
		
		return repository.save(user);
	}

	@Override
	public User getUserById(int id) {
		Optional<User> user = repository.findById(id);
		User newUser = user.get();
		
		return newUser;
	}

	@Override
	public List<User> getAllUsers() {
		
		return repository.findAll();
	}
	
	public User getByEmail(String email) {
		return repository.getUserByUsername(email);
	}

	@Override
	public List<User> getUsersByRole(String role) {
		
		return repository.findByRole(role);
	}

	@Override
	public void deleteUser(int userId) {
	    User user = repository.findById(userId).orElseThrow();
	    List<Orders> orders = user.getOrder();
	    orders.forEach(order -> ordersRepository.delete(order));
	    repository.delete(user);
	    
	}

	@Override
	public User updateUser(User user) {
		return repository.save(user);
	}

}
