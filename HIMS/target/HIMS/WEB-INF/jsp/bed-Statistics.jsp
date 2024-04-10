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
<title>医院住院管理系统</title>
</head>
<body>
	<div class="title">
		<h2>病房统计</h2>
	</div>
	<div class="table-box">
		<table id="showList">
			<thead>
				<tr>
					<th class="num">序号</th>
					<th class="name">科室编号</th>
					<th class="name">科室名称</th>
					<th class="node">床位总数</th>
					<th class="node">未使用</th>
					<th class="time">已使用</th>
					<th class="name">使用率%</th>
				</tr>
			</thead>
			<tbody id="show">
				<c:forEach items="${requestScope.departments}" var="d" varStatus="sta">
					<tr ${(sta.index+1)%2==0?'style="background: #E8F1F7"':'style="background: #fff"'}>
						<td class="num">${sta.index+1}</td>
						<td class="name">${d.departmentId}</td>
						<td class="name">${d.departmentName}</td>
						<td class="node">${d.bedNum}</td>
						<td class="node">${d.unUsedNum}</td>
						<td class="time">${d.usedNum}</td>
						<td class="name">${d.percent}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="pagination ue-clear"></div>
</body>
<script type="text/javascript" src="/js/echarts.js"></script>
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/core.js"></script>
<script type="text/javascript" src="/js/jquery.pagination.js"></script>
<script type="text/javascript" src="/js/bed-Statistics.js"></script>
<script type="text/javascript">
	$("#department").on("click", function() {
		$("#depart").toggle();
		return false;
	});
	$("#depart").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#department").find("span").text(txt);
		$("#departmentNo").val(label);
	});
</script>
</html>
