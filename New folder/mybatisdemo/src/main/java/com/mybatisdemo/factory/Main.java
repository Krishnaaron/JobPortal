package com.mybatisdemo.factory;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.mybatisdemo.mapper.ProductMapper;
import com.mybatisdemo.modal.Product;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
         BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
         
         String resourse ="mybatisconfig.xml";
         try {
        	 InputStream stream = Resources.getResourceAsStream(resourse);
        	 
        	 SqlSessionFactory sff =new SqlSessionFactoryBuilder().build(stream);
        	 SqlSession session = sff.openSession();
        	 ProductMapper mapper = session.getMapper(ProductMapper.class);
        	 
        	 Product product = new Product();
        	 
        	 product.setProduct_id(1);
        	 product.setProduct_Name("pen");
        	 product.setPrice(5);
        	 product.setQuentity(100);
        	 
        	 mapper.insertProduct(product);
//        	 session.commit();
        	 
        	 
//        	 product.setProduct_id(1);
//        	 product.setProduct_Name("pencil");
//        	 product.setPrice(50);
//        	 product.setQuentity(300);
//        	 mapper.updateProduct(product);
        	 List<Product> prod = mapper.viewProduct(1);
        	
        	 session.commit();
//        	 mapper.deleteProduct(1);
//      	for(Product pro : prod) 
//      	{
//      		 System.out.println(pro.getPrice());
//      	}
        	 System.out.println("insert completed");
         }catch(Exception e) {
        	 
        	 e.printStackTrace();
        	 
         }
         
	}

}
