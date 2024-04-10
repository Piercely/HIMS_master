<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/base.css"/>
    <link rel="stylesheet" href="/css/info-reg.css"/>
    <title>医院住院管理系统</title>
</head>

<body>
<div class="title">
    <h2>用户更新</h2>
</div>
<form id="userForm">
    <div class="main">
        <p class="short-input ue-clear">
            <label><font color="red">*</font>账&nbsp;&nbsp;&nbsp;&nbsp;号：</label>
            <input id="accountNo" name="userId" type="text" value="${user.userId}" readonly placeholder="用户名"> <span
                id="accountError"></span>
        </p>
        <p class="short-input ue-clear">
            <label><font color="red">*</font>真实姓名：</label> <input type="text"
                                                                  id="name" value="${user.userName}" placeholder="真实姓名" name="userName"/> <span
                id="nameError"></span>
        </p>
        <p class="short-input ue-clear">
            <label><font color="red">*</font>手&nbsp;&nbsp;&nbsp;&nbsp;机：</label>
            <input type="text" id="phone" placeholder="手机" name="userPhone" value="${user.userPhone}"/><span
                id="phoneError"></span>
        </p>
        <div class="short-input select ue-clear">
            <label>权限设置：</label>
            <div class="select-wrap">
                <select name="userDescribe" style="width: 262px;color: gray" class="select-title ue-clear"
                        id="userDescribe">
                    <option value="-1">--请选择角色--</option>
                </select>
            </div>
        </div>
    </div>
    <div class="btn ue-clear">
        <a href="javascript:updateUser();" class="confirm">更新</a> <a
            href="javascript:void(0);" id="reset" class="clear">重置</a>
    </div>
</form>
</body>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/md5.js"></script>
<script type="text/javascript" src="/js/userzc.js"></script>

<script type="text/javascript">

    $(function () {
        //页面加载绑定科室下拉框
        $.getJSON("/paracode/findParacodes/005", function (result) {
            //alert(JSON.stringify(result));
            for (var i = 0; i < result.length; i++) {
                $("#userDescribe").append("<option value='" + result[i].parameterValues + "'>" + result[i].parameterName + "</option>");
            }
            //回显
            $("#userDescribe").val('${user.userDescribe}');
        });
    });

    /**
     * 更新用户(异步新增)
     */
    function updateUser() {
        //获取表单数据
        var data = $("#userForm").serialize();
        //alert(data);
        $.post("/user/update", data, function (result) {
            if (result.code == 200) {
                alert("用户更新成功");
                //页面刷新
                location.reload();
            } else{
                alert("用户更新异常");
            }
        });
    }

</script>
</html>
