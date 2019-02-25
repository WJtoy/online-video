<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="utf-8">
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<title></title>
<!-- <link rel="stylesheet" href="bootstrap3/js/bootstrap.min.css"> -->
<link rel="stylesheet" href="${APP_PATH}/bootstrap3/css/user.css" />
<!-- <script src="bootstrap3/jquery.js"></script>
<script src="bootstrap3/js/bootstrap.min.js"></script> -->
<%@include file="../common/receptions.jsp" %>



</head>
<body>
<c:import url="../common/receptop.jsp"></c:import>

<div class="row">
<div class="wrap" style="" >
	 <div class="myMenus" style="background-color:#F0F8FF;">
    	 <ul class="list" style="border-left: none;" id="myNav">
	        <li class="active" data-toggle="tab" data-target="#demo"><a href="javascript:void(0)">我的账户</a></li>
	        <li data-toggle="tab" data-target="#record"><a href="javascript:void(0)" >浏览记录</a></li>
         </ul>
   	 </div>
   	 
	 <div class="myMains">	
	 <div id="myTabContent" class="tab-content">
	 <!--  -->
		<div class="tab-pane fade" style="margin: 60px 200px auto 300px;" id="demo" > <!-- class="collapse in" -->
		<form action="user/receptionUpdate" enctype="multipart/form-data" method="post">
		 <table class="table table-bordered" style="width: 350px">
		<tr>
		<td>
			<div class="form-group clearfix" align="center"> 
				<label class="control-label" >
					<span id="imgErrSpan" style="color:red;font-weight:normal;">
					</span>
				</label> 
				<div class="col-sm-10">
							<input type="file" id="picture" name="pictureImg" style="display: none;" onchange="photoImgChange();">
					<div class="ui-avatar-box">
							
						<img id="coursePicture" style="max-width: 250px;height:120px;" src="/ssm-crud/${sessionScope.user.headimg}">
						<a href="javascript:void(0);" onclick="doUpload();" style="text-decoration: underline;margin-top:5px;">选择头像</a>
							
					</div>
				</div>
			</div>
			</td>
		</tr>
		<tr>
			<td>
			<div align="center" style="margin:0 auto;">
			<li>
				<input type="hidden" name="id" value="${sessionScope.user.id }"> 
				账号 : ${sessionScope.user.username}
			</li>
			</div>
			</li>
			</td>
		</tr>
		<tr>
				<td>
			<div align="center" style="margin:0 auto;">
			<li>
				昵称 <input type="text" name="nickname" value="${sessionScope.user.nickname }"
												class="easyui-textbox" data-options="iconCls:'icon-man'">

			</li>
			</div>
			</td>
		</tr>
		<tr>
				<td>
			<div align="center" style="margin:0 auto;">
			<li>
				邮箱 : ${sessionScope.user.email}
			</li>
			</div>
			</td>
		</tr>
		<tr>
			<td>
			<div align="center" style="margin:0 auto;">
				<li>
				<label>性别</label> 
				<select name="gender">
					<c:choose>
						<c:when test="${empty sessionScope.user.gender }">
							<option></option>
							<option value="1">男</option>
							<option value="0">女</option>
						</c:when>
						<c:when test="${sessionScope.user.gender eq 1 }">
							<option></option>
							<option value="1" selected="selected">男</option>
							<option value="0">女</option>
						</c:when>
						<c:when test="${sessionScope.user.gender eq 0 }">
							<option></option>
							<option value="1">男</option>
							<option value="0" selected="selected">女</option>
						</c:when>
					</c:choose>			
				</select>
				</li>
			</div>
			</td>
		</tr>
		<tr>
			<td>
			<div align="center" style="margin:0 auto;">
				<input type="submit" value="修改">
			</div>
			</td>
		
		</tr>	
		</table>
		</form>
	</div><!-- 我的账户部分结束 -->
	
	<!-- 浏览记录开始 -->	
	 <div class="tab-pane fade" id="record">
	  <div class="panel panel-default ai-zone-learning-records" style="">
	  <div id="ai-zone-learning-records" class="panel-body">
	  <div class="row">
	  <div class="panel panel-default">
	   <table class="table table-striped " id="table_record">
	  		<thead><tr><th>时间</th> <th>视频名称</th> <th>观看进度</th> <th></th></tr></thead> 
	   <tbody>
	  		<tr>
	  			<td>SpringMVC+Spring+MyBatis</td> 
	  			<td>第一节  框架介绍 properties  XML  读写</td>
	  			<td>
	  			<div title="进度10%" class="progress">
	  				<div role="progressbar" aria-valuenow="13" aria-valuemin="0" aria-valuemax="2532" 
	  						class="progress-bar progress-bar-success" style="width: 10%;">
	  				</div>
	  			</div>
	  			</td>
	  	 		<td><a href="/courses/14/91">继续学习</a></td>
	  	 	</tr>
	   </tbody>
	   	
	   </table>
	  </div>
	  </div>
	  </div>
	  </div>
	  </div><!-- 浏览记录结束部分 -->
	</div>
	</div>
	
