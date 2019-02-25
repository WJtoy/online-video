package com.item.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.item.bean.Barrage;
import com.item.bean.Video;
import com.item.service.BarrageService;
import com.item.service.VideoService;
import com.item.utils.Msg;

@Controller
@RequestMapping("/reception")
public class Reception {
	
	@Autowired
	private VideoService videoService;
	
	@Autowired 
	private BarrageService barrageService;
	
	
	//查询基础及进阶部分
	@RequestMapping("/receptionBase")
	public ModelAndView receptionBase() {
		ModelAndView mv=new ModelAndView("reception");
		List<Video> videoBase = videoService.getVideoBase(0);
		List<Video> videoAdvance = videoService.getVideoBase(1);
		List<Video> videoActual = videoService.getVideoBase(2);
		mv.addObject("baseAdvance", videoBase);
		mv.addObject("videoAdvance",videoAdvance );
		mv.addObject("videoActual", videoActual);
		
		//根据时间,时间重复根据id降序进行排序
		List<Video> sort = videoService.timeSort();
		mv.addObject("sortTime", sort);
		
		return mv;
	}
	
	//查最新的视频
	@RequestMapping("/bulletinBoard")
	@ResponseBody
	public Msg bulletinBoard() {
		List<Video> sort = videoService.bulletinBoard();
		return Msg.success().add("bulletin", sort);
	}
	
	//查根据弹幕最火的视频
	@ResponseBody
	@RequestMapping("/getBarrageCount")
	public Msg getBarrageCount() {
		List<Barrage> count = barrageService.getBarrageCount();
		return Msg.success().add("bullCount", count);
	}
	 	
	/*
	@RequestMapping("/timeSort")
	@ResponseBody
	public Msg timeSort() {
		return Msg.success().add("sortTime", sort);
	}
	*/
	
}
