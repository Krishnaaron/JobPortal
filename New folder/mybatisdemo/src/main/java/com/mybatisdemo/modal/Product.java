package com.mybatisdemo.modal;

public class Product {
private int product_id;
private String product_Name;
private int quentity;
private int price;
public int getProduct_id() {
	return product_id;
}
public void setProduct_id(int product_id) {
	this.product_id = product_id;
}
public String getProduct_Name() {
	return product_Name;
}
public void setProduct_Name(String product_Name) {
	this.product_Name = product_Name;
}
public int getQuentity() {
	return quentity;
}
public void setQuentity(int quentity) {
	this.quentity = quentity;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public Product() {
	
}
public Product(int product_id, String product_Name, int quentity, int price) {
	super();
	this.product_id = product_id;
	this.product_Name = product_Name;
	this.quentity = quentity;
	this.price = price;
}

	
	
}
