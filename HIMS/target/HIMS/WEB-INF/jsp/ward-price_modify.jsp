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
    <link rel="stylesheet" href="/css/info-reg.css"/>
    <title>医院住院管理系统</title>
</head>
<body>
<div class="title">
    <h2>病房价格调整</h2>
</div>
<div class="main">

    <div class="table-box">
        <form id="updatePriceForm">
            <input style="display: none;" id="total" name="total"/>
            <table>
                <thead>
                <tr>
                    <th class="num">序号</th>
                    <th class="name">病房类型号</th>
                    <th class="process">类型名称</th>
                    <th class="node">调整前的价格(元/天)</th>
                    <th class="operate">调整后的价格(元/天)</th>
                    <th class="operate">上次调整时间</th>
                    <th class="operate">修改价格</th>
                </tr>
                </thead>
                <tbody id="show">
                    <c:forEach items="${requestScope.list}" var="wardType">
                        <tr  style="border-bottom:1px rgb(199,199,199) dashed;">
                            <td class="num">${wardType.id}</td>
                            <td class="name">${wardType.type}</td>
                            <td class="process">${wardType.name}</td>
                            <td class="node">${wardType.price}</td>
                            <td class="operate">

                                <input  type="text" name="updatePrice0" id="price_input_modify_${wardType.id}" style="width:50px;margin-left:100px;color:red;" value="${wardType.price}">
                                <a href="javascript:void(0);" onclick="modify_price1(0)"><img src="/images/edit_remove.png" style="position:relative;left:-72px;top:5px;display: none"></a>
                                <a href="javascript:void(0);" onclick="modify_price2(0)"><img src="/images/edit_add.png" style="position:relative;left:-15px;top:5px;display: none"></a>

                            <td class="operate">${wardType.updateTime}</td>
                            <td class="operate"><a href="javascript:updateWardTypePrice(${wardType.id});" id="save" class="confirm">保存</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </form>
    </div>
</div>
</body>
<script>

    function updateWardTypePrice(id){
        var price=$("#price_input_modify_"+id).val();
        //需要校验price合法性(暂时忽略)
        $.ajax({
            url:"/category/updateWardTypePrice",
            data:{"id":id,"price":price,"_method":"put"},
            dataType:"json",
            type:"post",
            success:function (result){
                //alert(JSON.stringify(result));
                if(result.code==200){
                    alert("价格修改成功");
                    var nowtime=result.data;
                    $("#price_input_modify_"+id).parent().next("td").text(nowtime);
                }else{
                    alert("价格修改异常");
                }
            }
        });
    }

</script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/core.js"></script>
<script type="text/javascript" src="/js/jquery.dialog.js"></script>
</html>
