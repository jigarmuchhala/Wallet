package com.repay.wallet.model;

public class WalletType {

	public Long getWalletTypeId() {
		return walletTypeId;
	}

	public void setWalletTypeId(Long walletTypeId) {
		this.walletTypeId = walletTypeId;
	}

	public String getWalletTypeName() {
		return walletTypeName;
	}

	public void setWalletTypeName(String walletTypeName) {
		this.walletTypeName = walletTypeName;
	}

	Long walletTypeId;
	String walletTypeName;
	
	public WalletType(long walletTypeId, String walletTypeName) {
		this.walletTypeId = walletTypeId;
		this.walletTypeName = walletTypeName;
	}
	
}
