package com.library.dao;

import org.apache.ibatis.jdbc.SQL;

import com.library.pojo.User;

public class UserDynaSqlProvider {
	public String queryUser(final User user) {
		return new SQL() {
			{
				SELECT("*");
				FROM("tb_user");
				if (user.getNumber()!=null && !user.getNumber().equals(""))
					WHERE("number=#{number}");
				if (user.getName()!=null && !user.getName().equals(""))
					WHERE("name=#{name}");		
				if (user.getIdentity()!=null && !user.getIdentity().equals(""))
					WHERE("identity=#{identity}");
			}
		}.toString();
	}
}
