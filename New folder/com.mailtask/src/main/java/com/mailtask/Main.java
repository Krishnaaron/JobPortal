package com.mailtask;

import java.time.LocalDateTime;

import jakarta.mail.*;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;

public class Main {

    public static void main(String[] args) {
        // Email server configuration
        String host = "imap.gmail.com"; // For Gmail
        String mailStoreType = "imap";
        String username = "2k20cse179@kiot.ac.in";
        String password = "Krishna121@";

        // Set mail properties
        Properties properties = new Properties();
        properties.put("mail.store.protocol", mailStoreType);
        properties.put("mail.imap.host", host);
        properties.put("mail.imap.port", "993");
        properties.put("mail.imap.ssl.enable", "true");

        try {
            // Get the session object
            Session emailSession = Session.getDefaultInstance(properties);

            // Create the IMAP store object and connect to the server
            Store store = emailSession.getStore("imap");
            store.connect(host, username, password);

            // Get the inbox folder
            Folder inbox = store.getFolder("INBOX");
            inbox.open(Folder.READ_ONLY);

            // Get the messages from the inbox folder
            Message[] messages = inbox.getMessages();

            System.out.println("Total Messages: " + messages.length);

            for (int i = 0; i < messages.length; i++) {
                Message message = messages[i];
                System.out.println("---------------------------------");
                System.out.println("Email Number " + (i + 1));
                System.out.println("Subject: " + message.getSubject());
                System.out.println("From: " + message.getFrom()[0]);
                
                System.out.println("Text: " + message.getContent().toString());
            }

            // Close the connections
            inbox.close(false);
            store.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
