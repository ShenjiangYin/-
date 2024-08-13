package com.library.pojo;

import java.time.LocalDate;

public class Record {
	private String name;				//图书名称
	private String isbn;					//ISBN
	private String borrower;				//借阅人
	private LocalDate borrowTime;			//借阅时间	
	private LocalDate deadline;			//到期时间
	private LocalDate returnTime;			//归还时间
	private String status;				//借阅状态
	private Book book;					//Book类对象
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getBorrower() {
		return borrower;
	}
	public void setBorrower(String borrower) {
		this.borrower = borrower;
	}
	public LocalDate getBorrowTime() {
		return borrowTime;
	}
	public void setBorrowTime(LocalDate borrowTime) {
		this.borrowTime = borrowTime;
	}
	
	public LocalDate getDeadline() {
		return deadline;
	}
	public void setDeadline(LocalDate deadline) {
		this.deadline = deadline;
	}
	public LocalDate getReturnTime() {
		return returnTime;
	}
	public void setReturnTime(LocalDate returnTime) {
		this.returnTime = returnTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	
	
}
