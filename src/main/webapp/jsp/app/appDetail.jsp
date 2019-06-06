<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: JiangYuhao
  Date: 2019/5/28
  Time: 20:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>App信息管理系统</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <style>
        body {
            zoom: 0.8;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/jsp/commer/header.jsp"/>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <h2>软件基础信息</h2>

            <input type="hidden" name="id" value="${app.id}">
            <div class="layui-form-item">
                <label class="layui-form-label">软件名称</label>
                <div class="layui-input-inline">
                    <input disabled type="text" name="softwareName" lay-verify="title" autocomplete="off"
                           placeholder="请输入软件名称" value="${app.softwareName}"
                           class="layui-input">
                </div>
                <label class="layui-form-label">APK名称</label>
                <div class="layui-input-inline">
                    <input disabled type="text" name="apkName" lay-verify="title" autocomplete="off"
                           placeholder="请输入APK名称" value="${app.apkName}"
                           class="layui-input">
                </div>
                <label class="layui-form-label">支持ROM</label>
                <div class="layui-input-inline">
                    <input disabled type="text" name="supportROM" lay-verify="title" autocomplete="off"
                           placeholder="请输入支持ROM" value="${app.supportROM}"
                           class="layui-input">
                </div>
                <label class="layui-form-label">界面语言</label>
                <div class="layui-input-inline">
                    <input disabled type="text" name="interfaceLanguage" lay-verify="title" autocomplete="off"
                           placeholder="请输入界面语言" value="${app.interfaceLanguage}"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">软件大小</label>
                <div class="layui-input-inline">
                    <input disabled type="text" name="softwareSize" lay-verify="title" autocomplete="off"
                           placeholder="请输入软件大小" value="${app.softwareSize}"
                           class="layui-input">
                </div>
                <label class="layui-form-label">应用简介</label>
                <div class="layui-input-inline">
                    <input disabled type="text" name="appInfo" lay-verify="title" autocomplete="off"
                           placeholder="请输入应用简介" value="${app.appInfo}"
                           class="layui-input">
                </div>

            </div>
            <div   class="layui-table">
                <h2>历史版本信息</h2>
                <table>
                    <thead>
                    <tr>
                        <th>版本编号</th>
                        <th>APK文件名称</th>
                        <th>APK位置</th>
                        <th>下载链接</th>
                        <th>版本大小</th>
                        <th>版本信息</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${app.appVersion}" var="obj">
                        <tr>
                            <td>${obj.versionNo}</td>
                            <td>${obj.apkFilename}</td>
                            <td>${obj.apklocPath}</td>
                            <td>${obj.downloadLink}</td>
                            <td>${obj.versionSize}</td>
                            <td>${obj.versionInfo}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>

        <jsp:include page="/jsp/commer/fotter.jsp"/>
    </div>
    <script src="${ctx}/static/plugins/layui/layui.js"></script>
    <script>
        //JavaScript代码区域
        layui.use(['form', 'element', 'layedit', 'laydate', 'jquery'], function () {
            var form = layui.form
                , layer = layui.layer
                , layedit = layui.layedit
                , laydate = layui.laydate;
            var element = layui.element;
            var $ = layui.jquery;


        });
    </script>
</body>


</html>
