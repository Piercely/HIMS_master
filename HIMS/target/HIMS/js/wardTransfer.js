$(function () {
    $("#patientId").click(selectPatient);
    $("#ward").click(showWard);
    $("#bed").click(showBed);
    $("#doctor").click(showDoctor);
    $("#department").click(clean);
    $("#type").click(cleans)
    $("#ward").click(cleanBed);
    $(".confirm").click(save);
    $(".clear").click(clear);
    // 科室列表
    $.ajax({
        url: 'common/list.do',
        type: 'post',
        data: {
            "name": "科室"
        },
        dataType: 'JSON',
        success: function (result) {
            if (result.state == 0) {
                var list = result.data;
                var $ul = $("#depart");
                $ul.empty();
                if (list.length > 0) {
                    for (var i = 0; i < list.length; i++) {
                        var common = list[i];
                        var $li = "<li value=" + common.value + ">"
                            + common.name + "</li>";
                        $ul.append($li);
                    }
                }
            }
        }
    });
    // 病房类型列表
    $.ajax({
        url: 'common/typeList.do',
        type: 'post',
        data: {
            "id": ""
        },
        dataType: 'JSON',
        success: function (result) {
            if (result.state == 0) {
                var list = result.data;
                var $ul = $("#types");
                $ul.empty();
                if (list.length > 0) {
                    for (var i = 0; i < list.length; i++) {
                        var common = list[i];
                        var $li = "<li value=" + common.value + ">"
                            + common.name + "</li>";
                        $ul.append($li);
                    }
                }
            }
        }
    });
});

function showWard() {
    var departmentNo = $("#departmentNo").val();
    var typeNo = $("#typeNo").val();
    // 病房号列表
    $.ajax({
        url: 'ward/wardQuery.do',
        type: 'post',
        data: {
            "departmentNo": departmentNo,
            "typeNo": typeNo
        },
        dataType: 'JSON',
        success: function (result) {
            if (result.state == 0) {
                var list = result.data;
                var $ul = $("#wards");
                $ul.empty();
                if (list.length > 0) {
                    for (var i = 0; i < list.length; i++) {
                        var ward = list[i];
                        var $li = "<li value=" + ward.wardNo + ">"
                            + ward.wardNo + "号房</li>";
                        $ul.append($li);
                    }
                }
            }
        }
    });
}

// 展示医生列表
function showDoctor() {
    var departmentNo = $("#departmentNo").val();
    // 病房号列表
    $.ajax({
        url: 'doctor/doctorQuery.do',
        type: 'post',
        data: {
            "department": departmentNo
        },
        dataType: 'JSON',
        success: function (result) {
            if (result.state == 0) {
                var list = result.data;
                var $ul = $("#doctors");
                $ul.empty();
                if (list.length > 0) {
                    for (var i = 0; i < list.length; i++) {
                        var doctor = list[i];
                        var $li = "<li value=" + doctor.id + ">" + doctor.name
                            + "</li>";
                        $ul.append($li);
                    }
                }
            }
        }
    });
}

function showBed() {
    var wardNo = $("#wardNo").val();
    // 床位列表
    $.ajax({
        url: 'bed/bedQuery.do',
        type: 'post',
        data: {
            "wardNo": wardNo
        },
        dataType: 'JSON',
        success: function (result) {
            if (result.state == 0) {
                var list = result.data;
                var $ul = $("#beds");
                $ul.empty();
                if (list.length > 0) {
                    for (var i = 0; i < list.length; i++) {
                        var bed = list[i];
                        var $li = "<li value=" + bed.bedNo + ">" + bed.bedNo
                            + "号床</li>";
                        $ul.append($li);
                    }
                }
            }
        }
    });
}

// 当点击科室和病房类型时，清空病房号和床位号
function clean() {
    $("#ward").find("span").text("请选择");
    $("#wardNo").val(0);
    $("#bed").find("span").text("请选择");
    $("#bedNo").val(0);
    $("#doctor").find("span").text("请选择");
    $("#doctorNo").val(0);
}

function cleans() {
    $("#ward").find("span").text("请选择");
    $("#wardNo").val(0);
    $("#bed").find("span").text("请选择");
    $("#bedNo").val(0);
}

// 清空床位信息
function cleanBed() {
    $("#bed").find("span").text("请选择");
    $("#bedNo").val(0);
}

// 展示病人信息
function showMessage() {
    $.ajax({
        url: "patient/patientQuery",
        type: "get",
        data: {
            "patientId": $("#patientId").val()
        },
        dataType: "JSON",
        async: false,
        success: function (patient) {
            //alert(JSON.stringify(patient));
            console.log(patient);
            //$("#departfh").text(patient.departmentName);
            $("#keshi").val(patient.department);
            $("#wardType").val(patient.roomType);

            getDoctorsByDeparent(patient.department,patient.doctorId);
            getWardsByDeparentAndWardType(patient.department,patient.roomType,patient.roomNo,patient.bedNo);

            //$("#yroom").val(patient.roomNo);
            //$("#ybed").val(patient.bedNo);
        }
    });
}

// 重置
function clear() {
    window.location.reload();
}

// 保存
function save() {
    // 提交form表单
    var saveData = $("#wardTransferForm").serialize();
    alert(saveData);
    if ($("#patientId").val() == "") {
        alert("请选择信息后提交！");
        $("#patientId").click();
        return false;
    }
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "/patient/changeKeshi",
        data: saveData,
        success: function (result) {
            if (result.code==200) {
                alert("转科室\病房成功！");
            }
           // window.location.reload();
        },
        error: function (result) {
            alert("转科室\病房异常！");
            //window.location.reload();
        }
    });
}

// 病人的查询弹窗
function selectPatient() {
    var ok = $('.showPatientDialog').Dialog("open");
}

$('.showPatientDialog').Dialog({
    title: '选择病人',
    autoOpen: false,
    width: 1000,
    height: 400,
});

function close() {
    $('.showPatientDialog').Dialog('close');
    showMessage();
}

//加载医生下拉框
function getDoctorsByDeparent(doctor_department,doctorId) {
    //清除下拉框
    $("#doctors").html("<option value='-1'>--请选择医生--</option>");
    //alert("科室ID--->:"+doctor_department);
    if (doctor_department == -1) {
        return;
    }
    $.getJSON("/doctor/findDoctorsByDepartment/" + doctor_department, function (result) {
        for (var i = 0; i < result.length; i++) {
            $("#doctors").append("<option value='" + result[i].doctorId + "'>" + result[i].name + "</option>");
        }
        //数据回显
        $("#doctors").val(doctorId);
    });
}

//加载房间下拉框
function getWardsByDeparentAndWardType(departmentNo,type,roomNo,bedNo) {
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
        //回显
        $("#ward").val(roomNo);
        //加载病房
        getBedsByRoomNo(roomNo,bedNo);
    });
}

//加载病床
function getBedsByRoomNo(ward,bedNo) {
    //alert("bedNo="+bedNo);
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
        //回显
        $("#bed").val(bedNo);
    });
}