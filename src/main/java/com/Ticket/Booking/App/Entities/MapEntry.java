package com.Ticket.Booking.App.Entities;


import java.util.List;

import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class MapEntry {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer seatId;

    private String mapKey;

    private List<Integer> mapValues;
    
    private String movieName;
    
    private String theaterName;

    public Integer getSeatId() {
        return seatId;
    }

    public void setSeatId(Integer seatId) {
        this.seatId = seatId;
    }

    public List<Integer> getMapValues() {
        return mapValues;
    }

    public void setMapValues(List<Integer> mapValues) {
        this.mapValues = mapValues;
    }

    public MapEntry() {

    }

	public String getMapKey() {
		return mapKey;
	}

	public void setMapKey(String mapKey) {
		this.mapKey = mapKey;
	}

	public MapEntry(String mapKey, List<Integer> mapValues) {
		super();
		this.mapKey = mapKey;
		this.mapValues = mapValues;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getTheaterName() {
		return theaterName;
	}

	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
    
    
}
