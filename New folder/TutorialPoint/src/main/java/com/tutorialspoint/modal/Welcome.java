package com.tutorialspoint.modal;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.OutputStream;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class Welcome {

	@PostMapping("/welcome")
	public String welcome() {
		System.out.println("welcome");
		
		return"welcome";
	}
	@GetMapping("/downloadTemplate")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ByteArrayInputStream fileStream = FileCreate.createFile();
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=UserRegister.xlsx");
        response.setContentLength(fileStream.available());

        try (OutputStream out = response.getOutputStream()) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fileStream.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }
        }
    }
}
