<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="utf-8">
<title>在线视频学习平台</title>
	<!--菜鸟教程-->
	<!--
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.fastaticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	-->
	<!--CDN-->
	<!--
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<link href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	 --> 
	<!--轮播图 jquery.js 一定要放在bootstrapt框架的前面-->
	<%@include file="../common/receptions.jsp"%>
	
</head>
<body style="background-color:#F0F0F0;width: 1350px; overflow-x: hidden;overflow-y: scroll;" >

<c:import url="../common/receptop.jsp"/>

<!--轮播开始-->
<div style="height:50px;background-color:#F0F0F0;"></div>
<div class="row" style="background-color:#F0F0F0;">
	 <!-- <div class="col-md-1"></div> -->
	<div id="myCarousel" class="carousel slide col-md-4" style="left:13%;width:1000px;height:450px;" >
	    <!-- 轮播（Carousel）指标 -->
	    <ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	    </ol>   
	    <!-- 轮播（Carousel）项目 -->
	    <div class="carousel-inner" align="center" >
		<div  class="item active" style="background:url(img/timg.jpeg)); background-size:cover; width:1000px;height:450px;">
		    <img src="bootstrap3/img/timg.jpeg" alt="First slide" style="width:1000px;height:450px;">
		    <div class="carousel-caption"></div>
		</div>
		<div  class="item" style="background:url(img/timg.jpeg); background-size:cover; width:1000px;height:450px;">
		    <img src="bootstrap3/img/timg.jpeg"  alt="Second slide" style="width:1000px;height:450px;">
		    <div class="carousel-caption"></div>
		</div>
		<div  class="item" style="background:url(img/timg.jpeg); background-size:cover; width:1000px;height:450px;">
		    <img src="bootstrap3/img/timg.jpeg" alt="Third slide" style="width:1000px;height:450px;">
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
<div style="height:100px;background-color:#F0F0F0;"></div>	
<!-- <div class="row" > -->
	<div  class="panel panel-success" style="width:1000px;margin: 0 auto;">
		    <div class="panel-heading" align="center" style="height:70px;margin: auto;">
			<h3 class="panel-title">最新视频</h3>
		    </div>
		    
		    <div class="panel-body">
				
			<div class="row ">
			<c:forEach items="${sortTime }" var="item">
			
			<!--链接开始-->	
			<a href="play/player?id=${item.id}" class="thumbnail col-md-4" style="width:220px;height:150px; border-radius: 8px;margin:10px auto auto 17px;">
				<div class="panel panel-default" style="margin:auto; height:147px; "  >
				    <div class="panel-heading" style="height:50px;background-color: #F0FFF0" align="center">
					<h3 class="panel-title">
					    ${item.coursename}
					</h3>
				    </div>
				    <div class="panel-body" style="margin: auto;">
						<p>${item.describe}</p>
						<div  style="margin:30px auto  auto 45px">
						<fmt:formatDate value= "${item.uploadtime }" pattern="yyyy年MM月dd日 hh:mm:ss"/>
						</div>
				    </div>
				</div>
			</a><!--链接结束-->		
			</c:forEach>
		
			</div>
	    </div>
<!-- 	</div> -->

</div><!--控制面板结束-->




<!--控制面板开始-->
<div style="height:100px;background-color:#F0F0F0;"></div>	
<!-- <div class="row" > -->
	<div  class="panel panel-primary" style="width:1000px;margin: 0 auto;">
		    <div class="panel-heading" align="center" style="height:70px;margin: auto;">
			<h3 class="panel-title">基础绝世</h3>
		    </div>
		    
		    <div class="panel-body">
			
			<div class="row ">
			<c:forEach items="${baseAdvance}" var="item">
			
			<!--链接开始-->	
			<a href="play/player?id=${item.id}" class="thumbnail col-md-4" style="width:220px;height:150px; border-radius: 8px;margin:10px auto auto 17px;">
				<div class="panel panel-default" style="margin:auto; height:147px; "  >
				    <div class="panel-heading" style="height:50px;background-color: #87CEEB" align="center">
					<h3 class="panel-title">
					    ${item.coursename}
					</h3>
				    </div>
				    <div class="panel-body" style="margin: auto;">
						<p>${item.describe}</p>
						<div  style="margin:30px auto  auto 45px">
						<fmt:formatDate value= "${item.uploadtime }" pattern="yyyy年MM月dd日 hh:mm:ss"/>
						</div>
				    </div>
				</div>
			</a><!--链接结束-->	
				
			</c:forEach>
			</div>
	    </div>
