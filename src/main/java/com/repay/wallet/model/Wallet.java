package com.repay.wallet.model;

import java.math.BigDecimal;

public class Wallet {
	
	Long walletId;
	BigDecimal balance;
	WalletType walletType;
	String currency;
	boolean isActive;
	
	public Wallet() {
	}
	
	Wallet(Long walletId, WalletType walletType, String currency,BigDecimal balance, boolean isActive){
		this.walletId = walletId;
		this.walletType = walletType;
		this.currency = currency;
		this.balance = balance;
		this.isActive = isActive;
	}
	
	
	
	public Long getWalletId() {
		return walletId;
	}
	public void setWalletId(Long walletId) {
		this.walletId = walletId;
	}
	public WalletType getWalletType() {
		return walletType;
	}
	public void setWalletType(WalletType walletType) {
		this.walletType = walletType;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public BigDecimal getBalance() {
		return balance;
	}

	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}
	
	
	
}
