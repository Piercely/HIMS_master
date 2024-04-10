<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/base.css"/>
    <link rel="stylesheet" href="/css/info-mgt.css"/>
    <title>医院住院管理系统</title>
</head>
<body>
<div class="title">
    <h2>入库查询</h2>
</div>
<div class="query">
    <form id="durgs_find_ruku" action="/drug/rukuQuery" method="post">
        <div class="query-conditions ue-clear">
            <div class="conditions staff ue-clear">
                <label>药品编号：</label> <input name="drugId" value="${drugVo.drugId}" type="text"/>
            </div>
            <div class="conditions staff ue-clear">
                <label>药品名称：</label> <input name="drugname" value="${drugVo.drugname}" type="text"/>
            </div>
            <div class="conditions time ue-clear">
                <label>入库时间：</label>
                <div class="time-select">
                    <input name="rukuStartTime" value="${drugVo.rukuStartTime}" type="date" placeholder="开始时间"/>
                </div>
                <span class="line">-</span>
                <div class="time-select">
                    <input type="date" name="rukuEndTime" value="${drugVo.rukuEndTime}" placeholder="结束时间"/>
                </div>
            </div>
            <div class="conditions time ue-clear">
                <label>保质期：</label>
                <div class="time-select">
                    <input type="date" name="guoqiStartTime" value="${drugVo.guoqiStartTime}" placeholder="开始时间"/>
                </div>
                <span class="line">-</span>
                <div class="time-select">
                    <input type="date" name="guoqiEndTime" value="${drugVo.guoqiEndTime}" placeholder="结束时间"/>
                </div>
            </div>
        </div>
        <div class="query-btn ue-clear">
            <a href="javascript:rukuQuery();" class="confirm">查询</a> <a
                href="javascript:void(0);" id="reset" class="clear">清空条件</a>
        </div>
    </form>
</div>
<div class="table-box">
    <table>
        <thead>
        <tr>
            <th class="num">序号</th>
            <th class="name">药品编号</th>
            <th class="time">药品名称</th>
            <th class="node">药品数量</th>
            <th class="node">药品单价（元）</th>
            <th class="time">生产日期</th>
            <th class="time">有效日期</th>
            <th class="time">入库日期</th>
        </tr>
        </thead>
        <tbody id="show">
        <c:forEach items="${pageUtils.records}" var="drug" varStatus="sta">
            <tr ${(sta.index+1)%2==0?'style="background: #E8F1F7;"':'style="background: #fff";'}>
                <td class="num">${sta.index+1}</td>
                <td class="name">${drug.drugId}</td>
                <td class="time">${drug.drugname}</td>
                <td class="node">${drug.addNum}</td>
                <td class="node">${drug.price}</td>
                <td class="time">${drug.productionTime}</td>
                <td class="time">${drug.validityTime}</td>
                <td class="time">${drug.createTime}</td>
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
<script type="text/javascript" src="/js/drugs_find.js"></script>
<script type="text/javascript">
    showRemind('input[type=text], textarea', 'placeholder');
</script>

<script type="text/javascript">

    //查询
    function rukuQuery() {
        $("#durgs_find_ruku").submit();
    }

    function goPage(pageIndex) {
        $("#durgs_find_ruku").attr("action", "/drug/rukuQuery?pageIndex=" + pageIndex);
        $("#durgs_find_ruku").submit();
    }
</script>

</html>
