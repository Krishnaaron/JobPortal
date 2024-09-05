//package com.jobportal.service;
//
//import java.io.ByteArrayInputStream;
//import java.io.ByteArrayOutputStream;
//import org.apache.poi.ss.usermodel.BorderStyle;
//import org.apache.poi.ss.usermodel.Cell;
//import org.apache.poi.ss.usermodel.CellStyle;
//import org.apache.poi.ss.usermodel.FillPatternType;
//import org.apache.poi.ss.usermodel.IndexedColors;
//import org.apache.poi.ss.usermodel.Row;
//import org.apache.poi.ss.usermodel.Sheet;
//import org.apache.poi.ss.usermodel.Workbook;
//import org.apache.poi.ss.util.CellRangeAddressList;
//import org.apache.poi.ss.usermodel.DataValidation;
//import org.apache.poi.ss.usermodel.DataValidationConstraint;
//import org.apache.poi.ss.usermodel.DataValidationHelper;
//import org.apache.poi.xssf.usermodel.XSSFWorkbook;
//
//public class DownloadTemplateServiceImp 
//{
//	public static ByteArrayInputStream createFile()
//	{
//
//		ByteArrayOutputStream bs = new ByteArrayOutputStream();
//		Workbook workBook = new XSSFWorkbook();
//		try
//		{
//			// Create the main sheet
//			Sheet sheet = workBook.createSheet("MainSheet");
//			sheet.setZoom(140);
//			sheet.setColumnHidden(1, true);
//			sheet.setColumnHidden(2, true);
//			sheet.setColumnHidden(0, true);
//			// Create a style for the header
//			CellStyle style = workBook.createCellStyle();
//			style.setBorderLeft(BorderStyle.THIN);
//			style.setBorderRight(BorderStyle.THIN);
//			style.setBorderBottom(BorderStyle.THIN);
//
//			CellStyle styles = workBook.createCellStyle();
//			styles.setBorderLeft(BorderStyle.THIN);
//			styles.setBorderRight(BorderStyle.THIN);
//			styles.setBorderBottom(BorderStyle.THIN);
//			styles.setBorderTop(BorderStyle.THIN);
//			style.setFillForegroundColor(IndexedColors.BRIGHT_GREEN.index);
//			style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
//
//			// Add headers
//			String[] header = { "Emp_id", "job_id", "Operation", "Status", "Role", "Job_description", "Location", "Skill", "Job_Type", "Experience_Level", "Number_of_Oppenings",
//					"Job_Status", "Company_Name" };
//			Row row = sheet.createRow(1);
//			int c=0;
//			for (int i = 1; i < header.length+1; i++)
//			{
//				sheet.setColumnWidth(i, 20 * 256);
//				// style.setFillForegroundColor(IndexedColors.BRIGHT_GREEN.index);
//				Cell cell = row.createCell(i);
//				cell.setCellValue(header[c]);
//				cell.setCellStyle(style);
//				c++;
//			}
//
//			// Create a sheet for dropdown values
//			Sheet dropdownSheet = workBook.createSheet("DropdownValues");
//			String[] dropdownValues = { "Mod", "Add", };
//			for (int i = 0; i < dropdownValues.length; i++)
//			{
//				Row valueRow = dropdownSheet.createRow(i);
//				Cell cell = valueRow.createCell(0);
//				cell.setCellValue(dropdownValues[i]);
//				cell.setCellStyle(style);
//			}
//
//			// Create data validation for the dropdown list
//			DataValidationHelper validationHelper = sheet.getDataValidationHelper();
//			String formula = "DropdownValues!$A$1:$A$" + dropdownValues.length;
//			DataValidationConstraint constraint = validationHelper.createFormulaListConstraint(formula);
//			CellRangeAddressList addressList = new CellRangeAddressList(1, 100, 3, 3);
//			DataValidation validation = validationHelper.createValidation(constraint, addressList);
//
//			// Apply data validation to the sheet
//			sheet.addValidationData(validation);
//			for (int j = 2; j <3; j++)
//			{
//
//				row = sheet.createRow(j);
//
//				for (int i = 0; i < header.length+1; i++)
//				{
//
//					Cell cell = row.createCell(i);
//					cell.setCellStyle(styles);
//				}
//			}
//			// Auto-size columns for better visibility
//			// for (int i = 0; i < header.length; i++) {
//			// sheet.autoSizeColumn(i);
//			// }
//
//			// Write the workbook to a ByteArrayOutputStream
//			workBook.write(bs);
//
//		}
//		catch (Exception e)
//		{
//			e.printStackTrace();
//		}
//		finally
//		{
//			try
//			{
//				workBook.close();
//			}
//			catch (Exception e)
//			{
//				e.printStackTrace();
//			}
//		}
//
//		return new ByteArrayInputStream(bs.toByteArray());
//	}
//}
