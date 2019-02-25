package com.item.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.item.bean.Barrage;
import com.item.dao.BarrageDao;

@Service
public class BarrageServiceImpl implements BarrageService{

	@Autowired
	private BarrageDao barrageDao;
	
	public List<Barrage> getBarrage() {
		return barrageDao.getBarrage();
	}

	//把弹幕插入到对应的视频里
	public void addBarrage(Barrage barrage) {
		Date date=new Date();
		barrage.setSendTime(date);
		barrageDao.addBarrage(barrage);
	}

	//根据视频id来查询当前视频的弹幕
	public List<Barrage> getBarrageVi(Integer cid) {
		return barrageDao.getBarrageVi(cid);
	}

	//查询所有视频的信息及用户和弹幕
	public List<Barrage> getBarrageUserAndVideo() {
		return barrageDao.getBarrageUserAndVideo();
	}
	//根据视频id查询所有弹幕
	public List<Barrage> getBarrageVideoById(Integer cid) {
		return barrageDao.getBarrageVideoById(cid);
	}
	
	//删除
	public void deleteBatch(int[] result) {
		barrageDao.deleteBatch(result);
	}
	public void deleteBarrage(Integer id) {
		barrageDao.deleteBarrage(id);
	}

	public List<Barrage> getBarrageCount() {
		return barrageDao.getBarrageCount();
	}
	
}
