<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta name="keywords" content="汪汪喵呜孤儿院,护佑流浪动物回家路,流浪猫领养计划,领养,动物保护,动物福利,中国犬只福利大奖,爱领养">
    <title>个人中心</title>

    <link rel="stylesheet" type="text/css" href="../css/semantic.min.css">
    <link rel="stylesheet" type="text/css" href="../css/frontend.css">

    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../js/semantic.min.js"></script>
    <script  type="text/javascript" src="../js/jquery.bgswitcher.js"></script>
    <script type="text/javascript" src="../js/frontend.js"></script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="js/7dac36bbadff4d3185df1c9154fe731c.js"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-20409328-1');
    </script>
    <style>
        body {
            background-image: url(../picture/blog.jpg);
            background-position: center center;
            background-size: cover;
            width: 960px;
            margin: 0 auto;
        }

        #logo {
            height: 53px;
            margin: 8px;
            display: inline-block;
        }

        #login_wrap {
            width: 400px;
            background-color: rgba(255, 255, 255, 0.2);
            outline: 20px rgba(255, 255, 255, 0.1) solid;
            margin-left: 300px;
            margin-top: 200px;
            border-radius: 10px;
        }

        .ui.form {
            padding: 20px;
        }

        #title {
            font-size: 18px;
            height: 60px;
            color: white;
            text-align: center;
            line-height: 60px;
            background-color: #4682B4;
        }

        #login_wrap h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        #userInfoForm label {
            display: block;
            margin-bottom: 5px;
        }

        #userInfoForm input[type="text"],
        #userInfoForm input[type="password"],
        #userInfoForm textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; /* 保证输入框的尺寸不会超出设置的宽度 */
        }

        #userInfoForm input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #4caf50;
            color: white;
            cursor: pointer;
        }

        #userInfoForm input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<header>
    <form  action="/zhuyeList" class="ui form" method="get">
        <div id="top-bar">
            <div class="wrap">
                <div id="user-panel">
                    <span><img  id="avatar" width=30px height=30px src="data:image/jpeg;base64,<%=request.getSession().getAttribute("avatar")%>"></span>
                    <span class="username" id="username"><%=request.getSession().getAttribute("username") %></span>
                    <a href="../../../login.jsp" style="line-height: 36px;margin-left: 0.5em;">退出</a>
                </div>
                <div class="results"></div>
            </div>
        </div>
    </form>
    <div class="wrap center">
        <ul id="menu">
            <li><a href="index.jsp"><div>HOME</div><div>首页</div></a></li>
            <li><a href="index4.jsp"><div>ADOPT</div><div>宠物领养</div></a></li>
            <li><a href="index5.jsp"><div>DONATE</div><div>捐赠</div></a></li>
            <li><a href="index6.jsp"><div>INDIVIDUAL CENTER</div><div>个人中心</div></a></li>
            <li><a href="index3.jsp"><div>LEAVE A MESSAGE</div><div>留言</div></a></li></ul>
    </div>
</header>



<div id="login_wrap">
        <h1>个人信息</h1>
        <form id="userInfoForm"  action="/gerenzhongxinList" method="post"  onsubmit="submitForm()">
            <span><img  id="avatar1" width=100px height=100px src="data:image/jpeg;base64,<%=request.getSession().getAttribute("avatar")%>"></span>
            <label for="username">ID:</label>
            <input type="text" id="ID" name="ID" value="<%=request.getSession().getAttribute("id")%>" readonly>

            <label for="username">用户名:</label>
            <input type="text" id="username1" name="username1"  value=<%=request.getSession().getAttribute("username")%>>

            <label for="password">密码:</label>
            <input type="password" id="password" name="password" value=<%=request.getSession().getAttribute("password")%>>

            <label for="hobbies">爱好:</label>
            <input type="text" id="hobbies" name="hobbies"  value=<%=request.getSession().getAttribute("like")%>>

            <label for="address">地址:</label>
            <input type="text" id="address" name="address"  value=<%=request.getSession().getAttribute("home")%>>

            <label for="pet">收养的宠物:</label>
            <input type="text" id="pet" name="pet"  value=<%=request.getSession().getAttribute("pet")%>>

            <input type="submit" value="保存">
        </form>
    </div>


</body>
</html>
<script type="text/javascript">
    window.onload = function() {
        // 创建XMLHttpRequest对象
        var xhr = new XMLHttpRequest();

        // 定义请求处理函数
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // 请求成功，处理返回的数据（如果有需要的话）
            }
        };

        // 发送GET请求到Servlet端点
        xhr.open("GET", "/gerenzhongxinList", true);

        xhr.send();
    };
    layui.use('laydate', function() {
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem : '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem : '#end' //指定元素
        });
    });
    function submitForm() {
        // 提交表单后刷新页面
        window.location.reload();

    }
</script>
