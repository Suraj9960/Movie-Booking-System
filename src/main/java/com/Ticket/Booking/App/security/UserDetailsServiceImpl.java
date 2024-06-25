package com.Ticket.Booking.App.security;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.Ticket.Booking.App.Entities.User;
import com.Ticket.Booking.App.JpaRepository.UserRepository;



public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private UserRepository userJpaRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User users = userJpaRepository.getUserByUsername(username);

		if (users == null) {
			throw new UsernameNotFoundException("User not found with username: " + username);
		}

		return new CustomUserDetails(users);
	}

}
