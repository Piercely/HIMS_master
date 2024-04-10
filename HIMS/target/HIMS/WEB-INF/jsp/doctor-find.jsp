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
    <style type="text/css">
        #titlevalue, #departmentvalue, #statevalue {
            display: none;
        }
    </style>
</head>
<label id="titlevalue"></label>
<label id="departmentvalue"></label>
<label id="statevalue"></label>
<body>
<div class="title">
    <h2>医生查询</h2>
</div>
<div class="query">
    <form id="doctor_find_head" action="/doctor/find" method="post">
        <div class="query-conditions ue-clear">

            <div class="conditionst name ue-clear">
                <label>&nbsp;&nbsp;科室：</label>
                <div class="select-wrap">
                    <select name="doctorDepartment" style="width: 262px;color: gray" class="select-title ue-clear" id="keshi">
                        <option value="-1">--请选择科室--</option>
                    </select>
                </div>
            </div>
            <div class="conditionst staffs ue-clear">
                <label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label> <input name="name" value="${doctorVo.name}" id="name" type="text"/>
            </div>
            <div class="conditionst time ue-clear">
                <label>&nbsp;&nbsp;入职时间：</label>
                <div class="time-select">
                    <input type="date" id="startTime" name="workingStartTime" value="${doctorVo.workingStartTime}" placeholder="开始时间"/>
                </div>
                <span class="line">-</span>
                <div class="time-select">
                    <input type="date" id="endTime" name="workingEndTime" value="${doctorVo.workingEndTime}" placeholder="结束时间"/>
                </div>
            </div>
            <div class="conditionst name ue-clear">
                <label>&nbsp;&nbsp;职称：</label>
                <div class="select-wrap">
                    <select name="doctorTitle" style="width: 262px;color: gray" class="select-title ue-clear" id="zhicheng">
                        <option value="-1">--请选职称--</option>
                    </select>
                </div>
            </div>
            <div class="conditionst name ue-clear">
                <label>是否离职：</label>
                <div class="select-wrap">
                    <select name="state" style="width: 245px;color: gray" class="select-title ue-clear">
                        <option value="-1" ${doctorVo.state==-1?'selected':''} >--选择状态--</option>
                        <option value="0" ${doctorVo.state==0?'selected':''}>在职</option>
                        <option value="1" ${doctorVo.state==1?'selected':''}>离职</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="query-btn ue-clear">
            <a href="javascript:findDoctors();" class="confirm">查询</a> <a
                href="javascript:;" id="reset" class="clear">清空条件</a>
        </div>
    </form>
</div>
<div class="table-box">
    <table>
        <thead>
        <tr>
            <th class="num">序号</th>
            <th class="name">医生编号</th>
            <th class="process">姓名</th>
            <th class="node">科室</th>
            <th class="num">性别</th>
            <th class="node">职称</th>
            <th class="time">入职时间</th>
            <th class="num">是否在职</th>
            <th class="name">编辑</th>
        </tr>
        </thead>
        <tbody id="show">
        <c:forEach items="${requestScope.pageUtils.records}" var="doctor" varStatus="sta">
            <tr ${(sta.index+1)%2==0?'style="background: #E8F1F7"':'style="background: #fff"'}>
                <td class="num">${sta.index+1}</td>
                <td class="name">${doctor.doctorId}</td>
                <td class="process">${doctor.name}</td>
                <td class="node">${doctor.keshiName}<span style="display:none">1</span></td>
                <td class="num">${doctor.gender==1?'男':'女'}<span style="display:none;">1</span></td>
                <td class="node">${doctor.zhichengName}<span style="display:none;">4</span></td>
                <td class="time">${doctor.workingTime}</td>
                <td class="num">${doctor.state==1?'离职':'在职'}</td>

                <td class="name">
                    <a href="javascript:void(0)" onclick="doctorChangeState(this,${doctor.doctorId});">${doctor.state==0?'离职':'在职'}</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="/doctor/toupdate/${doctor.doctorId}">修改</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

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
    <div class="pxofy">当前第&nbsp;${pageUtils.pageIndex}&nbsp;页&nbsp;&nbsp;共${pageUtils.pageCount}页&nbsp;&nbsp;共&nbsp;${pageUtils.totalCount}&nbsp;条记录</div>
</div>
<!--分页HTML-->
</body>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/core.js"></script>
<script type="text/javascript" src="/js/jquery.dialog.js"></script>
<script type="text/javascript" src="/js/jquery.pagination.js"></script>

<script type="text/javascript">
    $(function (){

        //页面加载绑定科室下拉框
        $.getJSON("/paracode/findParacodes/001",function (result){
            //alert(JSON.stringify(result));
            for(var i=0;i<result.length;i++){
                $("#keshi").append("<option value='"+result[i].parameterValues+"'>"+result[i].parameterName+"</option>");
            }
            //下拉框回显
            $("#keshi").val('${doctorVo.doctorDepartment}');
        });

        //页面加载绑定房间类型下拉框
        $.getJSON("/paracode/findParacodes/002",function (result){
            //alert(JSON.stringify(result));
            for(var i=0;i<result.length;i++){
                $("#zhicheng").append("<option value='"+result[i].parameterValues+"'>"+result[i].parameterName+"</option>");
            }
            //下拉框回显
            $("#zhicheng").val('${doctorVo.doctorTitle}');
        });
    });


    //查询
    function findDoctors(){
        $("#doctor_find_head").submit();
    }

    function goPage(pageIndex){
        $("#doctor_find_head").attr("action","/doctor/find?pageIndex="+pageIndex);
        $("#doctor_find_head").submit();
    }

    //修改日任职状态
    function doctorChangeState(a,doctorId){
        var state=0;
        var text=$(a).text();//获取点击的链接的字
        if(confirm("确定要"+text+"嘛?")){
            if(text=="离职"){
                state=1;
            }
            $.post("/doctor/doctorChangeState",{"state":state,"doctorId":doctorId,"_method":"put"},function (result){
                //alert(JSON.stringify(result));
                if(result.code==200){
                    $(a).text(state==1?'在职':'离职');
                    $(a).parent().prev("td").text(text);
                }
            },"json");
        }

    }

</script>

</html>
