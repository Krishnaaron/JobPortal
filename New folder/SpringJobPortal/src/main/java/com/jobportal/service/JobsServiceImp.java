package com.jobportal.service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import org.apache.poi.xssf.usermodel.DefaultIndexedColorMap;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.Comment;
import org.apache.poi.ss.usermodel.DataValidation;
import org.apache.poi.ss.usermodel.DataValidationConstraint;
import org.apache.poi.ss.usermodel.DataValidationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddressList;

import com.jobportal.mapper.JobsMapper;
import com.jobportal.model.JobApplications;
import com.jobportal.model.Jobs;

import org.apache.poi.xssf.usermodel.XSSFFont;

@Service
public class JobsServiceImp implements JobsService
{
	private static final Logger	LOGGER	= LogManager.getLogger(JobsServiceImp.class);

	@Autowired
	private JobsMapper			jobsMapper;

	/**
	 * Retrieves a list of all available jobs.
	 * 
	 * @return A list of Jobs objects representing the available job postings.
	 */
	@Override
	public List<Jobs> viewJobs()
	{

		return jobsMapper.viewJobs();
	}

	/**
	 * Retrieves the employer ID for a specific job.
	 * 
	 * @param job_Id
	 *            The ID of the job.
	 * @return The employer ID associated with the given job.
	 */
	@Override
	public int getEmployerIdForJob(int job_Id)
	{

		return jobsMapper.getEmployerIdForJob(job_Id);
	}

	/**
	 * Allows a job seeker to apply for a specific job. Handles
	 * DataIntegrityViolationException to manage unique constraint violations.
	 * 
	 * @param job_Id
	 *            The ID of the job to apply for.
	 * @param job_Seeker_Id
	 *            The ID of the job seeker applying for the job.
	 * @param employer_id
	 *            The ID of the employer offering the job.
	 * @return True if the application is successful; false otherwise.
	 */
	// @Override
	// public boolean applyJob(int job_Id, int job_Seeker_Id, int employer_id) {
	//
	// return jobsMapper.applyForJob(job_Id, job_Seeker_Id, employer_id);
	// }
	public boolean applyJob(int job_Id, int job_Seeker_Id, int employer_id)
	{
		try
		{
			return jobsMapper.applyForJob(job_Id, job_Seeker_Id, employer_id);
		}
		catch (DataIntegrityViolationException e)
		{
			// Handle unique constraint violation exception
			// You can log the error or throw a custom exception, or handle it
			// based on your
			// application's logic
			// e.printStackTrace(); // For logging purposes
			return false; // or throw a custom exception if needed
		}
	}

	/**
	 * Retrieves a list of jobs that a specific job seeker has applied for.
	 * 
	 * @param job_Seeker_Id
	 *            The ID of the job seeker.
	 * @return A list of Jobs objects that the job seeker has applied to.
	 */
	@Override
	public List<Jobs> appliedJobs(int job_Seeker_Id)
	{

		return jobsMapper.getJobApplicationsByJobSeekerId(job_Seeker_Id);
	}

	/**
	 * Retrieves the status of a specific job application for a job seeker.
	 * 
	 * @param job_Id
	 *            The ID of the job.
	 * @param job_Seeker_Id
	 *            The ID of the job seeker.
	 * @param employer_id
	 *            The ID of the employer.
	 * @return The status of the job application (e.g., "Pending", "Accepted",
	 *         "Rejected").
	 */
	@Override
	public String jobStatus(int job_Id, int job_Seeker_Id, int employer_id)
	{
		return jobsMapper.getStatusByJobIdEmpIdJobSeekerId(job_Id, employer_id, job_Seeker_Id);
	}

	@Override
	public List<Jobs> postedJobs(int employer_id)
	{
		return jobsMapper.viewPostedJobs(employer_id);
	}

	@Override
	public List<JobApplications> viewNumberApplicatio(int employer_id)
	{
		return jobsMapper.viewNumberApplication(employer_id);
	}

	@Override
	public boolean postJob(Jobs jobs)
	{
		return false;
	}

