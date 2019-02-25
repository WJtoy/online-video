package com.item.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.item.bean.Video;

public interface VideoDao {

	public void add(Video video);

	public List<Video> getVideoAll();
	

	public int updateVideo(Video video);

	public Video getVideo(Integer id);

	public void updateByPrimaryKeySelective(Video video);

	public void deleteByPrimaryKey(Integer id);

/*	public void deleteByExample(@Param("ids")List<Integer> ids);*/

	public void deleteByExample(int[] result);

	
	//查询基础课程
	public List<Video> getVideoBase(Integer id);

	
	//根据时间,时间重复根据id降序进行排序
	public List<Video> timeSort();
	
	//查最新的公告栏
	public List<Video> bulletinBoard();

	//根据cid来查找视频
	public List<Video> getByCidVideo(Integer id);
	
	
	
	public List<Video> getByCidAllVideo( @Param("list")List<Integer> class_ids, @Param("base_advance") Integer base_advance);
	

	public List<Video> getByCidChildrenVideo(@Param("ids")int parseInt, @Param("base_advance")Integer bid);

	public List<Video> getBaseAllVideo(@Param("base_advance")Integer bid);

}
