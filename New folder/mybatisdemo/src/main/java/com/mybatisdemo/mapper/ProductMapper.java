package com.mybatisdemo.mapper;

import java.util.List;

import com.mybatisdemo.modal.Product;

public interface ProductMapper {
   public void insertProduct(Product product);
   public void updateProduct(Product product);
   public List<Product> viewProduct(int id);
   public void deleteProduct(int id);
   public List<Product> viewAllProduct();
}
