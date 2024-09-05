package com.tutorialspoint.modal;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;


import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class FileCreate {

	public static ByteArrayInputStream createFile() {
	
		ByteArrayOutputStream bs =new ByteArrayOutputStream();
		Workbook workBook =new XSSFWorkbook();
		try {
		Sheet sheet =workBook.createSheet();
		Row row =sheet.createRow(0);
		
		CellStyle style =workBook.createCellStyle();
		style.setBorderLeft(BorderStyle.THIN);
		style.setBorderRight(BorderStyle.THIN);
		style.setBorderBottom(BorderStyle.THIN);
		style.setBorderLeft(BorderStyle.THIN);
		style.setFillBackgroundColor(IndexedColors.BRIGHT_GREEN.index);
		style.setFillPattern(FillPatternType.DIAMONDS);
		
		String[]header= {"Name","Email","PhoneNumber","password"};
		for(int i=0;i<header.length;i++)
		{
			Cell cell=row.createCell(i);
			cell.setCellValue(header[i]);
			cell.setCellStyle(style);
		}
		
		
		workBook.write(bs);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return new ByteArrayInputStream(bs.toByteArray());
	}
	
	
}
