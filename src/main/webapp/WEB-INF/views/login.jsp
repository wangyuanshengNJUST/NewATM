<%--
  Created by IntelliJ IDEA.
  User: 王元圣
  Date: 2020/8/30
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<!DOCTYPE html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>easyui/themes/icon.css">
    <script type="text/javascript" src="<%=basePath %>easyui/jquery-1.7.2.min.js">
    </script>
    <script type="text/javascript" src="<%=basePath %>easyui/jquery.easyui.min.js">
    </script>
</head>
<body>
<div id="content">
    <div id="box">
        <div class="title">Login</div>
        <div class="input">
            <input type="text" id="username" name="userid" value="" placeholder="用户名" style="margin: 30px"/>
            <br>
            <br>
            <br>
            <input type="password" id="password" name="password" placeholder="密码"/>
            <br>
            <button type="button" onclick="login()">登录</button>
        </div>
        <p id="message"></p>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    $(function () {
        $('#password').passwordbox({
            prompt: 'Password',
            checkInterval: 500,
            showEye: true,
        });
        $('#username').textbox({
            iconCls: 'icon-man',
            iconAlign: 'left'
        })
    });

    function login() {
        var name = $("#username").val();
        var pwd = $("#password").val();
        if (name == "" || name == null) {
            alert("用户名不能为空")
            return;
        }
        if (pwd == "" || pwd == null) {

            alert("密码不能为空")
            return;
        }
        $.post(
            "login",
            "userid=" + name + "&password=" + pwd,
            function (data) {
                if (data == "succes") {
                    // this.$router.push({
                    //     "path": "/app_surpport/mappingTable",
                    // });
                    window.location.href = "${pageContext.request.contextPath}/succes?userid="+name;
                }

                if (data == "faild") {
                    alert("用户名或密码错误")
                }
            })
    }
</script>
<style type="text/css">
    * {
        margin: 0px;
    }

    #content {
        width: 100%;
        height: 100vh;
        border: 1px transparent solid;
        background-image: url('${pageContext.request.contextPath}/bg.jpg')
    }

    #box {
        margin: 50px auto;
        width: 30%;
        height: 360px;
        background-color: #fff;
        text-align: center;
        border-radius: 15px;
        border: 2px #fff solid;
        box-shadow: 10px 10px 5px #000000;
    }

    .title {
        line-height: 58px;
        margin-top: 20px;
        font-size: 36px;
        color: #000;
        height: 58px;
    }

    #box:hover {
        border: 2px #fff solid;
    }

    .input {
        margin-top: 20px;
    }

    #username {

    }

    #password {

    }

    button {
        margin-top: 20px;
        border: none;
        color: #000;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 13px;
        border-radius: 15px;
        background-color: #CCCCCC;
    }

    button:hover {
        background-color: #1f637b;
        color: #fff;
    }
</style>