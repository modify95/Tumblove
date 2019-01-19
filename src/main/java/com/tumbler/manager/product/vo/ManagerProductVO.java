package com.tumbler.manager.product.vo;

import org.springframework.web.multipart.MultipartFile;

public class ManagerProductVO {
	private int p_num;
	private int i_num;
	private String p_name;
	private String p_material;
	private String p_category;
	private String p_sub_category;
	private int p_price;
	private String p_temperature;
	private int p_stock;
	private int p_sales_volume;
	private String p_capacity;
	private String p_country;
	private String p_color;
	private double p_grade;
	private String p_state;
	private String p_date;
	   
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	private String image5;
	
	private MultipartFile file;
	private MultipartFile file2;
	private MultipartFile file3;
	private MultipartFile file4;
	private MultipartFile file5;
	      
	public ManagerProductVO() {
		super();
	}
	
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public int getI_num() {
		return i_num;
	}
	public void setI_num(int i_num) {
		this.i_num = i_num;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_material() {
		return p_material;
	}
	public void setP_material(String p_material) {
		this.p_material = p_material;
	}
	public String getP_category() {
		return p_category;
	}
	public void setP_category(String p_category) {
		this.p_category = p_category;
	}
	public String getP_sub_category() {
		return p_sub_category;
	}
	public void setP_sub_category(String p_sub_category) {
		this.p_sub_category = p_sub_category;
	}
	public double getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getP_temperature() {
		return p_temperature;
	}
	public void setP_temperature(String p_temperature) {
		this.p_temperature = p_temperature;
	}
	public int getP_stock() {
		return p_stock;
	}
	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}
	public int getP_sales_volume() {
		return p_sales_volume;
	}
	public void setP_sales_volume(int p_sales_volume) {
		this.p_sales_volume = p_sales_volume;
	}
	public String getP_capacity() {
		return p_capacity;
	}
	public void setP_capacity(String p_capacity) {
		this.p_capacity = p_capacity;
	}
	public String getP_country() {
		return p_country;
	}
	public void setP_country(String p_country) {
		this.p_country = p_country;
	}
	public String getP_color() {
		return p_color;
	}
	public void setP_color(String p_color) {
		this.p_color = p_color;
	}
	public double getP_grade() {
		return p_grade;
	}
	public void setP_grade(double p_grade) {
		this.p_grade = p_grade;
	}
	public String getP_state() {
		return p_state;
	}
	public void setP_state(String p_state) {
		this.p_state = p_state;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public String getImage4() {
		return image4;
	}

	public void setImage4(String image4) {
		this.image4 = image4;
	}

	public String getImage5() {
		return image5;
	}

	public void setImage5(String image5) {
		this.image5 = image5;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public MultipartFile getFile2() {
		return file2;
	}

	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}

	public MultipartFile getFile3() {
		return file3;
	}

	public void setFile3(MultipartFile file3) {
		this.file3 = file3;
	}

	public MultipartFile getFile4() {
		return file4;
	}

	public void setFile4(MultipartFile file4) {
		this.file4 = file4;
	}

	public MultipartFile getFile5() {
		return file5;
	}

	public void setFile5(MultipartFile file5) {
		this.file5 = file5;
	}
	
}
