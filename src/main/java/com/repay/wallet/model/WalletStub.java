package com.repay.wallet.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.repay.wallet.controller.UserController;

public class WalletStub {
	private static Map<Long, Wallet> wallets = new HashMap<Long, Wallet>();
	private static Long idIndex = 3L;
	private static UserController userController = new UserController();

	//populate initial wallet
	static {
		WalletType walletType1 = new WalletType(1L,"Pending_Cashback");
		WalletType walletType2 = new WalletType(2L,"Missed_Cashback");
		WalletType walletType3 = new WalletType(3L,"Cashback");
		WalletType walletType4 = new WalletType(4L,"Selling_Provisons");
		Wallet a = new Wallet(1L,walletType1,"USD",new BigDecimal("0.0"), true);
		wallets.put(1L, a);
		Wallet b = new Wallet(2L, walletType2,"USD",new BigDecimal("0.0"),true);
		wallets.put(2L, b);
		Wallet c = new Wallet(3L,walletType3,"USD",new BigDecimal("0.0"),true);
		wallets.put(3L, c);
		Wallet d = new Wallet(3L,walletType4,"USD",new BigDecimal("0.0"),true);
		wallets.put(4L, d);
	}

	public static List<Wallet> list() {
		return new ArrayList<Wallet>(wallets.values());
	}

	public static Wallet create(Wallet wallet) {
		idIndex += idIndex;
		wallet.setWalletId(idIndex);
		wallets.put(idIndex, wallet);
		return wallet;
	}

	public static Wallet get(Long id) {
	
		return wallets.get(id);
	}

	public static List<Wallet> getUserWallet(Long userId) {
		List<Wallet> walletList = new ArrayList<Wallet>();
		User user = userController.getUser(userId);
	    for(Wallet wallet : wallets.values()){
	    	if(userId.equals(user.getId())){
	    		walletList.add(wallet);
	    	}
	    }
		return walletList;
	}
	
	public static Wallet update(Long id, Wallet wallet) {
		wallets.put(id, wallet);
		return wallet;
	}

	public static Wallet delete(Long id) {
		return wallets.remove(id);
	}
	
	
}
