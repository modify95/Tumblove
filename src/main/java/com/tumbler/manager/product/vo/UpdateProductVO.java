package com.tumbler.manager.product.vo;

import org.springframework.web.multipart.MultipartFile;

public class UpdateProductVO {
	private int up_num;
	private int ui_num;
	private String up_name;
	private String up_material;
	private String up_category;
	private String up_sub_category;
	private int up_price;
	private String up_temperature;
	private int up_stock;
	private int up_sales_volume;
	private String up_capacity;
	private String up_country;
	private String up_color;
	private double up_grade;
	private String up_state;
	private String up_date;
	   
	private String uimage1;
	private String uimage2;
	private String uimage3;
	private String uimage4;
	private String uimage5;
	
	private MultipartFile ufile1;
	private MultipartFile ufile2;
	private MultipartFile ufile3;
	private MultipartFile ufile4;
	private MultipartFile ufile5;
	
	public UpdateProductVO() {
		super();
	}
	
	public int getUp_num() {
		return up_num;
	}
	public void setUp_num(int up_num) {
		this.up_num = up_num;
	}
	public int getUi_num() {
		return ui_num;
	}
	public void setUi_num(int ui_num) {
		this.ui_num = ui_num;
	}
	public String getUp_name() {
		return up_name;
	}
	public void setUp_name(String up_name) {
		this.up_name = up_name;
	}
	public String getUp_material() {
		return up_material;
	}
	public void setUp_material(String up_material) {
		this.up_material = up_material;
	}
	public String getUp_category() {
		return up_category;
	}
	public void setUp_category(String up_category) {
		this.up_category = up_category;
	}
	public String getUp_sub_category() {
		return up_sub_category;
	}
	public void setUp_sub_category(String up_sub_category) {
		this.up_sub_category = up_sub_category;
	}
	public int getUp_price() {
		return up_price;
	}
	public void setUp_price(int up_price) {
		this.up_price = up_price;
	}
	public String getUp_temperature() {
		return up_temperature;
	}
	public void setUp_temperature(String up_temperature) {
		this.up_temperature = up_temperature;
	}
	public int getUp_stock() {
		return up_stock;
	}
	public void setUp_stock(int up_stock) {
		this.up_stock = up_stock;
	}
	public int getUp_sales_volume() {
		return up_sales_volume;
	}
	public void setUp_sales_volume(int up_sales_volume) {
		this.up_sales_volume = up_sales_volume;
	}
	public String getUp_capacity() {
		return up_capacity;
	}
	public void setUp_capacity(String up_capacity) {
		this.up_capacity = up_capacity;
	}
	public String getUp_country() {
		return up_country;
	}
	public void setUp_country(String up_country) {
		this.up_country = up_country;
	}
	public String getUp_color() {
		return up_color;
	}
	public void setUp_color(String up_color) {
		this.up_color = up_color;
	}
	public double getUp_grade() {
		return up_grade;
	}
	public void setUp_grade(double up_grade) {
		this.up_grade = up_grade;
	}
	public String getUp_state() {
		return up_state;
	}
	public void setUp_state(String up_state) {
		this.up_state = up_state;
	}
	public String getUp_date() {
		return up_date;
	}
	public void setUp_date(String up_date) {
		this.up_date = up_date;
	}
	public String getUimage1() {
		return uimage1;
	}
	public void setUimage1(String uimage1) {
		this.uimage1 = uimage1;
	}
	public String getUimage2() {
		return uimage2;
	}
	public void setUimage2(String uimage2) {
		this.uimage2 = uimage2;
	}
	public String getUimage3() {
		return uimage3;
	}
	public void setUimage3(String uimage3) {
		this.uimage3 = uimage3;
	}
	public String getUimage4() {
		return uimage4;
	}
	public void setUimage4(String uimage4) {
		this.uimage4 = uimage4;
	}
	public String getUimage5() {
		return uimage5;
	}
	public void setUimage5(String uimage5) {
		this.uimage5 = uimage5;
	}
	public MultipartFile getUfile1() {
		return ufile1;
	}
	public void setUfile1(MultipartFile ufile1) {
		this.ufile1 = ufile1;
	}
	public MultipartFile getUfile2() {
		return ufile2;
	}
	public void setUfile2(MultipartFile ufile2) {
		this.ufile2 = ufile2;
	}
	public MultipartFile getUfile3() {
		return ufile3;
	}
	public void setUfile3(MultipartFile ufile3) {
		this.ufile3 = ufile3;
	}
	public MultipartFile getUfile4() {
		return ufile4;
	}
	public void setUfile4(MultipartFile ufile4) {
		this.ufile4 = ufile4;
	}
	public MultipartFile getUfile5() {
		return ufile5;
	}
	public void setUfile5(MultipartFile ufile5) {
		this.ufile5 = ufile5;
	}
}
