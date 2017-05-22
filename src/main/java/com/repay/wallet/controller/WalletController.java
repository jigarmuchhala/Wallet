package com.repay.wallet.controller;

import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.repay.wallet.model.Wallet;
import com.repay.wallet.model.WalletStub;

@RestController
@RequestMapping("/")
public class WalletController {

	@RequestMapping(value = "/user/{userId}/wallet", method = RequestMethod.GET)
	public List<Wallet> getUserWallet(@PathVariable Long userId){
		return WalletStub.getUserWallet(userId);
	}
	
	@RequestMapping(value = "/user/{userId}/wallet/{walletId}", method = RequestMethod.GET)
	public Wallet getWallet(@PathVariable Long walletId){
		return WalletStub.get(walletId);
	}
	
	@RequestMapping(value = "/wallets", method = RequestMethod.GET)
	public List<Wallet> getWallets(){
		return WalletStub.list();
	}
	
	
	@RequestMapping(value = "/user/{userId}/wallet/{walletId}", method = RequestMethod.POST)
	public Wallet createWallet(@RequestBody Wallet wallet){
		return WalletStub.create(wallet);
	}
	
	
	@RequestMapping(value = "/wallet/{id}", method = RequestMethod.PUT)
	public Wallet updateWallet(@PathVariable Long id,@RequestBody Wallet wallet){
		return WalletStub.update(id,wallet);
	}

	@RequestMapping(value = "/wallet/{id}", method = RequestMethod.DELETE)
	public Wallet deleteWallet(@PathVariable Long id){
		return WalletStub.delete(id);
	}
	
}
