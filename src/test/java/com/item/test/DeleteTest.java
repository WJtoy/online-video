package com.item.test;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.item.service.VideoService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class DeleteTest {
	private static Logger logger=Logger.getLogger(DeleteTest.class);
	
	@Resource
	private VideoService videoService;
	@Test
	public void test() {
		int[] result= {17,18};
		System.out.println(result[0]);
		videoService.deleteBatch(result);
	}

}
