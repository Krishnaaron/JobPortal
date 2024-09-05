package com.jobportal.service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.Comment;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
public class FileUploadImp
{
	private static final Logger	LOGGER	= LogManager.getLogger(FileUploadImp.class);

	public static ByteArrayInputStream downloadFile(String filePath)
	{

		FileInputStream fs = null;
		ByteArrayOutputStream fo = null;
		Workbook workBook = null;
		Workbook workBook2 = null;
		String path = filePath;
		LOGGER.trace("Entering File Upload Data check Service class");
		try
		{

			fs = new FileInputStream(path);
			workBook = new XSSFWorkbook(fs);
			workBook2 = new XSSFWorkbook();
			Sheet sheet2 = workBook2.createSheet("Updated Data");

			// Create a drawing patriarch to hold comments
			Drawing<?> drawing = sheet2.createDrawingPatriarch();

			Sheet sheet = workBook.getSheetAt(0);
			int sizeOfRow = sheet.getLastRowNum();
			System.out.println("Number of rows: " + (sizeOfRow + 1));

			// Create a map to store and reuse cell styles
			Map<String, CellStyle> styleMap = new HashMap<>();

			// Create style for status cells
			CellStyle statusStyle = workBook2.createCellStyle();
			statusStyle.setBorderLeft(BorderStyle.THIN);
			statusStyle.setBorderRight(BorderStyle.THIN);
			statusStyle.setBorderBottom(BorderStyle.THIN);
			statusStyle.setBorderTop(BorderStyle.THIN);
			statusStyle.setFillForegroundColor(IndexedColors.BLUE1.index);
			statusStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

			Row row = null;
			Row row2 = sheet2.createRow(0);
			LOGGER.trace("upload file data copy to another file ");
			String[] header = { "Operation", "JobTittle", "JobDescription", "Location", "RequriredSkills", "JobType", "Expreriece", "number of opennings",
					"Education Qualification", "ApplicatiodDeadLine", "Status" };

			for (int i = 0; i < header.length; i++)
			{
				sheet.setColumnWidth(i, 20 * 256);
				// style.setFillForegroundColor(IndexedColors.BRIGHT_GREEN.index);
				Cell cell = row2.createCell(i);
				cell.setCellValue(header[i]);
				cell.setCellStyle(statusStyle);
			}

			for (int i = 1; i <= sizeOfRow; i++)
			{
				row = sheet.getRow(i);
				row2 = sheet2.createRow(i);

				if (row == null)
				{
					row2 = sheet2.createRow(i);
					continue;
				}

				int nonEmptyCellCount = 0;

				for (int j = 0; j < row.getPhysicalNumberOfCells(); j++)
				{
					Cell cell = row.getCell(j);
					Cell cell2 = row2.createCell(j); // Create cell2 in each
														// iteration
					sheet2.setColumnWidth(j, 20 * 256); // Set column width

					// Copy cell style
					if (cell != null)
					{
						CellStyle cellStyle = cell.getCellStyle();
						String styleKey = Integer.toString(cellStyle.hashCode()); 
						CellStyle newCellStyle = styleMap.get(styleKey);

						if (newCellStyle == null)
						{
							newCellStyle = workBook2.createCellStyle();
							newCellStyle.cloneStyleFrom(cellStyle);
							styleMap.put(styleKey, newCellStyle);
						}

						cell2.setCellStyle(newCellStyle);
					}

					if (cell == null || cell.getCellType() == CellType.BLANK)
					{
						ClientAnchor anchor = workBook2.getCreationHelper().createClientAnchor();
						anchor.setCol1(j);
						anchor.setRow1(i);
						Comment comment = drawing.createCellComment(anchor);
						comment.setString(workBook2.getCreationHelper().createRichTextString("This field is mandatory"));
						cell2.setCellComment(comment);

						CellStyle style = workBook2.createCellStyle();
						style.setBorderBottom(BorderStyle.THIN);
						style.setBorderTop(BorderStyle.THIN);
						style.setBorderLeft(BorderStyle.THIN);
						style.setBorderRight(BorderStyle.THIN);
						style.setFillForegroundColor(IndexedColors.AQUA.index);
						style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
						cell2.setCellStyle(style);
					}
					else
					{
						// Set cell value based on type
						switch (cell.getCellType())
						{
						case STRING:
							cell2.setCellValue(cell.getStringCellValue());
							nonEmptyCellCount++;
							break;
						case NUMERIC:
							cell2.setCellValue(cell.getNumericCellValue());
							nonEmptyCellCount++;
							break;
						case BOOLEAN:
							cell2.setCellValue(cell.getBooleanCellValue());
							nonEmptyCellCount++;
							break;
						case FORMULA:
							cell2.setCellFormula(cell.getCellFormula());
							nonEmptyCellCount++;
							break;
						default:
							break;
						}

					}
				}

				if (nonEmptyCellCount > 0 && nonEmptyCellCount < 10)
				{

					row2.createCell(10).setCellValue("Failed");
					nonEmptyCellCount = 0;
					// statusCell.setCellStyle(statusStyle);
				}
				else if (nonEmptyCellCount >= 10)
				{
					row2.createCell(10).setCellValue("Success");
					nonEmptyCellCount = 0;
					// statusCell.setCellStyle(statusStyle);
				}
				else
				{
					// statusCell.setCellValue("No Data");
					// statusCell.setCellStyle(statusStyle);
				}

				// Adjust column width for the status column
				sheet2.setColumnWidth(row.getPhysicalNumberOfCells(), 20 * 256);

				System.out.println(); // Move to the next line after each row
			}

			// Write the workbook to a ByteArrayOutputStream
			fo = new ByteArrayOutputStream();
			workBook2.write(fo);

		}
		catch (Exception e)
		{
			e.printStackTrace();
			LOGGER.error("file data checking proplem",e);
		}
		finally
		{
			try
			{
				if (workBook != null)
				{
					workBook.close();
				}
				if (workBook2 != null)
				{
					workBook2.close();
				}
				if (fs != null)
				{
					fs.close();
				}
				if (fo != null)
				{
					fo.close();
				}
			}
			catch (IOException e)
			{
				e.printStackTrace();
			}
		}
		return new ByteArrayInputStream(fo.toByteArray());
	}

}
