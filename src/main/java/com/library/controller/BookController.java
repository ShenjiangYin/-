package com.library.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.pojo.Book;
import com.library.service.BookService;
import com.library.pojo.User;
@Controller									//设置当前类为控制器类
@RequestMapping("/book")		//设置控制器类的映射路径
public class BookController {
	
	@Autowired
	private BookService bookService;			//自动装配OrderService对象
	/**********图书查询****************/
	@RequestMapping("/query")		//设置控制器方法的映射路径
	public String queryBook(Book book, HttpServletRequest request) {
		List<Book> books = bookService.queryBook(book);
		request.setAttribute("books", books);
		return "queryBook";
	}
	@ResponseBody
	@RequestMapping("/queryBookByIsbn")		//设置控制器方法的映射路径
	public Book queryBookByIsbn(String isbn) {
		return bookService.queryBookByIsbn(isbn);
	}
	@ResponseBody
	@RequestMapping("/borrow")		//设置控制器方法的映射路径
	public Boolean borrowBook(Book book, HttpSession session) {
		User user = (User)session.getAttribute("USER_SESSION");
		return bookService.borrowBook(book, user);
	}
	/**********借阅记录****************/
	@ResponseBody
	@RequestMapping("/return")		//设置控制器方法的映射路径
	public Boolean returnBook(String isbn, String borrower) {
		return bookService.returnBook(isbn, borrower);
	}
	/**********图书管理****************/
	@RequestMapping("/manage")		//设置控制器方法的映射路径
	public String manageBook(Book book, HttpServletRequest request) {
		List<Book> books = bookService.queryBook(book);
		request.setAttribute("books", books);
		return "manageBook";
	}
	@ResponseBody
	@RequestMapping("/add")		//设置控制器方法的映射路径
	public Boolean addBook(Book book) {
		return bookService.addBook(book);
	}
	@ResponseBody
	@RequestMapping("/update")		//设置控制器方法的映射路径
	public Boolean updateBook(Book book) {
		return bookService.updateBook(book);
	}
	@ResponseBody
	@RequestMapping("/delete")		//设置控制器方法的映射路径
	public Boolean deleteBook(String isbn) {
		return bookService.deleteBook(isbn);
	}
	
}
