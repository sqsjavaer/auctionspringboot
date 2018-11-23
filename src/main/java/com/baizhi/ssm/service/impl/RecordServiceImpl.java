package com.baizhi.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baizhi.ssm.dao.RecordDao;
import com.baizhi.ssm.entity.Record;
import com.baizhi.ssm.service.RecordService;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RecordServiceImpl implements RecordService {
    
	@Autowired
	private RecordDao recordDao; 
	
	public void setRecordDao(RecordDao recordDao) {
		this.recordDao = recordDao;
	}

	@Override
	public void add(Record record) {
       
		recordDao.insertOne(record);
	}

}
