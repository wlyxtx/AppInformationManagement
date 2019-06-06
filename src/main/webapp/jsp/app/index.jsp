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

        a {
            text-decoration: none;
            border-bottom: 0;
        }

        a:link, a:visited, a:hover {
            text-decoration: none;
            border-bottom: 0;
        }

        a:hover {
            text-decoration: none;
            border-bottom: 0;
           color: black;

        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/jsp/commer/header.jsp"/>

    <div class="layui-body" style="background-color: #e6e6e6">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">

            <%--数据分类查询--%>
            <div style="margin:0;background-color: white">
                <form class="layui-form" action="${ctx}/app/query" method="post">
                    <input type="hidden" name="pageNum" value="1"><%--存放页码信息--%>
                    <div class="layui-form-item">
                        <label class="layui-form-label">软件名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="softwareName" lay-verify="title" autocomplete="off"
                                   placeholder="请输入要查询的软件名称" value="${appinfoDTO.softwareName}"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">APP状态</label>
                        <div class="layui-input-inline">
                            <select name="appStatus" lay-filter="aihao">
                                <option value="" selected>--请选择--</option>
                                <c:if test="${obj.id eq appStatus}">
                                    selected
                                </c:if>
                                <c:forEach items="${appStatus}" var="obj">
                                    <option value="${obj.valueId}" <c:if test="${obj.id eq appinfoDTO.appStatus }">
                                        selected
                                    </c:if>>${obj.valueName}</option>
                                </c:forEach>

                            </select>
                        </div>

                        <label class="layui-form-label">所属平台</label>
                        <div class="layui-input-inline">
                            <select name="appFlatform" lay-filter="aihao">
                                <option value="" selected>--请选择--</option>

                                <c:forEach items="${appFlatform}" var="obj">

                                    <option value="${obj.valueId}"  <c:if test="${obj.id eq appinfoDTO.appFlatform}">
                                        selected
                                    </c:if>>${obj.valueName}</option>
                                </c:forEach>
                            </select>
                        </div>

                    </div>
                    <div class="layui-form-item">

                        <label class="layui-form-label">一级分类</label>
                        <div class="layui-input-inline">
                            <select name="levelOne" lay-filter="levelOne" id="levelOne">
                                <option value="" selected>--请选择--</option>
                                <c:forEach items="${LevelOne}" var="obj">
                                    <option value="${obj.id}"  <c:if test="${obj.id eq appinfoDTO.levelOne}">
                                        selected
                                    </c:if>>${obj.categoryName}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <label class="layui-form-label">二级分类</label>
                        <div class="layui-input-inline">
                            <select name="levelTwo" lay-filter="levelTwo" id="levelTwo">
                                <option value="" selected>--请选择--</option>
                            </select>
                        </div>


                        <label class="layui-form-label">三级分类</label>
                        <div class="layui-input-inline">
                            <select name="levelThree" lay-filter="levelThree" id="levelThree">
                                <option value="" selected>--请选择--</option>

                            </select>
                        </div>

                    </div>
                    <div class="layui-form-item" style="padding-bottom: 15px">
                        <div class="layui-input-block">
                            <button class="layui-btn layui-btn-normal layui-btn-radius" lay-submit
                                    lay-filter="formDemo">查询
                            </button>
                            <button type="reset" class="layui-btn layui-btn-primary layui-btn-radius">重置</button>
                        </div>
                    </div>
                </form>
            </div>

            <%--数据显示部分--%>
            <div style="background-color: white">
                <div class="layui-input-block" style="padding-top: 25px;margin-left: 15px">
                    <a href="${ctx}/app/toAdd">
                        <button class="layui-btn layui-btn-radius" lay-submit lay-filter="formDemo">新增APP产品信息</button>
                    </a>
                </div>
                <table class="layui-table" style="">
                    <thead>
                    <tr style="background-color: white">
                        <th>软件名称</th>
                        <th>APK名称</th>
                        <th>软件大小(Mb)</th>
                        <th>所属平台</th>
                        <th>所属分类(一级、二级、三级分类)</th>
                        <th>状态</th>
                        <th>下载次数</th>
                        <th>最新版本号</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.list}" var="obj">
                        <tr>
                            <td>${obj.softwareName}</td>
                            <td>${obj.apkName}</td>
                            <td>${obj.softwareSize}</td>
                            <td>
                                <c:if test="${obj.flatformId eq 1}">
                                    手机
                                </c:if>
                                <c:if test="${obj.flatformId eq 2}">
                                    平板
                                </c:if>
                                <c:if test="${obj.flatformId eq 3}">
                                    通用
                                </c:if>
                            </td>
                            <td>
                                    ${obj.categoryLevel1.categoryName}->>${obj.categoryLevel2.categoryName}->>${obj.categoryLevel3.categoryName}
                            </td>
                            <td>
                                <c:if test="${obj.status eq 1}">
                                    待审核
                                </c:if>
                                <c:if test="${obj.status eq 2}">
                                    审核通过
                                </c:if>
                                <c:if test="${obj.status eq 3}">
                                    审核不通过
                                </c:if>
                                <c:if test="${obj.status eq 4}">
                                    已上架
                                </c:if>
                                <c:if test="${obj.status eq 5}">
                                    已下架
                                </c:if>
                            </td>
                            <td>${obj.downloads}</td>
                            <td>${obj.newAppVersion.versionNo}</td>
                            <td>
                                <a href="${ctx}/app/queryById/${obj.id}"><i class="layui-icon layui-icon-more"></i></a>
                                <a href="${ctx}/app/toEdit/${obj.id}"><i class="layui-icon layui-icon-edit"></i></a>
                                <a href="${ctx}/app/delete/${obj.id}"><i class="layui-icon layui-icon-delete"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <%--页码导航--%>
            <div>
                <input hidden name="pageNum" value="1">
                <div style="position:absolute;left:15px; ">

                    <p>
                        共${page.total}条数据${page.pageNum}/${page.pages}页
                    </p>
                </div>
                <div style="position:absolute;right: 15px; ">


                    <p>
                        <a page="first" href="javascript:void(0)">
                            <button class="layui-btn layui-btn-normal layui-btn-radius"
                                    style="height: 28px;line-height: 28px">首页
                            </button>
                        </a>
                        <a page="prev" href="javascript:void(0)">
                            <button class="layui-btn layui-btn-normal layui-btn-radius"
                                    style="height: 28px;line-height: 28px">上一页
                            </button>
                        </a>
                        <a page="next" href="javascript:void(0)">
                            <button class="layui-btn layui-btn-normal layui-btn-radius"
                                    style="height: 28px;line-height: 28px">下一页
                            </button>
                        </a>
                        <a page="last" href="javascript:void(0)">
                            <button class="layui-btn layui-btn-normal layui-btn-radius"
                                    style="height: 28px;line-height: 28px">尾页
                            </button>
                        </a>
                    </p>
                </div>
            </div>

        </div>
    </div>

    <jsp:include page="/jsp/commer/fotter.jsp"/>