</div>
</div>

<c:import url="../common/recepfoot.jsp"/>
	<script>
	
	function doUpload(){
		$('#picture').click();
	}
	//选择图片
	function photoImgChange(){
		var img = $('#picture').val();
		if(oc.photoValid(img)){
			oc.previewUploadImg('picture','coursePicture');
			$('#coursePicture').show();
			$('#imgErrSpan').html('');
			return;
		}else{
			$('#imgErrSpan').html('&nbsp;请选择png,jpeg,jpg格式图片');
			$('#coursePicture').val('');
		}
	}
	
	$("#myNav li").on('click',function() {
	    $(this).addClass('active').siblings().removeClass('active');
	})
	/* $(document).ready(function(){
	    $("#myNav").affix({
	        offset: { 
	            top: 125 
	      }
	    });
	});  */
	
	
		/* $(function () {
	        $('#myTab li:eq(1) a').tab('show');
	    }); */
	    $(function(){
			//去历史页面
			show_record();
		});
	    function show_record(){
	    $.ajax({  								
	        type : "GET",  
	        url : "${APP_PATH}/record/getRecordByUser",
	        //async: false, 
	        async: true,
	        cache: true,  
	        contentType: false,  
	        processData: false,
	        success : function(result) {
	        	console.log(result);
	        	build_record_table(result);
	        }  
		});
	    };
	    function build_record_table(result){
			//清空table表格
			$("#table_record tbody").empty();
			var records = result.extend.record;
			$.each(records,function(index,item){
				var recordidTd = $("<td></td>").append(item.id);
				var recordtimeTd = $("<td></td>").append(disposeDate(item.recordtime));
				var recordUserTd = $("<td></td>").append(item.u.nickname);
				var recordVideoTd = $("<td><a href=${APP_PATH}/play/player?id="+item.vi.id+">"+item.vi.coursename+"</a></td>");
				var recordDescribeTd = $("<td></td>").append(item.vi.recordDescribe);
				var Td = '<div title="进度10%" class="progress"><div role="progressbar" aria-valuenow="13" aria-valuemin="0" aria-valuemax="2532"class="progress-bar progress-bar-success" style="width: 10%;"></div></div>';
				$("<tr></tr>")
					.append(recordtimeTd)
					/* .append(genderTd) */
					.append(recordVideoTd)
					.append(Td)
					/* .append(recordDescribeTd) */
					.appendTo("#table_record tbody");
			});
			if(records!=""){
				$("<tr></tr>").append("<th><a href='javascript:void(0);' onclick='js_method();'>清空历史记录</a></th>")
					.appendTo("#table_record tbody");
			}
		}
	    
	    //时间转换
	    function disposeDate(dateTime) {
	    	 var time = new Date(dateTime);
	    	 var year=time.getFullYear();
	    	 var month=time.getMonth()+1;
	    	 var date=time.getDate();
	         var hours = time.getHours();
	         var minutes = time.getMinutes();
	         var seconds = time.getSeconds();
	         return year+'-'+month+'-'+date+' '+hours+':'+minutes+':'+seconds;
	      }
	   
	    //观看进度
	    $(document).ready(function(){
			
			  $("#video-active").on(
			    "timeupdate", 
			    function(event){
			      onTrackedVideoFrame(this.currentTime, this.duration);
			    });
			});
			function onTrackedVideoFrame(currentTime, duration){
			
			    $("#current").text(currentTime);
			    $("#duration").text(duration);
			    var a=currentTime/duration;
			    var b=(a*100).toFixed(0)+"%";
			    document.getElementById('hyTime').style.width=b;
			    $("#hy").text(b);
			    if(currentTime==duration){
			     $("#pro").text("(已完成)");
			    }
			}
			
			//清除历史记录
			function js_method(){
				$.ajax({  								
			        url : "${APP_PATH}/record/deleteRecord",
			        async: true,
			  /*       cache: true, */  
			     	type:"delete",
			        success : function(result) {
			        	alert(result.msg);
			        	show_record();
			        }  
				});
				
			}
	</script>
	
</body>
</html>
