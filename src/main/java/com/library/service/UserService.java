package com.library.service;

import java.util.List;

import com.library.pojo.User;

public interface UserService {
	/**********用户登录****************/
	public User queryUser(User user);
	/**********用户管理****************/
	public List<User> queryAllUser(User user);
	public User queryUserByNum(String number);
	public Boolean updateUser(User user);
	public Boolean addUser(User user);
	public Boolean deleteUser(String number);
}