</div>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>

    layui.use(['form', 'element', 'layedit', 'laydate', 'jquery'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;
        var element = layui.element;
        var $ = layui.jquery;
        //分页事件
        $('a[page]').click(function () {
            var pageNum = 1;
            var v = $(this).attr("page");//first?last?
            var currPage = '${page.pageNum}';//当前页
            var totalPages = '${page.pages}';//总页数
            switch (v) {
                case  "first":
                    pageNum = 1;
                    break;
                case  "prev":
                    pageNum = currPage - 1;
                    if (pageNum < 1) {
                        pageNum = 1;
                    }
                    break;
                case  "next":
                    pageNum = parseInt(currPage) + 1;
                    if (pageNum > totalPages) {
                        pageNum = totalPages;
                    }
                    break;
                case  "last":
                    pageNum = totalPages;
                    break;
            }
            //更新隐藏域的值
            $("input[name=pageNum]").val(pageNum);
            //提交表单
            $("form").submit();
        })
        //分页end
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
        //保留分级目录
        $(function () {
            //取出一级分类的值
            var levelOne = $("#levelOne").val();
            if (levelOne != null && levelOne != '' && levelOne != 0) {
                var levelTwo = '${appinfoDTO.levelTwo}';
                if (levelTwo != null && levelTwo != '' && levelTwo != undefined) {
                    //  alert("levelOne已经选择了" + levelOne + "levelTwo已经选择了" + levelTwo);
                    //经过判断一级二级已经选择过  重新渲染二级selecte
                    $.ajax({
                        url: '${ctx}/category/queryLevelTwoByLevelOne/' + levelOne,
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
                    var levelThree = '${appinfoDTO.levelThree}';
                    //三级目录也不为空
                    $.ajax({
                        url: '${ctx}/category/queryLevelTwoByLevelTwo/' + levelTwo,
                        type: 'get',
                        success: function (data) {
                            //根据data修改数据render重新渲染
                            var html = '<option value="" selected>--请选择--</option>';
                            var len = data.length;
                            for (var i = 0; i < len; i++) {
                                html += '<option value="' + data[i].id + '"';
                                if (data[i].id == levelThree) {
                                    html += ' selected ';
                                }
                                html += '>' + data[i].categoryName + '</option>'
                            }
                            $("#levelThree").html(html);
                            form.render();
                        }
                    })
                }

            }
        });
        //保留分级目录end

    });


</script>
</body>


</html>
