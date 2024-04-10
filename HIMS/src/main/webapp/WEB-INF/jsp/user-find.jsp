<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/base.css"/>
    <link rel="stylesheet" href="/css/info-mgt.css"/>
    <link rel="stylesheet" type="text/css" href="/css/jquery.dialog.css"/>

    <title>医院住院管理系统</title>
</head>

<body>
<div class="title">
    <h2>用户查询</h2>
</div>
<input style="display: none;" type="text" id="des"/>
<form id="userForm" action="/user/find" method="post">
 <div class="query">
    <div class="query-conditions ue-clear">
        <div class="conditions name ue-clear">
            <label>用户类型：</label>
            <div class="select-wrap" id="usertype">
                <select name="userDescribe" style="width: 262px;color: gray" class="select-title ue-clear"
                        id="userDescribe">
                    <option value="-1">--请选择角色--</option>
                </select>
            </div>
        </div>
        <div class="conditions staff ue-clear">
            <label>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</label> <input name="userId" value="${userVo.userId}"
                                                                          type="text" id="id"/>
        </div>
        <div class="conditions time ue-clear">
            <label>注册时间：</label>
            <div class="time-select">
                <input type="date" name="workingStartTime" id="startTime" placeholder="开始时间" value="${userVo.workingStartTime}"/>
            </div>
            <span class="line">-</span>
            <div class="time-select">
                <input type="date" id="endTime" name="workingEndTime" placeholder="结束时间" value="${userVo.workingEndTime}"/>
            </div>
        </div>
        <div class="conditions staff ue-clear">
            <label>真实姓名：</label> <input type="text" value="${userVo.userName}" name="userName" id="username"/>
        </div>
    </div>
    <div class="query-btn ue-clear">
        <a href="javascript:findUsers();" class="confirm">查询</a> <a
            href="javascript:void(0);" id="reset" class="clear">清空条件</a>
    </div>
</div>
</form>
<div class="table-box">
    <table id="showList">
        <thead>
        <tr>
            <th class="num">序号</th>
            <th class="name">账号</th>
            <th class="process">真实姓名</th>
            <th class="node">用户类型</th>
            <th class="node">电话号码</th>
            <th class="time">注册时间</th>
            <th class="name">编辑</th>
        </tr>
        </thead>
        <tbody id="show">
            <c:forEach items="${pageUtils.records}" var="user" varStatus="sta">
                <tr ${(sta.index+1)%2==0?'style="background: #E8F1F7"':'style="background: #fff"'}>
                    <td class="num">${sta.index+1}</td>
                    <td class="name">${user.userId}</td>
                    <td class="process">${user.userName}</td>
                    <td class="node">${user.shenfenName}</td>
                    <td class="node">${user.userPhone}</td>
                    <td class="time">${user.createTime}</td>
                    <td class="name"><a href="javascript:deleteUser('${user.userId}');">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
                            href="/user/toupdate/${user.userId}">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
                            href="javascript:resetPassword('${user.userId}');">重置密码</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!--分页HTML-->
<div class="pagination ue-clear" id="showbuttom">
    <div class="pagin-list">
        <c:if test="${pageUtils.pageIndex==1}">
            <span class="current prev">&lt;&nbsp;上一页</span>
        </c:if>
        <c:if test="${pageUtils.pageIndex>1}">
            <span class="current" onclick="goPage(${pageUtils.pageIndex-1});">&lt;&nbsp;上一页</span>
        </c:if>

        <c:forEach items="${pageUtils.numbers}" var="num">
            <c:if test="${pageUtils.pageIndex==num}">
                <span class="current">${num}</span>
            </c:if>
            <c:if test="${pageUtils.pageIndex!=num}">
                <span class="current prev" onclick="goPage(${num});">${num}</span>
            </c:if>
        </c:forEach>

        <c:if test="${pageUtils.pageIndex<pageUtils.pageCount}">
            <span class="current" onclick="goPage(${pageUtils.pageIndex+1});">下一页&nbsp;&gt;</span>
        </c:if>
        <c:if test="${pageUtils.pageIndex>=pageUtils.pageCount}">
            <span class="current next">下一页&nbsp;&gt;</span>
        </c:if>
    </div>
    <div class="pxofy">当前第&nbsp;${pageUtils.pageIndex}&nbsp;页&nbsp;&nbsp;共${pageUtils.pageCount}页&nbsp;&nbsp;共&nbsp;${pageUtils.totalCount}&nbsp;条记录</div>
</div>
<!--分页HTML-->

</body>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/core.js"></script>
<script type="text/javascript" src="/js/jquery.dialog.js"></script>
<script type="text/javascript" src="/js/jquery.pagination.js"></script>
<script type="text/javascript" src="/js/userfind.js"></script>
<script type="text/javascript">
    $(function () {
        //页面加载绑定科室下拉框
        $.getJSON("/paracode/findParacodes/005", function (result) {
            //alert(JSON.stringify(result));
            for (var i = 0; i < result.length; i++) {
                $("#userDescribe").append("<option value='" + result[i].parameterValues + "'>" + result[i].parameterName + "</option>");
            }
        });
        //回显
        $("#userDescribe").val('${userVo.userDescribe}');
    });

    //查询
    function findUsers(){
        $("#userForm").submit();
    }

    function goPage(pageIndex){
        $("#userForm").attr("action","/user/find?pageIndex="+pageIndex);
        $("#userForm").submit();
    }

    //根据ID删除
    function deleteUser(id){
        if(confirm("确定删除用户嘛???")){
            $.post("/user/delete",{"id":id,"_method":"delete"},function (result){
                if(result.code==200){
                    alert("用户删除成功");
                    window.location.reload();
                }else{
                    alert("用户删除异常");
                }
            },"json");
        }
    }

    function resetPassword(userId){
        if(confirm("确定重置该用户密码嘛??")){
            $.post("/user/resetPassword",{"userId":userId,"_method":"put"},function (result){
                if(result.code==200){
                    alert("密码重置成功");
                }else{
                    alert("密码重置异常");
                }
            },"json");
        }
    }
</script>
</html>
