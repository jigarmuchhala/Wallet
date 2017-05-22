package com.repay.wallet.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.repay.wallet.controller.WalletController;

public class UserStub {
	private static Map<Long, User> users = new HashMap<Long, User>();
	private static Long idIndex = 3L;
	private static WalletController walletController = new WalletController();
	//populate initial users
	static {
		User a = new User(1L, "U869","USD");
		users.put(1L, a);
		User b = new User(2L, "Thistlegorm","USD");
		users.put(2L, b);
		User c = new User(3L, "S.S. Yongala","USD");
		users.put(3L, c);
	}

	public static List<User> list() {
		return new ArrayList<User>(users.values());
	}

	public static User create(User user) {
		user.setWallets(walletController.getUserWallet(user.getId()));
		idIndex += idIndex;
		user.setId(idIndex);
		users.put(idIndex, user);
		return user;
	}

	public static User get(Long id) {
		return users.get(id);
	}

	public static User update(Long id, User user) {
		users.put(id, user);
		return user;
	}

	public static User delete(Long id) {
		return users.remove(id);
	}
	
	
}
