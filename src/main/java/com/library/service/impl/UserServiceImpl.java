package com.library.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.dao.UserMapper;
import com.library.pojo.User;
import com.library.service.UserService;
@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	/**********用户登录****************/
	public User queryUser(User user) {
		return userMapper.queryUser(user);
	}
	/**********用户管理****************/
	public List<User> queryAllUser(User user) {
		return userMapper.queryAllUser(user);
	}
	public User queryUserByNum(String number) {
		return userMapper.queryUserByNum(number);
	}
	public Boolean addUser(User user) {
		if (userMapper.queryUserByNum(user.getNumber()) == null) {
			int num = userMapper.addUser(user); 
			if (num > 0) 
				return true; 
			else 
				return false; 
			
		}
		else {
			return false;	
		}
	}
	public Boolean updateUser(User user) {
		int num = userMapper.updateUser(user);
		if (num > 0)
			return true;
		else
			return false;
	}
	public Boolean deleteUser(String number) {
		int num = userMapper.deleteUser(number); 
		if (num > 0) 
			return true; 
		else 
			return false; 
	}
}
