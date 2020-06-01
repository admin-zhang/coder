<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/1
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="./lib/layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">


    <button data-method="notice" class="layui-btn">示范一个公告层</button>

</div>
<!-- 示例-970 -->


<script src="./lib/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('layer', function(){ //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
        //触发事件
        var active = {
            notice: function(){
                //示范一个公告层
                layer.open({
                    type: 1
                    ,title: "协议声明" //不显示标题栏
                    ,closeBtn: 1
                    ,area: ['1200px', '600px']
                    ,shade: 0.8
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['同意', '不同意']
                    ,btnAlign: 'c'
                    ,resize: false
                    ,scrollbar: false
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: '<div>' +
                        '《小米商城用户协议》、《小米商城隐私政策》、《小米帐号用户协议》、《小米帐号隐私政策》请您仔细阅读以上协议，其中有对您权利义务的特别约定等重要条款，同意后方可使用本软件' +
                        '</div style="width:100%">' +
                        '<div>' +
                        '<iframe src="https://www.baidu.com/" scrolling="no" style="width:1200px;height:500px">' +
                        '</iframe></div>'
                    ,success: function(layero){
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').attr({
                            href: 'http://www.layui.com/'
                            ,target: '_blank'
                        });
                    }
                });
            }
        };
        $('#layerDemo .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    });
</script>

</body>
</html>
