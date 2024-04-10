$(function() {
	// 读取cookie的值,为收款人和收款人编号赋值
	// cookie内容：{user:用户ID#用户姓名#用户类型描述}
	// var cookie = getCookie('user');
	// var id = cookie.split("#")[0].substring(0);
	// $("#userId").val(id);
	// $.ajax({
	// 	url : "account/userQuery.do",
	// 	data : {
	// 		"id" : id
	// 	},
	// 	type : "post",
	// 	dataType : "JSON",
	// 	success : function(result) {
	// 		if (result.state == 0) {
	// 			var list = result.data;
	// 			var user = list[0];
	// 			$("#userName").val(user.name);
	// 		}
	// 	}
	// });
	// 为收费时间加载默认值（当前时间）
	showDate();
	// 设置按钮监听
	$("#patientId").click(selectPatient);
	$(".confirm").click(save);
	$(".clear").click(clear);

});

// 展示病人信息
function showMessage() {
	debugger;
	$.ajax({
		url : "/patient/patientQuery",
		type : "post",
		data : {
			"patientId" : $("#patientId").val()
		},
		dataType : "JSON",
		async : false,
		success : function(patient) {
			$("#departmentName").val(patient.keshiName);
			$("#doctorName").val(patient.doctorName);
		}
	});
}

// 病人的查询弹窗
function selectPatient() {
	$('.showDialog').Dialog("open");
}

$('.showDialog').Dialog({
	title : '选择病人',
	autoOpen : false,
	width : 1000,
	height : 400
});

function close() {
	$('.showDialog').Dialog('close');
	showMessage();
}

// 重置
function clear() {
	$("#costForm:input").val("");
}

// 保存
function save() {
	// 提交form表单
	var saveData = $("#costForm").serialize();
	if ($("#patientId").val() == "") {
		alert("住院号必须选择！");
		$("#patientId").click();
		return false;
	}
	if ($("#account").val() == "") {
		alert("预交费用不能为空！");
		return false;
	}
	$.ajax({
		type : "POST",
		dataType : "json",
		url : "/cost/add",
		data : saveData,
		success : function(result) {
			if (result.code == 200) {
				alert("费用预缴成功！");
			}else{
				alert("费用预缴异常！");
			}
			//window.location.reload();
		}
	});
}

// 获取当前时间
function showDate() {
	var today = new Date();
	var day = today.getDate();
	var month = today.getMonth() + 1;
	var year = today.getYear() + 1900;
	var mytime = today.toLocaleTimeString();
	var date = year + "-" + month + "-" + day + " " + mytime;
	document.getElementById("collectionTime").value = date;
}