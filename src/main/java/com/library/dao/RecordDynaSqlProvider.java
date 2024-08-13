package com.library.dao;


import org.apache.ibatis.jdbc.SQL;

import com.library.pojo.Record;

public class RecordDynaSqlProvider {
	/**********借阅记录****************/
	//根据借阅记录的图书名称、ISBN、借阅人和借阅状态中的零个、一个或多个条件查询借阅记录
	public String queryRecord(final Record record) {
		return new SQL() {
			{
				SELECT("*");
				FROM("tb_record");
				if (record.getName()!=null && !record.getName().equals(""))
					WHERE("name=#{name}");
				if (record.getIsbn()!=null && !record.getIsbn().equals(""))
					WHERE("isbn=#{isbn}");
				if (record.getBorrower()!=null && !record.getBorrower().equals(""))
					WHERE("borrower=#{borrower}");
				if (record.getStatus()!=null && !record.getStatus().equals(""))
					WHERE("status=#{status}");
			}
		}.toString();
	}
}
