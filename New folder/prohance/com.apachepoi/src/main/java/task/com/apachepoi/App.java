package task.com.apachepoi;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class App {
    public static void main(String[] args) {
        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet sheet = workbook.createSheet("report");

        Object[][] reportData = {
                { "Test case", "Received packets", "Lost packets", "Time Taken", "Maximum time", "Average time" },
                { "google.com", 4, 0, 892, 284, 223 },
                { "yahoo.com", 5, 1, 923, 294, 233 }
        };

        int colCount = reportData[0].length;

        System.out.println("Columns: " + colCount);

        // Create a style for the first row (header) with blue background and white text
        CellStyle headerStyle = workbook.createCellStyle();
        headerStyle.setFillForegroundColor(IndexedColors.BLUE.getIndex());
        headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        headerStyle.setBorderBottom(BorderStyle.THIN);
        headerStyle.setBorderTop(BorderStyle.THIN);
        headerStyle.setBorderLeft(BorderStyle.THIN);
        headerStyle.setBorderRight(BorderStyle.THIN);

        Font headerFont = workbook.createFont();
        headerFont.setColor(IndexedColors.WHITE.getIndex());
        headerFont.setBold(true);
        headerStyle.setFont(headerFont);

        // Create a style for data rows with borders
        CellStyle dataStyle = workbook.createCellStyle();
        dataStyle.setBorderBottom(BorderStyle.THIN);
        dataStyle.setBorderTop(BorderStyle.THIN);
        dataStyle.setBorderLeft(BorderStyle.THIN);
        dataStyle.setBorderRight(BorderStyle.THIN);

        for (int i = 0; i < reportData.length; i++) {
            XSSFRow row = sheet.createRow(i);
            for (int c = 0; c < colCount; c++) {
                Object value = reportData[i][c];
                if (value != null && !value.toString().trim().isEmpty()) {
                    XSSFCell cell = row.createCell(c);
                    if (value instanceof String) {
                        cell.setCellValue((String) value);
                    } else if (value instanceof Integer) {
                        cell.setCellValue((Integer) value);
                    } else if (value instanceof Boolean) {
                        cell.setCellValue((Boolean) value);
                    }
                    // Apply styles
                    if (i == 0) {
                        cell.setCellStyle(headerStyle);  // First row with blue background and white text
                    } else {
                        cell.setCellStyle(dataStyle);  // Data rows with borders
                    }
                }
            }
        }

        // Remove gridlines from the sheet
        sheet.setDisplayGridlines(false);

        File file = new File("C:\\Users\\Aaaron\\Desktop\\New folder\\oy.xlsx");

        try (FileOutputStream fos = new FileOutputStream(file)) {
            workbook.write(fos);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
