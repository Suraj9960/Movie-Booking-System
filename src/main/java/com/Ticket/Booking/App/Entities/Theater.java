package com.Ticket.Booking.App.Entities;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity(name = "theaters")
public class Theater {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int tid;
	private String tname;
	private String address;
	private int tseats;
	private int tprice;
	
	@OneToMany(mappedBy = "theater")
	private List<Show> shows;


	public Theater() {
		super();
	}
	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getTseats() {
		return tseats;
	}

	public void setTseats(int tseats) {
		this.tseats = tseats;
	}

	public int getTprice() {
		return tprice;
	}

	public void setTprice(int tprice) {
		this.tprice = tprice;
	}

	public List<Show> getShows() {
		return shows;
	}

	public void setShows(List<Show> shows) {
		this.shows = shows;
	}


	public Theater(String tname, String address, int tseats, int tprice,
			List<Show> shows) {
		super();
		this.tname = tname;
		this.address = address;
		this.tseats = tseats;
		this.tprice = tprice;
		this.shows = shows;
	}
}
