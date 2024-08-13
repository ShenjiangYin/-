package com.library.service.impl;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.dao.RecordMapper;
import com.library.service.RecordService;
import com.library.pojo.Record;
@Service("recordService")
public class RecordServiceImpl implements RecordService {
	@Autowired
	private RecordMapper recordMapper;
	/**********借阅记录****************/
	//@Override
	public List<Record> queryRecord(Record record) {
		return recordMapper.queryRecord(record);
	}
	//@Override
	public int updateRecord(Record record) {
		return recordMapper.updateRecord(record);
	}
}
