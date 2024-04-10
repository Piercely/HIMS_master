$(function() {
	$(".confirm").click(save);
	$(".clear").click(reset);
	$("#patientId").click(selectPatient);
});

// 病人的查询弹窗
function selectPatient() {
	var ok = $('.exitDialog').Dialog("open");
	$("#drugsRepercussion :input").val("");
}

$('.exitDialog').Dialog({
	title : '选择病人',
	autoOpen : false,
	width : 1000,
	height : 400
});

function close() {
	$('.exitDialog').Dialog('close');
	// 关闭弹窗后增加下拉列表的数据
	var patientId = $("#patientId").val();
	$.ajax({
		url : "/withdrawal/getTuiDrugs",
		type : "post",
		data : {
			"patientId" : patientId
		},
		dataType : "JSON",
		success : function(result) {
			if (result.code == 200) {
				var list = result.data;
				console.log("list:" + list);
				var $datalist = $("#drugsList");
				$datalist.empty();
				if (list.length > 0) {
					for (var i = 0; i < list.length; i++) {
						var stock = list[i];
						var $li = "<option value='" + stock.drugId + "'>"
								+ stock.drugName + "</option>";
						$datalist.append($li);
					}
				}
			}
		},
		error : function(result) {
			alert("服务器查询下拉框异常！");
		}
	});
}
function checknum() {
	var patientId = $("#patientId").val();
	var drugId = $("#durgsName").val();
	var numb = $("#count").val();
	//alert("patientId="+patientId);
	//alert("drugId="+drugId);
	$.ajax({
		url : "/withdrawal/countTotal",
		type : "post",
		data : {
			"patientId" : patientId,
			"drugId" : drugId
		},
		dataType : "JSON",
		success : function(result) {
			//alert(JSON.stringify(result));
			if (result.code == 200) {
				var count = result.data;
				console.log("count:" + count);
				$("#count1").val(count);
			}else{
				alert("查询总药品数量异常！")
			}
		}
	});
}

function checknum1() {
	var count = $("#count").val();
	var count1 = $("#count1").val();
	if (count1 - count < 0) {
		alert("对不起，数量超长！病人只有:" + count1 + "个，该药品");
		$("#count").val("");
	}

}
// 保存退药信息
function save() {
	var patientId = $("#patientId").val();
	var patientName = $("#patientName").val();
	var drugsId = $("#durgsName").val();
	var count = $("#count").val();
	var reason = $("#repercussion").val();

	$.ajax({
		url : "/withdrawal/tuiDrugs",
		type : "POST",
		data : {
			"patientId" : patientId,
			"patientName" : patientName,
			"drugsId" : drugsId,
			"count" : count,
			"reason" : reason
		},
		success : function(result) {
			if(result.code==200){
				alert("退药成功！");
				//window.location.reload();
			}else{
				alert("退药异常！");
			}
		},
		error : function() {
			alert("退药失败！");
		}
	});

}

function reset() {
	$("#drugsRepercussion :input").val("");
}
