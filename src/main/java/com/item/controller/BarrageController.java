package com.item.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.item.bean.Barrage;
import com.item.bean.Classes;
import com.item.service.BarrageService;
import com.item.utils.Msg;

@Controller
@RequestMapping("/barrage")
public class BarrageController {

	@Autowired
	private BarrageService barrageService;

	//open弹幕页面
	@RequestMapping("/delBarrage")
	public ModelAndView delBarrage() {
		return new ModelAndView("delBarrage");
	}
	
	//获取弹幕以及评论和用户的信息
	@RequestMapping("/getBarrageUserAndVideo")
	@ResponseBody
	public Msg getBarrageUserAndVideo(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		// 这不是一个分页查询
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 5);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Barrage> emps = barrageService.getBarrageUserAndVideo();
		System.out.println(emps.size());
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(emps, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	
	//根据所在的视频id查对应的弹幕
	@RequestMapping("/getBarrageVideoById/{cid}")
	@ResponseBody
	public  Msg getBarrageVideoById(@PathVariable("cid")Integer cid) {
		List<Barrage> barrage=barrageService.getBarrageVideoById(cid);
		return Msg.success().add("barrage", barrage);
	}
	
	
	//把弹幕插入到对应的视频里
	@RequestMapping("/addBarrage")
	@ResponseBody
	public Msg addBarrage(HttpServletRequest request,Barrage barrage) {
		String st=request.getParameter("text");
		Integer vid=Integer.parseInt(request.getParameter("vid"));
		if(st.equals(null)) {
			return Msg.fail();
		}
		barrage.setText(st);
		barrage.setVid(vid);
		barrageService.addBarrage(barrage);
		return Msg.success();
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/delBarrage/{ids}",method=RequestMethod.DELETE)
	public Msg deleteEmp(@PathVariable("ids")String ids){
		//批量删除
		if(ids.contains("-")){
			/*List<Integer> del_ids = new ArrayList<>();*/
			String[] str_ids = ids.split("-");
			//组装id的集合
			int[] result = new int[str_ids.length];//int类型数组
			for(int i=0;i<str_ids.length;i++)
			{
			   result[i] = Integer.parseInt(str_ids[i]);//整数数组
			}
			barrageService.deleteBatch(result);
		}else{
			//单个删除
			Integer id = Integer.parseInt(ids);
			barrageService.deleteBarrage(id);
		}
		return Msg.success();
	}
	
}
