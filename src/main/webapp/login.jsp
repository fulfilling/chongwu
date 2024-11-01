<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
    <head>
		<meta charset="utf-8">
		<title>登录</title>
		
		<link rel="stylesheet" type="text/css" href="view/static/css/semantic.min.css">

		
		<style>
    		body {
        		background-image: url(view/static/images/login-background.jpg);
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
        		background-color: rgba(255, 255, 255, 0.8);
        		outline: 20px rgba(255, 255, 255, 0.1) solid;
        		margin-left: 520px;
        		margin-top: 200px;
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
        		background-color: #21ba45;
    		}
		</style>
    </head>
    <body>
    <div id="login_wrap">
        <div id="title">登 录</div>
        <form  action="/login" class="ui form" method="post">

            <div class="field">
                <div class="ui icon input">
                    <input type="text" name="username" placeholder="用户名" />
                    <i class="user icon"></i>
                </div>
            </div>

            <div class="field">
                <div class="ui icon input">
                    <input type="password" name="password" placeholder="密码" />
                    <i class="lock icon"></i>
                </div>
            </div>
            <div>
                <input type="submit" class="ui green button" value="登录" style="float:left;">
                <a href="view/static/views/index2.jsp" style="line-height: 36px;margin-left: 0.5em;">注册</a>
            </div>
            <div style="clear: both"></div>
        </form>

    </div>


    </body>
</html>

<script type="text/javascript">

        $(document).ready(function() {
            $('.ui.checkbox').checkbox();
        });
</script>