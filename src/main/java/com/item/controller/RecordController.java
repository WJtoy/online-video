package com.item.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.item.bean.Record;
import com.item.service.RecordService;
import com.item.utils.Msg;

@Controller
@RequestMapping("/record")
public class RecordController {
	
	@Autowired
	private RecordService recordService;
	
	@RequestMapping("/getUserRecord")
	@ResponseBody
	public Msg getUserRecord() {
		List<Record> record = recordService.getUserRecord();
		return Msg.success().add("UserRecord", record);
	}
	
	@RequestMapping("/getRecordByUser")
	@ResponseBody
	public Msg getRecordByUser() {
		
		List<Record> recordByUser = recordService.getRecordByUser();
		
		return Msg.success().add("record", recordByUser);
	}
	
	@RequestMapping(value="/deleteRecord" ,method=RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteRecord() {
		
		recordService.deleteRecord();
		return Msg.success();
	}
	
}
