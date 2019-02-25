<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../common/receptions.jsp" %>
</head>
<body>

<div class="row" style="width: 100%;">
        <div class="col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-3" style="padding-left: 0px; padding-right: 0px;    box-shadow: 0 5px 20px 0 rgba(0,34,77,.5);">
            <div class="ai-login-title" style="text-align: center;background-color: #00796b;color: white;padding-top: 10px;padding-bottom: 10px;">
                <h3>注册在线视频学习平台</h3>
                <h5>来自玩具的学习经验</h5>
            </div>
            <div class="ai-login-main">
             	<form action="/ssm-crud/email/regist" method="post" onsubmit="return submitForm();">
                    <div class="form-group has-feedback">
                        <label for="ai-login-nickname">昵称</label>
                        <input type="text" class="form-control"  onfocus="YHMonfocu()" onblur="YHMonblus()" name="nickname" id="nickname"
                        		 placeholder="昵称(长度2-20)" aria-describedby="nicknameError" value="">
                        <span id="nicknameError" class="help-block" style="color: red;"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="ai-login-account">邮箱</label>
                        <input type="email" class="form-control" onfocus="Emailonfocu()" onblur="Emailonblus()" name="email" id="email"
                         		placeholder="邮箱(例如:1227679550@qq.com)" aria-describedby="emailError" value="">
                        <span id="emailError" class="help-block" style="display: block; color: red;">${emailError}</span>
                    </div>
                    <div class="form-group has-warning">
                        <label for="ai-login-password">密码</label>
                        <input type="password" class="form-control" onfocus="MMonfocu()" onblur="MMonblus()" name="password" id="password"
                        	 placeholder="字母数字组成" aria-describedby="passError" value="">
                        <span id="passError" class="help-block" style="display: inline; color:red;"></span>
                    </div>
                    <div class="form-group has-warning">
                        <label for="ai-login-repeat-password">重复密码</label>
                        <input type="password" class="form-control" onfocus="QRMMonfocu()" onblur="QRMMonblus()" name="repeatPassword" id="confirmPassword" 
                        		placeholder="重复密码" aria-describedby="repeatPassError" value="">
                        <span id="repeatPassError" class="help-block" style="display: inline; color : red;"></span>
                    </div>
                   <!--  <div class="form-group">
                        <span id="passwordNotEqual" class="help-block" style="display: none;">两次密码不一致</span>
                    </div> -->
                    <div class="form-group">
                        <label for="ai-login-validate-code">验证码</label>
                        <div class="row">
                            <div class="col-xs-6">
                                <input type="text" class="form-control" onblur="checkRandomCode()" id ="randomCodeByInput"
                                		 name="validateCode" placeholder="验证码" >
                            </div>
                            <div class="col-xs-6">
                            	<!-- <img src="/auth/validateCode?timestemp=830" onclick="refreshCode(this);" alt="点击刷新" style="cursor: pointer"> -->
                            
                            	<label id = "codeLabel" style ="height: 25px;width:50px;background-color: rgb(200,200,200);"></label>
										&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0);"  onclick="reRandomCode();">
									<img alt="" src="backui/images/login/refresh.png">
								</a>
								<label id ="msgSpan" style="color:red;">&nbsp;(T ^ T)</label>
                            </div>
                        </div>
                       <!--  <span id="validateCodeError" class="help-block" style="display: none;">请输入4位验证码</span> -->
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-success" style="width: 100%">提交</button>
                    </div>
                </form>
                <div>
                    <a href="receptionLogin">去登录</a>
                </div>
            </div>
        </div>
    </div>

