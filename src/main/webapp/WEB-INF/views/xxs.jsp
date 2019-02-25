<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en">
<head>
	
    <meta charset="UTF-8">
    <title>Dashboard-2 | Admire</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--<link rel="shortcut icon" href="img/logo1.ico"/>-->
    <!--global styles-->
    <!-- <link type="text/css" rel="stylesheet" href="../../bootstraps4/css/components.css" />
    <link type="text/css" rel="stylesheet" href="../../bootstraps4/css/custom.css" /> -->
    <!-- end of global styles-->
    <!--<link type="text/css" rel="stylesheet" href="vendors/chartist/css/chartist.min.css" />
    <link type="text/css" rel="stylesheet" href="vendors/circliful/css/jquery.circliful.css">
    	-->
    <!-- <link type="text/css" rel="stylesheet" href="../../bootstraps4/css/pages/index.css">
    <link type="text/css" rel="stylesheet" href="#" id="skin_change"/> -->
		
		
		
		
		
</head>

<body class="body">



<div class="preloader" style=" position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  z-index: 100000;
  backface-visibility: hidden;
  background: #ffffff;">
    <div class="preloader_img" style="width: 200px;
  height: 200px;
  position: absolute;
  left: 48%;
  top: 50%;
  background-position: center;
z-index: 999999">
        <img src="/ssm-crud/bootstraps4/img/loader.gif" style=" width: 50px;" alt="loading...">
    </div>
