&#160
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>费用查询</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="${ctx}/public/logo.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/public/css/font.css">
    <link rel="stylesheet" href="${ctx}/public/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/public/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/public/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="${ctx }/fee/pay">首页</a>
        <a>
          <cite>费用记录</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="background-color: #248cf5;line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:38px">ဂ</i></a>
</div>
<div class="x-body">


    <%-- <xblock>
<!--        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button> -->
      <button class="layui-btn" onclick="x_admin_show('添加用户','${ctx}/dept/add')"><i class="layui-icon"></i>添加</button>
      <span class="x-right" style="line-height:40px">共有数据：88 条</span>
    </xblock> --%>


    <table class="layui-table">
        <thead>
        <tr>
            <th>月份</th>
            <th>当月用水量(立方米)</th>
            <th>当月应缴水费(元)</th>
            <th>缴纳状况</th>
            <th></th>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.waterFee}" var="w" varStatus="stat">
            <tr>
                <td>${w.month }</td>
                <td>${w.consumption }</td>
                <td>${w.fee }</td>
                <td>${w.status}</td>
                <td><input  onclick="x_admin_show('缴纳','${ctx }/fee/code?record_id=${w.record_id }&s=1');" href="javascript:;"  type="submit" value="缴费" class="layui-btn" style="background-color: #248cf5; margin-left:60px;"  lay-filter="edit" lay-submit=""/></td>
            </tr>




        </c:forEach>




        </tbody>
    </table>



        <table class="layui-table">
            <thead>
            <tr>
                <th>月份</th>
                <th>当月用电量(千瓦时)</th>
                <th>当月应缴电费(元)</th>
                <th>缴纳状况</th>
                <!-- <th>状态</th> -->
                <th></th>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.eleFee}" var="w" varStatus="stat">
                <tr>
                    <td>${w.month }</td>
                    <td>${w.consumption }</td>
                    <td>${w.fee }</td>
                    <td>${w.status}</td>

                          <td><input  onclick="x_admin_show('缴纳','${ctx }/fee/code?record_id=${w.record_id }&s=2');" href="javascript:;"  type="submit" value="缴费" class="layui-btn" style="background-color: #248cf5; margin-left:60px;"  lay-filter="edit" lay-submit=""/></td>

                </tr>




            </c:forEach>




            </tbody>
        </table>

    <!--  <div class="page">
       <div>
         <a class="prev" href="">&lt;&lt;</a>
         <a class="num" href="">1</a>
         <span class="current">2</span>
         <a class="num" href="">3</a>
         <a class="num" href="">489</a>
         <a class="next" href="">&gt;&gt;</a>
       </div>
     </div> -->

</div>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });

    /*用户-停用*/
    function member_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){

            if($(obj).attr('title')=='启用'){

                //发异步把用户状态进行更改
                $(obj).attr('title','停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!',{icon: 5,time:1000});

            }else{
                $(obj).attr('title','启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!',{icon: 5,time:1000});
            }

        });
    }

    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            //等以后再使用异步，这里先使用
            $.get("${ctx}/dept/delete?id="+id);
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }



    function delAll (argument) {

        var data = tableCheck.getData();

        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }

</script>

<script>var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>


<script>


</html>