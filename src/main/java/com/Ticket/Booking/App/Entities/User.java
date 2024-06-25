package com.Ticket.Booking.App.Entities;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity(name = "users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@NotBlank(message = "Field Not be Blank!!")
	private String name;
	@Size(min = 1 , max = 12 , message = "Username must contain minimum 3 letters!!")
	private String username;
	@NotBlank(message = "Enter correct password!!")
	private String password;
	@NotBlank(message = "Enter correct password!!")
	private String confirmPassword;
	@NotBlank(message = "Field is madatory!!")
	private String email;
	private String role;
	private String imageUrl;
	private boolean enabled;
	private boolean checked;
	private String address;
	
	 @OneToMany(mappedBy = "user")
	    private List<Orders> order;
	
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public List<Orders> getOrder() {
		return order;
	}
	public void setOrder(List<Orders> order) {
		this.order = order;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public User() {
		super();
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", username=" + username + ", password=" + password
				+ ", confirmPassword=" + confirmPassword + ", email=" + email + ", role=" + role + ", imageUrl="
				+ imageUrl + ", enabled=" + enabled + "]";
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public User(@NotBlank(message = "Field Not be Blank!!") String name,
			@Size(min = 1, max = 12, message = "Username must contain minimum 3 letters!!") String username,
			@NotBlank(message = "Enter correct password!!") String password,
			@NotBlank(message = "Enter correct password!!") String confirmPassword,
			@NotBlank(message = "Field is madatory!!") String email, String role, String imageUrl, boolean enabled, String address) {
		super();
		this.name = name;
		this.username = username;
		this.password = password;
		this.confirmPassword = confirmPassword;
		this.email = email;
		this.role = role;
		this.imageUrl = imageUrl;
		this.enabled = enabled;
		this.address = address;
	}
	
}
