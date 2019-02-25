<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@include file="../common/head2.jsp"%><!--　静态引入文件内不允许有相同的变量  -->
<%-- <jsp:include page="../common/head2.jsp"/><!-- 动作引入 --> --%>

 <c:import url="../common/head3.jsp"/><!-- jstl引入 -->

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
		<div style="margin: 60px 200px auto 300px;">
		<form action="user/update" enctype="multipart/form-data" method="post">
		 <table class="table table-bordered" style="width: 350px">
		<tr>
		<td>
			<div class="form-group clearfix" align="center"> 
				<label class="control-label" >
					<span id="imgErrSpan" style="color:red;font-weight:normal;">
					</span>
				 </label> 
					<div class="col-sm-10">
							<input type="file" id="pictureImg" name="pictureImg" style="display: none;" onchange="photoImgChange();">
						<div class="ui-avatar-box">
							
								<img id="coursePicture" style="max-width: 250px;height:120px;" src="/ssm-crud/${sessionScope.admin.headimg}">
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
				<input type="hidden" name="id" value="${sessionScope.admin.id }"> 
				账号 : ${sessionScope.admin.username}
			</li>
			</div>
			</li>
			</td>
		</tr>
		<tr>
				<td>
			<div align="center" style="margin:0 auto;">
			<li>
				昵称 <input type="text" name="nickname" value="${sessionScope.admin.nickname }"
												class="easyui-textbox" data-options="iconCls:'icon-man'">
			</li>
			</div>
			</td>
		</tr>
		<tr>
				<td>
			<div align="center" style="margin:0 auto;">
			<li>
				邮箱 : ${sessionScope.admin.email}
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
						<c:when test="${empty sessionScope.admin.gender }">
							<option></option>
							<option value="1">男</option>
							<option value="0">女</option>
						</c:when>
						<c:when test="${sessionScope.admin.gender eq 1 }">
							<option></option>
							<option value="1" selected="selected">男</option>
							<option value="0">女</option>
						</c:when>
						<c:when test="${sessionScope.admin.gender eq 0 }">
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
	</div>
</body>
</html>