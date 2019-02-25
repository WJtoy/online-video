package com.item.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.item.bean.Record;
import com.item.bean.Video;
import com.item.service.RecordService;
import com.item.service.VideoService;
import com.item.utils.Msg;

@Controller
@RequestMapping("/play")
public class Play {
	
	@Autowired
	private VideoService videoService;
	
	@Autowired
	private RecordService recordService;
	
	
	@RequestMapping("/player")
	public String  play(HttpServletRequest request) {
		String string = request.getParameter("id");
		request.getSession().setAttribute("idstr", string);
		return "videoPlay";
	}
	
	
	@ResponseBody
	@RequestMapping("/playVideo/{id}")
	public Msg playVideo(@PathVariable("id")Integer id,Record record) {
		
		Video video = videoService.getVideo(id);
		
		boolean bool = recordService.getUserRecordByCid(id);
		if(bool) {
			record.setCid(id);
			recordService.updateUserRecord(record);
		}else {
			record.setCid(id);
			record.setUid(1);
			recordService.addUserRecord(record);
		}
		return Msg.success().add("playVideo", video);
	}
	
	
}
