package com.mailtask.mailsender;

import java.util.Properties;
import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;
import jakarta.activation.*;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeBodyPart;
import jakarta.mail.internet.MimeMessage;

//public class MailSender {
//	
//	private String from ="2k20cse179@kiot.ac.in";
//	private String password="Krishna121@";
//	private String smtp_Host="smtp.gmail.com";
//	private String smtp_Port="587";
//	private String to="krishsri520@gmail.com";
//	
//	public boolean sendEmail() {
//		boolean messageSu = false;
//		Properties prop =new Properties();
//		prop.put("mail.smtp.host", smtp_Host);
//		prop.put("mail.smtp.port", smtp_Port);
//		prop.put("mail.smtp.auth","true");
//		prop.put("mail.smtp.starttls.enable", "true");
//		
//		Session ses = Session.getInstance(prop,new Authenticator() {
//			protected PasswordAuthentication getPasswordAuthentication() {
//				
//				return new PasswordAuthentication(from,password);
//			}
//			
//		});
//		
//		
//		try {
//		MimeMessage message = new MimeMessage(ses);
//		message.setFrom(new InternetAddress(from));
//		message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
//		message.setSubject("Notification Schedular");
//		
//		String emailContent="sampleContent";
//		message.setContent(emailContent,"text/plain");
//	    Transport.send(message);
//	    messageSu =true;
//		
//		
//		}catch(Exception e) {
//			e.printStackTrace();
//			
//			
//			
//		}
//		
//		return messageSu;
//	}
	
public class MailSender {

    private String from = "2k20cse179@kiot.ac.in";
    private String password = "Krishna121@";
    private String smtp_Host = "smtp.gmail.com";
    private String smtp_Port = "587";
    private String to = "krishsri520@gmail.com";

    public boolean sendEmailWithAttachment(String filePath) {
        boolean messageSu = false;

        Properties prop = new Properties();
        prop.put("mail.smtp.host", smtp_Host);
        prop.put("mail.smtp.port", smtp_Port);
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(prop, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Generated Report");

            // Create the message part
            MimeBodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setText("report.");

            // Create a multipart message for attachment
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messageBodyPart);

            // Attachment part
            MimeBodyPart attachmentPart = new MimeBodyPart();
            DataSource source = new FileDataSource(filePath);
            attachmentPart.setDataHandler(new DataHandler(source));
            attachmentPart.setFileName(filePath);
            multipart.addBodyPart(attachmentPart);

            // Send the complete message parts
            message.setContent(multipart);

            // Send the message
            Transport.send(message);
            messageSu = true;

        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return messageSu;
    }
	
	

}
