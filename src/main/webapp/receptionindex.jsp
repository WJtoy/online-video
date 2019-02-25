<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="utf-8">
<title></title>
	<!--菜鸟教程-->
	<!--
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	-->
	<!--CDN-->
	<!--
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<link href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	 --> 
	<!--轮播图 jquery.js 一定要放在bootstrapt框架的前面-->
	<script src="bootstrap3/jquery.js"></script>
	<link rel="stylesheet" href="bootstrap3/js/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>
	<script src="bootstrap3/js/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="bootstrap3/css/mycss.css">
	
</head>
<body style="background-color: #FCFCFC;width: 1350px; overflow-x: hidden;overflow-y: scroll;" >

<!--导航栏开始-->
 <div id="header">
	<nav class="navbar navbar-default" role="navigation" style="opacity: 1;">
	  <div class="container-fluid">
	    <div class="navbar-header">
	     &nbsp;<a class="navbar-brand" href="#"> </a>
	     &nbsp;<a class="brand" href="index.html"><img src="bootstrap3/img/timg.jpeg" style="width: 214px;height: 50px;" /></a>
	    </div>  
	    <ul class="nav navbar-nav navbar-right">
	      <li><a href="#"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
	      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
	      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span>  </a></li>
		
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
	<div class="input-group pull-right" id="seachBtn" >
		     <input type="text" class="form-control" style="width:140px" onkeydown="onKeyDown(event)"/>
		 <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
	 </div><!-- 搜索框结束 -->

</div><!--导航栏结束-->


<!--轮播开始-->
<div style="height:50px;background-color:#FCFCFC;"></div>
<div class="row" style="background-color:#FCFCFC;">
	<div class="col-md-1"></div>
	<div id="myCarousel" class="carousel slide col-md-4" style="left:15%;width:700px;height:300px;" >
	    <!-- 轮播（Carousel）指标 -->
	    <ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	    </ol>   
	    <!-- 轮播（Carousel）项目 -->
	    <div class="carousel-inner" align="center" >
		<div  class="item active" style="background:url(img/timg.jpeg)); background-size:cover; width:650px;height:350px;">
		    <img src="bootstrap3/img/timg.jpeg" alt="First slide" style="width:650px;height:350px;">
		    <div class="carousel-caption"></div>
		</div>
		<div  class="item" style="background:url(img/timg.jpeg); background-size:cover;width:650px;height:350px;">
		    <img src="bootstrap3/img/timg.jpeg"  alt="Second slide" style="width:650px;height:350px;">
		    <div class="carousel-caption"></div>
		</div>
		<div  class="item" style="background:url(img/timg.jpeg); background-size:cover;width:650px;height:350px;">
		    <img src="bootstrap3/img/timg.jpeg" alt="Third slide" style="width:650px;height:350px;">
		    <div class="carousel-caption"></div>
		</div>
	    </div>
	    <!-- 轮播（Carousel）导航 -->
	    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	    </a>
	</div>
</div><!--轮播结束-->



<!--控制面板开始-->
<div style="height:100px;background-color:#FCFCFC;"></div>	
<div class="row" >
	<div  class="panel panel-primary" style="width:1000px;margin: 0 auto;">
		    <div class="panel-heading" align="center" style="height:70px;margin: auto;">
			<h3 class="panel-title">面板标题</h3>
		    </div>
		    <div class="panel-body">
			
			<!--链接开始-->
			<a href="#" class="thumbnail" style="border-radius: 8px;width:202px;height:112px;">
				<div class="panel panel-default" style="width:200px;">
				    <div class="panel-heading">
					<h3 class="panel-title">
					    带有 title 的面板标题
					</h3>
				    </div>
				    <div class="panel-body" style="height:70px;margin: auto;">
					内容
				    </div>
				</div>
			</a><!--链接结束-->
				
				
	    </div>
	</div>

</div><!--控制面板结束-->
   


<!--控制面板开始-->
<div style="height:50px;background-color:#FCFCFC;"></div>	
<div class="row">
	<div  class="panel panel-danger" style="width:1000px;margin:0 auto;">
		   <div class="panel-heading" align="center" style="height:70px;margin: auto;">
			<h3 class="panel-title">面板标题</h3>
		    </div>
		    <div class="panel-body">
			
			<!--链接开始-->
			<a href="#" class="thumbnail" style="border-radius: 8px;width:202px;height:112px;">
				<div class="panel panel-default" style="width:200px;">
				    <div class="panel-heading">
					<h3 class="panel-title">
					    带有 title 的面板标题
					</h3>
				    </div>
				    <div class="panel-body" style="height:70px;margin: auto;">
					内容
				    </div>
				</div>
			</a><!--链接结束-->	
				
				
	   	</div>
	</div>

