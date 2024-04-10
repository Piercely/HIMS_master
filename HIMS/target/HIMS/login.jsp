<!-- localhost:8090 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta
            name="viewport"
            content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"
    />
    <title>医院住院管理系统</title>
    <link rel="stylesheet" type="text/css" href="/css/login-demo.css"/>
    <%-- css样式--%>
    <script type="text/javascript">
        //图片点击事件
        function changeCheckCode(img) {
            //拼接时间，是为了可以一直刷新验证码，也可以用其他随机数
            img.src = "/getCode?" + new Date().getTime();
        }
    </script>
</head>
<body id="body" bgcolor="#c7edcc">
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md6">
            <img
                    id="logo"
                    style="height: 90px; width: auto"
                    src="/images/logo-login.png"
            />
        </div>
    </div>
    <div class="layui-row">
        <div
                class="layui-col-md6 layui-col-md-offset6 layui-form layui-form-pane"
        >
            <form
                    action="/login"
                    method="post"
                    id="login-form"
                    style="margin: 60px 100px 100px 700px"
            >
                <div class="layui-form-item">
                    <div class="login-switch-tabs">
                        <a
                                href="javascript:void(0);"
                                target="_self"
                                class="tab tab-selected login-switch-item"
                                data-mode="1"
                                data-password="1"
                                for="login-mm"
                        >密码登录</a
                        >
                    </div>
                </div>
                <div class="layui-form-item">
                    <form action="/login" method="post">
                        <table
                                width="350"
                                border="0"
                                style="border-collapse: separate; border-spacing: 0px 10px"
                        >
                            <tr>
                                <td align="center">
                                    <label>用户名</label>
                                </td>
                                <td align="center">
                                    <input
                                            type="text"
                                            class="text"
                                            placeholder="请输入用户名"
                                            id="username"
                                            name="username"
                                            size="20px"
                                            style="
                          width: 98%;
                          height: 30px;
                          border: none;
                          outline: none;
                        "
                                    />
                                </td>
                            </tr>
                            <tr>
                                <td align="center"><label>密 码 </label></td>
                                <td align="center">
                                    <input
                                            type="password"
                                            class="text"
                                            placeholder="请输入密码"
                                            id="password"
                                            name="password"
                                            style="
                          width: 98%;
                          height: 30px;
                          border: none;
                          outline: none;
                        "
                                    />
                                </td>
                            </tr>
                            <tr>
                                <td align="center"><label>验证码</label></td>
                                <td>
                                    <input
                                            type="text"
                                            class="chctext"
                                            placeholder="请输入验证码"
                                            name="checkCode"
                                            id="Verification"
                                            style="
                          width: 70%;
                          height: 30px;
                          float: left;
                          border: none;
                          outline: none;
                        "
                                    />
                                    <img
                                            style="width: 80px"
                                            src="/getCode"
                                            id="yzmimage"
                                            align="middle"
                                            onclick="changeCheckCode(this)"
                                    />
                                </td>
                            </tr>
                        </table>

                        <span style="color: red">${requestScope.msg}</span>
                        <div>
                            <input type="submit" id="login" class="submit" value="登录"/>
                        </div>
                        <div id="pc-login" class="login-mode"></div>
                        <div class="login-bottom">
                            <span id="online-user">在线人数：28</span>
                        </div>
                    </form>
                </div>
            </form>
        </div>
    </div>
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
