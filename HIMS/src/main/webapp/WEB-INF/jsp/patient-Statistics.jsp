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
		<h2>区间病人统计</h2>
	</div>
	<input style="display: none;" type="text" id="des" />
	<div class="table-box">
		<table id="showList">
			<thead>
				<tr>
					<th class="node">科室编号</th>
					<th class="name">科室名称</th>
					<th class="node">累计入院</th>
					<th class="node">累计出院</th>
					<th class="node">出院比(%)</th>
				</tr>
			</thead>
			<tbody id="show">
			   <c:forEach items="${requestScope.departments}" var="d">
				   <tr ${(sta.index+1)%2==0?'style="background: #E8F1F7"':'style="background: #fff"'}>
					   <td class="node">${d.departmentId}</td>
					   <td class="name">${d.departmentName}</td>
					   <td class="node">${d.inNum}</td>
					   <td class="node">${d.outNum}</td>
					   <td class="node">${d.percent}(%)</td>
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
<script type="text/javascript" src="/js/patient-Statistics.js"></script>
<script type="text/javascript"></script>
</html>
