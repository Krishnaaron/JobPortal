package com.jobportal;



import java.io.File;

//import org.springframework.context.annotation.ComponentScan;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import jakarta.servlet.MultipartConfigElement;
import jakarta.servlet.ServletRegistration;

//@Configuration
//@EnableWebMvc
//@ComponentScan(basePackages = "com.jobportal")
public class MyWebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
	/**
     * Specifies the root configuration classes for the application context.
     * @return Array of root configuration classes.
     */
	 private int maxUploadSizeInMb = 5 * 1024 * 1024;
    @Override
    protected Class<?>[] getRootConfigClasses() {
    	 // Returning the configuration class for the application context
    	System.out.println("testing -1");
        return new Class[] { DispatherServlet.class };
    }
    /**
     * Specifies configuration classes for the DispatcherServlet application context.
     * @return Array of servlet configuration classes, null if none.
     */
    @Override
    protected Class<?>[] getServletConfigClasses() {
        // Specify configuration classes for the DispatcherServlet application context
        return null;
    }
    /**
     * Specifies the servlet mapping for the DispatcherServlet.
     * @return Array of servlet mapping URLs.
     */
    @Override
    protected String[] getServletMappings() {
        // Map the DispatcherServlet to "/"
    	System.out.println("testing -2");
        return new String[] { "/" };
    }
//    @Override
//    protected void customizeRegistration(ServletRegistration.Dynamic registration) {
//
//        // upload temp file will put here
//        File uploadDirectory = new File(System.getProperty("java.io.tmpdir"));
//
//        // register a MultipartConfigElement
//        MultipartConfigElement multipartConfigElement =
//                new MultipartConfigElement(uploadDirectory.getAbsolutePath(),
//                        maxUploadSizeInMb, maxUploadSizeInMb * 2, maxUploadSizeInMb / 2);
//
//        registration.setMultipartConfig(multipartConfigElement);
//
//    }
    @Override
    protected void customizeRegistration(ServletRegistration.Dynamic registration) {
    	File uD = new File(System.getProperty("java.io.tmpdir"));
    	  
    	registration.setMultipartConfig(new MultipartConfigElement( uD.getAbsolutePath(),maxUploadSizeInMb,maxUploadSizeInMb*2,maxUploadSizeInMb/2));
    }
}
