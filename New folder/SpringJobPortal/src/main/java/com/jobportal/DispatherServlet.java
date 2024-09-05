package com.jobportal;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import javax.sql.DataSource;

@EnableWebMvc  // Enables Spring MVC features
@Configuration // Indicates that this class provides Spring configuration
@ComponentScan(basePackages = "com.jobportal") // Scans for components in the specified package
@MapperScan("com.jobportal.mapper") // Scans for MyBatis mapper interfaces
public class DispatherServlet implements WebMvcConfigurer{
	 /**
     * Configures the view resolver to direct requests for views to JSP files.
     * @return InternalResourceViewResolver configured for JSP views.
     */
    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        System.out.println("testing -4");
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        return resolver;
    }
    /**
     * Configures resource handlers for serving static resources.
     * @param registry ResourceHandlerRegistry to register resource handlers.
     */
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		System.out.println("testing -3");
		  registry.addResourceHandler("/assets/**")
          .addResourceLocations("/assets/");
	}
	 /**
     * Configures the DataSource for connecting to the Oracle database.
     * @return Configured DataSource for Oracle database.
     */
	@Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("oracle.jdbc.OracleDriver");
        dataSource.setUrl("jdbc:oracle:thin:@localhost:1521:xe"); 
        dataSource.setUsername("JOBPORTAL"); 
        dataSource.setPassword("ORACLE1234"); 
        return dataSource;
	}
	
	 /**
     * Configures the SqlSessionFactory for MyBatis.
     * @param dataSource The DataSource to use for MyBatis.
     * @return Configured SqlSessionFactory.
     * @throws Exception if unable to configure the session factory.
     */
	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
		sessionFactory.setDataSource(dataSource);
		return sessionFactory.getObject();
	}
	/**
     * Configures the SqlSessionTemplate for MyBatis.
     * @param sqlSessionFactory The SqlSessionFactory to use.
     * @return Configured SqlSessionTemplate.
     */
	@Bean
	public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}
	
}