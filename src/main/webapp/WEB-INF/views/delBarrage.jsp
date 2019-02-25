<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@include file="../common/head.jsp"%>
</head>
<body>

<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h3>用户弹幕列表</h>
			</div>
		</div>
		<!-- 按钮-->
		<div class="row">
			<div class="col-md-4 col-md-offset-10">
				<!-- <button class="btn btn-primary" id="emp_add_modal_btn">新增</button> -->
				<button class="btn btn-danger" id="emp_delete_all_btn">删除选中</button>
			</div>
		</div> 
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">  <!-- table-hover -->
				<table class="table table-striped" id="emps_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all"/>
							</th>
							<th>#</th>
							<th>用户账号</th>
							<th>用户名称</th>
							<th>视频名称</th>
							<th>弹幕信息</th>
							<th>发送时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>

		<!-- 显示分页信息 -->
		<div class="row">
			<!--分页文字信息  -->
			<div class="col-md-6" id="page_info_area"></div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area"></div>
		</div>
		
	</div>


<script type="text/javascript">
		var totalRecord,currentPage;
		//1、页面加载完成以后，直接去发送ajax请求,要到分页数据
		$(function(){
			//去首页
			to_page(1);
		});
		
		function to_page(pn){
			$.ajax({
				url:"${APP_PATH}/barrage/getBarrageUserAndVideo",
				data:"pn="+pn,
				type:"GET",
				success:function(result){
					/* console.log(result);  */
					//1、解析并显示员工数据
					build_emps_table(result);
					//2、解析并显示分页信息
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
				}
			});
		}
		
		function build_emps_table(result){
			//清空table表格
			$("#emps_table tbody").empty();
			var barrage = result.extend.pageInfo.list;
			$.each(barrage,function(index,item){
				var checkBoxTd = $("<td><input type='checkbox' class='check_item' name='"+item.id+"'/></td>");
				var barrageidTd=$("<td></td>").append(item.id);
				var usernameTd = $("<td></td>").append(item.us.username);
				var nicknameTd = $("<td></td>").append(item.us.nickname);
				var coursenameTd = $("<td></td>").append(item.vi.coursename);
				var textTd = $("<td></td>").append(item.text); 
				var sendTimeTd = $("<td></td>").append(item.sendTime);
				  /*  var classesTd = $("<td></td>").append(item.classes.classname); */
				/* var deptNameTd = $("<td></td>").append(item.department.deptName); */
				/**
				<button class="">
									<span class="" aria-hidden="true"></span>
									编辑
								</button>
				*/
				/* var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				//为编辑按钮添加一个自定义的属性，来表示当前员工id
				editBtn.attr("edit-id",item.id); */
				var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				//为删除按钮添加一个自定义的属性来表示当前删除的员工id
				delBtn.attr("del-id",item.id);
				var btnTd = $("<td></td>").append(" ").append(delBtn);
				//var delBtn = 
				//append方法执行完成以后还是返回原来的元素
				$("<tr></tr>").append(checkBoxTd) 
					.append(barrageidTd) 
					.append(usernameTd)
					.append(nicknameTd)
					/* .append(genderTd) */
					.append(coursenameTd)
					.append(textTd)
					.append(sendTimeTd)
					.append(btnTd) 
					.appendTo("#emps_table tbody");
			});
		}
		//解析显示分页信息
		function build_page_info(result){
			$("#page_info_area").empty();
			$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
					result.extend.pageInfo.pages+"页,总"+
					result.extend.pageInfo.total+"条记录");
			totalRecord = result.extend.pageInfo.total;
			currentPage = result.extend.pageInfo.pageNum;
		}
		//解析显示分页条，点击分页要能去下一页....
		function build_page_nav(result){
			//page_nav_area
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			
			//构建元素
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
			if(result.extend.pageInfo.hasPreviousPage == false){
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}else{
				//为元素添加点击翻页的事件
				firstPageLi.click(function(){
					to_page(1);
				});
				prePageLi.click(function(){
					to_page(result.extend.pageInfo.pageNum -1);
				});
			}
			
			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			if(result.extend.pageInfo.hasNextPage == false){
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			}else{
				nextPageLi.click(function(){
					to_page(result.extend.pageInfo.pageNum +1);
				});
				lastPageLi.click(function(){
					to_page(result.extend.pageInfo.pages);
				});
			}
			
			//添加首页和前一页 的提示
			ul.append(firstPageLi).append(prePageLi);
			//1,2，3遍历给ul中添加页码提示
			$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
				
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if(result.extend.pageInfo.pageNum == item){
					numLi.addClass("active");
				}
				numLi.click(function(){
					to_page(item);
				});
				ul.append(numLi);
			});
			//添加下一页和末页 的提示
			ul.append(nextPageLi).append(lastPageLi);
			
			//把ul加入到nav
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}
		
		//清空表单样式及内容
	/* 	function reset_form(ele){
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		} */
		
		//单个删除
		$(document).on("click",".delete_btn",function(){
			//1、弹出是否确认删除对话框
			
			var empName = $(this).parents("tr").find("td:eq(1)").text();
			var empId = $(this).attr("del-id");
			//alert($(this).parents("tr").find("td:eq(1)").text());
			if(confirm("确认删除id号为【"+empName+"】弹幕吗？")){
				//确认，发送ajax请求删除即可
				$.ajax({
					url:"${APP_PATH}/barrage/delBarrage/"+empId,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						//回到本页
						to_page(currentPage);
					}
				});
			}
		});
		
		
		//完成全选/全不选功能
		$("#check_all").click(function(){
			//attr获取checked是undefined;
			//我们这些dom原生的属性；attr获取自定义属性的值；
			//prop修改和读取dom原生属性的值
				$(".check_item").prop("checked",$(this).prop("checked"));
			/* $.each($(".check_item"),function(){
				alert($(this).parents("tr").find("td:eq(1)").text());
				$(".check_item").prop("checked",$(this).prop("checked"));
				if($(this).parents("tr").find("td:eq(1)").text()==27){
					alert("dasdSS");
					$(this).find("td:eq(0)").prop("checked", false);
				}else{
					$(".check_item").prop("checked",$(this).prop("checked"));
				}
			}); */
		});
		
		
		
		//check_item
		$(document).on("click",".check_item",function(){
			//判断当前选择中的元素是否5个
			var flag = $(".check_item:checked").length==$(".check_item").length;
			$("#check_all").prop("checked",flag);
		});
		//点击全部删除，就批量删除
		$("#emp_delete_all_btn").click(function(){
			//
			if($(".check_item:checked").length==0){
				alert("请选择要删除的数据！");
				return;
			}
			var empNames = "";
			var del_idstr = "";
			$.each($(".check_item:checked"),function(){
				//this
				empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
				//组装员工id字符串
				del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			//去除empNames多余的,
			empNames = empNames.substring(0, empNames.length-1);
			//去除删除的id多余的-
			del_idstr = del_idstr.substring(0, del_idstr.length-1);
			if(confirm("确认删除id为【"+empNames+"】弹幕吗？")){
				//发送ajax请求删除
				$.ajax({
					url:"${APP_PATH}/barrage/delBarrage/"+del_idstr,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						//回到当前页面
						to_page(currentPage);
					}
				});
			}
		});
		
</script>

</body>
</html>