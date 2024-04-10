<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/base.css"/>
    <link rel="stylesheet" href="/css/info-reg.css"/>
    <title>医院住院管理系统</title>
    <style type="text/css">
        #hide input {
            display: none;
        }
    </style>
</head>
<body>
<div class="title">
    <h2>入院登记</h2>
</div>
<div class="main">
    <form id="patientRegForm">
        <table>
            <tr>
                <td><p class="short-inpue-clear">
                    <label><font color="red">*</font>姓
                        &nbsp;&nbsp;&nbsp;&nbsp;名：</label>
                </p></td>
                <td><p class="short-input ue-clear">
                    <input type="text" name="patientName" id="name"/>
                </p></td>
                <td><p class="short-input ue-clear">
                    <label><font color="red">*</font>身份证号：</label>
                </p></td>
                <td><p class="short-input ue-clear">
                    <input type="text" name="certificateNo" id="cerificateNo"/> <span
                        id="patientError"></span>
                    <p class="short-input ue-clear"></td>
            </tr>
            <tr>
                <td><p class="short-input ue-clear">
                    <label>性&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
                </p></td>
                <td>
                    <div class="short-input select ue-clear">
                        <div class="select-wrap">
                            <select name="gender" style="width: 262px;color: gray" class="select-title ue-clear"
                                   >
                                <option value="1">男</option>
                                <option value="2">女</option>
                            </select>
                        </div>
                    </div>
                </td>
                <td><p class="short-input ue-clear">
                    <label>民 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族：</label>
                </p></td>
                <td>
                    <div class="short-input select ue-clear">
                        <div class="select-wrap">
                            <select name="nation" style="width: 262px;color: gray" class="select-title ue-clear"
                                    id="nation">

                            </select>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td><p class="short-input ue-clear">
                    <label>工作单位：</label>
                </p></td>
                <td><p class="short-input ue-clear">
                    <input type="text" name="workUnit" id="workUnit"/>
                    <p class="short-input ue-clear"></td>
                <td><p class="short-input ue-clear">
                    <label><font color="red">*</font>生
                        &nbsp;&nbsp;&nbsp;&nbsp;日：</label>
                </p></td>
                <td><p class="short-input ue-clear">
                    <input type="date" id="birth" name="birth"
                           onblur="checkpatientTime()"/>
                </p></td>
            </tr>
            <tr>
                <td><p class="short-input ue-clear">
                    <label><font color="red">*</font>家庭住址：</label>
                </p></td>
                <td><p class="short-input ue-clear">
                    <input type="text" name="homeAddress" id="homeAddress"/>
                    <p class="short-input ue-clear"></td>
                <td><p class="short-input ue-clear">
                    <label>家庭电话：</label>
                </p></td>
                <td><p class="short-input ue-clear">
                    <input type="text" name="homePhone" id="homePhone"/>
                    <p class="short-input ue-clear"></td>
            </tr>
            <tr>
                <td><p class="short-input ue-clear">
                    <label>婚姻状况：</label>
                </p></td>
                <td>
                    <div class="short-input select ue-clear">
                        <div class="select-wrap">
                            <select name="maritalStatus" style="width: 262px;color: gray" class="select-title ue-clear">
                                <option value="0">未婚</option>
                                <option value="1">已婚</option>
                            </select>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td><p class="short-input ue-clear">
                    <label><font color="red">*</font>科
                        &nbsp;&nbsp;&nbsp;&nbsp;室：</label>
                </p></td>
                <td>
                    <div class="short-input select ue-clear">
                        <div class="select-wrap">
                            <select name="department" style="width: 262px;color: gray" class="select-title ue-clear"
                                    id="keshi" onchange="getDoctors();">
                                <option value="-1">--请选择科室--</option>
                            </select>
                        </div>
                    </div>
                </td>
                <td><p class="short-input ue-clear">
                    <label><font color="red">*</font>主治医师：</label>
                </p></td>
                <td>
                    <div class="short-input select ue-clear">
                        <div class="select-wrap">
                            <select name="doctorId" style="width: 262px;color: gray" class="select-title ue-clear"
                                    id="doctors">
                                <option value="-1">--请选择医生--</option>
                            </select>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td><p class="short-input ue-clear">
                    <label><font color="red">*</font>病房类型：</label>
                </p></td>
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
                <td><p class="short-input ue-clear">
                    <label><font color="red">*</font>病 房 号：</label>
                </p></td>
                <td>
                    <div class="short-input select ue-clear">
                        <div class="select-wrap">
                            <select name="roomNo" style="width: 262px;color: gray" class="select-title ue-clear"
                                    id="ward" onchange="getBeds();">
                                <option value="-1">--请选择病房--</option>
                            </select>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td><p class="short-input ue-clear">
                    <label><font color="red">*</font>床 位 号：</label>
                </p></td>
                <td>
                    <div class="short-input select ue-clear">
                        <div class="select-wrap">
                            <select name="bedNo" style="width: 262px;color: gray" class="select-title ue-clear"
                                    id="bed">
                                <option value="-1">--请选择病床--</option>
                            </select>
                        </div>
                    </div>
                </td>
                <td><p class="short-input ue-clear">
                    <label><font color="red">*</font>入院状况：</label>
                </p></td>
                <td>
                    <div class="short-input select ue-clear">
                        <div class="select-wrap">
                            <select name="admissionStatus" style="width: 262px;color: gray" class="select-title ue-clear">
                                <option value="0">一般</option>
                                <option value="1">紧急</option>
                                <option value="2">病危</option>
                            </select>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td><p class="short-input ue-clear">
                    <label><font color="red">*</font>紧急联 系 人：</label>
                </p></td>
                <td><p class="short-input ue-clear">
                    <input type="text" name="contacts" id="contacts"/>
                </p></td>
                <td><p class="short-input ue-clear">
                    <label><font color="red">*</font>手机号：</label>
                </p></td>
                <td><p class="short-input ue-clear">
                    <input type="text" name="contactsPhone" id="contactsPhone"/>
                    <p class="short-input ue-clear"></td>
            </tr>
        </table>
    </form>
