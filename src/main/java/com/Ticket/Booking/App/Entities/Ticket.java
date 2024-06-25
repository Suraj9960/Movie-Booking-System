package com.Ticket.Booking.App.Entities;

import java.time.LocalDate;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Ticket {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String bookingId;
	private String username;
	private LocalDate date;
	private String moviename;
	private String theater_name;
	private String show_name;
	private int seatsCount;
	private String selectedSeat;
	private int totalPrice;
	private String payment_id;
	private String status;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getMoviename() {
		return moviename;
	}

	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}

	public String getBookingId() {
		return bookingId;
	}

	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}

	public String getTheater_name() {
		return theater_name;
	}

	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}

	public String getShow_name() {
		return show_name;
	}

	public void setShow_name(String show_name) {
		this.show_name = show_name;
	}

	public int getSeatsCount() {
		return seatsCount;
	}

	public void setSeatsCount(int seatsCount) {
		this.seatsCount = seatsCount;
	}

	public String getSelectedSeat() {
		return selectedSeat;
	}

	public void setSelectedSeat(String s) {
		this.selectedSeat = s;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}

	public String getStatus() {
		return status;
	}
	
	

	public void setStatus(String status) {
		this.status = status;
	}

	public Ticket() {
		super();
	}

	public Ticket(String bookingId, String username, LocalDate date, String moviename, String theater_name,
			String show_name, int seatsCount, String selectedSeat, int totalPrice, String payment_id,
			String status) {
		super();
		this.bookingId = bookingId;
		this.username = username;
		this.date = date;
		this.moviename = moviename;
		this.theater_name = theater_name;
		this.show_name = show_name;
		this.seatsCount = seatsCount;
		this.selectedSeat = selectedSeat;
		this.totalPrice = totalPrice;
		this.payment_id = payment_id;
		this.status = status;
	}

}