	@Override
	public ByteArrayInputStream downloadJobs(int employerId)
	{
		LOGGER.info("Entering downloadJobs Service package");
		// retriving data to jobs Mapper
		List<Jobs> jobs = jobsMapper.downloadJobs(employerId);
		if (jobs == null)
		{

			LOGGER.warn("no data for jobs table");
		}
		XSSFWorkbook workBook = new XSSFWorkbook();
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		Row row = null;
		Cell cell = null;
		Row valueRow = null;

		try
		{
			Sheet sheet = workBook.createSheet();
			sheet.setZoom(120);// zoom used for sheet
			CellStyle style = workBook.createCellStyle();
			sheet.createFreezePane(0, 2);// freeze column
			sheet.autoSizeColumn(0);
			style.setBorderTop(BorderStyle.THIN);
			style.setBorderBottom(BorderStyle.THIN);
			style.setBorderLeft(BorderStyle.THIN);
			style.setBorderRight(BorderStyle.THIN);
			style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			CellStyle styles = workBook.createCellStyle();
			styles.setBorderTop(BorderStyle.THIN);
			styles.setBorderBottom(BorderStyle.THIN);
			styles.setBorderLeft(BorderStyle.THIN);
			styles.setBorderRight(BorderStyle.THIN);
			styles.setFillForegroundColor(IndexedColors.BRIGHT_GREEN.index);
			styles.setFillPattern(FillPatternType.SOLID_FOREGROUND);

			row = sheet.createRow(0);
			row.setZeroHeight(true);
			sheet.setColumnHidden(0, true);
			sheet.setColumnHidden(1, true);
			sheet.setColumnHidden(2, true);

			int c = 1;
			// creating header field for sheet
			row = sheet.createRow(1);
			String[] header = { "Emp_id", "job_id", "Operation", "Status", "Role", "Job_description", "Location", "Skill", "Job_Type", "Experience_Level", "Number_of_Oppenings",
					"Job_Status", "Company_Name" };
			for (int i = 0; i < header.length; i++)
			{
				cell = row.createCell(c);
				cell.setCellValue(header[i]);
				sheet.setColumnWidth(i, 20 * 256);
				cell.setCellStyle(styles);
				c++;
			}

			Sheet dropdownSheet = workBook.createSheet("DropdownValues");
			String[] dropdownValues = { "Mod", "Add" };
			for (int i = 0; i < dropdownValues.length; i++)
			{
				valueRow = dropdownSheet.createRow(i);
				cell = valueRow.createCell(0);
				cell.setCellValue(dropdownValues[i]);
				cell.setCellStyle(style);
			}

			// Create data validation for the dropdown list
			DataValidationHelper validationHelper = sheet.getDataValidationHelper();
			String formula = "DropdownValues!$A$1:$A$" + dropdownValues.length;
			DataValidationConstraint constraint = validationHelper.createFormulaListConstraint(formula);
			CellRangeAddressList addressList = new CellRangeAddressList(2, 100, 3, 3);
			DataValidation validation = validationHelper.createValidation(constraint, addressList);
			sheet.addValidationData(validation);
			int i = 2;
			for (Jobs jobs1 : jobs)
			{
				row = sheet.createRow(i);
				sheet.setColumnWidth(i, 20 * 256);
				cell = row.createCell(1);
				cell.setCellStyle(style);
				cell.setCellValue(jobs1.getEmployer_Id());
				cell = row.createCell(2);
				cell.setCellStyle(style);
				cell.setCellValue(jobs1.getJob_Id());
				cell = row.createCell(3);
				cell.setCellStyle(style);
				cell = row.createCell(4);
				cell.setCellStyle(style);
				cell = row.createCell(5);
				cell.setCellStyle(style);
				cell.setCellValue(jobs1.getJob_Title());
				cell = row.createCell(6);
				cell.setCellStyle(style);
				cell.setCellValue(jobs1.getJob_Description());
				cell = row.createCell(7);
				cell.setCellStyle(style);
				cell.setCellValue(jobs1.getLocation());
				cell = row.createCell(8);
				cell.setCellStyle(style);
				cell.setCellValue(jobs1.getRequired_Skills());
				cell = row.createCell(9);
				cell.setCellStyle(style);
				cell.setCellValue(jobs1.getJob_Type());
				cell = row.createCell(10);
				cell.setCellStyle(style);
				cell.setCellValue(jobs1.getExperience_Level());
				cell = row.createCell(11);
				cell.setCellStyle(style);
				cell.setCellValue(jobs1.getNumber_Of_Openings());
				cell = row.createCell(12);
				cell.setCellStyle(style);
				cell.setCellValue(jobs1.getJob_Status());
				cell = row.createCell(13);
				cell.setCellStyle(style);
				cell.setCellValue(jobs1.getCompany_Name());
				i++;

			}
			workBook.write(os);
		}
		catch (Exception e)
		{
			LOGGER.error("Exception is throwed", e);
			e.printStackTrace();

		}
		finally
		{
			if (workBook != null)
			{
				try
				{
					workBook.close();
				}
				catch (IOException e)
				{
					e.printStackTrace();
				}
			}
		}

		return new ByteArrayInputStream(os.toByteArray());

	}

