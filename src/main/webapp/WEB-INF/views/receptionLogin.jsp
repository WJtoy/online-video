<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../common/receptions.jsp" %>
<link href="backui/css/login.css" rel="stylesheet"><!-- 图片样式 -->
</head>
<body onload="onLoad();">
<div class="row" style="width: 100%">
        <div class="col-lg-4 col-lg-offset-4  col-md-6 col-md-offset-3" style="padding-left: 0px; padding-right: 0px;    box-shadow: 0 5px 20px 0 rgba(0,34,77,.5);">
            <div class="ai-login-title" style="text-align: center;background-color: #00796b;color: white;padding-top: 10px;padding-bottom: 10px;">
                <h3>登录在线视频学习平台</h3>
                <h5>来自玩具的学习经验</h5>
            </div>
            <div class="ai-login-main">
              <form action="user/isActivaed" onsubmit="return submitForm();" method="post">
                    <div class="form-group has-feedback">
                        <label for="ai-login-account">账号:</label>
                        <input type="text" class="form-control" id="username" name="username" onblur="checkUsername()" placeholder="账号" >
                       <!--  <span id="emailError" class="help-block" style="display: none;">请输入正确的账号</span> -->
                    </div>
                    <div class="form-group">
                        <label for="ai-login-password">密码:</label>
                        <input type="password" class="form-control" id="password"  name="password" onblur="checkPassword()" placeholder="请填写密码">
                       <!--  <span id="passError" class="help-block" style="display: none;">字母数字组成，6-20位</span> -->
                    </div>
                    <div class="form-group">
                        <label for="ai-login-validate-code">验证码:</label>
                       
                       <!-- <img width="30" src = "backui/images/login/checkcode.png"/>&nbsp;验证码： -->
                        <!-- <div class="row"> -->
                           <!--  <div class="col-xs-6">
                                <input type="text" class="form-control" name="validateCode" id="ai-login-validate-code" placeholder="验证码" aria-describedby="validateCode" width="50%">
                            </div>
                            <div class="col-xs-6"><img src="/auth/validateCode" onclick="refreshCode(this);" alt="点击刷新" style="cursor: pointer">
                            </div> -->
                       
                       		<input class="col-sm-4 form-control" placeholder="验证码" type="text" onblur="checkRandomCode()" id ="randomCodeByInput"  style="width: 70px; height: 25px;">
							&nbsp;&nbsp;
							<!--用来显示随机数的label-->
							<label id = "codeLabel" style ="height: 25px;width:50px;background-color: rgb(200,200,200);"></label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="javascript:void(0);"  onclick="reRandomCode();">
								<img alt="" src="backui/images/login/refresh.png">
							</a>
						
                       <!--  </div> -->
                        <!-- <span id="validateCodeError" class="help-block" style="display: none;">请输入4位验证码</span> -->
                    
                   <!--   <div class="form-group"> -->
                       <!--  <div class="checkbox">
                            <label>
                                <input type="checkbox" name="remember" id="ai-login-remember ">记住我一个月
                            </label>
                        </div> -->
                       <font color = "red">
								<c:if test="${not empty msg }">
									<label id = "msgSpan">${msg}&nbsp;(T ^ T)</label>
								</c:if>
								<c:if test="${empty msg}">
									<label id = "msgSpan">(≧∇≦)ﾉ&nbsp;&nbsp;点我登陆哦~</label>
								</c:if>
							</font>
                   <!--  </div> -->
                    
                    </div>
                   
                    <div class="form-group">
                        <button type="submit" class="btn btn-success" style="width: 100%">提交</button>
                    </div>
                </form>
                <div>
                    <a style="float: left" href="/auth/forget">忘记密码</a> <a style="float: right" href="register">我要注册</a>
                </div>
            </div>

        </div>

    </div>
</body>
<!-- do -->
<script src="backui/js/validate.js"></script>
<script type="text/javascript">
    //加载验证码
    function onLoad(){
        var codeLabel =  document.getElementById("codeLabel");//加载窗口的时候加载
        codeLabel.innerHTML= createRandomCode() ;
    }
</script>
</html>