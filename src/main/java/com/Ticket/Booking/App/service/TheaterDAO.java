package com.Ticket.Booking.App.service;

import java.util.List;
import java.util.Map;

import com.Ticket.Booking.App.Entities.Theater;

public interface TheaterDAO {
	public Theater addTheater(Theater theater);
	
	public List<Theater> geTheaters();
	
	public void deleteById(int id);
	
	public Theater geTheaterByName(String tname);
	
	public int totalTicketPrice(int price , int noOfSeats);
	
	public Theater findById(int id);
	
	public List<Integer> convertStringToList(String selected);
	
	public List<Integer> initializeTheaterSeats(int tseats);
	
	public List<Integer> removeSelectedSeats(List<Integer> totalSeatList, List<Integer> selectedSeatList);
	
	public Map<String, List<Integer>> getListByKey(int tSeats , String tname , String mName);
	
	
	public List<Integer> totalSeats(int tseats);
}
