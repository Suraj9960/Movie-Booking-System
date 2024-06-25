package com.Ticket.Booking.App.serviceDaoImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Ticket.Booking.App.Entities.MapEntry;
import com.Ticket.Booking.App.Entities.Movie;
import com.Ticket.Booking.App.Entities.Theater;
import com.Ticket.Booking.App.JpaRepository.MapEntryRepository;

@Service
public class MapEntryService {

	@Autowired
	private MapEntryRepository mapEntryRepository;

	public void saveMap(Map<String, List<Integer>> currKey, String tname, String mName) {
		List<Integer> selectedSeats = new ArrayList<>();

		// Get the selected seats from the database
		List<MapEntry> selectedMapEntries = mapEntryRepository.findByTheaterNameAndMovieName(tname, mName);
		for (MapEntry mapEntry : selectedMapEntries) {
			selectedSeats.addAll(mapEntry.getMapValues());
		}

		// Save the updated seats list to the database
		for (Map.Entry<String, List<Integer>> entry : currKey.entrySet()) {
			MapEntry mapEntry = new MapEntry();
			mapEntry.setMapKey(entry.getKey());
			mapEntry.setMapValues(entry.getValue());
			mapEntry.setTheaterName(tname);
			mapEntry.setMovieName(mName);
			mapEntryRepository.save(mapEntry);
		}
	}

	public void updateMap(Map<String, List<Integer>> updatedList, String tname, String mName) {
		// Get the selected seats from the updated list
		List<Integer> selectedSeats = new ArrayList<>();
		for (List<Integer> seats : updatedList.values()) {
			selectedSeats.addAll(seats);
		}

		// Remove the selected seats from the original list in the database
		List<MapEntry> mapEntries = mapEntryRepository.findByTheaterNameAndMovieName(tname, mName);
		for (MapEntry mapEntry : mapEntries) {
			List<Integer> originalSeats = new ArrayList<>(mapEntry.getMapValues());
			originalSeats.removeAll(selectedSeats);
			mapEntry.setMapValues(originalSeats);
			mapEntryRepository.save(mapEntry);
		}

		// Save the updated list to the database
		for (Map.Entry<String, List<Integer>> entry : updatedList.entrySet()) {
			MapEntry mapEntry = new MapEntry();
			mapEntry.setMapKey(entry.getKey());
			mapEntry.setMapValues(entry.getValue());
			mapEntry.setTheaterName(tname);
			mapEntry.setMovieName(mName);
			mapEntryRepository.save(mapEntry);
		}
	}

	public List<MapEntry> findByTheaterName(String theaterName, String movieName) {
		return mapEntryRepository.findByTheaterNameAndMovieName(theaterName, movieName);
	}

}
