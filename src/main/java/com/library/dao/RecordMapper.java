package com.library.dao;

import java.util.List;

import org.apache.ibatis.annotations.*;
import com.library.pojo.Record;

public interface RecordMapper {
	/**********图书查询****************/
	//插入借阅记录
	@Insert("insert into tb_record(name, isbn, borrower, borrowTime, deadline, returnTime, status) "
			+ "values(#{name}, #{isbn}, #{borrower}, #{borrowTime}, #{deadline}, #{returnTime}, #{status})")
	public int addRecord(Record record);
	/**********借阅记录****************/
	//使用基于注解的动态SQL查询借阅记录
	@SelectProvider(type=RecordDynaSqlProvider.class, method="queryRecord")
	@Results({
		@Result(property="name", column="name"),
		@Result(id=true, property="isbn", column="isbn"), 
		@Result(property="borrower", column="borrower"), 
		@Result(property="borrowTime", column="borrowTime"), 
		@Result(property="returnTime", column="returnTime"),
		@Result(property="status", column="status"),
		@Result(property="book", column="isbn", one=@One(
				select="com.library.dao.BookMapper.queryBookByIsbn")) 
	})
	public List<Record> queryRecord(Record record);
	//根据ISBN和借阅人更新借阅记录的归还时间和借阅状态
	@Insert("update tb_record set returnTime=#{returnTime}, status=#{status} where isbn=#{isbn} and borrower=#{borrower}")
	public int updateRecord(Record record);
	//@Insert("delete from tb_record where isbn=#{isbn} and borrower=#{borrower}")
	//public int deleteRecord(Record record);
}
