package com.library.service;

import java.util.List;

import com.library.pojo.Record;

public interface RecordService {
	/**********借阅记录****************/
	public List<Record> queryRecord(Record record);
	public int updateRecord(Record record);
}
