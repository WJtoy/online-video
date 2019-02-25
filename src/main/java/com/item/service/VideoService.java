package com.item.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.item.bean.User;
import com.item.bean.Video;

public interface VideoService {

	public void add(MultipartFile pictureImg, Video video, HttpServletRequest request);


	public void updateVideo(MultipartFile adminIcon,Video video, HttpServletRequest request);

	public List<Video> getVideoAll();

	public Video getVideo(Integer id);

	/*public void deleteBatch(List<Integer> del_ids);*/

	public void deleteVideo(Integer id);

	public void deleteBatch(int[] result);

	
	//查询视频基础及进阶部分
	public List<Video> getVideoBase(Integer id);

	//根据时间,时间重复根据id降序进行排序
	public List<Video> timeSort();

	//查公告栏的最新视频
	public List<Video> bulletinBoard();

	//根据cid来查找视频
	public List<Video> getByCidVideo(Integer id);

	//根据一级分类查询及以下所有的视频
	public List<Video> getByCidAllVideo(List<Integer> class_ids, Integer i);


	public List<Video> getByCidChildrenVideo(int parseInt, Integer bid);


	public List<Video> getBaseAllVideo(Integer bid);
	

}