</div>
<div id="wrap">
        <!-- .navbar -->
    <div id="top">
        <nav class="navbar navbar-static-top">
            <div class="container-fluid m-0">
                <a class="navbar-brand float-left" href="index.html">
                    <h4><img src="/ssm-crud/bootstraps4/img/logo1.ico" class="admin_img" alt="logo"> ADMIRE ADMIN</h4>
                </a>
                 
            </div>
        </nav>
    </div>
	
    <!-- /#top -->

 
                    
    <div class="wrapper">
        <div id="left">
            <div class="menu_scroll">
                <div class="left_media">
                    <div class="media user-media">
                        <!--<div class="user-media-toggleHover">
                            <span class="fa fa-user"></span>
                        </div>-->
			
                        <div class="user-wrapper">

			<div class="menu">
		           <span class="toggle-left" id="menu-toggle">
		          	 <i class="fa fa-bars"></i>
		           </span>
			   <span class="link-title menu_hide">
			   </span>
	   		 </div>
				<div>
		                    <a class="user-link" href="#">
		       <img class="media-object img-thumbnail user-img rounded-circle admin_img3" alt="User Picture"
		                             src="/ssm-crud/bootstraps4/img/admin.jpg">
		                        <p class="user-info menu_hide">Welcome Micheal</p>
		                    </a>
				</div>
                        </div>
                    </div>
                    <hr/>
                </div>
                <ul id="menu">
			<li> 
				
			</li>
                    <li>
                        <a href="javascript:;">
                            <i class="fa fa-home"></i>
                            <span class="link-title menu_hide">&nbsp;个人中心</span>
                        </a>
                    </li>
                    <li >
                        <a href="javascript:;">
                            <i class="fa fa-tachometer"></i>
                            <span class="link-title menu_hide">&nbsp;浏览记录

                            </span>
                        </a>
                    </li>
                    <li> <!--class="dropdown_menu"-->
                        <a href="javascript:;">
                            <i class="fa fa-anchor"></i>
                            <span class="link-title menu_hide">&nbsp;信息修改</span>
                            <!--<span class="fa arrow menu_hide"></span>-->
                        </a>
		   </li>
		</ul>
  	</div>
	</div>

 <!-- /#content -->
    <div id="right">
        <div class="right_content">
            <div class="well-small dark m-t-15">
                <div class="row m-0">
                    <div class="col-lg-12 p-d-0">
                        <div class="skinmulti_btn" onclick="javascript:loadjscssfile('blue_black_skin.css','css')">
                            <div class="skin_blue skin_size b_t_r"></div>
                            <div class="skin_blue_border skin_shaddow skin_size b_b_r"></div>
                        </div>
                        <div class="skinmulti_btn" onclick="javascript:loadjscssfile('green_black_skin.css','css')">
                            <div class="skin_green skin_size b_t_r"></div>
                            <div class="skin_green_border skin_shaddow skin_size b_b_r"></div>
                        </div>
                        <div class="skinmulti_btn" onclick="javascript:loadjscssfile('purple_black_skin.css','css')">
                            <div class="skin_purple skin_size b_t_r"></div>
                            <div class="skin_purple_border skin_shaddow skin_size b_b_r"></div>
                        </div>
                        <div class="skinmulti_btn" onclick="javascript:loadjscssfile('orange_black_skin.css','css')">
                            <div class="skin_orange skin_size b_t_r"></div>
                            <div class="skin_orange_border skin_shaddow skin_size b_b_r"></div>
                        </div>
                        <div class="skinmulti_btn" onclick="javascript:loadjscssfile('red_black_skin.css','css')">
                            <div class="skin_red skin_size b_t_r"></div>
                            <div class="skin_red_border skin_shaddow skin_size b_b_r"></div>
                        </div>
                        <div class="skinmulti_btn" onclick="javascript:loadjscssfile('mint_black_skin.css','css')">
                            <div class="skin_mint skin_size b_t_r"></div>
                            <div class="skin_mint_border skin_shaddow skin_size b_b_r"></div>
                        </div>
                        <!--</div>-->
                        <div class="skin_btn skinsingle_btn skin_blue b_r height_40 skin_shaddow"
                             onclick="javascript:loadjscssfile('blue_skin.css','css')"></div>
                        <div class="skin_btn skinsingle_btn skin_green b_r height_40 skin_shaddow"
                             onclick="javascript:loadjscssfile('green_skin.css','css')"></div>
                        <div class="skin_btn skinsingle_btn skin_purple b_r height_40 skin_shaddow"
                             onclick="javascript:loadjscssfile('purple_skin.css','css')"></div>
                        <div class="skin_btn  skinsingle_btn skin_orange b_r height_40 skin_shaddow"
                             onclick="javascript:loadjscssfile('orange_skin.css','css')"></div>
                        <div class="skin_btn skinsingle_btn skin_red b_r height_40 skin_shaddow"
                             onclick="javascript:loadjscssfile('red_skin.css','css')"></div>
                        <div class="skin_btn skinsingle_btn skin_mint b_r height_40 skin_shaddow"
                             onclick="javascript:loadjscssfile('mint_skin.css','css')"></div>
                    </div>
                    <div class="col-lg-12 text-center m-t-15">
                        <button class="btn btn-dark button-rounded"
                                onclick="javascript:loadjscssfile('black_skin.css','css')">Dark
                        </button>
                        <button class="btn btn-secondary button-rounded default_skin"
                                onclick="javascript:loadjscssfile('default_skin.css','css')">Default
                        </button>
                    </div>
                </div>
            </div>
        </div> 
   </div>
</div>
<!-- # right side -->


<!-- /#wrap -->
<!-- global scripts-->
<!-- <script type="text/javascript" src="../../bootstraps4/js/components.js"></script>
<script type="text/javascript" src="../../bootstraps4/js/custom.js"></script>
 --><!--end of global scripts-->
<!--  plugin scripts -->
<!--
<script type="text/javascript" src="vendors/countUp.js/js/countUp.min.js"></script>
<script type="text/javascript" src="vendors/flip/js/jquery.flip.min.js"></script>
<script type="text/javascript" src="js/pluginjs/jquery.sparkline.js"></script>
<script type="text/javascript" src="vendors/chartist/js/chartist.min.js"></script>
<script type="text/javascript" src="js/pluginjs/chartist-tooltip.js"></script>
<script type="text/javascript" src="vendors/swiper/js/swiper.min.js"></script>
<script type="text/javascript" src="vendors/circliful/js/jquery.circliful.min.js"></script>
<script type="text/javascript" src="vendors/flotchart/js/jquery.flot.js" ></script>
<script type="text/javascript" src="vendors/flotchart/js/jquery.flot.resize.js"></script>
-->
<!--end of plugin scripts-->

<!--<script type="text/javascript" src="js/pages/index.js"></script>-->
</body>
<%@include file="../common/headManage.jsp"%>
</html>
