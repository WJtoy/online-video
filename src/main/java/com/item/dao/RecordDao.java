package com.item.dao;

import java.util.List;

import com.item.bean.Record;

public interface RecordDao {

	public List<Record> getRecord(Integer id);

	public int addRecord(Record rec);

	public Record getUserRecordByCid(Integer id);

	public void updateUserRecord(Record record);

	public void addUserRecord(Record record);
	
	public void deleteRecord();
	
	public List<Record> getRecordByUser();
	

}
