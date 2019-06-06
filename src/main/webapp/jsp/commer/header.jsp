<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: JiangYuhao
  Date: 2019/5/28
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="layui-header">
    <div class="layui-logo">APP BMS</div>

    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                <c:if test="${UserCategory =='开发者' }">
                    ${sessionScope.devUser.devName}
                </c:if>
                <c:if test="${UserCategory =='管理员' }">
                    ${sessionScope.User.userCode}
                </c:if>

            </a>

        </li>
        <li class="layui-nav-item"><a href="${ctx}/dev/logout">退了</a></li>
    </ul>
</div>

<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="javascript:;">后台首页</a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">App应用管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="
                     <c:if test="${UserCategory =='开发者' }">
                     ${ctx}/app/index/devId/${sessionScope.devUser.id}
                    </c:if>
                    <c:if test="${UserCategory =='管理员' }">
                        ${ctx}/user/app/index/devId/${sessionScope.User.id}
                    </c:if>
                    ">App维护</a></dd>

                </dl>
            </li>
        </ul>
    </div>
</div>
