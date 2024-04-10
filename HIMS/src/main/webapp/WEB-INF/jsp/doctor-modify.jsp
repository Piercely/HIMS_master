<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="/css/base.css" />
<link rel="stylesheet" href="/css/info-reg.css" />
<style type="text/css">
#titlevalue, #departmentvalue, #gendervalue {
	display: none;
}
</style>
<title>医院住院管理系统</title>
</head>

<body>
	<div class="title">
		<h2>
			医生修改
			<h2>
	</div>
	<label id="titlevalue">0</label>
	<label id="departmentvalue">0</label>
	<label id="gendervalue">0</label>
	<form id="doctorForm">
		<input type="hidden" name="doctorId" value="${doctor.doctorId}"/>
		<div class="main">
			<p class="short-input ue-clear">
				<label><font color="red">*</font>姓名：</label>
				<input id="doctorname"
					type="text" placeholder="姓名" name="name" value="${doctor.name}"><span id="doctorNameError"></span>
			</p>
			<div class="short-input select ue-clear">
				<label>科室：</label>
				<div class="select-wrap">
					<select name="doctorDepartment" style="width: 262px;color: gray" class="select-title ue-clear" id="keshi">
						<option value="-1">--请选择科室---</option>
					</select>
				</div>
			</div>
			<p class="short-input ue-clear">
				<label><font color="red">*</font>入职时间：</label> <input type="date"
					id="time" name="workingTime" value="${doctor.workingTime}" placeholder="从业时间" /><span id="timeError"></span>
			</p>
			<div class="short-input select ue-clear">
				<label>职称：</label>
				<div class="select-wrap">
					<select name="doctorTitle" style="width: 262px;color: gray" class="select-title ue-clear" id="zhicheng">
						<option value="-1">--请选职称---</option>
					</select>
				</div>
			</div>
			<div class="short-input select ue-clear">
				<label>性别：</label>
					<div class="select-wrap">
				<select name="gender" style="width: 262px;color: gray" class="select-title ue-clear">
						<option value="1" ${doctor.gender==1?'selected':''} >男</option>
						<option value="2"  ${doctor.gender==2?'selected':''}>女</option>
					</select>
				</div>
			</div>
		</div>
	</form>
	<div class="btn ue-clear">
		<a href="javascript:;doctorUpdate();" class="confirm">修改</a> <a
			href="javascript:;" id="reset" class="clear"
			onclick="window.location.reload(true)">重置</a>
	</div>
</body>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/common.js"></script>

<script type="text/javascript">
	$(function (){

		//页面加载绑定科室下拉框
		$.getJSON("/paracode/findParacodes/001",function (result){
			//alert(JSON.stringify(result));
			for(var i=0;i<result.length;i++){
				$("#keshi").append("<option value='"+result[i].parameterValues+"'>"+result[i].parameterName+"</option>");
			}
			//回显
			$("#keshi").val('${doctor.doctorDepartment}');
		});

		//页面加载绑定房间类型下拉框
		$.getJSON("/paracode/findParacodes/002",function (result){
			//alert(JSON.stringify(result));
			for(var i=0;i<result.length;i++){
				$("#zhicheng").append("<option value='"+result[i].parameterValues+"'>"+result[i].parameterName+"</option>");
			}
			//回显
			$("#zhicheng").val('${doctor.doctorTitle}');
		});
	});


	function doctorUpdate(){
		//获取表单数据
		var data=$("#doctorForm").serialize()+"&_method=put";
		$.post("/doctor/update",data,function (result){
			if(result.code==200){
				alert("医生更新成功");
				//页面刷新
				location.reload();
			}else{
				alert("医生更新异常");
			}
		},"json");
	}

</script>

</html>
