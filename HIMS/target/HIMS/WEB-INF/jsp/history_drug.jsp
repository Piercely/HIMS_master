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
		<h2>用药历史查询</h2>
	</div>
	<input style="display: none;" type="text" id="des" />
	<div class="query">
		<div class="query-conditions ue-clear">
			<form id="findForm" action="/grantdrug/find" method="post">
				<div class="query-conditions ue-clear">
					<div class="conditions staff ue-clear">
						<label id="patientNum">住&nbsp;&nbsp;院&nbsp;&nbsp;号：</label> <input
							type="search" results="s" readonly id="patientId"
							name="patientId" class="patientId" value="${grantdrug.patientId}" />
					</div>
				</div>
			</form>
		</div>
		<div class="query-btn ue-clear">
			<a href="javascript:grantdrugFind();" id="find" class="confirm">查询</a> <a
				href="javascript:;" id="cle" class="clear">清空条件</a>
		</div>
	</div>
	<div class="table-box">
		<table id="showList">
			<thead>
				<tr>
					<th class="name">药物编号</th>
					<th class="name">药物名称</th>
					<th class="num">数量</th>
					<th class="num">单价</th>
					<th class="name">使用患者</th>
					<th class="name">派发医生</th>
					<th class="time">派发时间</th>
				</tr>
			</thead>
			<tbody id="show">
			<c:forEach items="${pageUtils.records}" var="d" varStatus="sta">
				<tr ${(sta.index+1)%2==0?'style="background: #E8F1F7"':'style="background: #fff"'}>
					<td class="name">${sta.index+1}</td>
					<td class="name">${d.drugName}</td>
					<td class="num">${d.drugCount}</td>
					<td class="num">${d.drugPrice}</td>
					<td class="name">${d.patientName}</td>
					<td class="name">${d.grantUserName}</td>
					<td class="time">${d.grantTime}</td>
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
	<!-- 病人查询 -->
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
<script type="text/javascript" src="/js/history_drug.js"></script>
<script type="text/javascript">

	function grantdrugFind(){
		$("#findForm").submit();
	}

	function goPage(pageIndex){
		$("#findForm").attr("action","/grantdrug/find?pageIndex="+pageIndex);
		$("#findForm").submit();
	}

</script>
</html>
