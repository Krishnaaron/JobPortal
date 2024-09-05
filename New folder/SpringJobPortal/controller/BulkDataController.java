package com.jobportal.controller;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.jobportal.service.DownloadTemplateServiceImp;
import com.jobportal.service.JobsService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class BulkDataController
{

	@Autowired
	private JobsService	jobsService;

	@Value("${file.upload-dir}")
	private String		uploadedFolder;

	@PostMapping("/sampl")
	protected void downloadSampleTemplate(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		sendFile(response, DownloadTemplateServiceImp.createFile(), "UserRegister.xlsx");
	}

	@PostMapping("/ModDataDownload")
	protected void downloadJobsData(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		sendFile(response, jobsService.downloadJobs(), "Jobs.xlsx");
	}

	@GetMapping("/preFieldDataDownload")
	protected void downloadPreFieldData(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException
	{
		String filePath = (String) session.getAttribute("filePath");
		if (filePath == null)
		{
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found");
			return;
		}
		sendFile(response, jobsService.updateJobs(filePath), "UserRegister.xlsx");
	}

	@PostMapping("/fileupload")
	public String uploadFile(@RequestParam("file") MultipartFile file, HttpSession session, RedirectAttributes redirectAttributes)
	{
		try
		{
			Path path = Paths.get(uploadedFolder + StringUtils.cleanPath(file.getOriginalFilename()));
			Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
			session.setAttribute("filePath", path.toString());
			redirectAttributes.addFlashAttribute("message", "File uploaded successfully!");
			return "redirect:/preFieldDataDownload";
		}
		catch (IOException e)
		{
			redirectAttributes.addFlashAttribute("error", "Failed to upload file.");
			return "employers/postJob";
		}
	}

	private void sendFile(HttpServletResponse response, ByteArrayInputStream fileStream, String filename) throws IOException
	{
		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		response.setHeader("Content-Disposition", "attachment; filename=" + filename);
		response.setContentLength(fileStream.available());

		try (OutputStream out = response.getOutputStream())
		{
			byte[] buffer = new byte[1024];
			int bytesRead;
			while ((bytesRead = fileStream.read(buffer)) != -1)
			{
				out.write(buffer, 0, bytesRead);
			}
		}
	}
}