	public ByteArrayInputStream updateJobs(String filePath, int employerid)
	{
		if (filePath == null || filePath.trim().isEmpty())
		{
			LOGGER.error(filePath + "File Path not recevied on updateJob Service");
			throw new IllegalArgumentException("File path cannot be null or empty");
		}
		DataValidations validation = new DataValidations();
		XSSFWorkbook workBook = null;
		Sheet sheet = null;
		Row row = null;
		Cell cell = null;
		ClientAnchor anchor = null;
		Comment comment = null;
		boolean condition = false;
		int rowSize = 0;

		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
		String operation = "sam";

		try (FileInputStream fileInputStream = new FileInputStream(filePath))
		{
			workBook = new XSSFWorkbook(fileInputStream);
			sheet = workBook.getSheetAt(0);
			rowSize = sheet.getLastRowNum();
			Drawing<?> drawing = sheet.createDrawingPatriarch();
			CellStyle cellStyle = workBook.createCellStyle();
			CellStyle cellStyle2 = workBook.createCellStyle();
			XSSFFont font = (XSSFFont) workBook.createFont();
			font.setColor(new XSSFColor(java.awt.Color.RED, new DefaultIndexedColorMap()));
			cellStyle.setFont(font);
			cellStyle.setBorderTop(BorderStyle.THIN);
			cellStyle.setBorderBottom(BorderStyle.THIN);
			cellStyle.setBorderLeft(BorderStyle.THIN);
			cellStyle.setBorderRight(BorderStyle.THIN);
			cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			font.setColor(new XSSFColor(java.awt.Color.MAGENTA, new DefaultIndexedColorMap()));
			cellStyle2.setFont(font);
			for (int i = 2; i <= rowSize; i++)
			{
				Jobs job = new Jobs();
				row = sheet.getRow(i);
				if (row == null)
					continue;

				for (int j = 0; j < row.getLastCellNum(); j++)
				{
					cell = row.getCell(j);

					if (cell == null || cell.getCellType() == CellType.BLANK)
					{
						if (j != 4)
						{
							anchor = workBook.getCreationHelper().createClientAnchor();
							anchor.setCol1(j);
							anchor.setRow1(i);
							comment = drawing.createCellComment(anchor);
							comment.setString(workBook.getCreationHelper().createRichTextString("This field is mandatory"));
							cell = row.createCell(j, CellType.STRING);
							cell.setCellComment(comment);
							cell.setCellStyle(cellStyle);

						}
					}
					else
					{
						switch (cell.getCellType())
						{
						case STRING:
							String cellValue = cell.getStringCellValue();
							switch (j)
							{
							case 3:
								operation = cellValue;
								job.setOperation(operation);
								break;
							case 5:
								job.setJob_Title(cellValue);
								break;
							case 6:
								job.setJob_Description(cellValue);
								break;
							case 7:
								job.setLocation(cellValue);
								break;
							case 8:
								job.setRequired_Skills(cellValue);
								break;
							case 9:
								job.setJob_Type(cellValue);
								break;

							case 12:
								job.setJob_Status(cellValue);
								break;
							case 13:
								job.setCompany_Name(cellValue);
								break;
							default:
								LOGGER.warn("Unexpected string cell index: " + j);
							}

							break;
						case NUMERIC:
							switch (j)
							{
							case 1:
								job.setEmployer_Id((int) cell.getNumericCellValue());
								break;
							case 2:
								job.setJob_Id((int) cell.getNumericCellValue());
								break;
							case 10:
								job.setExperience_Level((int) cell.getNumericCellValue());
								break;
							case 11:
								try
								{

									job.setNumber_Of_Openings((int) cell.getNumericCellValue());
								}
								catch (Exception e)
								{

									LOGGER.warn("Number of Experience error is not number: " + j);

								}
								break;
							default:
								LOGGER.warn("Unexpected numeric cell index", j);
							}

							break;
						case BOOLEAN:
						case FORMULA:
							break;
						default:
							LOGGER.warn("Unexpected cell type: " + cell.getCellType());
						}
					}
				}
				cell = row.createCell(4, CellType.STRING);

				if ("Add".equals(operation))
				{
					condition = validation.dataValidations(job);
					if (condition)
					{
						job.setEmployer_Id(employerid);
						boolean status = jobsMapper.postNewJob(job);
						cell.setCellValue(status ? "Success" : "failed");
						cell.setCellStyle(cellStyle);
					}
					else
					{

						cell.setCellValue("failed");
						cell.setCellStyle(cellStyle);

					}
				}
				else if ("Mod".equals(operation))
				{
					condition = validation.dataValidation(job);

					if (condition)
					{

						boolean status = jobsMapper.updateJobs(job);

						cell.setCellValue(status ? "Success" : "failed");
						cell.setCellStyle(cellStyle);
					}
					else
					{

						cell.setCellValue("failed");
						cell.setCellStyle(cellStyle);

					}

				}
				else
				{

					cell.setCellValue("failed");
					cell.setCellStyle(cellStyle);

				}

			}

			// Hide columns and set zero height for the header row
			// row = sheet.createRow(0);
			// row.setZeroHeight(true);
			sheet.setColumnHidden(0, true);
			sheet.setColumnHidden(1, true);
			sheet.setColumnHidden(2, true);

			workBook.write(byteArrayOutputStream);

		}
		catch (IOException e)
		{
			LOGGER.error("DataCheking controller error", e);
			e.printStackTrace();

		}
		finally
		{
			if (workBook != null)
			{
				try
				{
					workBook.close();
				}
				catch (IOException e)
				{
					e.printStackTrace();
				}
			}
		}

		return new ByteArrayInputStream(byteArrayOutputStream.toByteArray());
	}

