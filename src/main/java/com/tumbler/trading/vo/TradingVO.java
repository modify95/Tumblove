package com.tumbler.trading.vo;

import java.sql.Date;

import com.tumbler.cart.vo.CartVO;

public class TradingVO extends CartVO {

	private int t_num;
	private int m_num;
	private int c_num;
	private int p_num;
	private int t_amount;
	private int t_price;
	private int t_mileage;
	private String t_payment_option;
	private String t_payment_state;
	private String t_depositor;
	private String t_bank;
	private String t_address;
	private String t_memo;
	private String t_recipient;
	private int t_mail_agreement;
	private String t_add_option1;
	private String t_add_option2;
	private String t_state;
	private String t_phone;
	private int t_delivery_charge;
	private Date t_date;
	private int t_receipt;
	private String refund_reason;
	private String delivery_state;

	public int getT_num() {
		return t_num;
	}

	public void setT_num(int t_num) {
		this.t_num = t_num;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public int getT_amount() {
		return t_amount;
	}

	public void setT_amount(int t_amount) {
		this.t_amount = t_amount;
	}

	public int getT_price() {
		return t_price;
	}

	public void setT_price(int t_price) {
		this.t_price = t_price;
	}

	public int getT_mileage() {
		return t_mileage;
	}

	public void setT_mileage(int t_mileage) {
		this.t_mileage = t_mileage;
	}

	public String getT_payment_option() {
		return t_payment_option;
	}

	public void setT_payment_option(String t_payment_option) {
		this.t_payment_option = t_payment_option;
	}

	public String getT_payment_state() {
		return t_payment_state;
	}

	public void setT_payment_state(String t_payment_state) {
		this.t_payment_state = t_payment_state;
	}

	public String getT_depositor() {
		return t_depositor;
	}

	public void setT_depositor(String t_depositor) {
		this.t_depositor = t_depositor;
	}

	public String getT_bank() {
		return t_bank;
	}

	public void setT_bank(String t_bank) {
		this.t_bank = t_bank;
	}

	public String getT_address() {
		return t_address;
	}

	public void setT_address(String t_address) {
		this.t_address = t_address;
	}

	public String getT_memo() {
		return t_memo;
	}

	public void setT_memo(String t_memo) {
		this.t_memo = t_memo;
	}

	public String getT_recipient() {
		return t_recipient;
	}

	public void setT_recipient(String t_recipient) {
		this.t_recipient = t_recipient;
	}

	public int getT_mail_agreement() {
		return t_mail_agreement;
	}

	public void setT_mail_agreement(int t_mail_agreement) {
		this.t_mail_agreement = t_mail_agreement;
	}

	public String getT_add_option1() {
		return t_add_option1;
	}

	public void setT_add_option1(String t_add_option1) {
		this.t_add_option1 = t_add_option1;
	}

	public String getT_add_option2() {
		return t_add_option2;
	}

	public void setT_add_option2(String t_add_option2) {
		this.t_add_option2 = t_add_option2;
	}

	public String getT_state() {
		return t_state;
	}

	public void setT_state(String t_state) {
		this.t_state = t_state;
	}

	public String getT_phone() {
		return t_phone;
	}

	public void setT_phone(String t_phone) {
		this.t_phone = t_phone;
	}

	public int getT_delivery_charge() {
		return t_delivery_charge;
	}

	public void setT_delivery_charge(int t_delivery_charge) {
		this.t_delivery_charge = t_delivery_charge;
	}

	public Date getT_date() {
		return t_date;
	}

	public void setT_date(Date t_date) {
		this.t_date = t_date;
	}

	public int getT_receipt() {
		return t_receipt;
	}

	public void setT_receipt(int t_receipt) {
		this.t_receipt = t_receipt;
	}

	public String getRefund_reason() {
		return refund_reason;
	}

	public void setRefund_reason(String refund_reason) {
		this.refund_reason = refund_reason;
	}

	public String getDelivery_state() {
		return delivery_state;
	}

	public void setDelivery_state(String delivery_state) {
		this.delivery_state = delivery_state;
	}

}
