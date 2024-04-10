<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="/css/base.css" />
<link rel="stylesheet" href="/css/info-reg.css" />
<title>医院住院管理系统</title>
</head>
<style type="text/css">
#typeNo, #departmentNo {
	display: none;
}
</style>
<body>
	<div class="title">
		<h2>病房增加</h2>
	</div>
	<form id="wardForm">
		<div class="main">
			<p class="short-input ue-clear">
				<label><font color="red">*</font>房&nbsp;间&nbsp;号：</label> <input
					id="wardNo" name="wardNo" type="text" placeholder="房间号"> <span
					id="wardError"><em>*</em>必须为正整数</span>
			</p>
			<div class="short-input select ue-clear">
				<label><font color="red">*</font>科&nbsp;&nbsp;&nbsp;&nbsp;室：</label>
				<div class="select-wrap">
					<select name="departmentNo" style="width: 262px;color: gray" class="select-title ue-clear" id="keshi">
                         <option value="-1">--请选择科室---</option>
					</select>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span id="departError"></span>
			</div>
			<div class="short-input select ue-clear">
				<label><font color="red">*</font>类&nbsp;&nbsp;&nbsp;&nbsp;型：</label>
				<div class="select-wrap">
					<select name="type"  style="width: 262px;color: gray"  class="select-title ue-clear" id="wardType">
						<option value="-1">--请选择病房类型---</option>
					</select>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span id="typeError"></span>
			</div>
			<p class="short-input ue-clear">
				<label><font color="red">*</font>容&nbsp;&nbsp;量：</label> <input
					id="wardspace" name="space" type="text" placeholder="容量">
				<span id="wardspaceerror"><em>*</em>必须为正整数</span>
			</p>
			<p class="short-input ue-clear">
				<label><font color="red">*</font>创建时间：</label> <input type="date"
					id="createTime"  style="width: 260px;color: gray"  name="createTime"
					placeholder="创建时间" /> &nbsp;&nbsp;&nbsp;&nbsp;<span
					id="createError"></span>
			</p>
		</div>
		<div class="btn ue-clear">
			   <a href="javascript:addWard();" class="confirm">增加</a>
			   <a href="javascript:void(0);" id="reset" class="clear">重置</a>
		</div>
	</form>
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
		});

		//页面加载绑定房间类型下拉框
		$.getJSON("/category/findCategorys",function (result){
			//alert(JSON.stringify(result));
			for(var i=0;i<result.length;i++){
				$("#wardType").append("<option value='"+result[i].type+"'>"+result[i].name+"</option>");
			}
		});
	});

	/**
	 * 新增病房(异步新增)
	 */
	function addWard(){
		//获取表单数据
		var data=$("#wardForm").serialize();
		//alert(data);
		$.post("/ward/add",data,function (result){
			if(result.code==200){
				alert("病房新增成功");
				//页面刷新
				location.reload();
			}else{
				alert("病房新增异常");
			}
		});
	}

</script>
</html>
