package com.item.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.item.bean.Record;
import com.item.dao.RecordDao;
@Service
public class RecordServiceImpl implements RecordService {
	
	@Autowired
	private RecordDao recordDao;
	
	//获取一个用户的浏览记录
	public List<Record> getRecord(Integer id) {
		return recordDao.getRecord(id);
	}
	
	//添加到用户的浏览记录下
	public boolean addRecord(Record rec) {
		int record = recordDao.addRecord(rec);
		return record > 0 ? true : false;
	}

	public List<Record> getUserRecord() {
		
		return null;
	}

	public boolean getUserRecordByCid(Integer id) {
		Record record = recordDao.getUserRecordByCid(id);
		if(record!=null) {
			return true;
		}
		return false;
	}

	public void updateUserRecord(Record record) {
		record.setRecordtime(new Date());
		recordDao.updateUserRecord(record);
	}

	public void addUserRecord(Record record) {
		record.setRecordtime(new Date());
		recordDao.addUserRecord(record);
	}

	public List<Record> getRecordByUser() {
		return recordDao.getRecordByUser();
	}

	public void deleteRecord() {
		recordDao.deleteRecord();
	}


}
