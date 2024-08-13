package com.library.service;

import java.util.List;

import com.library.pojo.*;
import com.library.pojo.User;

public interface BookService {
	/**********图书查询****************/
	public List<Book> queryBook(Book book);
	public Book queryBookByIsbn(String isbn);
	public Boolean borrowBook(Book book, User user);
	
	/**********借阅记录****************/
	public Boolean returnBook(String isbn, String borrower);
	/**********图书管理****************/
	public Boolean addBook(Book book);
	public Boolean updateBook(Book book);
	public Boolean deleteBook(String isbn);

}
