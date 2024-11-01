<!DOCTYPE html>
<html lang="zh-cn">
    <head>
		<meta charset="utf-8">
		<title>注册</title>
		
		<link rel="stylesheet" type="text/css" href="../css/semantic.min.css">

		<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="../js/semantic.min.js"></script>
		
		<style>
    		body {
        		background-image: url(../images/login-background.jpg);
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
            <div id="title">用户注册</div>
            <form  action="/zhuce" class="ui form" method="post" enctype="multipart/form-data">
                <div class="field">
                    <div class="ui icon input">
                            <label for="avatar">Avatar:</label>
                            <input type="file" id="avatar" name="avatar" accept="image/*" required>
                    </div>
                </div>
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
                <div class="field">
                    <div class="ui icon input">
                        <input type="text" name="like" placeholder="爱好" />
                        <i class="mail icon"></i>
                    </div>
                </div>
                <div class="field">
                    <div class="ui icon input">
                        <input type="text" name="home" placeholder="地址" />
                        <i class="mail icon"></i>
                    </div>
                </div>
                <div>
                    <input type="submit" class="ui green button" value="提交" style="float:left;">
                    <a href="../../../login.jsp" style="line-height: 36px;margin-left: 0.5em;">返回</a>
                    </div>
                <div style="clear: both"></div>
            </form>

        </div>
            
    </body>
</html>

<script type="text/javascript">
    $(document).ready(function() {
        $('.ui.checkbox').checkbox();
    });</script>