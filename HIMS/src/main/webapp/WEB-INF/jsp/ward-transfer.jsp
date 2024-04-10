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
<style type="text/css">
#hide input {
	display: none;
}
</style>
</head>

<body>
	<div class="title">
		<h2>转科室/病房</h2>
	</div>
	<div class="main">
		<form id="wardTransferForm">

			<table>
				<tr>
					<td>
						<p class="short-inpue-clear">
							<label><font color="red"></font>住&nbsp;&nbsp;院&nbsp;&nbsp;号：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="search" readonly results="s" name="patientId"
								id="patientId" />
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<label>姓 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
						</p>
					</td>
					<td>
						<p class="short-input ue-clear">
							<input type="text" readonly name="patientName" id="patientName" />
						</p>
					</td>
				</tr>
				<tr>
					<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>科
								&nbsp;&nbsp;&nbsp;&nbsp;室：</label>
						</p>
					</td>
					<td>
						<div class="short-input select ue-clear">
							<select name="department" style="width: 262px;color: gray" class="select-title ue-clear" id="keshi" onchange="getDoctors();">
								<option value="-1">--请选择科室--</option>病房类
							</select>
						</div>
					</td>
					<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>主治医师：</label>
						</p>
					</td>
					<td>
						<div class="short-input select ue-clear">
							<select name="doctorId" style="width: 262px;color: gray" class="select-title ue-clear"
									id="doctors">
								<option value="-1">--请选择医生--</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>病房类型：</label>
						</p>
					</td>
					<td>
						<div class="short-input select ue-clear">
							<div class="select-wrap">
								<select name="roomType" style="width: 262px;color: gray" class="select-title ue-clear"
										id="wardType" onchange="getWards();">
									<option value="-1">--请选择病房类型--</option>
								</select>
							</div>
						</div>
					</td>
					<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>病 房 号：</label>
						</p>
					</td>
					<td>
						<div class="short-input select ue-clear">
							<select name="roomNo" style="width: 262px;color: gray" class="select-title ue-clear"
									id="ward" onchange="getBeds();">
								<option value="-1">--请选择病房--</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<p class="short-input ue-clear">
							<label><font color="red">*</font>床 位 号：</label>
						</p>
					</td>
					<td>
						<div class="short-input select ue-clear">
							<select name="bedNo" style="width: 262px;color: gray" class="select-title ue-clear"
									id="bed">
								<option value="-1">--请选择病床--</option>
							</select>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="btn">
		<a href="javascript:void(0);" id="register" class="confirm">保存</a> <a
			href="javascript:void(0);" id="reset" class="clear">重置</a>
	</div>
	<div class="showPatientDialog">
		<iframe src="/patient/find" frameBorder="0" width="100%"
			scrolling="auto" height="100%"></iframe>
	</div>
</body>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/core.js"></script>
<script type="text/javascript" src="/js/jquery.dialog.js"></script>
<script type="text/javascript" src="/js/wardTransfer.js"></script>
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
	$("#type").on("click", function() {
		$("#types").toggle();
		return false;
	});
	$("#types").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#type").find("span").text(txt);
		$("#typeNo").val(label);
	});
	$("#ward").on("click", function() {
		$("#wards").toggle();
		return false;
	});
	$("#wards").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#ward").find("span").text(txt);
		$("#wardNo").val(label);
	});
	$("#bed").on("click", function() {
		$("#beds").toggle();
		return false;
	});
	$("#beds").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#bed").find("span").text(txt);
		$("#bedNo").val(label);
	});
	$("#doctor").on("click", function() {
		$("#doctors").toggle();
		return false;
	});
	$("#doctors").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#doctor").find("span").text(txt);
		$("#doctorNo").val(label);
	});
	$("#statu").on("click", function() {
		$("#status").toggle();
		return false;
	});
	$("#status").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#statu").find("span").text(txt);
		$("#statusNo").val(label);
	});

	$(function () {

		//页面加载绑定科室下拉框
		$.getJSON("/paracode/findParacodes/001", function (result) {
			//alert(JSON.stringify(result));
			for (var i = 0; i < result.length; i++) {
				$("#keshi").append("<option value='" + result[i].parameterValues + "'>" + result[i].parameterName + "</option>");
			}
			//回显下拉框

		});


		//页面加载绑定房间类型下拉框
		$.getJSON("/category/findCategorys", function (result) {
			//alert(JSON.stringify(result));
			for (var i = 0; i < result.length; i++) {
				$("#wardType").append("<option value='" + result[i].type + "'>" + result[i].name + "</option>");
			}
		});
	});

	//加载医生下拉框
	function getDoctors() {
		//清除下拉框
		$("#doctors").html("<option value='-1'>--请选择医生--</option>");
		var doctor_department = $("#keshi").val();
		if (doctor_department == -1) {
			return;
		}
		$.getJSON("/doctor/findDoctorsByDepartment/" + doctor_department, function (result) {
			for (var i = 0; i < result.length; i++) {
				$("#doctors").append("<option value='" + result[i].doctorId + "'>" + result[i].name + "</option>");
			}
		});
	}

	//加载病床
	function getBeds() {
		$("#bed").html("<option value='-1'>--请选择病床--</option>");
		var ward = $("#ward").val();
		if (ward == -1) {
			return;
		}
		$.getJSON("/bed/findBedsAll/" + ward, function (result) {
			for (var i = 0; i < result.length; i++) {
				if(result[i].state==0||result[i].bedNo==bedNo){
					$("#bed").append("<option value='" + result[i].bedNo + "'>" + result[i].bedNo + "</option>");
				}
			}
		});
	}

	//加载房间下拉框
	function getWards() {
		$("#ward").html("<option value='-1'>--请选择病房--</option>");
		var type = $("#wardType").val();
		var departmentNo = $("#keshi").val();
		if (type == -1 || departmentNo == -1) {
			return;
		}
		$.getJSON("/ward/findWardByDepartmentAndType/" + departmentNo + "/" + type, function (result) {
			for (var i = 0; i < result.length; i++) {
				$("#ward").append("<option value='" + result[i].wardNo + "'>" + result[i].wardNo + "</option>");
			}
		});
	}

</script>
</html>
