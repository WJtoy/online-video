package com.item.service;

import java.util.List;

import com.item.bean.Barrage;

public interface BarrageService {

	//插入视频中
	public void addBarrage(Barrage barrage);
	//根据视频来查询当前视频的弹幕
	public List<Barrage> getBarrageVideoById(Integer cid);

	public List<Barrage> getBarrageUserAndVideo();

	//删除
	public void deleteBatch(int[] result);
	public void deleteBarrage(Integer id);
	
	//公告栏最火视频
	public List<Barrage> getBarrageCount();


}
