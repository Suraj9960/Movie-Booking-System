package com.Ticket.Booking.App.serviceDaoImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Ticket.Booking.App.Entities.Theater;
import com.Ticket.Booking.App.JpaRepository.TheaterRepository;
import com.Ticket.Booking.App.service.TheaterDAO;

@Service
public class TheaterDaoImpl implements TheaterDAO {

	@Autowired
	private TheaterRepository repository;

	@Autowired
	private MapEntryService mapEntryService;

	@Override
	public Theater addTheater(Theater theater) {
		return repository.save(theater);
	}

	@Override
	public List<Theater> geTheaters() {

		return repository.findAll();
	}

	@Override
	public void deleteById(int id) {
		repository.deleteById(id);
	}

	@Override
	public Theater geTheaterByName(String tname) {
		return repository.getBytname(tname);
	}

	@Override
	public int totalTicketPrice(int price, int noOfSeats) {

		return price * noOfSeats;
	}

	@Override
	public Theater findById(int id) {
		Optional<Theater> newTheater = repository.findById(id);
		Theater theater2 = newTheater.get();
		return theater2;
	}

	public List<Integer> convertStringToList(String selected) {
		List<Integer> seatList = new ArrayList<>();
		// Remove leading '[' and trailing ']' characters if present
		if (selected.startsWith("[")) {
			selected = selected.substring(1);
		}
		if (selected.endsWith("]")) {
			selected = selected.substring(0, selected.length() - 1);
		}
		String[] seatArray = selected.split(","); // Split the string by comma
		for (String seat : seatArray) {
			seatList.add(Integer.parseInt(seat.trim())); // Convert each string to integer and add to the list
		}
		return seatList;
	}

	// this is method for getting the list of seats

	public List<Integer> initializeTheaterSeats(int tseats) {
		List<Integer> theaterTseats = new ArrayList<>();
		for (int i = 1; i <= tseats; i++) {
			theaterTseats.add(i);
		}
		return theaterTseats;
	}

	public List<Integer> removeSelectedSeats(List<Integer> totalSeatList, List<Integer> selectedSeatList) {
		totalSeatList.removeAll(selectedSeatList);
		return totalSeatList;
	}

	@Override
	public Map<String, List<Integer>> getListByKey(int tSeats, String tname, String mName) {
		int seatNumber = 1;
		Map<String, List<Integer>> mp = new HashMap<>();

		String[] key = new String[26];

		for (int i = 0; i < 26; i++) {
			key[i] = Character.toString((char) ('A' + i));
		}

		while (tSeats > 0) {
			List<Integer> list = new ArrayList<>(10);
			for (String keys : key) {
				if (tSeats <= 0)
					break;

				// Get or create the list for the current key
				List<Integer> currKey = mp.getOrDefault(key, new ArrayList<>(10));

				// Add up to 10 seats for the current key
				for (int i = 0; i < 10 && tSeats > 0; i++) {
					currKey.add(seatNumber++);
					tSeats--;
				}

				// Put the updated list back into the map
				mp.put(keys, currKey);
			}
		}
		return mp;
	}

	public  Map<String, List<Integer>> convertToMap(String input) {
		Map<String, List<Integer>> map = new HashMap<>();
		String[] pairs = input.split(",");

		for (String pair : pairs) {
			String[] keyValue = pair.split("-");
			String key = keyValue[0];
			Integer value = Integer.parseInt(keyValue[1]);

			// Check if the map already contains the key
			if (!map.containsKey(key)) {
				// If not, create a new list and add it to the map
				map.put(key, new ArrayList<>());
			}
			// Add the value to the list associated with the key
			map.get(key).add(value);
		}

		return map;
	}

	public Map<String, List<Integer>> removeEntries(Map<String, List<Integer>> list,
			Map<String, List<Integer>> convertToMap) {
		for (Map.Entry<String, List<Integer>> entry : convertToMap.entrySet()) {
			String key = entry.getKey();
			List<Integer> valuesToRemove = entry.getValue();

			if (list.containsKey(key)) {
				List<Integer> originalList = list.get(key);
				originalList.removeAll(valuesToRemove);

				if (originalList.isEmpty()) {
					list.remove(key);
				} else {
					list.put(key, originalList);
				}
			}
		}

		return list;
	}

	@Override
	public List<Integer> totalSeats(int tseats) {
		List<Integer> theaterTseats = new ArrayList<>();
		for (int i = 1; i <= tseats; i++) {
			theaterTseats.add(i);
		}
		return theaterTseats;
	}

}
