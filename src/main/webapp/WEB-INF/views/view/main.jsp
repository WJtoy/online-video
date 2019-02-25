<%@page contentType="text/html; UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
	<head>
	    <meta charset="UTF-8">
		<title></title>
		
		<link href="/ssm-crud/res/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
		<link href="/ssm-crud/res/css/reset.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="/ssm-crud/res/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="/ssm-crud/res/js/bootstrap.min.js"></script>
		
		<!--[if lt IE 9]>
		  <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		
		<link rel="icon" type="image/png" href="/ssm-crud/res/i/ico.png" sizes="16x16">
		
	</head>

	<body>
		<!-- 头部-start -->
		<div class="f-header">
			<div class="f-header-box clearfix">
				<a href="#"  class="logo" title="在线视频网站"></a>
				<nav class="header-nav">
					<a href="#" class="header-nav-item">首 页</a>
					<a href="#" class="header-nav-item">课 程</a>
					<!-- <a href="#" class="header-nav-item">我的</a> -->
					<a href="#"  style="width:100px;" target="_blank" class="header-nav-item">后台</a>
				</nav>
				
				<nav class="header-nav" style="float:right">
					<a href="#myModal" class="header-nav-item"  data-toggle="modal" onclick="login();" 
					style="margin-right:0px;font-size:14px;">登录</a>
					<a href="#" class="header-nav-item"   style="margin-left:0px;font-size:14px;">注册</a>
			        <a href="#" class="header-nav-item"  style="margin-left:0px;font-size:14px;" id="userdetail">头像
			        <img id="headerUserHeader" alt="" src='/ssm-crud/res/i/ico.png' style="width: 35px;height: 35px;border-radius:50%;">
			        </a>
				</nav>
			</div>
		</div>
		<script type="text/javascript">
			function login(){
				$('#loginTitle').css('color','#337Ab7');
				$('#loginForm').show();
				$('#registeTitle').css('color','#000');
				$('#registeForm').hide();
			}
			function registe(){
				$('#loginTitle').css('color','#000');
				$('#loginForm').hide();
				$('#registeTitle').css('color','#337Ab7');
				$('#registeForm').show();
			}
			$(function(){
				$("#userdetail").popover({
		            trigger:'manual',
		            placement : 'bottom',
		            html: 'true',
		            content : '<div style="width:300px;height:300px;"></div>',
		            animation: false
		        }).on("mouseenter", function () {
		            var _this = this;
		            $(this).popover("show");
		            $(this).siblings(".popover").on("mouseleave", function () {
		                $(_this).popover('hide');
		            });
		        }).on("mouseleave", function () {
		            var _this = this;
		            setTimeout(function () {
		                if (!$(".popover:hover").length) {
		                    $(_this).popover("hide")
		                }
		            }, 0);
		        });
				//课程分类展示 
				$(".category").popover({
		            trigger:'manual',
		            placement : 'right',
		            html: 'true',
		            content : '',
		            animation: false
		        }).on("mouseenter", function () {
		            var cid = $(this).attr('c-id');
		            $('#' + cid).show();
		            $('#' + cid).hover(function(){
		            	$('#' + cid).show();
		            },function(){
		            	$('#' + cid).hide();
					});
		        }).on("mouseleave", function () {
		            var cid = $(this).attr('c-id');
		            $('#' + cid).hide();
		        });
			});
		</script>
		<!-- 头部-end -->
		
		<!-- 登录注册-start -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"  style="position:fixed; top:30%;">
		    <div class="modal-dialog" role="document">
		        <div class="modal-content">
		        
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                    <span aria-hidden="true" style="font-size:18px;">×</span>
		                </button>
		                <h4 class="modal-title"  id="loginTitle"  style="float: left; color: #337Ab7;cursor: pointer; " onclick="login();">登 录</h4>
		                <h4 class="modal-title"  id="registeTitle"  style="float: left;margin-left: 20px;cursor: pointer;" onclick="registe();">注 册</h4>
		                <div class="clearfix"></div>
		            </div>
		            
		            <div class="modal-body">
		               	<form id="loginForm" class="form-horizontal" style="padding: 0px 20px;">
		                      <div class="form-group">
		                          <input type="email" class="form-control"  id="username"  placeholder="用户名">
		                      </div>
		                      <div class="form-group help">
		                          <input type="password" class="form-control"  id="password"  placeholder="密　码">
		                      </div>
		                      <div class="form-group">
		                          <label>
		                           <input type="checkbox" value="None" id="checkbox1" name="check">
		                           <span class="text" style="color: #787D82;font-size: 14px;">下次自动登录</span>
		                          </label>
		                      </div>
		                      
		                      <a href="javascript:void(0)">
		                      	<div class="header-login-btn">登 录</div>
		                      </a>
		                  </form>
		                  
		                   <form id="registeForm" class="form-horizontal" style="padding: 0px 20px;display: none;">
		                       <div class="form-group">
		                           <input type="email" class="form-control"  id="username"  placeholder="用户名">
		                       </div>
		                       <div class="form-group help">
		                           <input type="email" class="form-control"  id="email"  placeholder="邮箱">
		                       </div>
		                       <div class="form-group help">
		                           <input type="password" class="form-control"  id="password"  placeholder="密　码">
		                       </div>
		                       <a href="javascript:void(0)">
		                      	<div class="header-login-btn">注 册</div>
		                       </a>
		                   </form>
		                  
		            </div>
					
		        </div>
		    </div>
		</div>
		<!-- 登录注册-end -->
			<!-- 轮播 分类-end -->
			
			
			
			
			
			<!-- 实战推荐-start -->
		</div>
		
		<!-- 页脚-start -->
		<div class="f-footer">
			<div class="f-footer-box clearfix">
				<div class="footer-link">
					<a href="javascript:void(0);"  target="_blank" title="企业合作">企业合作</a> 
					<a href="javascript:void(0);" target="_blank" title="联系我们">联系我们</a> 
					<a href="javascript:void(0);" target="_blank" title="常见问题">常见问题</a> 
					<a href="javascript:void(0);" target="_blank" title="意见反馈">意见反馈</a>
					<a href="javascript:void(0);" target="_blank" title="友情链接">友情链接</a>
				</div>
				<div class="footer-copyright">
					<span>©&nbsp;2018&nbsp; 备案 </span>
				</div>
			</div>
		</div>
		<!-- 页脚-end-->
		
	</body>
	
	<script>
	$(function(){
		var index = 0;
		var timer = 4000;
		$('.bg-nav a').click(function(){
			index = $('.bg-nav a').index($(this));
			rollBg(index);
		});
		$('.index-roll-item').click(function(){
			index = $('.index-roll-item').index($(this));
			rollBg(index);
		});
		var rollBg = function(i){
			$('.main-bg-item').fadeOut(1000);
			$($('.main-bg-item')[i]).fadeIn(1000);
			$('.bg-nav a').removeClass('cur');
			$($('.bg-nav a')[i]).addClass('cur');
			$('.index-roll-item').removeClass('cur');
			$($('.index-roll-item')[i]).addClass('cur');
		}
		setInterval(function(){
			index += 1;
			index = index%3;
			rollBg(index);
		}, timer);
		
	});
	</script>
</html>
