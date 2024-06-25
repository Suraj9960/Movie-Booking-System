package com.Ticket.Booking.App.Entities;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.validation.constraints.NotBlank;

@Entity(name = "shows")
public class Show {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int sid;
	@NotBlank(message = "Field is Mandatory!!")
	private String showName;
	@NotBlank(message = "Select Show time!!")
	private String showStartTime;
	@NotBlank(message = "Select Show time!!")
	private String showEndTime;
	private int totalSeats;
	private int bookedSeats;
	@DateTimeFormat(pattern = "dd-MM-YYY")
	private LocalDate dateOfShow;

	@ManyToOne
	private Movie movie;

	@ManyToOne
	private Theater theater;

	public Show() {
	}

	public Show(String showName, String showStartTime, String showEndTime, int totalSeats, int bookedSeats,
			LocalDate dateofShow) {
		this.showName = showName;
		this.showStartTime = showStartTime;
		this.showEndTime = showEndTime;
		this.totalSeats = totalSeats;
		this.bookedSeats = bookedSeats;
		this.dateOfShow = dateofShow;
	}

	// Getters and setters
	// isFull method

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getShowName() {
		return showName;
	}

	public void setShowName(String showName) {
		this.showName = showName;
	}

	public String getShowStartTime() {
		return showStartTime;
	}

	public void setShowStartTime(String showStartTime) {
		this.showStartTime = showStartTime;
	}

	public String getShowEndTime() {
		return showEndTime;
	}

	public void setShowEndTime(String showEndTime) {
		this.showEndTime = showEndTime;
	}

	public int getTotalSeats() {
		return totalSeats;
	}

	public void setTotalSeats(int totalSeats) {
		this.totalSeats = totalSeats;
	}

	public int getBookedSeats() {
		return bookedSeats;
	}

	public void setBookedSeats(int bookedSeats) {
		this.bookedSeats = bookedSeats;
	}

	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public Theater getTheater() {
		return theater;
	}

	public void setTheater(Theater theater) {
		this.theater = theater;
	}
	
	public LocalDate getDateOfShow() {
		return dateOfShow;
	}

	public void setDateOfShow(LocalDate dateOfShow) {
		this.dateOfShow = dateOfShow;
	}

}
