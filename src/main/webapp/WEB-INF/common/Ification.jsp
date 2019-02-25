<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${APP_PATH }/bootstrap3/jquery.js"></script>
</head>
<body>

<div class="container" style="box-shadow: 0 4px 4px 0px rgba(7,17,27,.1);margin-top: 20px">
    <div class="row" style="min-height: 250px;background-color: whitesmoke;min-height: 80px;padding-top: 15px; padding-bottom: 10px">
        <div class="col-sm-12 col-md-1">
                <span style="width: 52px;
                display: block;
                line-height: 30px;
                font-weight: 700;
                font-size: 14px;
                color: #07111b;
                text-align: right;">方向：</span>
        </div>
        <div class="col-sm-12 col-md-11">
            <ul class="nav nav-pills">
                           <li class="active"><a href="javascript:void(0)">全部</a></li>
                           <li><a href="javascript:void(0)">JAVA后端</a></li>
                           <li><a href="javascript:void(0)">前端</a></li>
                           <li><a href="javascript:void(0)">网站架构</a></li>
            </ul>
        </div>
    </div>
  <div class="row" style="min-height: 250px;background-color: whitesmoke;min-height: 80px;padding-top: 15px; padding-bottom: 10px">
        <div class="col-sm-12 col-md-1">
                <span style="width: 52px;
                display: block;
                line-height: 30px;
                font-weight: 700px;
                font-size: 14px;
                color: #07111b;
                text-align: right;">分类：</span>
        </div>
        <div class="col-sm-12 col-md-11">
            <ul class="nav nav-pills">
                           <li class="active">
                       			 <a href="javascript:void(0)">全部</a>
                   		   </li>
                           <li class="">
                                <a href="javascript:void(0)">JAVA基础</a>
                            </li>
                             <li class="">
                                <a href="javascript:void(0)">JAVAWEB</a>
                            </li>
                            <li class="">
                                <a href="javascript:void(0)">SSM框架</a>
                            </li>
                           <li class="">
                                <a href="javascript:void(0)">项目实战</a>
                            </li>
                             <li class="">
                                <a href="javascript:void(0)">js</a>
                            </li>
                             <li class="">
                                <a href="javascript:void(0)">html</a>
                            </li>
                            <li class="">
                                <a href="javascript:void(0)">MySQL数据库</a>
                            </li>
                             <li class="">
                                <a href="javascript:void(0)">数据结构</a>
                            </li>
                             <li class="">
                                <a href="javascript:void(0)">项目工具</a>
                            </li>
                             <li class="">
                                <a href="javascript:void(0)">分布式/中间件</a>
                            </li>
                               <li class="">
                                <a href="javascript:void(0)">微服务/SOA</a>
                            </li>
                        </ul>
        </div>
    </div>
    <div class="row" style="min-height: 250px;background-color: whitesmoke;min-height: 80px;padding-top: 15px; padding-bottom: 10px">
        <div class="col-sm-12 col-md-1">
                <span style="width: 52px;
                display: block;
                line-height: 30px;
                font-weight: 700;
                font-size: 14px;
                color: #07111b;
                text-align: right;">类型：</span>
        </div>
        <div class="col-sm-12 col-md-11">
            <ul class="nav nav-pills">
                              <li class="active"><a href="">全部</a></li>
                             <li>
                                <a href="javascript:void(0)">工具</a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">项目实战</a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">基础课程</a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">框架</a>
                            </li>
                   </ul>
        </div>
    </div>
</div>
	<div class="row" align="center" >
		<div class="btn-group ">
		    <a class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		        Java<span class="caret"></span>
		    </a>
		    <ul class="dropdown-menu">
		        <li><a href="javascript:void(0)">菜单项1</a></li>
		        <li><a href="javascript:void(0)">菜单项2</a></li>
		        <li class="divider"></li>
		        <li><a href="javascript:void(0)">菜单项3</a></li>
		    </ul>
		</div>
		
		<div class="btn-group">
		    <a class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		        C<span class="caret"></span>
		    </a>
		    <ul class="dropdown-menu">
		        <li><a href="#">菜单项1</a></li>
		        <li><a href="#">菜单项2</a></li>
		        <li class="divider"></li>
		        <li><a href="#">菜单项3</a></li>
		    </ul>
		</div>
		
		
		<div class="btn-group">
		    <a class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		        PHP<span class="caret"></span>
		    </a>
		    <ul class="dropdown-menu">
		        <li><a href="#">菜单项1</a></li>
		        <li><a href="#">菜单项2</a></li>
		        <li class="divider"></li>
		        <li><a href="#">菜单项3</a></li>
		    </ul>
		</div>
		<div class="btn-group">
		    <a class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		        Python<span class="caret"></span>
		    </a>
		    <ul class="dropdown-menu">
		        <li><a href="#">菜单项1</a></li>
		        <li><a href="#">菜单项2</a></li>
		        <li class="divider"></li>
		        <li><a href="#">菜单项3</a></li>
		    </ul>
		</div>
		
		<div class="btn-group">
		    <a class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		        数据库<span class="caret"></span>
		    </a>
		    <ul class="dropdown-menu">
		        <li><a href="#">菜单项1</a></li>
		        <li><a href="#">菜单项2</a></li>
		        <li class="divider"></li>
		        <li><a href="#">菜单项3</a></li>
		    </ul>
		</div>
	</div>
	
	<script type="text/javascript">
	
	$("li").on('click',function() {
	    $(this).addClass('active').siblings().removeClass('active');
	})
	
	  $.ajax({  								//把弹幕插入对应的视频里 
	        type : "GET",  
	        url : "${APP_PATH}/",
	        //async: false, 
	        async: true,
	        cache: true,  
	        contentType: false,  
	        processData: false,
	        success : function(result) {
	        }  
		});
	</script>
</body>
</html>