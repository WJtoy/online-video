<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<style type="text/css">

        /*淘宝CSS格式化代码*/
         body,
        h1, h2, h3, h4, h5, h6, hr, p, blockquote, dl, dt, dd, ul, ol, li, pre, form, fieldset, legend, button, input, textarea, th, td {
            margin: 0;
            padding: 0;
        }
 
        body, button, input, select, textarea {
            font: 12px/1.5 tahoma, arial, \5b8b\4f53;
        }
 
        h1, h2, h3, h4, h5, h6 {
            font-size: 100%;
        }
 
        address, cite, dfn, em, var {
            font-style: normal;
        }
 
        code, kbd, pre, samp {
            font-family: couriernew, courier, monospace;
        }
 
        small {
            font-size: 12px;
        }
 
        ul, ol {
            list-style: none;
        }
 
        a {
            text-decoration: none;
        }
 
        a:hover {
            text-decoration: underline;
        }
 
        sup {
            vertical-align: text-top;
        }
 
        sub {
            vertical-align: text-bottom;
        }
 
        legend {
            color: #000000;
        }
 
        fieldset, img {
            border: 0;
        }
 
        button, input, select, textarea {
            font-size: 100%;
        }
 
        table {
            border-collapse: collapse;
            border-spacing: 0;
        }
 
       /*  body, html {
            width: 100%;
            height: 100%;
        } */
         
        
 		/* .container-fluid {
            background: aquamarine;
            height: 100%;
        } */
 
 
        .logo {
            background: #354144;
            color: black;
            font-size: 40px;
            padding-left: 20px;
            height: 60px;
            min-height: 60px;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 100;
            width: 100%;
        }
 
         .nav > li > a:hover {
            color: #262626;
            text-decoration: none;
            background-color: #354144;
        } 
 
        .open > a {
            background-color: #354144 !important;
        }
 
        .right {
            float: right;
        }
 
        .grid:hover {
            background: #efefef;
        } 
</style>

<script type="text/javascript" src="${APP_PATH }/bootstrap3/jquery.js"></script>

</head>
<body style="background-color: #F0F0F0"><!-- style="background-color: #F0F0F0" -->


<!--导航栏开始-->
 <div id="header" >
	<nav class="navbar navbar-default" role="navigation" style="opacity: 0.8;">
	  <div class="container-fluid">
	    <div class="navbar-header navbar-nav">
	     &nbsp;<a class="navbar-brand" href="#"> </a>
	     &nbsp;<a class="brand" href="reception/receptionBase"><img src="bootstrap3/img/timg.jpeg" style="width: 150px;height: 50px;" /></a>
	   	 &nbsp;<a class="brand glyphicon glyphicon-book" href="${APP_PATH }/classes/findByAllClass" style="margin:7px auto auto 20px">课程</a>
	    </div>  
	    <ul class="nav navbar-nav navbar-right" >
	    <c:if test="${empty sessionScope.user }">
	      <li><a class="center-to-head" href="register" ><span class="glyphicon glyphicon-user "></span> 注册</a></li>
	      <li><a class="center-to-head" href="receptionLogin" ><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
	      <!-- <li><a href="#"><span class="glyphicon glyphicon-log-out"></span>  </a></li> -->
	    </c:if>
		   <c:if test="${ !empty sessionScope.user}">
		  <li>
		  	<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="height: 60px" >
		  		<img  id="userPictureImg" alt="" class="img-circle" src="bootstrap3/img/timg.jpeg " width="38px" height="38px"/>
		  		<span style="color: #FFFFFF;font-size: 15px">
		  			<i>username</i>
		  		</span> 
		  	</a>
		  	<div class="dropdown-menu pull-right"
                                 style="background: #FFFFFF;width: 200px;overflow: hidden">
                                <div style="margin-top: 16px;border-bottom: 1px solid #eeeeee">
                                    <div style="text-align: center">
                                        <img class="img-circle" src="bootstrap3/img/timg.jpeg" 
                                             style="width: 38px;height: 38px;"/>
                                    </div>
                                    <div style="color: #323534;text-align: center;line-height: 36px;font-size: 15px">
                                        <span>  username  </span>
                                    </div>
                                </div>
 							<a href="receptionUser">
                                <div class="row" style="margin-left: 15px;margin-right: 15px;margin-top: 10px">
                                    <div class="col-md-12 text-center grid">
                                        <i class="glyphicon glyphicon-user" style="font-size: 25px;line-height: 45px;"></i>
                                        <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                            个人中心</p>
                                    </div>
                                    <!-- <div class="col-md-4 text-center grid">
                                        <i class="fa fa-gear" style="font-size: 25px;line-height: 45px;"></i>
                                        <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                            账号管理</p>
                                    </div>
                                    <div class="col-md-4 text-center grid">
                                        <i class="fa fa-key" style="font-size: 25px;line-height: 45px;"></i>
                                        <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                            密码修改</p>
                                    </div> -->
                                </div>
 						 </a>
 						 
                                <div class="row" style="margin-left: 15px;margin-right: 15px;margin-top: 10px" id="PictureImg" onclick="choosefile()">
                                    <div class="col-md-12 text-center grid">
                                        <i class="glyphicon glyphicon-picture" style="font-size: 25px;line-height: 45px;"></i>
                                        <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                            修改头像</p>
                                            <input type="file" name="" id="pictureImg" style="display:none;"onchange="photoImgChange();" />
                                            
                                    </div>
                                    <!-- <div class="col-md-4 text-center grid">
             	                           <i class="fa fa-comments" style="font-size: 25px;line-height: 45px;"></i>
                                        <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                            消息</p>
                                    </div>
                                    <div class="col-md-4 text-center grid">
                                        <i class="fa fa-heart-o" style="font-size: 25px;line-height: 45px;"></i>
                                        <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                            帮助中心</p>
                                    </div> -->
                                </div>
                                
 								<a href="user/receptionLoginOut">
                             	  <div class="row" style="margin-top: 20px">
                                    <div class="text-center"
                                         style="padding: 15px;margin: 0px;background: #f6f5f5;color: #323534;">
                                        <i class="glyphicon glyphicon-log-out"></i> 退出登入界面
                                    </div>
                                	</div>
                                	</a>
                                	
                 </div>
		  	</li>
		  	</c:if>
	    </ul>
	  </div>
	</nav>
	
