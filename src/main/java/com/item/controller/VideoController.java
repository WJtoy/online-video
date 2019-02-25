package com.item.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.item.bean.Video;
import com.item.service.VideoService;
import com.item.utils.Msg;

@Controller
@RequestMapping("/video")
public class VideoController {
	
	@Resource
	private VideoService videoService;
	
	
	@ResponseBody
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public Msg add(MultipartFile pictureImg,Video video ,HttpServletRequest request) {
		videoService.add(pictureImg,video,request);
		return Msg.success();
	}
	
	//添加
	/*@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Video video,BindingResult result){
		if(result.hasErrors()){
			//校验失败，应该返回失败，在模态框中显示校验失败的错误信息
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段名："+fieldError.getField());
				System.out.println("错误信息："+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		}else{
			videoService.saveVideo(video);
			return Msg.success();
		}
		
	}
	*/
	
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id")Integer id){
		Video employee = videoService.getVideo(id);
		return Msg.success().add("emp", employee);
	}
	
	
	@RequestMapping("/videoList")
	public String indexs() {
		return "videoList";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public Msg getEmpsWithJson(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		// 这不是一个分页查询
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 5);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Video> emps = videoService.getVideoAll();
		System.out.println(emps.size());
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(emps, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	
	/*@RequestMapping("/list")*/
	public String getEmps(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			Model model) {
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 5);
		System.out.println(pn);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Video> emps = videoService.getVideoAll();
		System.out.println(emps.isEmpty());
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(emps, 5);
		model.addAttribute("pageInfo", page);
		return "list";
	}
	
	//更新
	@ResponseBody
	@RequestMapping(value="/update/{id}",method=RequestMethod.POST)
	public Msg saveEmp(MultipartFile videoImg,Video video,HttpServletRequest request){
		System.out.println("请求体中的值："+request.getParameter("url"));
		videoService.updateVideo(videoImg, video, request);
		return Msg.success();
	}
	
	
	/**
	 * 单个批量二合一
	 * 批量删除：1-2-3
	 * 单个删除：1
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
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
			videoService.deleteBatch(result);
			
		}else{
			//单个删除
			Integer id = Integer.parseInt(ids);
			videoService.deleteVideo(id);
		}
		return Msg.success();
	}
	
	
	
	//根据分类的cid来查找视频
	@ResponseBody
	@RequestMapping("/getByCidVideo")
	public Msg getByCidVideo(HttpServletRequest request) {
		String req1=request.getParameter("fid");
		List<Video> all = videoService.getVideoAll();
		/*List<Video> videoClass=videoService.getByCidVideo(Integer.parseInt(req1));*/
		return Msg.success().add("videoClass", all);
	}
	
}
