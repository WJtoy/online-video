<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>弹幕播放器</title>
    <link rel="stylesheet" href="videoJS/css/base.css">
    <style>
        .Dplayer_box{overflow:hidden;width:980px;height:456px;margin:100px auto;display:block;border-top:1px solid #e5e9ef;border-bottom:1px solid #e5e9ef;background-color:#f6f9fa}
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
        .danmuku_list li:nth-child(2):hover{color:#00a1d6}
        .danmuku_list li:nth-child(3){margin-left:5px}
    </style>
    <link rel="stylesheet" href="videoJS/css/DPlayer.min.css">
    <!-- <script src="videoJS/js/jquery.js"></script> -->
</head>
<body>
<div class="Dplayer_box">
    <div class="player_av">
        <div id="player1"></div>
    </div>

    <div class="Dplayer_danmu">
        <div class="Dplayer_watching">
            <span class="Dplayer-watching-number" title="这个数据是假的">24</span>
            人正在观看,<span class="danmuku_num">100</span>条弹幕
        </div>

        <ul class="Dplayer_list">
            <li>时间</li>
            <li>发送内容</li>
            <li>用户类型</li>
        </ul>
        <ul class="list_ovefiow">

        </ul>

    </div>
</div>

<div class="alert_back">加载中</div>
<script src="videoJS/js/DPlayer.min.js"></script>
<script>
    console.log(" %c 该项目基于Dplayer.js",'color:red')
    var dp = new DPlayer({
        element: document.getElementById('player1'),
        video: {
            url: 'videoJS/xiaoli.mp4',
            pic: 'videoJS/css/danmu.jpg'
        },
        danmaku: {
            id: 'demo',
            api: 'https://api.prprpr.me/dplayer/', 		//弹幕发送的数据保存到后台的
            addition: ['https://api.prprpr.me/dplayer/bilibili?aid=15572523']	//附加
        }
    });2
    // 弹出框
    function alert_back(text) {
        $(".alert_back").html(text).show();
        setTimeout(function () {
            $(".alert_back").fadeOut();
        },1200)
    }
    //秒转分秒
    function formatTime(seconds) {
        return [
//            parseInt(seconds / 60 / 60),
            parseInt(seconds / 60 % 60),
            parseInt(seconds % 60)
        ]
            .join(":")
            .replace(/\b(\d)\b/g, "0$1");
    }
$.ajax({
    url:"", //发送数据并插入数据库并在播放器的右侧前端显示
    success:function (data) {
        if(data.code=="1"){
            var danmaku=data.danmaku;
            var autor="农民";
            $(".danmuku_num").text(danmaku.length)
            $(danmaku).each(function (index,item) {
                if(item.type=="right"){
                }else
                {
                    autor="地主";
                };
                var oLi= `<ol class="danmuku_list" time="${item.time}">
                    <li>${item.time}</li>
                    <li title="${item.text}">${item.text} </li>
                    <li>${autor}</li>
        			</ol>`
        
                $(".list_ovefiow").append(oLi);
                autor="农民";
            })
        }else {
            alert_back("弹幕加载失败 -v-!");
        }
        $(".danmuku_list").on("click",function () {

            dp.seek( $(this).attr("time"))
        })
    }
})

</script>
</body>
</html>