<!-- 用户头像下拉框-->
			<!--<div class="topnav dropdown-menu-right float-right">
			<div class="btn-group">
                        <div class="notifications request_section no-bg">
                            <a class="btn btn-default btn-sm messages" id="request_btn"> 
                                   <i class="fa fa-sliders" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>

		 <div class="btn-group">
                        <div class="user-settings no-bg">
                            <button type="button" class="btn btn-default no-bg micheal_btn" data-toggle="dropdown">
                                <img src="img/admin.jpg" class="admin_img2 img-thumbnail rounded-circle avatar-img"
                                     alt="avatar"> <strong>Micheal</strong>
                                <span class="fa fa-sort-down white_bg"></span>
                            </button>
                            <div class="dropdown-menu admire_admin">
                                <a class="dropdown-item title" href="#">
                                    Admire Admin</a>
                                
                                <a class="dropdown-item" href="#">
                                    <i class="fa fa-user"></i>
                                    User Status
                                </a>
                               
                                <a class="dropdown-item" href="login2.html"><i class="fa fa-sign-out"></i>
                                    Log Out</a>
                            </div>
                        </div>
                    </div>

                </div>
		</div>
		-->
	

	<!-- 搜索框开始 -->
	<!-- <div class="input-group pull-right" id="seachBtn" >
		     <input type="text" class="form-control" style="width:140px" onkeydown="onKeyDown(event)"/>
		 <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
	 </div> --><!-- 搜索框结束 -->

</div><!--导航栏结束-->

<!-- <p>输入的文本：<p/> 
<div class="main">
 <input type="text" id="wenben" /> 
 <input type="button" value="确认" class="btn" /> </div> -->
 
 
<!-- <span id="imgErrSpan" style="color:red;font-weight:normal;"></span> -->



<script type="text/javascript">
		
//此JS用于将bootstrap下拉菜单改为悬停显示,不需要点击下拉按钮(采用的是jquery)
$(function () {
      $(".dropdown").mouseover(function () {
          $(this).addClass("open");
      });

      $(".dropdown").mouseleave(function () {
          $(this).removeClass("open");
      });
  });


		/* function doUpload(){
			$('#PictureImg').click();
		} */
		//选择图片
		function photoImgChange(){
			var img = $('#pictureImg').val();
			if(oc.photoValid(img)){
				alert("修改成功!");
				oc.previewUploadImg('pictureImg','userPictureImg');
				$('#userPictureImg').show();
				$('#imgErrSpan').html(''); 
				return;
			}else{
				 var err=$('#imgErrSpan').html('&nbsp;请选择png,jpeg,jpg格式图片');
					$('#userPictureImg').val(''); 
					alert("请选择png,jpeg,jpg格式图片");
			}
		};
		
		function choosefile() {
		    var f = document.getElementById("pictureImg");
		        f.click();
		};
		

</script>
</body>

</html>