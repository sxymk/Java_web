&#160
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="${ctx}/public/logo.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${ctx}/public/css/font.css">
    <link rel="stylesheet" href="${ctx}/public/css/xadmin.css">
</head>
<body>
<div class="x-body layui-anim layui-anim-up">
    <blockquote class="layui-elem-quote"style="border-left: 5px solid #248cf5;">欢迎：
        <span class="x-red"style="color: #2816a1;">${sessionScope.userName }</span>！</blockquote>
    <fieldset class="layui-elem-field">
        <legend>当日值班人员</legend>
        <div class="layui-field-box">
            <div class="layui-col-md12" style="margin-bottom: 10px; margin-top: 10px; margin-left: 15px;">
                <div class="layui-col-md13" style="margin-bottom: 10px; border-color: #E6E6E6FF">当前日期：2022年${cmonth}月${cday}日 ${xingqiji}</div>
                <div class="layui-col-md13" style="margin-bottom: 10px; border-color: #E6E6E6FF">保安：${baoan}</div>
                <div class="layui-col-md14" style="margin-bottom: 10px; border-color: #E6E6E6FF">保洁员：${baojie}</div>
                <div class="layui-col-md15" style="margin-bottom: 10px; border-color: #E6E6E6FF">维修员：${weixiu}</div>
                <div class="layui-col-md16" style="margin-bottom: 10px; border-color: #E6E6E6FF">程序员：${chengxu}</div>
            </div>
        </div>
    </fieldset>
    <fieldset class="layui-elem-field">
        <legend>近期公告</legend>
        <div class="layui-field-box">
            <table class="layui-table" lay-skin="line">
                <tbody>
                <tr>
                    <td >
                        <a class="x-a" href="https://www.sohu.com/a/489185151_99965003" target="_blank">关于中秋及国庆假期调休安排</a>
                    </td>
                </tr>
                <tr>
                    <td >
                        <a class="x-a" href="https://baijiahao.baidu.com/s?id=1658116433996236453&wfr=spider&for=pc" target="_blank">受疫情影响申请在家办公指南</a>
                    </td>
                </tr>
                <c:forEach items="${sessionScope.a}" var="dept" varStatus="stat">
                    <tr>
                        <td>
                            <a class="x-a" href="${ctx}/dept/content2?news_content=${dept }"> ${dept }</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </fieldset>
    <blockquote class="layui-elem-quote layui-quote-nm">已经到达底部。</blockquote>
</div>
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
</body>
</html>