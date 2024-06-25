package com.Ticket.Booking.App.JpaRepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Ticket.Booking.App.Entities.Orders;
import java.util.List;


public interface OrdersRepository extends JpaRepository<Orders, Long> {
	
	public Orders findByOrderId(String orderId);

}
