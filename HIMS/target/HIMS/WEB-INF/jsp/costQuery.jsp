<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="/css/base.css" />
<link rel="stylesheet" href="/css/info-mgt.css" />
<link rel="stylesheet" type="text/css" href="/css/jquery.dialog.css" />
<title>医院住院管理系统</title>
</head>

<body>
	<div class="title">
		<h2>费用查询</h2>
	</div>
	<form id="costQueryForm" action="/cost/find" method="post">
		<div class="query">
			<div class="query-conditions ue-clear">
				<div class="conditionst staff ue-clear">
					<label id="patientNum">&nbsp;&nbsp;住院号：</label> <input type="text"
						id="patientId" name="patientId" value="${costvo.patientId}" />
				</div>
				<div class="conditionst staff ue-clear">
					<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label> <input
						type="text" id="patientName" name="patientName" />
				</div>
				<div class="conditionst time ue-clear">
					<label>&nbsp;&nbsp;缴费时间：</label>
					<div class="time-select">
						<input type="date" id="startTime" name="costStartTime" value="${costvo.costStartTime}"
							placeholder="开始时间" />
					</div>
					<span class="line">-</span>
					<div class="time-select">
						<input type="date" id="endTime" name="costEndTime" placeholder="结束时间" value="${costvo.costEndTime}"/>

					</div>
				</div>
			</div>
			<div class="query-btn ue-clear">
				<a href="javascript:costFind();" id="select" class="confirm">查询</a> <a
					href="javascript:void(0);" id="reset" class="clear">清空条件</a>
			</div>
		</div>
	</form>
	<div class="table-box">
		<table id="showList">
			<thead>
				<tr>
					<th class="num">序号</th>
					<th class="name">缴费编号</th>
					<th class="name">住院号</th>
					<th class="name">付款人</th>
					<th class="node">预交金额</th>
					<th class="node">缴费方式</th>
					<th class="time">缴费时间</th>
					<th class="name">收款用户</th>
				</tr>
			</thead>
			<tbody id="show">
			<c:forEach items="${pageUtils.records}" var="cost" varStatus="sta">
				<tr ${(sta.index+1)%2==0?'style="background: #E8F1F7"':'style="background: #fff"'}>
					<td class="num">${sta.index+1}</td>
					<td class="name">${cost.id}</td>
					<td class="name">${cost.patientId}</td>
					<td class="name">${cost.patientName}</td>
					<td class="node">${cost.account}</td>
					<td class="node">${cost.type}</td>
					<td class="time">${cost.costTime}</td>
					<td class="name">${cost.userId}</td>
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
	<!-- 查询病人 -->
	<div class="showDialog">
		<iframe src="/patient/find" frameBorder="0" width="100%"
			scrolling="auto" height="100%"></iframe>
	</div>
</body>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/core.js"></script>
<script type="text/javascript" src="/js/jquery.dialog.js"></script>
<script type="text/javascript" src="/js/jquery.pagination.js"></script>
<script type="text/javascript" src="/js/cookie_util.js"></script>
<script type="text/javascript" src="/js/costQuery.js"></script>
<script type="text/javascript">

	//查询
	function costFind(){
		$("#costQueryForm").submit();
	}

	function goPage(pageIndex){
		$("#costQueryForm").attr("action","/cost/find?pageIndex="+pageIndex);
		$("#costQueryForm").submit();
	}
</script>
</html>
