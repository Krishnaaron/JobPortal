package com.jobportal.controller;

import java.util.Properties;
import java.util.Random;

import com.jobportal.model.User;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class SendEmail {

    private static final String FROM_EMAIL = "2k20cse179@kiot.ac.in"; // Replace with your email
    private static final String PASSWORD = "Krishna121@"; // Replace with your app-specific password
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";
    private static final String LOGO_URL = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTGp0kefQA7lAzPq9m4rZb5i8mnhaNSixVcEA4owHBbUyzOEzJ"
    		+ ""; // Replace with your logo URL

    // Generate a random 6-digit verification code
    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    // Send a verification email to the user
    public boolean sendEmail(User user) {
        boolean success = false;
        String toEmail = user.getEmail();

        // SMTP server properties
        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Create a new email session with an authenticator
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, PASSWORD);
            }
        });

        try {
            // Create a new email message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FROM_EMAIL));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("User Email Verification");

            // HTML content
            String emailContent = "<html>" +
                    "<body>" +
                    "<img src='" + LOGO_URL + "' alt='Company Logo' style='width: 100px; height: auto;' />" +
                    "<h2 style='color: #242b5e;'>Welcome to Job Finder!</h2>" +
                    "<p>Dear " + user.getName() + ",</p>" +
                    "<p>Registration Successful. Please verify your account using this code:</p>" +
                    "<h3 style='color: #fa276d;'>" + user.getCode() + "</h3>" +
                    "<p>Thank you for joining us!</p>" +
                    "<p>Best Regards,</p>" +
                    "<p><strong>Job Finder Team</strong></p>" +
                    "</body>" +
                    "</html>";

            message.setContent(emailContent, "text/html");
            // Send the email
            Transport.send(message);
            success = true;

        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return success;
    }



    public boolean sendPasswordResetEmail(String email) {
        boolean success = false;
        String toEmail = email;
        
        // SMTP server properties
        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Create a new email session with an authenticator
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, PASSWORD);
            }
        });

        try {
            // Create a new email message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FROM_EMAIL));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("Password Reset Request");

            // HTML content for password reset
            String emailContent = "<html>" +
                    "<body>" +
                    "<img src='" + LOGO_URL + "' alt='Company Logo' style='width: 100px; height: auto;' />" +
                    "<h2 style='color: #242b5e;'>Password Reset Request</h2>" +
                    "<p>We received a request to reset your password. Please follow the link below to reset your password:</p>" +
                    "<a href='http://example.com/reset-password' style='color: #fa276d;'>Reset Password</a>" +
                    "<p>If you did not request a password reset, please ignore this email or contact support.</p>" +
                    "<p>Best Regards,</p>" +
                    "<p><strong>Job Finder Team</strong></p>" +
                    "</body>" +
                    "</html>";

            message.setContent(emailContent, "text/html");
            // Send the email
            Transport.send(message);
            success = true;

        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return success;
    }
}
