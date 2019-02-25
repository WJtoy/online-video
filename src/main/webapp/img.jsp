<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="res/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="res/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="res/js/jquery.form.js"></script>
<script type="text/javascript" src="res/js/bootstrap.min.js"></script>
<script type="text/javascript" src="res/js/highcharts-4.1.min.js"></script>
<script type="text/javascript" src="res/js/oc.min.js"></script>
<link rel="icon" type="image/png" href="res/i/ico.png" sizes="16x16">



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function doUpload(){
			$('#pictureImg').click();
		}
		//选择图片
		function photoImgChange(){
			var img = $('#pictureImg').val();
			if(oc.photoValid(img)){
				oc.previewUploadImg('pictureImg','coursePicture');
				$('#coursePicture').show();
				$('#imgErrSpan').html('');
				return;
			}else{
				$('#imgErrSpan').html('&nbsp;请选择png,jpeg,jpg格式图片');
				$('#coursePicture').val('');
			}
		}
</script>
</head>
<body>
		<form action="user/update" enctype="multipart/form-data" method="post">
			<div class="form-group clearfix"> 
				<label class="control-label" >头像 <span id="imgErrSpan" style="color:red;font-weight:normal;"></span> </label> 
					<div class="col-sm-10">
						<input type="file" id="pictureImg" name="pictureImg" style="display: none;" onchange="photoImgChange();">
						<div class="ui-avatar-box">
						<img id="coursePicture" style="max-width: 250px;height:120px;">
						<a href="javascript:void(0);" onclick="doUpload();" style="text-decoration: underline;margin-top:5px;">选择图片</a>
						</div>
				</div>
			</div>
			<input type="hidden" name="id" value="1"> 
			昵称:<input type="text" name="nickname">
			<input type="submit" value="修改">		
		</form>
			
</body>
</html>