<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/base.css"/>
    <link rel="stylesheet" href="/css/info-mgt.css"/>
    <link rel="stylesheet" type="text/css" href="/css/jquery.dialog.css"/>
    <title>医院住院管理系统</title>
</head>

<body>
<div class="title">
    <h2>费用结算</h2>
</div>
<form action="/fee/find" method="post" id="feeForm">
    <div class="query">
        <div class="query-conditions ue-clear">
            <div class="conditions staff ue-clear">
                <label><font color="red">*</font>住院号：</label> <input type="search" name="patientId" results="s" readonly id="patientId" value="${patientId}" class="patientId"/> <label
                    id="patientIdError"></label> <input type="text"
                                                        style="display: none;" id="patientName">
            </div>
            <div class="query-btn ue-clear">
                <a href="javascript:feeFind();" class="confirm">费用查询</a>
                <c:if test="${patient.settlementState==0}">
                    <a href="javascript:;cofirmPay();" class="clear">费用结算</a>
                </c:if>
            </div>
        </div>
    </div>
</form>
<div class="table-box">
    <table id="showList">
        <thead>
        <tr>
            <th class="num">序号</th>
            <th class="name">住院号</th>
            <th class="process">姓名</th>
            <th class="node">费用类别</th>
            <th class="node">费用金额(元)</th>
        </tr>
        </thead>
        <tbody id="show">
            <c:forEach items="${requestScope.fees}" varStatus="sta" var="f">
                <tr ${(sta.index+1)%2==0?'style="background: #E8F1F7"':'style="background: #fff"'}>
                    <td class="num">${sta.index+1}</td>
                    <td class="name">${f.patientId}</td>
                    <td class="process">${f.patientName}</td>
                    <td class="node">${f.feeType}</td>
                    <td class="node">${f.fee}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<!-- 查询病人 -->
<div class="showDialog">
    <iframe src="/patient/find" frameBorder="0" width="100%"
            scrolling="auto" height="100%"></iframe>
</div>

<!-- 确定弹窗 -->
<div class="showJiesuanDialog" id="confirm">
    <div class="dialog-content">
        <div class="ui-dialog-icon"></div>
        <div class="ui-dialog-text">
            <p class="dialog-content">确定结算？</p>
            <p class="tips">如果是请点击“确定”，否则点“取消”</p>
            <div class="buttons">
                <input type="hidden" id="leftMoney"/>
                <input type="button" onclick="jiesuan();"  class="button long2 jiesuanOK" value="确定"/>
                <input type="button" class="button long2 jiesuanNO" value="取消"/>
            </div>
        </div>
    </div>
</div>

<div class="showJiesuanDialog" id="qianfee">
    <div class="dialog-content">
        <div class="ui-dialog-icon"></div>
        <div class="ui-dialog-text">
            <p class="dialog-content">预交费不足！</p>
            <p class="tips">点击<a href="/to_cost_yujiao">预缴</a></s>链接，进行缴费</p>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/core.js"></script>
<script type="text/javascript" src="/js/jquery.dialog.js"></script>
<script type="text/javascript" src="/js/jquery.pagination.js"></script>
<script type="text/javascript" src="/js/cookie_util.js"></script>
<script type="text/javascript" src="/js/expense-settlement.js"></script>

<script type="text/javascript">

    function feeFind() {
        $("#feeForm").submit();
    }

    function cofirmPay(){
        var leftMoney=$("td:last").text();
        $("#leftMoney").val(leftMoney);
        if(leftMoney>0){
            $('#confirm').Dialog("open");
        }else{
            $('#qianfee').Dialog("open");
        }
    }

    //确认结算
    function jiesuan(){
        var patientId=$("#patientId").val();
        $.getJSON("/patient/jiesuan",{"patientId":patientId},function (result){
            if(result.code==200){
                alert("结算完毕，返回金额为:"+ $("#leftMoney").val()+"元！");
                window.location.reload();
            }else{
                alert("结算异常!");
            }
        });
    }
</script>
</html>
