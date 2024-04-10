<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes"/>
    <link rel="stylesheet" href="/css/base.css"/>
    <link rel="stylesheet" href="/css/info-mgt.css"/>

    <title>医院住院管理系统</title>
</head>

<body>
<div class="title">
    <h2>住院查询</h2>
</div>
<form id="patientFindForm" action="/patient/find" method="post">
    <input style="display: none;" id="departmentNo" name="departmentNo"
           type="text" value=""/>
    <div class="query">
        <div class="query-conditions ue-clear" id="zhuyuan_find">
            <div class="conditionst name ue-clear">
                <label>&nbsp;&nbsp;科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;室：</label>
                <div class="select-wrap">
                    <select name="department" style="width: 262px;color: gray" class="select-title ue-clear"
                            id="keshi" onchange="getDoctors();">
                        <option value="-1">--请选择科室--</option>
                    </select>
                </div>
            </div>
            <div class="conditionst staff ue-clear">
                <label>住&nbsp;&nbsp;院&nbsp;&nbsp;号：</label> <input type="text" value="${patientVo.patientId}"
                                                                   name="patientId"/>
            </div>
            <div class="conditionst staff ue-clear">
                <label>&nbsp;&nbsp;病&nbsp;&nbsp;房&nbsp;&nbsp;号：</label> <input
                    type="text" name="roomNo" value="${patientVo.roomNo}"/>
            </div>
            <div class="conditionst time ue-clear">
                <label>&nbsp;&nbsp;入院时间：</label>
                <div class="time-select">
                    <input type="date" name="ruyuanStartTime" id="start" placeholder="开始时间"
                           onblur="checkstarttime()" value="${patientVo.ruyuanStartTime}"/>
                </div>
                <span class="line">-</span>
                <div class="time-select">
                    <input type="date" name="ruyuanEndTime" placeholder="结束时间" value="${patientVo.ruyuanEndTime}"/>
                </div>
            </div>
            <div class="conditionst staff ue-clear">
                <label>&nbsp;&nbsp;姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
                <input type="text" id="name" name="patientName" value="${patientVo.patientName}"/>
            </div>
            <div class="conditionst staff ue-clear">
                <label>床&nbsp;&nbsp;位&nbsp;&nbsp;号：</label> <input type="text" value="${patientVo.bedNo}"
                                                                   name="bedNo"/>
            </div>
        </div>
        <div class="query-btn ue-clear">
            <a href="javascript:findpatient();" class="confirm">查询</a> <a
                href="javascript:void(0);" class="clear"
                onclick="window.location.reload()">清空条件</a>
        </div>
    </div>
    <div class="table-box">
        <table>
            <thead>
            <tr>
                <th class="num">序号</th>
                <th class="time">住院号</th>
                <th class="process">姓名</th>
                <th class="num">性别</th>
                <th class="node">科室</th>
                <th class="num">病房</th>
                <th class="num">床位号</th>
                <th class="num">入院情况</th>
                <th class="time">入院时间</th>
            </tr>
            </thead>
            <tbody id="show">
               <c:forEach items="${pageUtils.records}" var="p" varStatus="sta">
                   <tr ${(sta.index+1)%2==0?'style="background: #E8F1F7;cursor:pointer"':'style="background: #fff;cursor:pointer"'}  onclick="jump(this);">
                       <td class="num">${sta.index+1}</td>
                       <td class="name">${p.patientId}</td>
                       <td class="time">${p.patientName}</td>
                       <td class="num">${p.gender==1?'男':'女'}</td>
                       <td class="node">${p.keshiName}</td>
                       <td class="num">${p.roomNo}</td>
                       <td class="num">${p.bedNo}</td>
                       <c:if test="${p.admissionStatus==0}">
                           <td class="num">一般</td>
                       </c:if>
                       <c:if test="${p.admissionStatus==1}">
                           <td class="num">紧急</td>
                       </c:if>
                       <c:if test="${p.admissionStatus==2}">
                           <td class="num">病危</td>
                       </c:if>
                       <td class="time">${p.admissionTime}</td>
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
    <div class="pxofy">
        当前第&nbsp;${pageUtils.pageIndex}&nbsp;页&nbsp;&nbsp;共${pageUtils.pageCount}页&nbsp;&nbsp;共&nbsp;${pageUtils.totalCount}&nbsp;条记录
    </div>
</div>
<!--分页HTML-->
</body>

<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/jquery.pagination.js"></script>
<script type="text/javascript" src="/js/patientfind.js"></script>

<script type="text/javascript">
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

    function checkstarttime() {
        if ($("#start").val() != "") {
            var startTime = $("#start").val();
            var start = new Date(startTime.replace("-", "/").replace("-", "/"));
            var endTime = getNowFormatDate();
            var end = new Date(endTime.replace("-", "/").replace("-", "/"));
            if (endTime < startTime) {
                alert("时间错误");
                $("#start").val(getNowFormatDate());
            }
        }
    }

    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = date.getFullYear() + seperator1 + month + seperator1
            + strDate;
        return currentdate;
    }


    $(function () {

        //页面加载绑定科室下拉框
        $.getJSON("/paracode/findParacodes/001", function (result) {
            //alert(JSON.stringify(result));
            for (var i = 0; i < result.length; i++) {
                $("#keshi").append("<option value='" + result[i].parameterValues + "'>" + result[i].parameterName + "</option>");
            }
            $("#keshi").val('${patientVo.department}');
        });

    });

    function findpatient() {
        $("#patientFindForm").submit();
    }

    function goPage(pageIndex) {
        $("#patientFindForm").attr("action", "/patient/find?pageIndex=" + pageIndex);
        $("#patientFindForm").submit();
    }

</script>
</html>
