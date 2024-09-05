package com.jobportal.controller;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.jobportal.model.Employers;
import com.jobportal.service.JobsService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class BulkDataController
{
	private static final Logger	LOGGER	= LogManager.getLogger(BulkDataController.class);

	@Autowired
	private JobsService			jobsService;

	@Value("${file.upload-dir}")
	private String				uploadedFolder;

	@PostMapping("/sampl")
	protected void downloadSampleTemplate(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		LOGGER.info("Job posting Templatecontroller {}");
		sendFile(response, jobsService.createFile(), "jobPostBlankTemplate.xlsx");
	}

	@PostMapping("/ModDataDownload")
	protected void downloadJobsData(HttpServletRequest request, HttpServletResponse response) throws IOException
	{

		HttpSession session = request.getSession();
		Employers employers = (Employers) session.getAttribute("employers");
		int id = employers.getId();
		LOGGER.info("Download Existing data Controller based on employer {}", employers.getId());
		sendFile(response, jobsService.downloadJobs(id), "ExistingData.xlsx");
	}

	@PostMapping("/fileupload")
	public void uploadFile(@RequestParam("file") MultipartFile file, @RequestParam("id") int id, HttpSession session, RedirectAttributes redirectAttributes,
			HttpServletResponse response)
	{

		try
		{
			Path path = Paths.get(uploadedFolder + StringUtils.cleanPath(file.getOriginalFilename()));
			Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
			session.setAttribute("filePath", path.toString());
			session.setAttribute("id", id);
			redirectAttributes.addFlashAttribute("message", "File uploaded successfully!");
			if (path.toString() == null)
			{
				LOGGER.error("File uploading path not find", path.toString());
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found");
				return;
			}
			sendFile(response, jobsService.updateJobs(path.toString(), id), "UpdatedData.xlsx");
			// return "redirect:/preFieldDataDownload";
		}
		catch (IOException e)
		{
			LOGGER.error("File uploading proplem", e);
			redirectAttributes.addFlashAttribute("error", "Failed to upload file.");
			// return "employers/postJob";
		}
	}

	private void sendFile(HttpServletResponse response, ByteArrayInputStream fileStream, String filename) throws IOException
	{
		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		response.setHeader("Content-Disposition", "attachment; filename=" + filename);
		response.setContentLength(fileStream.available());
		LOGGER.info("File Convert byte Browser Automatic Download");
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
