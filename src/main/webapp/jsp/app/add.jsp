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
            <form class="layui-form" action="${ctx}/app/add" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">软件名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="softwareName" lay-verify="title" autocomplete="off"
                               placeholder="请输入软件名称" value="${appinfoDTO.softwareName}"
                               class="layui-input">
                    </div>
                    <label class="layui-form-label">APK名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="apkName" lay-verify="title" autocomplete="off"
                               placeholder="请输入APK名称" value="${appinfoDTO.softwareName}"
                               class="layui-input">
                    </div>
                    <label class="layui-form-label">支持ROM</label>
                    <div class="layui-input-inline">
                        <input type="text" name="supportROM" lay-verify="title" autocomplete="off"
                               placeholder="请输入支持ROM" value="${appinfoDTO.softwareName}"
                               class="layui-input">
                    </div>
                    <label class="layui-form-label">界面语言</label>
                    <div class="layui-input-inline">
                        <input type="text" name="interfaceLanguage" lay-verify="title" autocomplete="off"
                               placeholder="请输入界面语言" value="${appinfoDTO.softwareName}"
                               class="layui-input">
                    </div>


                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">软件大小</label>
                    <div class="layui-input-inline">
                        <input type="text" name="softwareSize" lay-verify="title" autocomplete="off"
                               placeholder="请输入软件大小" value="${appinfoDTO.softwareName}"
                               class="layui-input">
                    </div>
                    <label class="layui-form-label">应用简介</label>
                    <div class="layui-input-inline">
                        <input type="text" name="appInfo" lay-verify="title" autocomplete="off"
                               placeholder="请输入应用简介" value="${appinfoDTO.softwareName}"
                               class="layui-input">
                    </div>
                    <%--TODO所属平台--%>
                    <label class="layui-form-label">所属平台</label>
                    <div class="layui-input-inline">
                        <select name="flarform.valueId" lay-filter="aihao">
                            <option value="" selected>--请选择--</option>
                            <c:forEach items="${appFlatform}" var="obj">
                                <option value="${obj.valueId}">${obj.valueName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <%--TODO应用状态--%>
                   <%-- <label class="layui-form-label">APP状态</label>
                    <div class="layui-input-inline">
                        <select name="status" lay-filter="aihao">
                            <option value="" selected>--请选择--</option>
                            <c:forEach items="${appStatus}" var="obj">
                                <option value="${obj.valueId}">${obj.valueName}</option>
                            </c:forEach>
                        </select>
                    </div>--%>


                </div>
                <div class="layui-form-item">


                    <%--TODO一级分类--%>
                    <%--TODO二级分类--%>
                    <%--TODO三级分类--%>
                    <label class="layui-form-label">一级分类</label>
                    <div class="layui-input-inline">
                        <select name="categoryLevel1.id" lay-filter="levelOne" id="levelOne">
                            <option value="" selected>--请选择--</option>
                            <c:forEach items="${LevelOne}" var="obj">
                                <option value="${obj.id}">${obj.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <label class="layui-form-label">二级分类</label>
                    <div class="layui-input-inline">
                        <select name="categoryLevel2.id" lay-filter="levelTwo" id="levelTwo">
                            <option value="" selected>--请选择--</option>
                        </select>
                    </div>


                    <label class="layui-form-label">三级分类</label>
                    <div class="layui-input-inline">
                        <select name="categoryLevel3.id" lay-filter="levelThree" id="levelThree">
                            <option value="" selected>--请选择--</option>

                        </select>
                    </div>

                </div>
                <div class="layui-form-item" style="padding-bottom: 15px">
                    <div class="layui-input-block">
                        <button class="layui-btn layui-btn-normal layui-btn-radius" lay-submit
                                lay-filter="formDemo">提交APP信息
                        </button>
                        <button type="reset" class="layui-btn layui-btn-primary layui-btn-radius">重置</button>
                    </div>
                </div>
            </form>

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
        //监听levelOne
        form.on('select(levelOne)', function (data) {
            /*  var html = "<option>手机</option>"
              $("#levelTwo").html(html);
              //layui修改完成后需要重新渲染
              form.render();*/
            var levelOneId = $('#levelOne').val();

            if (levelOneId == '') {
                var html = '<option value=""  selected>--请选择--</option>';
                $("#levelTwo").html(html);
                $("#levelThree").html(html);
                form.render();
                return;
            } else {
                $.ajax({
                    url: '${ctx}/category/queryLevelTwoByLevelOne/' + levelOneId,
                    type: 'get',
                    success: function (data) {
                        //根据data修改数据render重新渲染
                        var html = '<option value="" selected>--请选择--</option>';
                        var len = data.length;
                        var levelTwo = '${appinfoDTO.levelTwo}';
                        for (var i = 0; i < len; i++) {
                            html += '<option value="' + data[i].id + '"';
                            if (data[i].id == levelTwo) {
                                html += ' selected ';
                            }
                            html += '>' + data[i].categoryName + '</option>'
                        }
                        $("#levelTwo").html(html);
                        form.render();
                    }
                })
            }

        });

        //监听levelTwo
        form.on('select(levelTwo)', function (data) {
            var levelTwoId = $('#levelTwo').val();
            if (levelTwoId == '') {
                var html = '<option value="" selected>--请选择--</option>';
                $("#levelThree").html(html);
                form.render();
                return;
            } else {
                $.ajax({
                    url: '${ctx}/category/queryLevelTwoByLevelTwo/' + levelTwoId,
                    type: 'get',
                    success: function (data) {
                        //根据data修改数据render重新渲染
                        var html = '<option value="" selected>--请选择--</option>';
                        var len = data.length;
                        for (var i = 0; i < len; i++) {
                            html += '<option value="' + data[i].id + '">' + data[i].categoryName + '</option>'
                        }
                        $("#levelThree").html(html);
                        form.render();
                    }
                })
            }

        });

    });
</script>
</body>


</html>
