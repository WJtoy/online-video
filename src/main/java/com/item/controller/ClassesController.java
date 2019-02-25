package com.item.controller;

import java.util.ArrayList;
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
import com.item.bean.Classes;
import com.item.bean.Video;
import com.item.service.ClassesService;
import com.item.service.VideoService;
import com.item.utils.Msg;

@Controller
@RequestMapping("/classes")
public class ClassesController {
	
	@Autowired
	private ClassesService classesService;

	@Autowired
	private VideoService videoService;
	
	
	@RequestMapping("/topClasses")
	public String topClasses() {
		return "topClasses";
	}
	@RequestMapping("/twoClasses")
	public String twoClasses() {
		return "twoClasses";
	}
	
	/**
	 * 返回所有的分类信息
	 */
	@RequestMapping("/class")
	@ResponseBody
	public Msg getClassesAll(){
		//查出的所有分类信息
		List<Classes> list = classesService.getClassesAll();
		return Msg.success().add("depts", list);
	}

	//查询一级分类信息
	@RequestMapping("/parentClasses")
	@ResponseBody
	public Msg getEmpsWithJson(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		// 这不是一个分页查询
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 5);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Classes> emps = classesService.getParentClassesAll(0);
		System.out.println(emps.size());
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(emps, 5);
		return Msg.success().add("pageInfo", page);
	}
	//查出的所有一级分类信息
	@RequestMapping("/parentClassesss")
	@ResponseBody
	public Msg getParentClassesAll(){
		List<Classes> list = classesService.getParentClassesAll(0);
		return Msg.success().add("depts", list);
	}
	
	//修改一级分类信息
	
	@RequestMapping(value="/findParentClasses/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id")Integer id){
		Classes employee = classesService.getParentClassesByid(id);
		return Msg.success().add("emp", employee);
	}
	
	@ResponseBody
	@RequestMapping("/updateParentClasses/{id}")
	public Msg updateParentClasses(Classes classes) {
		System.out.println(classes.toString());
		classesService.updateParentClasses(classes);
		return Msg.success();
	}
	
	
	//查询所有二级分类信息
	@RequestMapping("/childrenClasses")
	@ResponseBody
	public Msg getChildrenClasses(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		// 这不是一个分页查询
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 5);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Classes> emps = classesService.getChildrenClassesAll();
		System.out.println(emps.size());
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(emps, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	
	//添加一级分类
	@RequestMapping("/addParentClasses")
	@ResponseBody
	public Msg addParentClasses(Classes classes) {
		System.out.println(classes.toString());
		classesService.addParentClasses(classes);
		return Msg.success();
	}
	
	//添加二级分类
	@RequestMapping("/addChildrenClasses")
	@ResponseBody
	public Msg addChildrenClasses(Classes classes) {
		classesService.addChildrenClasses(classes);
		return Msg.success();
	}
	
	//删除一级分类
	@RequestMapping(value="/deleteParentClasses/{id}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteParentClasses(@PathVariable("id")Integer id) {
		Integer fid=null;
		if(id!=null) {
	       fid=id;
	       }
		classesService.deleteParentClasses(id,fid);
		/*List<Integer> list = classesService.findChildrenClassesByids(id);
		if(list!=null) {
			int[] result = new int[list.size()];//int类型数组
			for(int i=0;i<list.size();i++) {
			   result[i] = list.get(i);//整数数组
			}
			classesService.deleteBatch(result);
		}*/
			
		return Msg.success();
	}
	
	//删除二级分类
	//单个删除
	/*@RequestMapping(value="/deleteChildrenClasses/{id}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteChildrenClasses(@PathVariable("id")Integer id) {
		classesService.deleteChildrenClasses(id);
		return Msg.success();
	}*/
	
	@ResponseBody
	@RequestMapping(value="/deleteChildrenClasses/{ids}",method=RequestMethod.DELETE)
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
			classesService.deleteBatch(result);
			
		}else{
			//单个删除
			Integer id = Integer.parseInt(ids);
			classesService.deleteChildrenClasses(id);
		}
		return Msg.success();
	}

	
	
	//修改二级分类
	@RequestMapping(value="/findChildrenClasses/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg findChildrenClasses(@PathVariable("id")Integer id){
		Classes employee = classesService.findChildrenClassesByid(id);
		return Msg.success().add("emp", employee);
	}
	
	@ResponseBody
	@RequestMapping("/updateChildrenClasses/{id}")
	public Msg updateChildrenClasses(Classes classes) {
		System.out.println(classes.toString());
		classesService.updateChildrenClasses(classes);
		return Msg.success();
	}
	
	
	//查询根据一级ID来查询及以下的二级ID
	@ResponseBody
	@RequestMapping("/findByIdChildrenClasses/{fid}")
	public Msg findByIdChildrenClasses(@PathVariable("fid")Integer fid) {
		List<Classes> list = classesService.findByIdChildrenClasses(fid);
		return Msg.success().add("ServerPartShopObject", list);
	}
	
	
	//查询所有的分类
	@RequestMapping("/findByAllClass")
	public ModelAndView findByAllClass(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView("ificationCourse");
		List<Classes> allClass = classesService.findByAllClass();//搜的全部分类列表
		String req=request.getParameter("classFid");
		String req1=request.getParameter("classCid");
		String req2=request.getParameter("baseid");
		mv.addObject("classFid", req);
		mv.addObject("classCid", req1);
		mv.addObject("baseid",req2);
		
		
		//课程分类的第三个类型
		Integer bid=null;
		if(req2!=null)bid=Integer.parseInt(req2);
		Integer fids=null;
		if(req!=null&req!="")
		fids=Integer.parseInt(req);
		
		if(req!=null) {
			
		List<Classes> childrenClasses = classesService.findByIdChildrenClasses(fids);//根据一级id去查二级分类
		List<Integer> class_ids = new ArrayList<Integer>();
		
			for(Classes attribute : childrenClasses) {
				class_ids.add(attribute.getId());
			}
			
			List<Video> videoClass = videoService.getByCidAllVideo(class_ids,bid);
			if(req1!=null) {
				Integer reqs=Integer.parseInt(req1);
				List<Video> list = videoService.getByCidChildrenVideo(reqs,bid);
				mv.addObject("list", list);
				mv.addObject("childrenClasses", childrenClasses);
				mv.addObject("allClass", allClass);
				return mv;
			}
		mv.addObject("videoClass", videoClass);//所查的视频
		mv.addObject("childrenClasses", childrenClasses);//二级分类列表
		mv.addObject("allClass", allClass);//搜的全部分类列表
		return mv;
		}
		List<Video> allVideo=videoService.getBaseAllVideo(bid);//查询所有视频
		mv.addObject("allClass", allClass);
		mv.addObject("allVideo", allVideo);
		return mv;
	}
	
/*	@RequestMapping("/findAllClasses")
	public ModelAndView findAllClasses() {
		ModelAndView mv= new ModelAndView();
		
		return mv;
	}*/
	
	
	//根据一级id去查二级分类
	@RequestMapping("/findByPidClass/{id}")
	@ResponseBody
	public Msg findByPidClass(@PathVariable("id")Integer id) {
		List<Classes> allChildrenClass=classesService.findByIdChildrenClasses(id);
		return Msg.success().add("allChildrenClass", allChildrenClass);
	}
	
	
	
}
