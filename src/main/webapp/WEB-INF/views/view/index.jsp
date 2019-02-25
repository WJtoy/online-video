<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="utf-8">
	<head>
		<title>在线视频学习平台</title>
		<link href="/ssm-crud/res/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
		<link href="/ssm-crud/res/css/reset.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="/ssm-crud/res/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="/ssm-crud/res/js/jquery.form.js"></script>
		<script type="text/javascript" src="/ssm-crud/res/js/bootstrap.min.js"></script>
		<link rel="icon" type="image/png" href="/ssm-crud/res/i/ico.png" sizes="16x16">
		<!-- <#include "../../../common/res.jsp"> -->
	</head>

	<body>
		<!-- <#include "./common/header.jsp"> -->
		
		<div class="f-main">
			<!-- 轮播 分类-start -->
			<div class="clearfix">
				<div class=main-category>
					
					<!-- 轮播区-start -->
					<div class="main-bg">
						<!-- <#if carouselList?? && carouselList?size gt 0>
						<#list carouselList as item> -->
						<a href="<%-- ${item.url!''} --%>">
							<div class="main-bg-item"  style='background-image: url(""); '></div>
						</a>
						<!-- </#list>
						</#if> -->
					</div>
					<div class="f-nav-box">
						<div class="bg-nav">
							<!-- <#if carouselList?? && carouselList?size gt 0>
							<#list carouselList as item>
								<#if item_index == 0> -->
								<a class="cur"></a> 
<!-- 								<#else> -->
								<a></a> 
								<!-- </#if>
							</#list>
							</#if> -->
						</div>
					</div>
					<!-- 轮播区-end -->
					
					<!-- 分类区-start -->
					<!-- 一级分类 -->
					<div class="main-category-menu">
						<!-- <#if classifys??>
						<#list classifys as item>
						<#if item_index lt 6>
						 --><div class="category" c-id="<%-- classify_${item.id!} --%>">
							<a href=""><div class="group">      </div></a>
						</div>
						<!-- </#if>
						</#list>
						</#if> -->
					</div>
					<!-- 二级分类 -->
					<!-- <#if classifys??>
					<#list classifys as item>
					<#if item_index lt 6>
					 --><div class="main-category-submenu-content"  id="classify_" >
						<div class="clearfix" >
							<div class="submenu-title clearfix">分类目录</div>
							<!-- <#if item.subClassifyList??>
							<#list item.subClassifyList as subItem>
							 -->	<a class="submenu-item" href=""></a>
								<!-- <#if subItem_index lt (item.subClassifyList?size - 1)> -->
								<a class="submenu-item">/</a>
								<!-- </#if>
							</#list>
							</#if> -->
						</div>
						
						<div class="clearfix" >
							<div class="submenu-title" style="margin-top: 30px;">课程推荐</div>
							<div>
								<!-- <#if item.recomdCourseList?? && item.recomdCourseList?size gt 0 >
								<#list item.recomdCourseList as item>
								 --><a href="" class="mt-10" title=""><li class="ellipsis oc-color-hover">➤</li></a>
<!-- 								</#list>
								</#if> -->
							</div>
						</div>
					</div>
					<!-- </#if>
					</#list>
					</#if> -->
					<!-- 分类区-end -->
					
				</div>
			</div>
			<!-- 轮播 分类-end -->
	
<!-- 	<#include "./common/footer.html"> -->
	</body>

	<script type="text/javascript">
	
	$(function(){
		//轮播效果 -start
		/* <#if carouselList?? && carouselList?size gt 0> */
		var size = Number(' ');
		/* <#else> */
		var size = 0;
		/* </#if> */
		
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
			index = index%size;
			rollBg(index);
		}, timer);
		//轮播效果 -end
		
		//课程分类展示-start
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
		//课程分类展示-end
		
	});
	</script>
	
</html>
