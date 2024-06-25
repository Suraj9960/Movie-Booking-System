package com.Ticket.Booking.App.controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Ticket.Booking.App.Entities.Movie;
import com.Ticket.Booking.App.Entities.User;
import com.Ticket.Booking.App.config.EmailDaoImpl;
import com.Ticket.Booking.App.serviceDaoImpl.MovieDaoImpl;
import com.Ticket.Booking.App.serviceDaoImpl.UserDaoImpl;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomeController {
	
	@Autowired
	private EmailDaoImpl emailDaoImpl;
	
	@Autowired
	private UserDaoImpl userDaoImpl;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private MovieDaoImpl movieDaoImpl;
	

	@GetMapping("/")
	public String home(Model model) {
		
		List<Movie> allMovies = movieDaoImpl.getFirstThreeMovies();
		model.addAttribute("movie", allMovies);
		
		return "Welcome";
	}
	
	@PostMapping("/send-mail")
	public String send() {
		
		String to = "surajkadam9965@gmail.com";
		String subject = "Nothing All okk";
		String text = "none";
		emailDaoImpl.sendEmail(to);
		return "success";
	}

	// **************************************** User Registration Process  ************************

	@GetMapping("/registerForm")
	public String register(ModelMap modelMap, User us, Model model) {
		User user2 = new User(us.getName(), us.getUsername(), us.getPassword(), us.getConfirmPassword(), us.getEmail(),
				us.getRole(), us.getImageUrl(), us.isEnabled(),us.getAddress());
		modelMap.addAttribute("user", user2);
		return "register";
	}

	@PostMapping("/do-register")
	public String registerPage(@Valid @ModelAttribute("user") User user, BindingResult result,
			HttpServletRequest request, HttpSession session, Model model,
			@RequestParam(value = "checked", defaultValue = "false") boolean check,
			@RequestParam("imageUrl") MultipartFile file) {
		
		if(result.hasErrors()) {
			List<FieldError> name = result.getFieldErrors("name");
			 FieldError username  =result.getFieldError("username");
			 FieldError password =  result.getFieldError("password");
			 FieldError Cpassword = result.getFieldError("confirmPassword");
			 FieldError email = result.getFieldError("email");
			
			model.addAttribute("name", name);
			model.addAttribute("username", username);
			model.addAttribute("password", password);
			model.addAttribute("Cpassword", Cpassword);
			model.addAttribute("email", email);
		}

		user.setImageUrl(file.getOriginalFilename());

		// for sending email

		boolean f = false;

		try {
			// save the file into folder
			byte[] data = file.getBytes();

			// save the image to folder
			String path = session.getServletContext().getRealPath("/") + "UserImage" + File.separator
					+ file.getOriginalFilename();

			FileOutputStream fos = new FileOutputStream(path);
			fos.write(data);
			fos.close();

			if (user.getEmail().equals("admin@gmail.com")) {
				user.setRole("ROLE_ADMIN");
			} else {
				user.setRole("ROLE_USER");
			}
			user.setEnabled(true);
			
			

			if (check) {			
				user.setPassword(passwordEncoder.encode(user.getPassword()));
				user.setConfirmPassword(passwordEncoder.encode(user.getConfirmPassword()));
				// Add user to the database
				userDaoImpl.addUser(user);

				f = true;
				session.setAttribute("succMsg", "Registered Successfully");
			} else {
				session.setAttribute("failedMsg", "Something went wrong");
				return "register";
			}

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("failedMsg", "Something went wrong");
			return "register";
		}

		return "register";
	}

	// ********************** Login Page *********************** //

	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}

	// Forget Password Module

	@GetMapping("/forget-password")
	public String openModel() {
		return "forget_password_form";
	}

	@PostMapping("/send-otp")
	public String sendOtp(@RequestParam("userEmail") String email, Model model, HttpSession session) {
		Random random = new Random(1000);
		int otp = random.nextInt(99999);
		System.out.println(email);

		return "otp_form";
	}

}