<!-- 	</div> -->

</div><!--控制面板结束-->
   


<!--控制面板开始-->
<div style="height:50px;background-color:#F0F0F0;"></div>	
<div class="row">
	<div  class="panel panel-danger" style="width:1000px;margin:0 auto;">
		   <div class="panel-heading" align="center" style="height:70px;margin: auto;">
			<h3 class="panel-title">进阶超神</h3>
		    </div>
		    <div class="panel-body">
			
			
			<div class="row ">
			<c:forEach items="${videoAdvance}" var="item">
			
			<!--链接开始-->	
			<a href="play/player?id=${item.id}" class="thumbnail col-md-4" style="width:220px;height:150px; border-radius: 8px;margin:10px auto auto 17px;">
				<div class="panel panel-default" style="margin:auto; height:147px; "  >
				    <div class="panel-heading" style="height:50px;background-color: #FFE4E1" align="center">
					<h3 class="panel-title">
					    ${item.coursename}
					</h3>
				    </div>
				    <div class="panel-body" style="margin: auto;">
						<p>${item.describe}</p>
						<div  style="margin:30px auto  auto 45px">
						<fmt:formatDate value= "${item.uploadtime }" pattern="yyyy年MM月dd日 hh:mm:ss"/>
						</div>
				    </div>
				</div>
			</a><!--链接结束-->
					
			</c:forEach>
			</div>	
				
	   	</div>
	</div>

</div><!--控制面板结束-->



<!--控制面板开始-->
<div style="height:50px;background-color:#F0F0F0;"></div>	
<div class="row" >
	<div  class="panel panel-warning" style="width:1000px;margin:0 auto;">
		   <div class="panel-heading" align="center"  style="height:70px;margin: auto;">
			<h3 class="panel-title">实战巅峰</h3>
		    </div>
		    <div class="panel-body">
			
		<div class="row ">
		<c:forEach items="${videoActual}" var="item">
		
			<!--链接开始-->	
			<a href="play/player?id=${item.id}" class="thumbnail col-md-4" style="width:220px;height:150px; border-radius: 8px;margin:10px auto auto 17px;">
				<div class="panel panel-default" style="margin:auto; height:147px; "  >
				    <div class="panel-heading" style="height:50px;background-color: #FFDCB9" align="center">
					<h3 class="panel-title">
					    ${item.coursename}
					</h3>
				    </div>
				    <div class="panel-body" style="margin: auto;">
						<p>${item.describe}</p>
						<div  style="margin:30px auto  auto 45px">
						<fmt:formatDate value= "${item.uploadtime }" pattern="yyyy年MM月dd日 hh:mm:ss"/>
						</div>
				    </div>
				</div>
			</a><!--链接结束-->			
		</c:forEach>
		</div>
				
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
		
<hr style="background-color: blue;">

<%-- <%@include file="../common/recepfoot.jsp" %> --%>
<c:import url="../common/recepfoot.jsp"/>

<script type="text/javascript">
		    $(function(){
		        $("#myCarousel").carousel({
		           interval: 5000,
		            wrap: true
		      });
		    $('#myTab li:eq(1) a').tab('show');
		    });
		    /* function getfieldCategoryU() {
				$.getJSON("/reception/receptionBase", function(data) {
				var tempHtml = '';
				data.CategoryList.map(function(item, index) {
				tempHtml += '<option data-id="' + item.cateId
		    	+ '">' + item.cateName + '</option>';
				});
				$('#fieldCategoryU').html(tempHtml);
				$('#fieldCategoryU').removeAttr('disabled');
			  });
		    };
		     */
		     
</script>

</body>
</html>