</div><!--控制面板结束-->



<!--控制面板开始-->
<div style="height:50px;background-color:#FCFCFC;"></div>	
<div class="row" >
	<div  class="panel panel-warning" style="width:1000px;margin:0 auto;">
		   <div class="panel-heading" align="center"  style="height:70px;margin: auto;">
			<h3 class="panel-title">面板标题</h3>
		    </div>
		    <div class="panel-body">
			
		<!--链接开始-->	
		<a href="#" class="thumbnail" style="border-radius: 8px;width:202px;height:112px;">
			<div class="panel panel-default" style="width:200px;">
			    <div class="panel-heading">
				<h3 class="panel-title">
				    带有 title 的面板标题
				</h3>
			    </div>
			    <div class="panel-body" style="height:70px;margin: auto;">
				内容
			    </div>
			</div>
		</a><!--链接结束-->			

				
	   		</div>
	</div>

</div><!--控制面板结束-->
				
			
   

    


	<!--
    <div class="col-md-2">  	
		<ul id="myTab" class="nav nav-tabs" style="margin-top: 1px;">
		<li><h3>公告栏</h3></li>
		<li class="active">
			<a href="#home" data-toggle="tab">系统公告</a>
		</li>
		<li><a href="#ios" data-toggle="tab">活动公告</a></li>
		</ul>
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade in active" id="home">
			<ul class="titleMessage">
				<li class="itemli"><i class="icoli">1</i><a>震惊！java从入门到精通 只卖</a></li>
				<li class="itemli"><i class="icoli">2</i>a</li>
				<li class="itemli"><i class="icoli">3</i><a>a</a></li>
				<li class="itemli"><i class="icoli">4</i>a</li>
				<li class="itemli"><i class="icoli">5</i>a</li>
				<li class="itemli"><i class="icoli">6</i>a</li>
				<li class="itemli"><i class="icoli">7</i>a</li>
			</ul>
		</div>
		<div class="tab-pane fade" id="ios">
			<ul class="titleMessage">
				<li class="itemli"><i class="icoli">1</i><a>1</a></li>
				<li class="itemli"><i class="icoli">2</i>!</li>
				<li class="itemli"><i class="icoli">3</i><a>!</a></li>
				<li class="itemli"><i class="icoli">4</i>!</li>
				<li class="itemli"><i class="icoli">5</i>!</li>
				<li class="itemli"><i class="icoli">6</i>!</li>
				<li class="itemli"><i class="icoli">7</i>!</li>
			</ul>
		</div>
	</div>
    	-->
 
<!--
<div style="height:50px;"></div>
    <div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-8" >
    <div class="panel">
      <div class="panel-body">
    <img src="img/timg.jpeg" class="imgLs"/> 
    <h3 class="blogtitle"> 运动场地</h3>
    <p class="ptitle">暂无简介</p>
      </div>
    </div>
     <div class="panel">
      <div class="panel-body">
              这是一个基本的面板
      </div>
    </div>
    </div>
    </div>
-->


		
<hr/>

<!--页尾开始-->
<div class="jumbotron text-center" style="margin-bottom:0;margin-top:20px;">
	  <p>
			
			<!--文本开始-->
			<div class="container">
				<div class="row clearfix">
					<div class="col-md-8 column">
				<h3>
					视频在线,欢迎各位点播!
				</h3>
				Video Online, Welcome to VOD! 
				<p>
					 <a class="btn" href="#">置顶 »</a>
				</p>
			</div>
			
			<!--<div class="col-md-4 column">
			</div>-->			
			</div>
			<div class="row clearfix">
				@玩具备案;粤S在线视频学习平台!
			</div>
			</div><!--文本结束-->	
			

	</p>
</div><!--页尾结束-->


<script type="text/javascript">
    $(function(){
        $("#myCarousel").carousel({
           interval: 5000,
            wrap: true
      });
    $('#myTab li:eq(1) a').tab('show');
    })
</script>

</body>
</html>