<script>
//    用户名
    function YHMonblus(){	//失去焦点
        var username=document.getElementById("nickname");
       // var reN =/^\d{6,18}$/;
        var re = /^[a-zA-Z_]{2,10}$/;
        if(username.value.trim().length==0){
            document.getElementById('nicknameError').innerText="请输入昵称";
            return false;
        }
         else if(username.value.length < 2 ||username.value.length > 10){
            console.log(username.value);
            document.getElementById('YHMerror').innerText="格式错误,长度应为2-10个字符";
        } 
        else if(!re.test(username.value)){
            document.getElementById('nicknameError').innerText="格式错误,只能包含英文字母和下划线";
            return false;
        }
        else {
            document.getElementById('nicknameError').innerText ="";
            return true;
        }
    } 
    function YHMonfocu(){		//获得焦点
            document.getElementById('nicknameError').innerText ="";
    } 
		//密码
    function MMonblus(){
          var password=document.getElementById("password");
          var re = /^(?=.*\d)(?=.*[a-zA-Z])[\da-zA-Z]{6,}$/;
          //var reg=/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/;

        if(password.value.trim().length==0){
        	document.getElementById('passError').innerText="请输入密码";
        	return false;
        }
          else if(password.value.trim().length < 6){
             document.getElementById('passError').innerText="格式错误,密码长度至少为6位";
             return false;
          }
          else if(!re.test(password.value)){
             document.getElementById('passError').innerText="格式错误,必须包含英文字母和数字";
             return false;
          } 
         else {
        	document.getElementById('passError').innerText ="";
        	return true;
         }
        return true;
}
    function MMonfocu(){
        document.getElementById('passError').innerText ="";
    }

		//确认密码
    function QRMMonblus(){
        var password=document.getElementById("password");
        var confirmPassword=document.getElementById("confirmPassword");
        if(confirmPassword.value==""){
            document.getElementById('repeatPassError').innerText="请输入确认密码";
            return false;
        }
        else if(password.value != confirmPassword.value){
            document.getElementById('repeatPassError').innerText="两次密码输入不一致";
            return false;
        }
        else {
            document.getElementById('repeatPassError').innerText ="";
            return true;
        }
    }
    function QRMMonfocu(){
        document.getElementById('repeatPassError').innerText ="";
    }

//    性别
    /* function XBonblus(){
//        var radios = document.getElementsByName("gender");
//        if(radios.checked == false){
//            document.getElementById('XBerror').innerText="请选择性别";
//        }else {
//            document.getElementById('XBerror').innerText ="";
//        }
    }
    function XBonfocu(){
//        document.getElementById('XBerror').innerText ="";
    }
 */
//    爱好
    /* function AHonblus(){
        var hobbys = document.getElementsByName("hobby");
        if(hobbys[0].checked == false&&hobbys[1].checked == false&&hobbys[2].checked == false){
            document.getElementById('AHerror').innerText="请选择爱好";
        }else {
            document.getElementById('AHerror').innerText ="";
        }
    }
    function AHonfocu(){
        document.getElementById('AHerror').innerText ="";
    } */
//    联系电话
    /* function LXDHonblus(){
        var phone=document.getElementById("phone");
        var re = /^1\d{10}$/;
        if(phone.value==""){
            document.getElementById('LXDHerror').innerText="请输入联系电话";
        }
        else if(!re.test(phone)){
            document.getElementById('LXDHerror').innerText="电话格式输入错误";
        }
        else {
            document.getElementById('LXDHerror').innerText ="";
        }
    }
    function LXDHonfocu(){
        document.getElementById('LXDHerror').innerText ="";
    } */
//    电子邮箱
    function Emailonblus(){
        var email=document.getElementById("email");
        var re= /[a-zA-Z0-9]{1,10}@[a-zA-Z0-9]{1,5}\.[a-zA-Z0-9]{1,5}/;
        if(email.value==""){
            document.getElementById('emailError').innerText="请输入电子邮箱";
            return false;
        }
        else if(!re.test(email.value)){
            document.getElementById("emailError").innerHTML="邮箱格式不正确";
            return false;
        }
        else {
            document.getElementById('emailError').innerText ="";
            return true;
        }
        return true;
    }
    function Emailonfocu(){
        document.getElementById('emailError').innerText ="";
    }
    
    var randomCodeByInput = document.getElementById("randomCodeByInput");
    var codeLabel = document.getElementById("codeLabel");
    function createRandomCode(){
        //简易验证码生成
        var str = "";
        var codeLength = 4 ;
        var code  = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
            'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
        for ( var i = 0 ; i < codeLength ; i ++){
            str += code [ Math.floor((Math.random()*62)) ].toString() ;
        }
        return str;
    }
    function checkRandomCode(){
        if(randomCodeByInput.value.length == 0){
            msgSpan.innerHTML = "验证码不能为空~(T ^ T)";
            randomCodeByInput.focus();
            return false;
        }else if(codeLabel.innerHTML.toLowerCase()
    		!= randomCodeByInput.value.toLowerCase()){
            msgSpan.innerHTML = "验证码错误~(T ^ T)";
            reRandomCode();
            randomCodeByInput.focus();
            return false;
        }
        msgSpan.innerHTML = "(≧∇≦)ﾉ&nbsp;&nbsp;点我登陆哦~";
        return true;
    }

    function reRandomCode(){
        //添加到label标签中
        codeLabel.innerHTML = createRandomCode();
    }
    
    function submitForm() {
        //提交表单时检查表单
        var isSuccess = YHMonblus()&&MMonblus()&&QRMMonblus()&&Emailonblus()&&checkRandomCode();
        if(isSuccess){ 
        	confirm("确认要注册吗");
        	msgSpan.innerHTML = "";
        }
        return isSuccess;
    }
    
</script>

</body>
</html>
