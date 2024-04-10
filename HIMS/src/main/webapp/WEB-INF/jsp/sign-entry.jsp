<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="/css/base.css" />
<link rel="stylesheet" href="/css/info-reg.css" />
<link rel="stylesheet" type="text/css" href="/css/jquery.dialog.css" />
<title>医院住院管理系统</title>
</head>

<body>
	<div class="title">
		<h2>体征数据录入</h2>
	</div>
	<form id="signEntry">
		<div class="main">
			<p class="short-input ue-clear">
				<label id="patientNum"><font color="red">*</font>住院编号：</label> <input
					id="patientId" name="patientId" type="search" results="s"
					placeholder="住院编号">
			</p>
			<p class="short-input ue-clear">
				<label>姓&nbsp;&nbsp;&nbsp;&nbsp;名：</label> <input id="patientName"
					name="patientName" readonly type="text" placeholder="姓名" />
			</p>
			<p class="short-input ue-clear">
				<label>床位号：</label> <input type="text" id="bedNo" name="bedNo"
					readonly placeholder="床位号" />
			</p>
			<input type="hidden" id="measureTime" name="measureTime"
				readonly="readonly" placeholder="测量时间" />

			<p class="short-input ue-clear">
				<label>体温(℃)：</label> <input type="text" id="temperature"
					name="temperature" placeholder="体温" />
			</p>
			<p class="short-input ue-clear">
				<label>心率(次/分)：</label> <input type="text" name="pulse" id="pulse"
					placeholder="脉搏" />
			</p>
			<p class="short-input ue-clear">
				<label>血压(mmHg):<br>(舒张/收缩)
				</label> <input type="text" name="bloodPressure" id="bloodPressure"
					placeholder="收缩压/舒张压" />
			</p>
			<p class="short-input ue-clear">
				<label>血糖(mmol/l)：</label> <input type="text" name="bloodSugar"
					id="bloodSugar" placeholder="血糖" />
			</p>
			<p class="short-input ue-clear">
				<label>备注：</label>
				<textarea placeholder="备注" name="remarks" id="remarks"></textarea>
			</p>
		</div>
		<div class="btn ue-clear">
			<a href="javascript:;" class="confirm">保存</a> <a href="javascript:;"
				class="clear">重置</a>
		</div>
		<!-- 病人查询 -->
		<div class="patientQuery">
			<iframe src="/patient/find" frameBorder="0" width="100%"
				scrolling="auto" height="100%"></iframe>
		</div>
	</form>
</body>
<script>
	
</script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/core.js"></script>
<script type="text/javascript" src="/js/jquery.dialog.js"></script>
<script type="text/javascript" src="/js/cookie_util.js"></script>
<script type="text/javascript" src="/js/signEntry.js"></script>
</html>
