package task.com.task;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args ) throws InterruptedException
    {
//    	try {
//			Runtime.getRuntime().exec("shutdown -s -t 10");
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
    	ProcessBuilder pb = new ProcessBuilder();
    	
//		pb.command("java -version");
    	 pb.command("wmic", "job");
        try {
		Process process=	pb.start();
			BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
			String line;
			while((line =br.readLine())!= null) {
					System.out.println(line);
				
			}
			process.waitFor();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
    	
        System.out.println( "Hello World!" );
    }
}
