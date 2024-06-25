package com.Ticket.Booking.App.controllers;

import java.security.Principal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.management.MalformedObjectNameException;

import org.apache.commons.logging.Log;
import org.apache.taglibs.standard.tag.el.sql.SetDataSourceTag;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.event.PublicInvocationEvent;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Ticket.Booking.App.Entities.MapEntry;
import com.Ticket.Booking.App.Entities.Movie;
import com.Ticket.Booking.App.Entities.Orders;
import com.Ticket.Booking.App.Entities.Show;
import com.Ticket.Booking.App.Entities.Theater;
import com.Ticket.Booking.App.Entities.Ticket;
import com.Ticket.Booking.App.Entities.User;
import com.Ticket.Booking.App.JpaRepository.MapEntryRepository;
import com.Ticket.Booking.App.JpaRepository.MovieRepository;
import com.Ticket.Booking.App.JpaRepository.OrdersRepository;
import com.Ticket.Booking.App.JpaRepository.TicketRepository;
import com.Ticket.Booking.App.JpaRepository.UserRepository;
import com.Ticket.Booking.App.serviceDaoImpl.MapEntryService;
import com.Ticket.Booking.App.serviceDaoImpl.MovieDaoImpl;
import com.Ticket.Booking.App.serviceDaoImpl.ShowDaoImpl;
import com.Ticket.Booking.App.serviceDaoImpl.TheaterDaoImpl;
import com.Ticket.Booking.App.serviceDaoImpl.TicketDaoImpl;
import com.Ticket.Booking.App.serviceDaoImpl.UserDaoImpl;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.RequestBody;
import com.razorpay.*;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private UserRepository repository;
	@Autowired
	private UserDaoImpl userDaoImpl;
	@Autowired
	private MovieDaoImpl movieDaoImpl;

	@Autowired
	private TheaterDaoImpl theaterDaoImpl;

	@Autowired
	private ShowDaoImpl showDaoImpl;

	@Autowired
	private TicketDaoImpl ticketDaoImpl;

	@Autowired
	private TicketRepository ticketRepository;

	@Autowired
	private OrdersRepository orderRepository;

	@Autowired
	private MovieRepository movieRepository;

	@Autowired
	private MapEntryService mapEntryService;

	@GetMapping("/index")
	public String userIndex(Model model, Principal principal) {
		String usernameString = principal.getName();
		User user = repository.getUserByUsername(usernameString);
		model.addAttribute("user", user);

		if (user.getEmail().equals("admin@gmail.com")) {
			return "admin/homePage";
		}

		// for retrive all movies

		List<Movie> movies = movieDaoImpl.getAllMovies(); // retrieve the latest movies
		Collections.reverse(movies);
		model.addAttribute("movies", movies);

		// for retrive only 4 movies
		List<Movie> firstFourMovies = movieDaoImpl.getRandomFourMovies();
		Collections.reverse(firstFourMovies);
		model.addAttribute("firstFourMovies", firstFourMovies);
		return "Userindex";
	}


	// ********************* Showing All Movie *****************

	@GetMapping("/show-movie")
	public String showAll(Model model, Principal principal) {
		String usernameString = principal.getName();
		User user = repository.getUserByUsername(usernameString);
		model.addAttribute("user", user);

		if (user.getEmail().equals("admin@gmail.com")) {
			return "admin/homePage";
		}

		// for retrive all movies

		List<Movie> movies = movieDaoImpl.getAllMovies(); // retrieve the latest movies
		Collections.reverse(movies);
		model.addAttribute("movies", movies);
		return "show-movie";
	}

	// **************************** Movie Details Display Page
	// ***************************** //

	@GetMapping("/book-ticket")
	public String bookTicket(Principal principal, Model model, @RequestParam("id") int id, HttpServletRequest request) {
		String usernameString = principal.getName();
		User user = repository.getUserByUsername(usernameString);
		model.addAttribute("user", user);

		Movie movie = movieDaoImpl.findById(id); // retrieve the latest movies

		model.addAttribute("movie", movie);
		// Getting List of Theaters

		List<Theater> theaters = theaterDaoImpl.geTheaters();
		model.addAttribute("theaters", theaters);

		List<Show> shows = showDaoImpl.getShows();
		model.addAttribute("shows", shows);

		return "book-ticket";
	}

	/*
	 * ********** This is For getting the show information based on movie , theater
	 * and date ********
	 */

	@GetMapping("/book-show")
	public String suraj(Model model, @RequestParam("id") int id, HttpServletRequest request, Principal principal) {

		String usernameString = principal.getName();
		User user = repository.getUserByUsername(usernameString);
		model.addAttribute("user", user);

		Movie movie = movieDaoImpl.findById(id); // retrieve the latest movies

		model.addAttribute("movie", movie);

		String image = movie.getMovieImageUrl();
		model.addAttribute("image", image);

		List<Show> allShows = showDaoImpl.getByMovie(movie);
		model.addAttribute("allShows", allShows);
		if (allShows.isEmpty()) {
			model.addAttribute("noShowsFound", true);
		}

		return "book-show";
	}

	/* *************** Book the show and proceed ************** */

	@PostMapping("/bookShow")
	public String selectShow(Model model, HttpServletRequest request, @RequestParam("id") int id,
			@RequestParam("theaterId") int tid, @Valid Ticket ticket, Principal principal) {
		String username = principal.getName();
		User user = repository.getUserByUsername(username);
		model.addAttribute("user", user);

		Movie movie = movieDaoImpl.findById(id); // retrieve the latest movies
		model.addAttribute("movie", movie);
		String mName = movie.getMovieName();

		Theater theater = theaterDaoImpl.findById(tid);
		model.addAttribute("theater", theater);
		String tname = theater.getTname();
		int tprice = theater.getTprice();
		int tseats = theater.getTseats();

		Map<String, List<Integer>> currKey = theaterDaoImpl.getListByKey(tseats, tname, mName);
		mapEntryService.saveMap(currKey, tname, mName);
		model.addAttribute("currKey", currKey);

		String selectedShowName = request.getParameter("selectedShow");
		String show = request.getParameter("showId");
		int showId = Integer.parseInt(show);
		String date = request.getParameter("showdate");

		// Theater Details
		model.addAttribute("tname", tname);
		model.addAttribute("theater_price", tprice);
		model.addAttribute("theater_seats", tseats);

		// Shows Details
		model.addAttribute("selectedShowName", selectedShowName);
		model.addAttribute("showId", showId);
		model.addAttribute("showdate", date);

		return "newPage";
	}

	@PostMapping("/bookSeats")
	public String seats(HttpServletRequest request, Model model, @RequestParam("id") int id, @Valid Ticket ticket,
			Principal principal) {
		String username = principal.getName();
		User user = repository.getUserByUsername(username);
		model.addAttribute("user", user);

		Movie movie = movieDaoImpl.findById(id); // retrieve the latest movies
		model.addAttribute("movie", movie);

		String seat = request.getParameter("selectedSeatsCount");
		int seats = Integer.parseInt(seat);
		String selected = request.getParameter("selectedSeats");

		String show = request.getParameter("selectedShow");
		int showId = Integer.parseInt(show);

		Show bookedShow = showDaoImpl.findById(showId);
		String tname = bookedShow.getTheater().getTname();
		String movieName = bookedShow.getMovie().getMovieName();

		Theater theater = theaterDaoImpl.geTheaterByName(tname);
		int tseats = theater.getTseats();
		int tprice = theater.getTprice();
		int totalPrice = tprice * seats;

		model.addAttribute("movieName", movieName);
		model.addAttribute("showName", bookedShow.getShowName());
		model.addAttribute("showStart", bookedShow.getShowStartTime());
		model.addAttribute("showEnd", bookedShow.getShowEndTime());
		model.addAttribute("date", bookedShow.getDateOfShow());
		model.addAttribute("tname", tname);
		model.addAttribute("tprice", tprice);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("seatCount", seat);
		model.addAttribute("selectedSeats", selected);

		return "ticket";
	}
	/* ************************** Ticket Creation *********************** */

	@PostMapping("/bookingTickets")
	public String ticketBookingFinal(HttpServletRequest req, Model model, Principal principal) {
		String usernameString = principal.getName();
		User user = repository.getUserByUsername(usernameString);
		model.addAttribute("user", user);

		// Fetching all data

		String sname = req.getParameter("sname");
		String tname = req.getParameter("tname");
		String mname = req.getParameter("mname");
		String mid = req.getParameter("mid");
		int movieId = Integer.parseInt(mid);

		Movie movie = movieDaoImpl.findById(movieId);

		String email = user.getEmail();

		String date = req.getParameter("date");
		LocalDate date2 = LocalDate.parse(date);

		String showStart = req.getParameter("sStart");
		String showEnd = req.getParameter("SEnd");

		String showDetail = sname + "(" + showStart + "-" + showEnd + " )";

		String totalprice = req.getParameter("totalPrice");
		int total = Integer.parseInt(totalprice);

		String s = req.getParameter("selected") + " ";

		String seat = req.getParameter("SeatCount");
		int seats = Integer.parseInt(seat);

		model.addAttribute("email", email);

		model.addAttribute("movieName", mname);

		model.addAttribute("movie", movie);

		model.addAttribute("showName", showDetail);

		model.addAttribute("showStart", showStart);

		model.addAttribute("showEnd", showEnd);

		model.addAttribute("date", date);

		model.addAttribute("tname", tname);

		model.addAttribute("totalPrice", totalprice);

		model.addAttribute("seatCount", seat);

		model.addAttribute("selectedSeats", s);

		/* ******************* Generate The Ticket ************* */
		

		

		Ticket ticket = new Ticket();

		ticket.setDate(date2);

		ticket.setMoviename(mname);

		ticket.setTheater_name(tname);

		ticket.setShow_name(showDetail);

		ticket.setSeatsCount(seats);

	    ticket.setSelectedSeat(s);

		ticket.setTotalPrice(total);

		ticket.setUsername(user.getName());

		ticket.setStatus("created");

		ticketRepository.save(ticket);

		int ticketId = ticket.getId();

		model.addAttribute("ticketId", ticketId);

		return "payment";

	}

	/*
	 * ***** Payment Integration For Website's and Updation of Ticket status and
	 * Payment status ******
	 */

	/*
	 * ********* 1. Creation of Payment Order Using RazorPay and save to database
	 * **********
	 */

	@PostMapping("/create_order")
	@ResponseBody
	public String createOrder(@RequestBody Map<String, Object> data, Principal principal, HttpServletRequest request,
			Model model) throws RazorpayException {

		int amt = Integer.parseInt(data.get("amount").toString());

		String ticketId = data.get("ticketId").toString(); // Access the ticket ID
		model.addAttribute("ticketId", ticketId);
		var client = new RazorpayClient("rzp_test_CN2otsWww3Ooa2", "MGvy27O3RvRXQN6Ba9NdJGTk");

		JSONObject orderRequest = new JSONObject();
		orderRequest.put("amount", amt * 100);
		orderRequest.put("currency", "INR");
		orderRequest.put("receipt", "receipt#1");

		// creating new order

		Order order = client.orders.create(orderRequest);

		// save the order into database

		LocalDateTime dateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String formattedDateTime = dateTime.format(formatter);

		Orders myOrders = new Orders();
		myOrders.setAmount(order.get("amount") + "");
		myOrders.setOrder_id(order.get("id"));
		myOrders.setPayment_id(null);
		myOrders.setReceipt(order.get("receipt"));
		myOrders.setStatus("created");
		myOrders.setUser(repository.getUserByUsername(principal.getName()));
		myOrders.setDateTime(formattedDateTime);
		myOrders.setUserName(principal.getName());

		// Save the orders

		orderRepository.save(myOrders);

		return order.toString();
	}

	/* ********** 2. Update Order status and ticket status ********* */

	@PostMapping("/update_order")
	public ResponseEntity<?> updateOrder(@RequestBody Map<String, Object> data, HttpServletRequest request,
			Model model) {

		Orders myOrders = orderRepository.findByOrderId(data.get("order_id").toString());

		String ticketId = data.get("ticketId").toString();

		int tid = Integer.parseInt(ticketId);

		myOrders.setPayment_id(data.get("payment_id").toString());
		myOrders.setStatus(data.get("status").toString());

		orderRepository.save(myOrders);

		Optional<Ticket> ticket2 = ticketRepository.findById(tid);
		Ticket newTicket = ticket2.get();

		newTicket.setBookingId(data.get("order_id").toString());
		newTicket.setPayment_id(data.get("payment_id").toString());
		newTicket.setStatus("booked");

		ticketRepository.save(newTicket);

		return ResponseEntity.ok(Map.of("msg", "Data Updated"));

	}

	/* ******************* Search Option ******************** */

	@PostMapping("/find-movie")
	public String findMovie(HttpServletRequest request, Model model, Principal principal) {
		String usernameString = principal.getName();
		User user = repository.getUserByUsername(usernameString);
		model.addAttribute("user", user);

		String ch = request.getParameter("search");

		List<Movie> movie = movieDaoImpl.findMovies(ch);

		if (movie.isEmpty()) {
			model.addAttribute("noMovieFound", true);
		}

		model.addAttribute("foundMovie", movie);

		return "find";
	}

	// ********************** List of tickets ***********************

	@GetMapping("/myBooking")
	public String myBooking(@Valid Ticket ticket, Model model, Principal principal) {

		String usernameString = principal.getName();
		User user = repository.getUserByUsername(usernameString);
		model.addAttribute("user", user);

		String name = user.getName();

		List<Ticket> ticket2 = ticketDaoImpl.findByUserName(name);

		model.addAttribute("tickets", ticket2);

		return "myBooking";
	}

	/* ********* Final page for printing booked Tickets ******* */

	@GetMapping("/submit")
	public String submit(HttpServletRequest request, Model model, Principal principal) {

		String usernameString = principal.getName();
		User user = repository.getUserByUsername(usernameString);
		model.addAttribute("user", user);

		String idString = request.getParameter("ticketId");
		int id = Integer.parseInt(idString);

		Optional<Ticket> ticket = ticketRepository.findById(id);

		Ticket newTicket = ticket.get();
		model.addAttribute("ticket", newTicket);

		Movie movie = (Movie) movieRepository.findMovieByMovieName(newTicket.getMoviename());
		model.addAttribute("movie", movie);

		return "submit";
	}
	
	
	@GetMapping("/profile")
	public String profile(Model model, Principal principal) {
		String usernameString = principal.getName();
		User user = repository.getUserByUsername(usernameString);
		model.addAttribute("user", user);
		return "profile";
	}
	
	@PostMapping("update-profile")
	public String updateProfile(HttpServletRequest request , @RequestParam("id")int uid , HttpSession session ) {
		String name = request.getParameter("name");
		String username = request.getParameter("username"); 
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		String cPass = request.getParameter("cPassword");
		User user = userDaoImpl.getUserById(uid);
		user.setName(name);
		user.setUsername(username);
		user.setEmail(email);
		user.setPassword(passwordEncoder.encode(pass));
		user.setConfirmPassword(passwordEncoder.encode(cPass));
		boolean f = false;
		userDaoImpl.updateUser(user);
			
		f= true;
		
		if (f) {			
			session.setAttribute("succMsg", "Registered Successfully");
		} else {
			session.setAttribute("failedMsg", "Something went wrong");
			return "redirect:profile";
		}
		return "signup";
	}

}
