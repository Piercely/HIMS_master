<%@ page language="java" contentType="text/html; utf-8" isELIgnored="false"
         pageEncoding="utf-8" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, minimum-scale=0.5, maximum-scale=1.0, user-scalable=yes"/>

    <title>医院住院管理系统</title>
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/font-awesome.css">
    <link rel="stylesheet" href="/css/font-icon-style.css">
    <link rel="stylesheet" href="/css/style.default.css"
          id="theme-stylesheet">
    <link rel="stylesheet" href="/css/card.css">
    <link rel="stylesheet" href="/css/topstyle.css">
    <link rel="stylesheet" href="/css/form.css">
    <script type="text/javascript">
		function logout(){
		    if(confirm("确定要退出系统?")){
                var logoutForm= document.getElementById("logoutForm");
                logoutForm.submit();
            }
		}
    </script>
</head>

<body>

<form action="/logout" id="logoutForm" method="post">

</form>

<!--顶栏-->
<header class="header">
    <nav class="navbar navbar-expand-lg ">
        <div class="container-fluid ">
            <!-- 左上标题 -->
            <div class="navbar-header">
                <a href="#" class="navbar-brand">医院住院管理系统</a> <a
                    id="toggle-btn" href="#" class="menu-btn active"> <span></span>
                <span></span> <span></span>
            </a>
            </div>
            <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                <!-- 右上最大化按钮-->
                <li class="nav-item d-flex align-items-center full_scr_exp"><a
                        class="nav-link" href="#"><img src="images/Max.png"
                                                       onclick="toggleFullScreen(document.body)" class="img-fluid"
                                                       alt=""></a></li>
                <!-- 右上角头像-->
                <li class="nav-item dropdown"><a id="profile"
                                                 class="nav-link logout" data-target="#" href="#"
                                                 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img
                        src="images/userface.png" alt="..."
                        class="img-fluid rounded-circle"
                        style="height: 30px; width: 30px;"></a>
                    <ul aria-labelledby="profile" class="dropdown-menu profile">
                        <li>
                            <div rel="nofollow" class="dropdown-item d-flex">
                                <div class="msg-profile">
                                    <img src="images/userface.png" alt="..."
                                         class="img-fluid rounded-circle">
                                </div>
                                <div class="msg-body">
                                    <h3 class="h5"><security:authentication property="name"/></h3>
                                    <span id="gangwei">${sessionScope.loginRole.roleName}</span>
                                </div>
                            </div>
                            <hr>
                        </li>

                        <li><a rel="nofollow" class="dropdown-item"
                               href="Reset_pwd.jsp" target="iframe"><i class="fa fa-cog"></i>修改密码</a>
                            <hr>
                        </li>

                        <li><a rel="nofollow" class="dropdown-item" href="javascript:logout();">
                            <i class="fa fa-power-off"></i>退出系统</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>

<!--侧栏-->
<div class="page-content d-flex align-items-stretch" id="sidebar">
    <nav class="side-navbar">
        <!--边栏系统时间-->
        <hr>
        <div class="sidebar-header d-flex align-items-center">
            <div class="title">
                <h1 class="h4" id="nowTime"></h1>
            </div>
        </div>
        <hr>
        <ul class="list-unstyled">
            <c:forEach items="${sessionScope.permissionList}" var="p1" varStatus="sta">
                <li id="${p1.liId}" style="display: block;">
                    <c:if test="${p1.parentId==0}">
                        <a href="#${sta.index+1}" aria-expanded="false" data-toggle="collapse"><i class="${p1.iocn}"></i>${p1.title}</a>
                    </c:if>
                    <ul id="${sta.index+1}" class="collapse list-unstyled">
                        <c:forEach items="${sessionScope.permissionList}" var="p2">
                            <c:if test="${p1.id==p2.parentId}">
                                <li><a href="${p2.url}" target="iframe" id="rydj" style="display: block;">${p2.title}</a></li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </li>
            </c:forEach>
        </ul>
    </nav>

    <!-- 主内容显示区域 -->
    <div class="content-inner form-cont">
        <iframe id="iframe" name="iframe" src="/to_welcome" width=100%
                height=850pixels frameborder="0"></iframe>
    </div>

</div>

</body>

<!--Global Javascript -->
<script type="text/javascript" src="/js/echarts.js"></script>
<script src="/js/jquery-3.3.1.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/tether.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.cookie.js"></script>
<script src="/js/jquery.validate.min.js"></script>
<script src="/js/chart.min.js"></script>
<script src="/js/front.js"></script>

<!--  <script type="text/javascript" src="js/index.js"></script>-->
<script type="text/javascript" src="/js/Exit_Sys.js"></script>
<script type="text/javascript" src="/js/cookie_util.js"></script>
<script type="text/javascript" src="/js/user.js"></script>

<script type="text/javascript">

    function showTime() {
        var d = new Date();
        var year = d.getFullYear();
        var month = d.getMonth() + 1;
        var day = d.getDate();
        var hour = d.getHours();
        var minute = d.getMinutes();
        var sec = d.getSeconds();
        var time = year + "年" + month + "月" + day + "日 " + hour + ":" + minute + ":" + sec;
        $("#nowTime").text(time);
    }

    $(function () {
        showTime();
        window.setInterval("showTime()", 1000);
    });

</script>

</html>