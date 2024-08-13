package com.library.dao;

import java.util.List;

import org.apache.ibatis.annotations.*;
import com.library.pojo.Book;

public interface BookMapper {
	/**********图书查询****************/
	//使用基于注解的动态SQL查询图书记录
	@SelectProvider(type=BookDynaSqlProvider.class, method="queryBook")
	public List<Book> queryBook(Book book);
	//根据ISBN查询图书记录
	@Select("select * from tb_book where isbn=#{isbn}")
	public Book queryBookByIsbn(String isbn);
	//使用基于注解的动态SQL更新图书记录
	@UpdateProvider(type=BookDynaSqlProvider.class, method="updateBook")
	public int updateBook(Book book);
	/**********图书管理****************/
	@Insert("insert into tb_book(name, author, press, isbn, publishTime, price, storage)"
			+ "values(#{name}, #{author}, #{press}, #{isbn}, #{publishTime}, #{price}, #{storage})")
	public int addBook(Book book);
	@Delete("delete from tb_book where isbn=#{isbn}")
	public int deleteBook(String isbn);
	
}
