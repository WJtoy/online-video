package com.item.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.item.bean.User;
import com.item.bean.Video;
import com.item.dao.VideoDao;
import com.item.utils.FileUtil;
import com.item.utils.Msg;

@Service
public class VideoServiceImpl implements VideoService{

	@Resource
	private VideoDao videoDao;
	
	
	//添加
	public	void add(MultipartFile pictureImg, Video video, HttpServletRequest request) {
		try{
            if(!pictureImg.isEmpty()){
                //更新首先要先删除原来的文件
                if(video.getUrl()!= null){
                    File file = new File(request.getServletContext().getRealPath("/" +video.getUrl()));
                    if(file != null) file.delete();
                }
                String path = FileUtil.uploadImage(pictureImg, "video", request);
                System.out.println(path);
                if(path == null) return ;
                video.setUrl(path);
            }
            Date date=new Date();
            video.setUploadtime(date);
            videoDao.add(video);
        }catch (Exception e){
            e.printStackTrace();
        }
	}
	//查询所有
	public List<Video> getVideoAll() {
		return videoDao.getVideoAll();
	}
	
	//根据id查一条
	public Video getVideo(Integer id) {
		return videoDao.getVideo(id);
	}
	
	/**
	 * 视频更新
	 * @param video
	 */
	public void updateVideo(MultipartFile adminIcon, Video video, HttpServletRequest request) {
		 try{
	            if(!adminIcon.isEmpty()){
	                //更新首先要先删除原来的文件
	                if(video.getUrl()!= null){
	                    File file = new File(request.getServletContext().getRealPath("/" +video.getUrl()));
	                    if(file != null) file.delete();
	                }
	                String path = FileUtil.uploadImage(adminIcon, "video", request);
	                System.out.println(path);
	                if(path == null) return ;
	                video.setUrl(path);
	            }
	            videoDao.updateByPrimaryKeySelective(video);
	        }catch (Exception e){
	            e.printStackTrace();
	        }
		
	}

	/**
	 * 员工删除
	 * @param id
	 */
	public void deleteVideo(Integer id) {
		// TODO Auto-generated method stub
		videoDao.deleteByPrimaryKey(id);
	}

	/*public void deleteBatch(List<Integer> ids) {
		// TODO Auto-generated method stub
		//delete from xxx where emp_id in(1,2,3)
		System.out.println(ids.toString()+"-----------------");
		videoDao.deleteByExample(ids);
	}*/
	//批量删除
	public void deleteBatch(int[] result) {
		videoDao.deleteByExample(result);
	}
	
	
	//查询视频基础及进阶部分
	public List<Video> getVideoBase(Integer id) {
		return videoDao.getVideoBase(id);
	}
	
	
	//根据时间,时间重复根据id降序进行排序
	public List<Video> timeSort() {
		List<Video> sort = videoDao.timeSort();
		return sort;
	}
	//查最新的视频
	public List<Video> bulletinBoard() {
		return videoDao.bulletinBoard();
	}
	public List<Video> getByCidVideo(Integer id) {
		return videoDao.getByCidVideo(id);
	}
	
	//根据一级分类查询及以下所有的视频
	public List<Video> getByCidAllVideo(List<Integer> class_ids,Integer baid) {
		return videoDao.getByCidAllVideo(class_ids, baid);
	}
	
	
	//根据二级分类来查询子视频
	public List<Video> getByCidChildrenVideo(int parseInt,Integer bid) {
		return videoDao.getByCidChildrenVideo(parseInt,bid);
	}
	
	//查询的所有视频并绑定第三个分类的类型视频
	public List<Video> getBaseAllVideo(Integer bid) {
		return videoDao.getBaseAllVideo(bid);
	}
	

}
