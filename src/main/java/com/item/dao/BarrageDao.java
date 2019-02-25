package com.item.dao;

import java.util.List;

import com.item.bean.Barrage;

public interface BarrageDao {
	
	
	public List<Barrage> getBarrage();
	
	//把弹幕插入到对应的视频里
	public int addBarrage(Barrage barrage);
	//根据视频来查询当前视频的弹幕
	public List<Barrage> getBarrageVi(Integer cid);
	
	//查询所有视频的信息及用户和弹幕
	public List<Barrage> getBarrageUserAndVideo();
	
	public void deleteBatch(int[] result);
	public void deleteBarrage(Integer id);

	
	public List<Barrage> getBarrageVideoById(Integer cid);
	
	//公告栏最火视频
	public List<Barrage> getBarrageCount();

}
