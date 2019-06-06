<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Try Bootstrap Online</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <script src="${ctx}/static/plugins/layui/layui.js"></script>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/2.0.0/jquery.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body{
            background-color: #75b9e6;
        }
    </style>
</head>
<body>
<center>
    <div style="margin-top: 150px;width: 400px;">
        <div style="color: #768399;background-color: #75b9e6;padding-bottom: 5px;" >
            <h2>App信息管理平台</h2>
        </div>
        <div style="background-color: white;width: 400px; border-radius: 25px;">
            <div  style="width: 300px">
                <hr>
                <ul id="myTab" class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">
                        开发者登录</a></li>
                    <li><a href="#ios" data-toggle="tab">后台管理登录</a></li>

                </ul>
            </div>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="home">
                    <div class="layui-container"  style="width: 300px;margin-top: 30px">
                        <form action="${ctx}/dev/login" method="post" class="layui-form">
                            <div class="layui-form-item" style="width: 300px">
                                <div class="layui-input-block" style="margin-left: 0">
                                    <input type="text" name="devCode" required lay-verify="required" value="test001"
                                           placeholder="请输入用户名" autocomplete="off"
                                           class="layui-input" style="width: 300px">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block" style="margin-left: 0">
                                    <input type="password" name="devPassword" required lay-verify="required" value="123456"
                                           placeholder="请输入密码" autocomplete="off"
                                           class="layui-input" style="width: 300px">
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <div class="layui-input-block" style="margin-left: 0;padding-bottom: 8px">
                                    <button class="layui-btn layui-btn-radius layui-btn-normal" lay-submit lay-filter="formDemo" style="width: 300px;">登录</button>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
                <div class="tab-pane fade" id="ios">
                    <div class="layui-container"  style="width: 300px;margin-top: 30px">
                        <form action="${ctx}/user/login" method="post" class="layui-form">
                            <div class="layui-form-item" style="width: 300px">
                                <div class="layui-input-block" style="margin-left: 0">
                                    <input type="text" name="userCode" required lay-verify="required" value="admin"
                                           placeholder="请输入用户名" autocomplete="off"
                                           class="layui-input" style="width: 300px">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block" style="margin-left: 0">
                                    <input type="password" name="userPassword" required lay-verify="required" value="123456"
                                           placeholder="请输入密码" autocomplete="off"
                                           class="layui-input" style="width: 300px">
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <div class="layui-input-block" style="margin-left: 0;padding-bottom: 8px">
                                    <button class="layui-btn layui-btn-radius layui-btn-normal" lay-submit lay-filter="formDemo" style="width: 300px;">登录</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</center>
<script>
    $(function () {
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        });
    });
</script>

</body>
</html>