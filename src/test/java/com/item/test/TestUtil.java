package com.item.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.item.bean.Barrage;
import com.item.bean.Classes;
import com.item.bean.Record;
import com.item.bean.Video;
import com.item.dao.BarrageDao;
import com.item.dao.ClassesDao;
import com.item.dao.RecordDao;
import com.item.dao.VideoDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class TestUtil {
	private static Logger logger=Logger.getLogger(Test.class);
	
	@Resource
	private ClassesDao classesDao;
	
	@Autowired
	private RecordDao recordDao;
	
	@Autowired
	private BarrageDao barrageDao;
	
	@Autowired
	private VideoDao videoDao;
	
	
	@Test
	public void getBarrageCount() {
		List<Barrage> count = barrageDao.getBarrageCount();
		System.out.println(count);
	}
	
	

	
	
    //自关联实现无穷分类
	@Test
	
     public void selfCorrelation(){
        List<Classes> categories = classesDao.findClassesByParentId(0);
        for (Classes item :categories) {
           System.out.println(item);
        }
    }
	
	@Test
	public void test2() {
	 classesDao.deleteParentClasses(1,1);	
	 
	}
	
	@Test
	public void test3() {
		 classesDao.deleteChildrenClasses(12);
	}
	
	@Test
	public void test4() {
		List<Classes> list=classesDao.selectByChildrenByid(8);
		System.out.println(list);
	}
	
	@Test
	public void test5() {
		List<Classes> list=classesDao.selectByChildrenId();
		System.out.println(list);
	}
	
	@Test
	public void test6() {
		
		String s="ndia";
		int i=2;
		s=i+s;
		Double d=2.0d;
	}
	
	@Test
	public void test7() {
		List<Record> record = recordDao.getRecord(1);
		System.out.println(record);
		
	}
	
	@Test
	public void test8() {
		Record rec = new Record();
		rec.setUid(3);
		rec.setCid(22);
		rec.setRecordtime(new Date());
		recordDao.updateUserRecord(rec);
	}
	
	@Test
	public void test9() {
		recordDao.deleteRecord();
	}
	
	@Test
	public void test10() {
		List<Record> list = recordDao.getRecordByUser();
		System.out.println(list);
	}
	
	@Test
	public void test11() {
		List<Integer> class_ids = new ArrayList<Integer>();
		class_ids.add(33);
		List<Video> video = videoDao.getByCidAllVideo(class_ids , 1);
		System.out.println(video);
	}
	
	
}
