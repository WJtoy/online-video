<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%><!-- true相当于把Jquery的代码当做是EL -->
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
    <meta charset="UTF-8">
    <title>在线视频播放器</title>
    
    <style>
        .Dplayer_box{overflow:hidden;width:980px;height:456px;margin:10px auto 10px;display:block;border-top:1px solid #e5e9ef;border-bottom:1px solid #e5e9ef;background-color:#f6f9fa}
        #player1{background-size:100% 100%;margin-top:1px}
        .player_av{width:680px;height:100%;float:left;background:#000}
        .Dplayer_danmu{width:299px;float:right;height:100%}
        .Dplayer_watching{width:100%;height:60px;line-height:60px;display:inline-block;font-size:12px;color:#99a2aa;box-shadow:#ddd 0 0 5px}
        .Dplayer-watching-number{margin-left:20px;font-size:18px;font-weight:700;color:#222;padding:0}
        .Dplayer_list{width:100%;height:30px;overflow:hidden}
        .Dplayer_list li{width:60px;height:30px;float:left;color:#99a2aa;font-size:12px;text-align:center;line-height:30px}
        .Dplayer_list li:nth-child(1){width:58px!important}
        .Dplayer_list li:nth-child(2){width:136px!important}
        .list_ovefiow{width:100%;height:363px;overflow:auto}
        .danmuku_list{width:100%;height:20px;line-height:20px;text-align:left;color:#99a2aa;font-size:12px;display:block;margin:auto;overflow:auto;margin-top:5px}
        .danmuku_list li{float:left;width:60px;height:20px;white-space:nowrap;cursor:pointer}
        .danmuku_list li:nth-child(1){width:58px;margin-left:8px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}
        .danmuku_list li:nth-child(2){width:125px;margin-right:15px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}
        .danmuku_list li:nth-child(2):hover{color:#00a1d6;}
        .danmuku_list li:nth-child(3){ margin-left:20px}
        .font-size-number{margin-left:20px;font-size:15px;font-weight:100px;color:#222;padding:0}
        
        
       /*  #bull li i:first-child{background:red;}
        #bull li i:last-child{backgroound:yellow;}
        #bull li i:nth-child(2){background:yellow;}
        #bull li i:nth-child(3){background:green;} */
    </style>
    
    <%@include file="../common/receptions.jsp"%>
    <link rel="stylesheet" href="/ssm-crud/videoJS/css/base.css">
    <link rel="stylesheet" href="/ssm-crud/videoJS/css/DPlayer.min.css">
    <script src="/ssm-crud/videoJS/js/jquery.js"></script> 
    <script src="/ssm-crud/videoJS/js/DPlayer.min.js"></script>
    
</head>
<body>
<c:import url="../common/receptop.jsp"/>

<%-- <c:import url="../common/Ification.jsp"/> --%>

	<div class="row">
		<div  id="videoTitle" style="margin:100px auto auto 90px">
		</div>
	</div>

<div class="row">
		
<div class="Dplayer_box col-sm-9">
    <div class="player_av">
        <div id="player1"></div>
    </div>

    <div class="Dplayer_danmu">
        <div class="Dplayer_watching">
            <span class="Dplayer-watching-number" title="这个数据是假的">1</span>
            人正在观看,<span class="danmuku_num">0</span>条弹幕
        </div>

        <ul class="Dplayer_list ">
            <li>时间</li>
            <li>发送内容</li>
            <li>用户类型</li>
        </ul>
        <ul class="list_ovefiow">

        </ul>

    </div>
</div>

<div class="alert_back">加载中</div>



	<!-- 公告栏开始 -->
    <div class="col-sm-2">  	
		<ul id="myTab" class="nav nav-tabs" style="margin-top: 50px;">
		<h2>公告栏</h2>
		<li class="active">
			<a href="#home" data-toggle="tab">最新视频</a>
		</li>
		<li><a href="#ios" data-toggle="tab">最火视频</a></li>
		</ul>
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade in active" id="home">
			
			 <ul class="titleMessage" id="bull">
			 	
			</ul> 
		</div>
		<div class="tab-pane fade" id="ios">
			<ul class="titleMessage" id="bullBarrage">
				<!-- <li class="itemli"><i class="icoli" style="background:red;">1</i><a>震惊!java从入门到精通</a></li>
				<li class="itemli"><i class="icoli" style="background:yellow;">2</i>a</li>
				<li class="itemli"><i class="icoli" style="background:green;">3</i><a>a</a></li>
				<li class="itemli"><i class="icoli">7</i>a</li> -->
			</ul>
			</div>
		</div>
	</div> <!-- 公告栏结束  -->
</div>

<div class="row">
		<div id="videoDescribe" style="margin:10px auto 100px 20px">
		</div>
</div>




<c:import url="../common/recepfoot.jsp"/>
<script>
    console.log(" %c 该项目基于Dplayer.js",'color:red');
    $(function(){
		$.ajax({			/* 显示视频主题以及视频的描述内容 */
			url:"${APP_PATH }/play/playVideo/${idstr}",
			type:"GET",
			success:function(result){
				console.log(result);
			getBarrage(result);
			/* 传给播放器的数据 */
			build_video(result);
			
			/* 显示视频标题描述的数据 */
			show_video(result);
			}
		});
    });
    
    /* 显示视频标题描述的数据 */
    function show_video(result){
    	var videoCoursename=result.extend.playVideo.coursename;
    	var videoDescribe=result.extend.playVideo.describe;
    	$("<h2></h2>").addClass("btn btn-default btn-lg glyphicon glyphicon-sort-by-attributes col-md-8 ")
    	.append("标题: "+videoCoursename)
    	.appendTo("#videoTitle");
    	$("<p></p>").addClass("glyphicon glyphicon-arrow-up col-md-6  font-size-number")
    	.append("视频描述: "+videoDescribe)
    	.appendTo("#videoDescribe");
    }
    
    function build_video(result){
    	var videoUrl=result.extend.playVideo.url;
    	var videoId=result.extend.playVideo.id;
    	
  	  const dp = new DPlayer({
        container: document.getElementById('player1'),
        /* live: true, */
        danmaku: true,
        apiBackend: {        //id       
            read: function (endpoint, callback) {
                callback();
            },
            send: function (endpoint, danmakuData, callback) {
        			/* var form = $("#formdata"); */  
        			var da=danmakuData.text;
        			console.log(danmakuData);
        			$.ajax({  								/* 把弹幕插入对应的视频里 */
        		        type : "GET",  
        		        url : "${APP_PATH}/barrage/addBarrage?text="+da+"&vid="+videoId,
        		        /* async: false, */  
        		        cache: true,  
        		        contentType: false,  
        		        processData: false,
        		        success : function(result) {
        		         show_list_Flow(videoId);
        		        }  
        			});
                callback();
            }
        },
        video: {
            url: '${APP_PATH}/'+videoUrl,    //'${APP_PATH}/'+videoUrl
            pic: 'videoJS/img/timg2.jpeg'
        }
    });
    const danmaku = {
    	    text: 'Get a danamku via WebSocket',
    	    color: '#fff',
    	    type: 'right'
    	};
    	dp.danmaku.draw(danmaku);
    	 
  	   EG: dp.on('play',function(){
			console.log("start play video");
  	　　});
  	  EG: dp.on('pause',function(){
  	　　　　console.log("pause play video");
  	　　});
    	
    	EG: dp.on('progress',function(){
      	　　　　console.log("progress play video");
      	　　});
    	
    	EG: dp.on('timeupdate',function(){
			console.log("timeupdate play video");
    		onTrackedVideoFrame(dp.video.currentTime, dp.video.duration);
    						//获取视频当前播放时长 		  //获取视频总时长
      	　　});
    };
    
    function onTrackedVideoFrame(currentTime, duration){
	    /* $("#current").text(currentTime);
	    $("#duration").text(duration); */
	    var a=currentTime/duration;
	    var b=(a*100).toFixed(0)+"%";
	    document.getElementById('hyTime').style.width=b;
	    $("#hy").text(b);
	    if(currentTime==duration){
	     $("#pro").text("(已完成)");
	    }
	}

    
    
    /* 传给播放器的数据 */
    /* function build_video(result){
	    var videoUrl=result.extend.playVideo.url;
	    var dp = new DPlayer({
	        element: document.getElementById('player1'),
	        video: {
	            url: "${APP_PATH}/"+videoUrl ,
	            pic: 'videoJS/css/danmu.jpg'
	        },
	         danmaku: {
	            id: 'demo',						//id是附加到api后面的
	            api: 'http://localhost:8080${APP_PATH}/barrage/getBarrage', 	//弹幕发送的数据保存到后台的 https://api.prprpr.me/dplayer/
	            addition: ['http://localhost:8080${APP_PATH}/barrage/getBarrage'] 	//附加https://api.prprpr.me/dplayer/bilibili?aid=15572523
	        } 
	    });
    }; 
      */
    
    // 弹出框
    function alert_back(text) {
        $(".alert_back").html(text).show();
        setTimeout(function () {
            $(".alert_back").fadeOut();
        },1200)
    };
    //秒转分秒
    function formatTime(seconds) {
        return [
           //parseInt(seconds / 60 / 60),
            parseInt(seconds / 60 % 60),
            parseInt(seconds % 60)
        ]
            .join(":")
            .replace(/\b(\d)\b/g, "0$1");
    };
  	//弹幕、时间转换
    function disposeDate(dateTime) {
        var time = new Date(dateTime);
        var hours = time.getHours();
        var minutes = time.getMinutes();
        var seconds = time.getSeconds();
        return hours+':'+minutes+':'+seconds;
      }
    
    //
  function getBarrage(result){
	var cid=result.extend.playVideo.id;
    	$.ajax({
			async: true,
			type: "GET",
		    url:"${APP_PATH}/barrage/getBarrageVideoById/"+cid, //发送数据并搜索数据库并在播放器的右侧前端显示
		    success:function (data) {
		    	console.log(data);
		        if(data.code=="100"){
		            var danmaku=data.extend.barrage; 
		            $(".danmuku_num").text(danmaku.length);
		            $.each(data.extend.barrage,function (index,item) {
		            	var oLi='<ol class="danmuku_list" time="'+item.sendTime+'" ><li>'
						+disposeDate(item.sendTime)+'</li><li>'
		            	+item.text+'</li><li>'
		            	+item.us.nickname+'</li></ol>';
		                $(".list_ovefiow").append(oLi);
		            /* var autor="农民"; */
		                /* if(item.type=="right"){
		                }else{
		                    autor="地主";
		                }; */
		                /* autor="农民"; */
		            })
		        }else {
		            alert_back("弹幕加载失败 -v-!");
		        }
		         $(".danmuku_list").on("click",function () {
		            dp.seek( $(this).attr("time")) ;
		        }); 
		    }
		});
    }
	   //发送弹幕并显示
	  function show_list_Flow(result){
		  console.log(result);
		  $(".list_ovefiow").empty();
		  $.ajax({
				async: true,
				type: "GET",
			    url:"${APP_PATH}/barrage/getBarrageVideoById/"+result, //发送数据并搜索数据库并在播放器的右侧前端显示
			    success:function (data) {
			    	console.log(data);
			        if(data.code=="100"){
			            var danmaku=data.extend.barrage; 
			            $(".danmuku_num").text(danmaku.length);
			            $.each(data.extend.barrage,function (index,item) {//把弹幕插入对应的视频里
			            	var oLi='<ol class="danmuku_list" time="'+item.sendTime+'" ><li>'
							+disposeDate(item.sendTime)+'</li><li><marquee direction="left" onMouseOut="this.start()" onMouseOver="this.stop()">'
			            	+item.text+'</marquee></li><li>'
			            	+item.us.nickname+'</li></ol>';
			                $(".list_ovefiow").append(oLi);
	  			 		});
		           	 }
			      }
			  });
	      }
	   
	  $.ajax({	//公告栏最新视频  								 
	        type : "GET",  
	        url : "${APP_PATH}/reception/bulletinBoard",
	        //async: false, 
	        async: true,
	        cache: true,  
	        contentType: false,  
	        processData: false,
	        success : function(result) {
	         console.log(result);
	         show_bulletinBoard(result);
	        }  
		});
	
	//公告栏
	function show_bulletinBoard(result){
		var res=result.extend.bulletin;
		var htmlTd="";var html1Td="";var html2Td="";var html3Td="";
		$.each(res,function(index,item){
			if(index==0){
				html1Td='<li class="itemli"><i class="icoli" style="background:red;">'+index+'</i><a href="${APP_PATH}/play/player?id='+item.id+'">'
				+item.coursename+'</a></li>';
				}
			else if(index==1){
				html2Td='<li class="itemli"><i class="icoli" style="background:yellow;">'+index+'</i><a href="${APP_PATH}/play/player?id='+item.id+'">'
				+item.coursename+'</a></li>';
				}
			else if(index==2){
				html3Td='<li class="itemli"><i class="icoli" style="background:green;">'+index+'</i><a href="${APP_PATH}/play/player?id='+item.id+'">'
				+item.coursename+'</a></li>';}
			else {
				htmlTd += '<li class="itemli"><i class="icoli">'+index+'</i><a href="${APP_PATH}/play/player?id='+item.id+'">'
				+item.coursename+'</a></li>';} 
		
		});
		 $("#bull").html(html1Td+html2Td+html3Td+htmlTd); 
	} 
	
	//公告栏最火视频
	  $.ajax({	  								 
	        type : "GET",  
	        url : "${APP_PATH}/reception/getBarrageCount",
	        async: true,
	        cache: true,  
	        contentType: false,  
	        processData: false,
	        success : function(result) {
	        	
	         console.log(result);
	         show_bulletinCount(result);
	        }  
		});
	
	//公告栏
		function show_bulletinCount(result){
			var res=result.extend.bullCount;
			var htmlTd="";var html1Td="";var html2Td="";var html3Td="";
			$.each(res,function(index,item){
				if(index==0){
					html1Td='<li class="itemli"><i class="icoli" style="background:red;">'+index+'</i><a href="${APP_PATH}/play/player?id='+item.vid+'">'
					+item.vi.coursename+'</a></li>';
					}
				else if(index==1){
					html2Td='<li class="itemli"><i class="icoli" style="background:yellow;">'+index+'</i><a href="${APP_PATH}/play/player?id='+item.vid+'">'
					+item.vi.coursename+'</a></li>';
					}
				else if(index==2){
					html3Td='<li class="itemli"><i class="icoli" style="background:green;">'+index+'</i><a href="${APP_PATH}/play/player?id='+item.vid+'">'
					+item.vi.coursename+'</a></li>';}
				else {
					htmlTd += '<li class="itemli"><i class="icoli">'+index+'</i><a href="${APP_PATH}/play/player?id='+item.vid+'">'
					+item.vi.coursename+'</a></li>';} 
			
			});
			 $("#bullBarrage").html(html1Td+html2Td+html3Td+htmlTd); 
		} 
	
	
</script>
</body>
</html>
