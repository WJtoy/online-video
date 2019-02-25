package com.item.service;

import java.util.List;

import com.item.bean.Record;

public interface RecordService {


	public List<Record> getUserRecord();


	public boolean getUserRecordByCid(Integer id);


	public void updateUserRecord(Record record);


	public void addUserRecord(Record record);


	public List<Record> getRecordByUser();
	
	 void deleteRecord();


}
