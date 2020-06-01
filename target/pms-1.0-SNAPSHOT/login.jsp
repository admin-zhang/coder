<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/30
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>逸彩人事管理系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <link rel="stylesheet" href="./css/login.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>

    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div style="background-color: red"></div>
    <%--        &lt;%&ndash;<div class="message">员工管理系统-管理登录</div>--%>
    <div id="darkbannerwrap">
        <span style="font-size: 20px;color: red"></span>
    </div>

    <form method="post" class="layui-form">
        <div class="layui-form-item">
            <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="Lay-user-login"></label>
            <input name="username" id="Lay-user-login" placeholder="用户名" type="text" lay-verify="required"
                   class="layui-input">
        </div>
        <div>
            <label class="layadmin-user-login-icon layui-icon layui-icon-password"
                   for="Lay-user-login-password"></label>
            <input name="password" id="Lay-user-login-password" lay-verify="required" placeholder="密码" type="password"
                   class="layui-input">
        </div>
        <hr class="hr15">
        <div id="slider"></div>
        <hr class="hr15"/>
        <div class="layui-form-item">
            <div class="layui-row">
                <div class="layui-col-xs7">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-vercode"
                           for="LAY-user-login-vercode"></label>
                    <input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required"
                           placeholder="图形验证码" class="layui-input">
                </div>
                <div class="layui-col-xs5">
                    <div style="margin-left: 10px;">
                        <a href="https://www.oschina.net/action/user/captcha">

                            <img src="https://www.oschina.net/action/user/captcha" class="layadmin-user-login-codeimg"
                                 id="LAY-user-get-vercode"
                                 onclick="javascript:this.src='https://www.oschina.net/action/user/captcha?tm='+Math.random()">
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-form-item" style="margin-bottom: 20px;">
            <input type="checkbox" name="remember" lay-skin="primary" title="记住密码">
            <div class="layui-unselect layui-form-checkbox" lay-skin="primary">
                <span>记住密码</span>
                <i class="layui-icon layui-icon-ok"></i>
            </div>
            <a href="forget.html" class="layadmin-user-jump-change layadmin-link" style="margin-top: 11px;">忘记密码？</a>
        </div>
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <hr class="hr15">
    </form>
    <div class="layui-trans layui-form-item layadmin-user-login-other">
        <label>社交账号登入</label>
        <a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>
        <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat"></i></a>
        <a href="javascript:;"><i class="layui-icon layui-icon-login-weibo"></i></a>
        <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
            <button data-method="notice" class="layadmin-user-jump-change layadmin-link layui-btn"
                    style="margin-left: 17px;border: 0px;margin-top: 4px;font-size: 16px;background-color: #ffffff;">
                注册帐号
            </button>
        </div>
    </div>
</div>

<script>
    //一般直接写在一个js文件中
    layui.config({
        base: '/dist/sliderVerify/'
    }).use(['sliderVerify', 'jquery', 'form'], function () {
        var sliderVerify = layui.sliderVerify,
            form = layui.form;
        var slider = sliderVerify.render({
            elem: '#slider',
            onOk: function () {//当验证通过回调
                layer.msg("滑块验证通过");
            }
        })
        //监听提交
        form.on('submit(login)', function (data) {
            if (slider.isOk()) {//用于表单验证是否已经滑动成功
                layer.msg(JSON.stringify(data.field));
            } else {
                layer.msg("请先通过滑块验证");
            }
            return false;
        });

    })
</script>

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
<!-- 底部结束 -->
</body>
</html>