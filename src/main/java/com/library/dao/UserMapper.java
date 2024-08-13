package com.library.dao;

import java.util.List;

import org.apache.ibatis.annotations.*;

import com.library.pojo.User;

public interface UserMapper {
	/**********用户登录****************/
	//根据账号、姓名、密码和身份查询用户记录
	@Select("select * from tb_user where number=#{number} and password=#{password} and identity=#{identity}")
	public User queryUser(User user);
	/**********用户管理****************/
	@SelectProvider(type=UserDynaSqlProvider.class, method="queryUser")
	public List<User> queryAllUser(User user);	
	@Select("select * from tb_user where number=#{number}")
	public User queryUserByNum(String number);
	@Update("update tb_user set name=#{name}, password=#{password}, identity=#{identity}, email=#{email} where number=#{number}")
	public int updateUser(User user);
	@Insert("insert into tb_user(number, name, password, identity, email)"
			+ "values(#{number}, #{name}, #{password}, #{identity}, #{email})")
	public int addUser(User user);
	@Delete("delete from tb_user where number=#{number}")
	public int deleteUser(String number);
}
