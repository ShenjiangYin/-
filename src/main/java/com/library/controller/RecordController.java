package com.library.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.service.RecordService;
import com.library.pojo.Record;
import com.library.pojo.User;
@Controller									//设置当前类为控制器类
@RequestMapping("/record")		//设置控制器类的映射路径
public class RecordController {
	@Autowired
	private RecordService recordService;			//自动装配OrderService对象
	/**********借阅记录****************/
	@RequestMapping("/query")		//设置控制器方法的映射路径
	public String queryRecord(Record record, HttpServletRequest request) {
		User user= (User)request.getSession().getAttribute("USER_SESSION");
		if (user.getIdentity().equalsIgnoreCase("学生") 
				|| user.getIdentity().equalsIgnoreCase("教师")) {
			record.setBorrower(user.getName());
		}
		List<Record> records = recordService.queryRecord(record);
		request.setAttribute("records", records);
		return "manageRecord";
	}
	@ResponseBody
	@RequestMapping("/queryRecordBy")		//设置控制器方法的映射路径
	public Record queryRecordBy(String isbn, String borrower) {
		Record record = new Record();
		record.setIsbn(isbn);
		record.setBorrower(borrower);
		List<Record> records = recordService.queryRecord(record);
		return records.get(0);
	}
}