	@Override
	public ByteArrayInputStream createFile()
	{
		ByteArrayOutputStream bs = new ByteArrayOutputStream();
		Workbook workBook = new XSSFWorkbook();
		Sheet sheet = null;
		Row row = null;
		CellStyle style = null;
		CellStyle styles = null;
		Cell cell = null;
		try
		{

			sheet = workBook.createSheet("MainSheet");
			sheet.setZoom(140);
			sheet.setColumnHidden(1, true);
			sheet.setColumnHidden(2, true);
			sheet.setColumnHidden(12, true);
			sheet.setColumnHidden(0, true);
			// Create a style for the header
			style = workBook.createCellStyle();
			style.setBorderLeft(BorderStyle.THIN);
			style.setBorderRight(BorderStyle.THIN);
			style.setBorderBottom(BorderStyle.THIN);

			styles = workBook.createCellStyle();
			styles.setBorderLeft(BorderStyle.THIN);
			styles.setBorderRight(BorderStyle.THIN);
			styles.setBorderBottom(BorderStyle.THIN);
			styles.setBorderTop(BorderStyle.THIN);
			style.setFillForegroundColor(IndexedColors.BRIGHT_GREEN.index);
			style.setFillPattern(FillPatternType.SOLID_FOREGROUND);

			String[] header = { "Emp_id", "job_id", "Operation", "Status", "Role", "Job_description", "Location", "Skill", "Job_Type", "Experience_Level", "Number_of_Oppenings",
					"Job_Status", "Company_Name" };
			row = sheet.createRow(1);
			int c = 0;
			for (int i = 1; i < header.length + 1; i++)
			{
				sheet.setColumnWidth(i, 20 * 256);
				cell = row.createCell(i);
				cell.setCellValue(header[c]);
				cell.setCellStyle(style);
				c++;
			}
			Sheet dropdownSheet = workBook.createSheet("DropdownValues");
			String[] dropdownValues = { "Add" };
			for (int i = 0; i < dropdownValues.length; i++)
			{
				Row valueRow = dropdownSheet.createRow(i);
				cell = valueRow.createCell(0);
				cell.setCellValue(dropdownValues[i]);
				cell.setCellStyle(style);
			}
			DataValidationHelper validationHelper = sheet.getDataValidationHelper();
			String formula = "DropdownValues!$A$1:$A$" + dropdownValues.length;
			DataValidationConstraint constraint = validationHelper.createFormulaListConstraint(formula);
			CellRangeAddressList addressList = new CellRangeAddressList(1, 100, 3, 3);
			DataValidation validation = validationHelper.createValidation(constraint, addressList);
			// Apply data validation to the sheet
			sheet.addValidationData(validation);
			for (int j = 2; j < 3; j++)
			{

				row = sheet.createRow(j);

				for (int i = 0; i < header.length + 1; i++)
				{

					cell = row.createCell(i);
					cell.setCellStyle(styles);
				}
			}

			workBook.write(bs);

		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				workBook.close();
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
		}

		return new ByteArrayInputStream(bs.toByteArray());
	}

}
