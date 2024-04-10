$(function () {
    $("#patientId").click(selectPatient);
    $(".confirm").click(confirm);
    $(".clear").click(clear);
    $(".ok").click(closeError);
    $(".normal").click(closeError);
});

// 保存按钮
function confirm() {
    // 校验
    var patientId = $("#patientId").val();
    if (patientId == null || "" == patientId) {
        alert("病人不存在！");
        return false;
    }
    var jiesuan = $("#jiesuan").val();
    if (jiesuan == "否") {
        showError();
        return false;
    }
    // 出院登记
    var url = "/patient/chuyuan";
    var data = {
        "patientId": patientId
    };
    $.post(url, data, function (result) {
        if(result.code==200){
            alert("出院登记成功！");
            window.location.reload();
        }else{
            alert("出院登记异常！");
        }
    });
}

// 重置按钮
function clear() {
    $("#leaveHospitalForm :input").val("");
}

// 错误提示弹窗
$('.showError').Dialog({
    title: '错误提示信息',
    autoOpen: false,
    width: 400,
    height: 200
});

function showError() {
    $('.showError').Dialog('open');
}

function closeError() {
    $('.showError').Dialog('close');
}

// 病人的查询弹窗
function selectPatient() {
    $("#patientIdError").empty();
    $('.showDialog').Dialog("open");
}

$('.showDialog').Dialog({
    title: '选择病人',
    autoOpen: false,
    width: 1000,
    height: 400
});

function close() {
    $('.showDialog').Dialog('close');
    // 关闭之前进行页面显示
    showMessage();
}

// 展示病人信息
function showMessage() {
    //alert($("#patientId").val());
    $.ajax({
        url: "/patient/patientQuery",
        type: "get",
        data: {
            "patientId": $("#patientId").val()
        },
        dataType: "JSON",
        async: false,
        success: function (patient) {
            alert(JSON.stringify(patient));
            var gender = "女";
            var settlementState = "是";
            if (patient.gender == 1) {
                gender = "男";
            }
            if (patient.settlementState == 0) {
                settlementState = "否";
            }
            // console.log(patient[0]);
            $("#patientName").val(patient.patientName);
            $("#cardId").val(patient.certificateNo);
            $("#gender").val(gender);
            $("#inTime").val(patient.admissionTime);
            $("#department").val(patient.keshiName);
            $("#doctorName").val(patient.doctorName);
            $("#roomNo").val(patient.roomNo);
            $("#jiesuan").val(settlementState);
            $("#bedNo").val(patient.bedNo);
        }
    });
}
