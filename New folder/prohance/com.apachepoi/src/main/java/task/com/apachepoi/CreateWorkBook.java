package task.com.apachepoi;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class CreateWorkBook {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		
		
		
		try {
			File file = new File("C:\\Users\\Aaaron\\Desktop\\New folder\\demo.xlsx");
			FileInputStream fo = new FileInputStream(file);
			XSSFWorkbook workBook = new XSSFWorkbook(fo);
			XSSFSheet sheet =workBook.getSheetAt(0);
			int rows=sheet.getLastRowNum();
			int cols=sheet.getRow(1).getLastCellNum();
			for(int i=0;i<=rows;i++) {
				XSSFRow row =sheet.getRow(rows);
				for(int c=0;c<cols;c++) {
					XSSFCell cell =row.getCell(c);
					switch(cell.getCellType()) {
					
					case STRING:
						System.out.println(cell.getStringCellValue());
					
					break;
					}
				}
			}
			fo.close();
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