</div>
<div class="btn">
    <a href="javascript:ruyuan();" class="confirm">登记</a> <a
        href="javascript:void(0);" id="reset" class="clear">重置</a>
</div>
</body>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/patientzc.js"></script>
<script type="text/javascript">
    $("#nation").on("click", function () {
        $("#nations").toggle();
        return false;
    });
    $("#nations").on("click", "li", function () {
        var txt = $(this).text();
        var label = $(this).val();
        $("#nation").find("span").text(txt);
        $("#nationNo").val(label);
    });
    $("#department").on("click", function () {
        $("#depart").toggle();
        return false;
    });
    $("#depart").on("click", "li", function () {
        var txt = $(this).text();
        var label = $(this).val();
        $("#department").find("span").text(txt);
        $("#departmentNo").val(label);
    });
    $("#marry").on("click", function () {
        $("#marrys").toggle();
        return false;
    });
    $("#marrys").on("click", "li", function () {
        var txt = $(this).text();
        var label = $(this).val();
        $("#marry").find("span").text(txt);
        $("#marryNo").val(label);
    });
    $("#type").on("click", function () {
        $("#types").toggle();
        return false;
    });
    $("#types").on("click", "li", function () {
        var txt = $(this).text();
        var label = $(this).val();
        $("#type").find("span").text(txt);
        $("#typeNo").val(label);
    });
    $("#ward").on("click", function () {
        $("#wards").toggle();
        return false;
    });
    $("#wards").on("click", "li", function () {
        var txt = $(this).text();
        var label = $(this).val();
        $("#ward").find("span").text(txt);
        $("#wardNo").val(label);
    });
    $("#bed").on("click", function () {
        $("#beds").toggle();
        return false;
    });
    $("#beds").on("click", "li", function () {
        var txt = $(this).text();
        var label = $(this).val();
        $("#bed").find("span").text(txt);
        $("#bedNo").val(label);
    });
    $("#doctor").on("click", function () {
        $("#doctors").toggle();
        return false;
    });
    $("#doctors").on("click", "li", function () {
        var txt = $(this).text();
        var label = $(this).val();
        $("#doctor").find("span").text(txt);
        $("#doctorNo").val(label);
    });
    $("#statu").on("click", function () {
        $("#status").toggle();
        return false;
    });
    $("#status").on("click", "li", function () {
        var txt = $(this).text();
        var label = $(this).val();
        $("#statu").find("span").text(txt);
        $("#statusNo").val(label);
    });
    $("#gender").on("click", function () {
        $("#genders").toggle();
        return false;
    });
    $("#genders").on("click", "li", function () {
        var txt = $(this).text();
        var label = $(this).val();
        $("#gender").find("span").text(txt);
        $("#genderNo").val(label);
    });
    //时间判断的方法
    var now = new Date();
    var changenow = new Date().getFullYear() + '-'
        + (new Date().getMonth() + 1) + '-' + new Date().getDate();

    function checkpatientTime() {
        if ($("#birth").val() != "") {
            var PT1 = $("#birth").val();
            //根据日期字符串转换成日期
            var regEx = new RegExp("\\-", "gi");
            PT1 = PT1.replace(regEx, "/");
            var PT2 = changenow;
            PT2 = PT2.replace(regEx, "/");
            //判断时间
            if (Date.parse(PT1) > Date.parse(PT2)) {
                alert("出生日期错误!");
                $("#birth").val(changenow);
            }
        }
    }


    $(function () {

        //绑定名族下拉框
        $.getJSON("/nation/findNations", function (result) {
            //alert(JSON.stringify(result));
            for (var i = 0; i < result.length; i++) {
                $("#nation").append("<option value='" + result[i].nationNum + "'>" + result[i].nationName + "</option>");
            }
        });

        //页面加载绑定科室下拉框
        $.getJSON("/paracode/findParacodes/001", function (result) {
            //alert(JSON.stringify(result));
            for (var i = 0; i < result.length; i++) {
                $("#keshi").append("<option value='" + result[i].parameterValues + "'>" + result[i].parameterName + "</option>");
            }
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

    //加载病床
    function getBeds() {
        $("#bed").html("<option value='-1'>--请选择病床--</option>");
        var ward = $("#ward").val();
        if (ward == -1) {
            return;
        }
        $.getJSON("/bed/findBeds/" + ward, function (result) {
            for (var i = 0; i < result.length; i++) {
                $("#bed").append("<option value='" + result[i].bedNo + "'>" + result[i].bedNo + "</option>");
            }
        });
    }

    //入院
    function ruyuan() {
        //获取表单数据
        var data = $("#patientRegForm").serialize();
        //alert(data);
        $.post("/patient/add", data, function (result) {
            if (result.code == 200) {
                alert("入院登记成功");
                //页面刷新
                location.reload();
            } else {
                alert("入院登记异常");
            }
        });
    }

</script>
</html>