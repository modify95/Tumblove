package com.tumbler.product.vo;

import java.util.Date;

import com.tumbler.product_image.vo.ProductImageVO;

public class ProductVO extends ProductImageVO {
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
   private Date p_date;
   
   private String order;
   
  
   public ProductVO() {
	super();
   }
   
   public String getOrder() {
	   return order;
   }

   public void setOrder(String order) {
	   this.order = order;
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

   public Date getP_date() {
      return p_date;
   }

   public void setP_date(Date p_date) {
      this.p_date = p_date;
   }
}