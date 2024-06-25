package com.Ticket.Booking.App.controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import com.Ticket.Booking.App.Entities.Movie;
import com.Ticket.Booking.App.Entities.Orders;
import com.Ticket.Booking.App.Entities.Show;
import com.Ticket.Booking.App.Entities.Theater;
import com.Ticket.Booking.App.Entities.Ticket;
import com.Ticket.Booking.App.Entities.User;
import com.Ticket.Booking.App.JpaRepository.OrdersRepository;
import com.Ticket.Booking.App.JpaRepository.UserRepository;
import com.Ticket.Booking.App.serviceDaoImpl.MovieDaoImpl;
import com.Ticket.Booking.App.serviceDaoImpl.ShowDaoImpl;
import com.Ticket.Booking.App.serviceDaoImpl.TheaterDaoImpl;
import com.Ticket.Booking.App.serviceDaoImpl.TicketDaoImpl;
import com.Ticket.Booking.App.serviceDaoImpl.UserDaoImpl;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import jakarta.validation.executable.ValidateOnExecution;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	private UserRepository repository;

	@Autowired
	private MovieDaoImpl movieDaoImpl;

	@Autowired
	private TheaterDaoImpl theaterDaoImpl;

	@Autowired
	private ShowDaoImpl showDaoImpl;

	@Autowired
	private UserDaoImpl userDaoImpl;

	@Autowired
	private TicketDaoImpl ticketDaoImpl;

	@Autowired
	private OrdersRepository ordersRepository;

	@GetMapping("/homePage")
	public String AdminHome(Model model, Principal principal) {

		try {
			String usernameString = principal.getName();
			User user = repository.getUserByUsername(usernameString);
			model.addAttribute("user", user);

			// Theater count
			List<Theater> list = theaterDaoImpl.geTheaters();
			int countT = list.size();
			model.addAttribute("Tcount", countT);
			// movies
			List<Movie> list1 = movieDaoImpl.getAllMovies();
			int countM = list1.size();
			model.addAttribute("Mcount", countM);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "adminHomePage";
	}

	@GetMapping("/adminNavbar")
	public String AdminNabar() {
		return "adminNavbar";
	}

	// ************************************* Movie Sections
	// ************************************************** //

	@GetMapping("/movie-list")
	public String getAllMovies(Model model, Principal principal) {
		try {

			String usernameString = principal.getName();
			User user = repository.getUserByUsername(usernameString);
			model.addAttribute("user", user);

			List<Movie> movies = movieDaoImpl.getAllMovies(); // retrieve the latest movies
			int count = movies.size();
			model.addAttribute("mcount", count);

			model.addAttribute("movies", movies);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "movie-list";
	}

	// ************************* Adding New Movie ************************ //

	@GetMapping("/add-movie")
	public String getMovieDetails(Model model, Movie movie) {
		Movie movies = new Movie(movie.getMovieName(), movie.getLanguage(), movie.getReleaseDate(), movie.getActor(),
				movie.getActress(), movie.getDirector(), movie.getMovieImageUrl(), movie.getDescription(),
				movie.getTrailerUrl(), movie.getDuration());

		model.addAttribute("movies", movies);
		return "add-movie";
	}

	@PostMapping("/add-movie")
	public String addMovie(Model m, @Valid @ModelAttribute Movie movie, BindingResult bindingResult,
			@RequestParam("movieImageUrl") MultipartFile movieImageFile, HttpSession s) throws IOException {
		try {

			boolean f = false;
			movieImageFile.getOriginalFilename();
			movie.setMovieImageUrl(movieImageFile.getOriginalFilename());

			byte[] data = movieImageFile.getBytes();

			// save the image to folder
			String path = s.getServletContext().getRealPath("/") + "image" + File.separator
					+ movieImageFile.getOriginalFilename();
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(data);
			fos.close();
			m.addAttribute("filename", movieImageFile.getOriginalFilename());
			// Save the movie to the database
			movieDaoImpl.addMovie(movie);
			System.out.println("Add movie");
			f = true;
			if (f) {
				s.setAttribute("succMsg", "Movie Added Successfully...");
			} else {
				s.setAttribute("failMsg", "Something Went Wrong");
			}

		} catch (Exception e) {
			s.setAttribute("failMsg", "Something Went Wrong");
		}
		return "redirect:/admin/movie-list";
	}

	// ***************************** Delete Movie ************************ //

	@RequestMapping("/delete-movie")
	public String deleteTodo(@RequestParam("id") int id, HttpSession s) {
		boolean f = false;
		movieDaoImpl.deleteById(id);
		f = true;

		if (f) {
			s.setAttribute("succMsg", "Movie Deleted Successfully...");
		} else {
			s.setAttribute("failMsg", "Something Went Wrong");
		}
		return "redirect:/admin/movie-list";
	}

	// *********************************** Theater Sections
	// ************************************** //

	@GetMapping("/theater-list")
	public String theater(Model model, Principal principal) {

		String usernameString = principal.getName();
		User user = repository.getUserByUsername(usernameString);
		model.addAttribute("user", user);

		List<Theater> list = theaterDaoImpl.geTheaters();
		model.addAttribute("theaters", list);
		int count = list.size();
		model.addAttribute("Tcount", count);
		return "theater-list";
	}

	// ************************ For adding Theater ***********************

	@PostMapping("/add-theater")
	public RedirectView addTheater(@ModelAttribute @Valid Theater theater, HttpSession session) {
		boolean f = false;

		try {
			theaterDaoImpl.addTheater(theater);
			f = true;

			if (f) {
				session.setAttribute("succMsg", "!! Theater Added Successfully !!");
			} else {
				session.setAttribute("failMsg", "!! Something Went Wrong !!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		RedirectView rv = new RedirectView();
		rv.setUrl("../admin/theater-list");

		return rv;
	}

	// ********************************* For Deleting Theater
	// ***********************

	@RequestMapping("delete-theater")
	public String deleteTheater(@RequestParam int id, HttpSession s) {
		boolean f = false;

		theaterDaoImpl.deleteById(id);
		f = true;

		if (f) {
			s.setAttribute("succMsg", "Theater Deleted Successfully...");
		} else {
			s.setAttribute("failMsg", "Something Went Wrong...");
		}
		return "redirect:/admin/theater-list";
	}

	// ********************************** Show Section
	// ****************************************** //

	@GetMapping("/show-list")
	public String getAllShows(Model model, Principal principal) {

		String usernameString = principal.getName();
		User user = repository.getUserByUsername(usernameString);
		model.addAttribute("user", user);

		List<Show> list = showDaoImpl.getShows();
		model.addAttribute("shows", list);

		List<Theater> theaters = theaterDaoImpl.geTheaters();
		model.addAttribute("theaters", theaters);

		List<Movie> movies = movieDaoImpl.getAllMovies();
		model.addAttribute("movies", movies);

		return "show-list";
	}

	// *************************** For Adding Shows ********************************

	@PostMapping("/add-show")
	public RedirectView addShow(@Valid @ModelAttribute Show show, HttpSession session, HttpServletRequest req,
			Model model) {

		boolean f = false;

		try {

			String tid = req.getParameter("theaterId");
			String mid = req.getParameter("movieId");

			int theaterId = Integer.parseInt(tid);
			int movieId = Integer.parseInt(mid);

			Movie movie = movieDaoImpl.findById(movieId);

			List<Show> list1 = movie.getShows();

			boolean s = false;

			Theater theater = theaterDaoImpl.findById(theaterId);

			show.setTheater(theater);
			show.setTotalSeats(theater.getTseats());
			show.setMovie(movie);

			List<Show> list = theater.getShows();

			model.addAttribute("showList", list);

			LocalDate dateOfShow = show.getDateOfShow();

			showDaoImpl.addShow(show);

			List<Show> suraj = showDaoImpl.getShowsByMovieAndTheaterAndDate(movie, theater, dateOfShow);

			f = true;

			if (f) {
				session.setAttribute("succMsg", "!! Show Added Successfully !!");
			} else {
				session.setAttribute("failedMsg", "!! Something Went Wrong !!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		RedirectView rv = new RedirectView();
		rv.setUrl("show-list");

		return rv;
	}

	// ****************************** Deletig the show ***************************

	@RequestMapping("delete-show")
	public String deleteShows(@RequestParam int id, HttpSession session) {
		boolean f = false;

		showDaoImpl.deleteById(id);
		f = true;

		if (f) {
			session.setAttribute("succMsg", "!! Show Deleted Successfully !!");
		} else {
			session.setAttribute("failedMsg", "!! Something Went Wrong !!");
		}
		return "redirect:show-list";
	}

	// ********************************* Ticket Booking List
	// **************************************** //

	@GetMapping("/booking-list")
	public String booking(Model model, Principal principal, @Valid Ticket ticket) {
		String usernameString = principal.getName();
		User user = repository.getUserByUsername(usernameString);
		model.addAttribute("user", user);

		List<Ticket> tickets = ticketDaoImpl.geTickets();
		model.addAttribute("tickets", tickets);

		int count = tickets.size();
		model.addAttribute("Bcount", count);

		return "booking-list";
	}

	// *********************** All Transctions ********************

	@GetMapping("/user-transctions")
	public String Transctions(@Valid Orders orders, Model model, Principal principal) {

		String usernameString = principal.getName();
		User user = repository.getUserByUsername(usernameString);
		model.addAttribute("user", user);

		List<Orders> allOrder = ordersRepository.findAll();
		model.addAttribute("orders", allOrder);

		int order = allOrder.size();
		model.addAttribute("order", order);

		return "transctions_list";
	}

	// *********************** All Users ********************

	@GetMapping("/user-list")
	public String allUsers(Model model, Principal principal) {
		String usernameString = principal.getName();
		User user = repository.getUserByUsername(usernameString);
		model.addAttribute("user", user);

		String role1 = "ROLE_USER";

		List<User> users = userDaoImpl.getUsersByRole(role1);
		model.addAttribute("users", users);
		return "users_list";
	}

	@RequestMapping("delete-user")
	public String deleteUser(@RequestParam int id, HttpSession session) {
		boolean f = false;

		userDaoImpl.deleteUser(id);
		f = true;

		if (f) {
			session.setAttribute("succMsg", "!! User Deleted Successfully !!");
		} else {
			session.setAttribute("failedMsg", "!! Something Went Wrong !!");
		}

		return "redirect:user-list";
	}

}
