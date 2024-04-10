<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>医院住院管理系统</title>
    <link rel="shortcut icon" href="/images/favicon.ico">
    <link  rel="stylesheet" type="text/css" href="/css/login-main.css"/>
    <script type="text/javascript">
        //图片点击事件
        function changeCheckCode(img) {
            //拼接时间，是为了可以一直刷新验证码，也可以用其他随机数
            img.src="/getCode?"+new Date().getTime();
        }
    </script>
</head>
<body id="body">
<div class="login">
    <div class="box png">
        <div class="logo png"></div>
        <div class="input">
            <div class="log">
                <form action="/login" method="post">
                    <div class="name">
                        <label>用户名</label><input type="text" class="text"
                                                 placeholder="用户名" id="username" name="username" size="20px"/>
                    </div>


                    <div class="pwd">
                        <label>密 码</label><input type="password" class="text"
                                                 placeholder="密码" id="password" name="password"/>
                    </div>

                    <div class="chc" id="yzm">
                        <label>验证码</label><input type="text" class="chctext" placeholder="验证码" name="checkCode" id="Verification"/>
                        <img style="width:80px" src="/getCode" id="yzmimage" align="middle" onclick="changeCheckCode(this)" />
                    </div>
                    <span style="color: red">${requestScope.msg}</span>
                    <div>
                        <input type="submit" id="login" class="submit" value="登录">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="air-balloon ab-1 png"></div>
    <div class="air-balloon ab-2 png"></div>
    <div class="footer"></div>
</div>
<script type="text/javascript" src="/js/jQuery_airball.js"></script>
<script type="text/javascript" src="/js/fun.base.js"></script>
<script type="text/javascript" src="/js/script.js"></script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/md5.js"></script>
<%--<script type="text/javascript" src="js/login.js"></script>--%>
<script type="text/javascript" src="/js/common.js"></script>

<div
        style="text-align: center; margin: 400px 0; font: normal 14px/24px 'MicroSoft YaHei';">
    <p>
        版权所有 © 蓝精灵科技&nbsp
        地址:吉林省长春市宽城区北湖XXXA座B区&nbsp
        Copyrigth © 2023-2026
        &nbsp;&nbsp;
    </p>
</div>
</body>
</html>
