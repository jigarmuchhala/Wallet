package com.repay.wallet.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.repay.wallet.model.User;
import com.repay.wallet.model.UserStub;

@RestController
@RequestMapping("/")
public class UserController {

	@RequestMapping(value = "user", method = RequestMethod.POST)
	public User createUser(@RequestBody User user){
		return UserStub.create(user);
	}
	
	@RequestMapping(value = "user/{id}", method = RequestMethod.GET)
	public User getUser(@PathVariable Long id){
		return UserStub.get(id);
	}

	@RequestMapping(value = "user/{id}", method = RequestMethod.PUT)
	public User updateUser(@PathVariable Long id,@RequestBody User user){
		return UserStub.update(id,user);
	}

	@RequestMapping(value = "user/{id}", method = RequestMethod.DELETE)
	public User deleteUser(@PathVariable Long id){
		return UserStub.delete(id);
	}
	
}
