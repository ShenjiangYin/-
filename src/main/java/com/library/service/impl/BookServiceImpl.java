package com.library.service.impl;

import java.time.LocalDate;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.dao.*;
import com.library.service.BookService;
import com.library.pojo.Book;
import com.library.pojo.Record;
import com.library.pojo.User;
@Service("bookService")
public class BookServiceImpl implements BookService {
	@Autowired
	private BookMapper bookMapper;
	@Autowired
	private RecordMapper recordMapper;
	/**********图书查询****************/
	//@Override
	public List<Book> queryBook(Book book) {
		return bookMapper.queryBook(book);
	}
	//@Override
	public Book queryBookByIsbn(String isbn) {
		return bookMapper.queryBookByIsbn(isbn);
	}
	//@Override
	public Boolean borrowBook(Book book, User user) {
		//设置图书的库存
		book.setStorage(book.getStorage() - 1);
		int num = bookMapper.updateBook(book);
		Record record = new Record();
		record.setName(book.getName());
		record.setIsbn(book.getIsbn());
		record.setBorrower(user.getName());	
		//获取本地当前日期，并设置借阅记录的借阅时间
		record.setBorrowTime(LocalDate.now());	
		//根据身份设置借阅记录的到期时间
		if (user.getIdentity().equalsIgnoreCase("学生"))
			record.setDeadline(LocalDate.now().plusDays(30L));
		else if (user.getIdentity()=="教师")
			record.setDeadline(LocalDate.now().plusDays(60L));
		record.setStatus("借阅中");
		num = recordMapper.addRecord(record);
		if (num > 0)
			return true;
		else
			return false;
	}

	/**********借阅记录****************/
	public Boolean returnBook(String isbn, String borrower) {
	Record record = new Record();
	record.setIsbn(isbn);
	record.setBorrower(borrower);
	record = recordMapper.queryRecord(record).get(0);
	record.setReturnTime(LocalDate.now());
	record.setStatus("已归还");
	int num = recordMapper.updateRecord(record);
	Book book = record.getBook();
	book.setStorage(book.getStorage() + 1);
	num = bookMapper.updateBook(book);
	if (num > 0) 
		return true; 
	else 
		return false; 
	}
	/**********图书管理****************/
	public Boolean addBook(Book book) {
		int num = bookMapper.addBook(book); 
		if (num > 0) 
			return true; 
		else 
			return false; 
			
	}
	//@Override
	public Boolean updateBook(Book book) {
		int num = bookMapper.updateBook(book);
		if (num > 0)
			return true;
		else
			return false;
	}
	public Boolean deleteBook(String isbn) {
		int num = bookMapper.deleteBook(isbn); 
		if (num > 0) 
			return true; 
		else 
			return false; 
	}
	
}
