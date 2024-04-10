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
		<h2>体征数据查询</h2>
	</div>
	<form id="signQueryForm" action="/sign/find" method="post">
		<input style="display: none;" id="departmentNo" name="departmentNo"
			type="text" value="" />
		<div class="query">
			<div class="query-conditions ue-clear">
<%--				<div class="conditions staff ue-clear">--%>
<%--					<label>姓&nbsp;&nbsp;&nbsp;&nbsp;名：</label> <input type="text"--%>
<%--																	  id="patientName" name="patientName" />--%>
<%--				</div>--%>
<%--				<div class="conditions staff ue-clear">--%>
<%--					<label>床&nbsp;&nbsp;位&nbsp;&nbsp;号：</label> <input type="text"--%>
<%--																	   name="bedNo" id="bedNo" />--%>
<%--				</div>--%>
				<div class="conditions staff ue-clear">
					<label id="patientNum">住&nbsp;&nbsp;院&nbsp;&nbsp;号：</label> <input
						type="text" name="patientId" id="patientId" value="${signVo.patientId}" />
				</div>
				<div class="conditions time ue-clear">
					<label>测量时间：</label>
					<div class="time-select">
						<input type="date" name="testStartTime" placeholder="开始时间" value="${signVo.testStartTime}"/>
					</div>
					<span class="line">-</span>
					<div class="time-select">
						<input type="date" name="testEndTime" placeholder="结束时间" value="${signVo.testEndTime}"/>
					</div>
				</div>
			</div>
			<div class="query-btn ue-clear">
				<a href="javascript:signFind();" class="confirm">查询</a> <a
					href="javascript:void(0);" class="clear">清空条件</a>
			</div>
			<!-- 病人查询 -->
			<div class="patientQuery">
				<iframe src="/patient/find" frameBorder="0" width="100%"
					scrolling="auto" height="100%"></iframe>
			</div>
		</div>
		<div class="table-box">
			<table>
				<thead>
					<tr>
						<th class="num">床号</th>
						<th class="node">住院号</th>
						<th class="name">脉搏</th>
						<th class="name">体温(℃)</th>
						<th class="name">心率(次/分)</th>
						<th class="name">血压(mmHg)</th>
						<th class="name">血糖(mmol/l)</th>
						<th class="time">录入时间</th>
						<th class="name">护理医师</th>
					</tr>
				</thead>
				<tbody id="show">
				<c:forEach items="${pageUtils.records}" var="sign" varStatus="sta">
					<tr ${(sta.index+1)%2==0?'style="background: #E8F1F7"':'style="background: #fff"'}>
						<td class="num">${sta.index+1}</td>
						<td class="node">${sign.patientId}</td>
						<td class="name">${sign.pulse}</td>
						<td class="name">${sign.temperature}</td>
						<td class="name">${sign.breathing}</td>
						<td class="name">${sign.bloodPressure}</td>
						<td class="name">${sign.bloodSugar}</td>
						<td class="time">${sign.measureTime}</td>
						<td class="name">${sign.userName}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</form>
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
<script type="text/javascript" src="/js/echarts.js"></script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/core.js"></script>
<script type="text/javascript" src="/js/jquery.dialog.js"></script>
<script type="text/javascript" src="/js/jquery.pagination.js"></script>
<script type="text/javascript" src="/js/cookie_util.js"></script>
<script type="text/javascript" src="/js/sign-query.js"></script>
<script type="text/javascript">

	function signFind(){
		$("#signQueryForm").submit();
	}

	function goPage(pageIndex){
		$("#signQueryForm").attr("action","/sign/find?pageIndex="+pageIndex);
		$("#signQueryForm").submit();
	}

</script>
</html>
