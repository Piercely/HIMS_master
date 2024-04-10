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
    <h2>出院查询</h2>
</div>
<div class="query">
    <div class="query-conditions ue-clear">
        <form id="findForm" action="/patient/outfind" method="post">
            <div class="conditions staff ue-clear">
                <label>住院号：</label> <input type="text" id="patiendId" value="${patientVo.patientId}" name="patientId"/>
            </div>
            <div class="conditions staff ue-clear">
                <label>姓&nbsp;名：</label> <input type="text" id="patientName" name="patientName"
                                                value="${patientVo.patientName}"/>
            </div>
            <div class="conditions time ue-clear">
                <label>入院时间：</label>
                <div class="time-select">
                    <input type="date" id="inStart" name="ruyuanStartTime" placeholder="开始时间"
                           value="${patientVo.ruyuanStartTime}"/>
                </div>
                <span class="line">-</span>
                <div class="time-select">
                    <input type="date" id="inEnd" name="ruyuanEndTime" placeholder="结束时间"
                           value="${patientVo.ruyuanEndTime}"/>
                </div>
            </div>
            <div class="conditions time ue-clear">
                <label>出院时间：</label>
                <div class="time-select">
                    <input type="date" id="outStart" name="chuyuanStartTime" placeholder="开始时间"
                           value="${patientVo.chuyuanStartTime}"/>
                </div>
                <span class="line">-</span>
                <div class="time-select">
                    <input type="date" id="outEnd" name="chuyuanEndTime" placeholder="结束时间"
                           value="${patientVo.chuyuanEndTime}"/>
                </div>
            </div>
        </form>
    </div>
    <div class="query-btn ue-clear">
        <a href="javascript:paitentOutFind();" class="confirm">查询</a> <a
            href="javascript:;" id="cle" class="clear">清空条件</a>
    </div>
</div>
<div class="table-box">
    <table id="showList">
        <thead>
        <tr>
            <th class="num">序号</th>
            <th class="name">住院号</th>
            <th class="name">姓名</th>
            <th class="node">性别</th>
            <th class="node">主治医生</th>
            <th class="node">证件号</th>
            <th class="time">入院时间</th>
            <th class="time">出院时间</th>
        </tr>
        </thead>
        <tbody id="show">
        <c:forEach items="${pageUtils.records}" var="p" varStatus="sta">
            <tr ${(sta.index+1)%2==0?'style="background: #E8F1F7;cursor:pointer"':'style="background: #fff;cursor:pointer"'} onclick="jump(this.firstChild);">
                <td class="num">${sta.index+1}</td>
                <td class="name">${p.patientId}</td>
                <td class="name">${p.patientName}</td>
                <td class="node">${p.gender==1?'男':'女'}</td>
                <td class="node">${p.doctorName}</td>
                <td class="node">${p.certificateNo}</td>
                <td class="time">${p.admissionTime}</td>
                <td class="time">${p.leaveTime}</td>
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
<script type="text/javascript" src="/js/jquery.pagination.js"></script>
<script type="text/javascript" src="/js/leftFind.js"></script>

<script type="text/javascript">

    function paitentOutFind() {
        $("#findForm").submit();
    }

    function goPage(pageIndex) {
        $("#findForm").attr("action", "/patient/outfind?pageIndex=" + pageIndex);
        $("#findForm").submit();
    }
</script>
</html>
