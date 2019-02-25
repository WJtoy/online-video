<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%@include file="../common/receptions.jsp"%>
</head>
<body>
	<body>
<!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top ai-navbar">
    <div class="container-fluid">
        <div class="navbar-header" style="">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/" style="padding-top: 7px">
                <img src="http://ophdr3ukd.bkt.clouddn.com/logo.png">            </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="center-to-head"><a href="/">首页</a></li>
                <li class="center-to-head"><a href="/courses">课程</a></li>
                <li class="center-to-head"><a href="/blog">博客</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>

<a target="_blank" href=""><img border="0" src="" alt="码码在线②" title="码码在线②"></a></li>
                                    <li>

                        <a class="dropdown dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                            @~
                                                            <span class="label label-default">VIP</span>
                                                        <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                            <li><a href="/zone">我的主页</a></li>
                             <li role="separator" class="divider"></li>
                            <li><a href="/auth/logout">退出登录</a></li>
                        </ul>

                    </li>
                            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>
<div class="container" style="box-shadow: 0 4px 4px 0px rgba(7,17,27,.1);margin-top: 20px">

    <div class="row" style="min-height: 250px;background-color: whitesmoke;min-height: 80px;padding-top: 15px; padding-bottom: 10px">
        <div class="col-sm-12 col-md-1">
                <span style="width: 52px;
                display: block;
                line-height: 30px;
                font-weight: 700;
                font-size: 14px;
                color: #07111b;
                text-align: right;">方向：</span>
        </div>
        <div class="col-sm-12 col-md-11">
            <ul class="nav nav-pills">

                                    <li class=""><a href="/courses/">全部</a></li>
                                                                                                        <li class="active"><a href="/courses?type=1">JAVA后端</a></li>
                        
                                                                        <li><a href="/courses?type=9">前端</a></li>
                        
                                                                        <li><a href="/courses?type=18">网站架构</a></li>
                        
                                                </ul>
        </div>
    </div>
    <div class="row" style="min-height: 250px;background-color: whitesmoke;min-height: 80px;padding-top: 15px; padding-bottom: 10px">
        <div class="col-sm-12 col-md-1">
                <span style="width: 52px;
                display: block;
                line-height: 30px;
                font-weight: 700;
                font-size: 14px;
                color: #07111b;
                text-align: right;">分类：</span>
        </div>
        <div class="col-sm-12 col-md-11">
            <ul class="nav nav-pills">
                                    <li class="">
                        <a href="/courses?type=1">全部</a>
                    </li>
                
                                                                                        <li class="active">
                                <a href="/courses?type=1&amp;subType=2">JAVA基础</a>
                            </li>
                        
                                                                        <li class="">
                                <a href="/courses?type=1&amp;subType=3">JAVAWEB</a>
                            </li>
                        
                                                                        <li class="">
                                <a href="/courses?type=1&amp;subType=4">SSM框架</a>
                            </li>
                        
                                                                        <li class="">
                                <a href="/courses?type=1&amp;subType=8">项目实战</a>
                            </li>
                        
                                                                        <li class="">
                                <a href="/courses?type=1&amp;subType=12">MySQL数据库</a>
                            </li>
                        
                                                                        <li class="">
                                <a href="/courses?type=1&amp;subType=14">数据结构</a>
                            </li>
                        
                                                                        <li class="">
                                <a href="/courses?type=1&amp;subType=15">项目工具</a>
                            </li>
                        
                                                </ul>
        </div>
    </div>
    <div class="row" style="min-height: 250px;background-color: whitesmoke;min-height: 80px;padding-top: 15px; padding-bottom: 10px">
        <div class="col-sm-12 col-md-1">
                <span style="width: 52px;
                display: block;
                line-height: 30px;
                font-weight: 700;
                font-size: 14px;
                color: #07111b;
                text-align: right;">类型：</span>
        </div>
        <div class="col-sm-12 col-md-11">
            <ul class="nav nav-pills">
                                    <li class=""><a href="/courses?type=1&amp;subType=2">全部</a></li>
                
                                    
                                                    <li>
                                <a href="/courses?type=1&amp;subType=2&amp;category=1">工具</a>
                            </li>
                        
                    
                                                    <li>
                                <a href="/courses?type=1&amp;subType=2&amp;category=3">项目实战</a>
                            </li>
                        
                    
                                                    <li>
                                <a href="/courses?type=1&amp;subType=2&amp;category=4">基础课程</a>
                            </li>
                        
                    
                                                    <li class="active">
                                <a href="/courses?type=1&amp;subType=2&amp;category=5">框架</a>
                            </li>
                        
                                                </ul>
        </div>
    </div>
</div>
<div class="container">
    <!--&lt;!&ndash;实战推荐&ndash;&gt;-->
    <div class="row" style="margin-top: 20px">
                            
    </div>
</div>
    <footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <p class="text-muted">©2017 码码在线 蜀ICP备17013207</p>
            </div>
        </div>
    </div>
</footer>    <script src="/static/jq/jquery.min.js"></script>
<script src="/static/bootstrap/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="/static/bootstrap/assets/js/ie10-viewport-bug-workaround.js"></script>
<script src="/static/js/common.min.js"></script>
<script>
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?785a71ccf7e75153f61dc939bd3bcbd5";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
<script>
    (function () {
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https') {
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else {
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
</script>
<script type="text/javascript">
    document.write('<a style="display:none!important" id="tanx-a-mm_123132078_25972090_100268369"></ a>');
    tanx_s = document.createElement("script");
    tanx_s.type = "text/javascript";
    tanx_s.charset = "gbk";
    tanx_s.id = "tanx-s-mm_123132078_25972090_100268369";
    tanx_s.async = true;
    tanx_s.src = "http://p.tanx.com/ex?i=mm_123132078_25972090_100268369";
    tanx_h = document.getElementsByTagName("head")[0];
    if (tanx_h) tanx_h.insertBefore(tanx_s, tanx_h.firstChild);
</script><a style="display:none!important" id="tanx-a-mm_123132078_25972090_100268369" data-err="{'id':'0bfbf7cf00005c243b9c566d00058efd','pid':1001}"><!-- a-->
</a></body>

</body>
</html>