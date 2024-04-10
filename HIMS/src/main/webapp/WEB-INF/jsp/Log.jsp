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
    <h2>运行日志</h2>
</div>
<input style="display: none;" type="text" id="des"/>
<form action="/log/find" method="post" id="logForm">
    <div class="query">
        <div class="query-conditions ue-clear">
            <div class="conditions name ue-clear">
                <label>事件类型：</label>
                <div class="select-wrap" id="eventtype">
                    <select name="type" style="width: 262px;color: gray" class="select-title ue-clear">
                        <option value="-1" ${requestScope.logVo.type=='-1'?'selected':''}>所有日志</option>
                        <option value="普通日志" ${requestScope.logVo.type=='普通日志'?'selected':''}>普通日志</option>
                        <option value="异常日志" ${requestScope.logVo.type=='异常日志'?'selected':''}>异常日志</option>
                    </select>
                </div>
            </div>
            <div class="conditions time ue-clear">
                <label>事件时间：</label>
                <div class="time-select">
                    <input type="date" id="startTime" placeholder="开始时间" value="${requestScope.logVo.startTime}"
                           name="startTime"/>
                </div>
                <span class="line">-</span>
                <div class="time-select">
                    <input type="date" id="endTime" placeholder="结束时间" value="${requestScope.logVo.endTime}"
                           name="endTime"/>
                </div>
            </div>
        </div>
        <div class="query-btn ue-clear">
            <a href="javascript:logFind();" class="confirm">查询</a> <a
                href="javascript:void(0);" id="reset" class="clear">清空条件</a>
        </div>
    </div>

</form>
<div class="table-box">
    <table id="showList">
        <thead>
        <tr>
            <th class="num">事件编号</th>
            <th class="node">事件类型</th>
            <th class="time">事件时间</th>
            <th class="name">事件描述</th>
            <th class="name">方法名字</th>
            <th class="name">方法参数</th>
            <th class="name">方法返回值</th>
            <th class="name">操作人ID</th>
            <th class="name">异常信息</th>
        </tr>
        </thead>
        <tbody id="show">
        <c:forEach items="${requestScope.pageUtils.records}" var="log" varStatus="sta">
            <tr ${(sta.index+1)%2==0?'style="background: #E8F1F7"':'style="background: #fff"'}>
                <th class="num">${log.id}</th>
                <th class="node">${log.type}</th>
                <th class="time">${log.createTime}</th>
                <th class="name">${log.logDescription}</th>
                <th class="name">${log.methodInfo}</th>
                <th class="name">${log.methodParms}</th>
                <th class="name">${log.methodReturn}</th>
                <th class="name">${log.userId}</th>
                <th class="name">${log.exMsg}</th>
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
    <div class="pxofy">
        当前第&nbsp;${pageUtils.pageIndex}&nbsp;页&nbsp;&nbsp;共${pageUtils.pageCount}页&nbsp;&nbsp;共&nbsp;${pageUtils.totalCount}&nbsp;条记录
    </div>
</div>
<!--分页HTML-->

</body>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/core.js"></script>
<script type="text/javascript" src="/js/jquery.dialog.js"></script>
<script type="text/javascript" src="/js/jquery.paginationForLogJSP.js"></script>
<script type="text/javascript" src="/js/log.js"></script>
<script type="text/javascript">
    $(".select-title").on("click", function () {
        $(".select-list").hide();
        $(this).siblings($(".select-list")).show();
        return false;
    })
    $(".select-list").on(
        "click",
        "li",
        function () {
            var txt = $(this).text();
            var ok = $(this).val();
            $(this).parent($(".select-list")).siblings($(".select-title"))
                .find("span").text(txt);
            $("#des").val(ok);
        })

    function logFind() {
        $("#logForm").submit();
    }

    function goPage(pageIndex) {
        $("#logForm").attr("action", "/log/find?pageIndex=" + pageIndex);
        $("#logForm").submit();
    }
</script>
</html>
