package com.Ticket.Booking.App.config;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailDaoImpl {

	@Autowired
	private JavaMailSender javaMailSender;

	public void sendEmail(String to) {
		String otp = generateOtp();
		try {
			sendEmailToOtp(to, otp);
		} catch (Exception e) {
			System.out.println(e+"Error ");
			e.printStackTrace();
		}
	}
	
	public String generateOtp() {
		Random random = new Random(1000);
		int otp = random.nextInt(99999);
		System.out.println("OTP : "+ otp);
		return String.valueOf(otp);
	}
	
	public void sendEmailToOtp(String email , String otp) throws MessagingException {
		MimeMessage msg = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(msg);
		helper.setTo(email);
		helper.setSubject("YOUR OTP IS :");
		helper.setText(otp);
		javaMailSender.send(msg);
		
	}
}
