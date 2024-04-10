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
    <title>医院住院管理系统</title>
</head>
<body>
<div class="title">
    <h2>库存查询</h2>
</div>
<div class="query">
    <form id="stock_query" action="/stock/find" method="post">
        <div class="query-conditions ue-clear">
            <div class="conditions staff ue-clear">
                <label>药品编号：</label> <input value="${stock.drugId}" name="drugId" type="text"/>
            </div>
            <div class="conditions staff ue-clear">
                <label>药品名称：</label> <input value="${stock.drugName}" name="drugName" type="text"/>
            </div>
        </div>
        <div class="query-btn ue-clear">
            <a href="javascript:findStocks();" class="confirm">查询</a> <a
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
            <th class="name">药品名称</th>
            <th class="node">药品价格</th>
            <th class="node">药品数量</th>
        </tr>
        </thead>
        <tbody id="show">
        <c:forEach items="${pageUtils.records}" var="stock" varStatus="sta">
            <tr ${(sta.index+1)%2==0?'style="background: #E8F1F7;cursor: pointer;"':'style="background: #fff";cursor: pointer;'} onclick="jump(this);">
                <td class="num">${sta.index+1}</td>
                <td class="name">${stock.drugId}</td>
                <td class="name">${stock.drugName}</td>
                <td class="node">${stock.price}</td>
                <td class="node">${stock.count}</td>
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
<script type="text/javascript" src="/js/stock_query.js"></script>
<script type="text/javascript">

    //查询
    function findStocks() {
        $("#stock_query").submit();
    }

    function goPage(pageIndex) {
        $("#stock_query").attr("action", "/stock/find?pageIndex=" + pageIndex);
        $("#stock_query").submit();
    }
</script>
</html>
