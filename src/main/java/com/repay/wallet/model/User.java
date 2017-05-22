package com.repay.wallet.model;

import java.util.List;

public class User {
	
	Long id;
	String userName;
	String currency;
	List<Wallet> wallets;
	
	public User() {
	}
	
	User(Long id, String userName,String currency){
		this.id = id;
		this.userName = userName;
		this.currency = currency;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public List<Wallet> getWallets() {
		return wallets;
	}

	public void setWallets(List<Wallet> wallets) {
		this.wallets = wallets;
	}
	
}
