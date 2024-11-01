<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
	<meta name="keywords" content="汪汪喵呜孤儿院,护佑流浪动物回家路,流浪猫领养计划,领养,动物保护,动物福利,中国犬只福利大奖,爱领养">
	<title>捐赠</title>

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
			background-image: url(../images/img.png);
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
			background-color: #c242a6;
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
	<div id="title">宠物捐赠</div>
	<form action="/juanzeng" class="ui form" method="post" enctype="multipart/form-data"onsubmit="return validateForm()">
		<div class="field">
			<label for="photo">宠物照片:</label>
			<div class="ui action input">
				<input type="text" id="photoFileName" placeholder="选择图片" readonly>
				<input type="file" id="photo" name="photo" accept="image/*" style="display: none;">
				<div class="ui button" onclick="document.getElementById('photo').click();">上传图片</div>
			</div>
		</div>

		<script>
			document.getElementById('photo').addEventListener('change', function() {
				var input = this;
				var fileName = input.value.split('\\').pop(); // 获取文件名
				document.getElementById('photoFileName').value = fileName; // 将文件名显示在输入框中
			});
		</script>


		<div class="field">
			<div class="ui icon input">
				<input type="text" name="pet_name" placeholder="宠物名字" />
				<i class="paw icon"></i>
			</div>
		</div>

		<div class="field">
			<div class="ui icon input">
				<input type="text" name="gender" placeholder="性别" />
				<i class="genderless icon"></i>
			</div>
		</div>
		<div class="field">
			<div class="ui icon input">
				<input type="text" name="age" placeholder="宠物年龄" />
				<i class="paw icon"></i>
			</div>
		</div>
		<div class="field">
			<div class="ui icon input">
				<input type="text" name="species" placeholder="物种" />
				<i class="bug icon"></i>
			</div>
		</div>
		<div class="field">
			<div class="ui icon input">
				<input type="text" name="type" placeholder="类型" />
				<i class="tags icon"></i>
			</div>
		</div>
		<div style="text-align: center;">
			<input type="submit" class="ui blue button" value="提交">
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
	function validateForm() {
		// 获取表单字段的值
		var photo = document.getElementById('photo').value;
		var petName = document.getElementsByName('pet_name')[0].value;
		var gender = document.getElementsByName('gender')[0].value;
		var age = document.getElementsByName('age')[0].value;
		var species = document.getElementsByName('species')[0].value;
		var type = document.getElementsByName('type')[0].value;

		// 验证宠物照片是否已经上传
		if (photo === '') {
			alert('请上传宠物照片');
			return false;
		}

		// 验证宠物名字是否为空
		if (petName.trim() === '') {
			alert('请输入宠物名字');
			return false;
		}

		// 验证性别是否为空
		if (gender.trim() === '') {
			alert('请输入性别');
			return false;
		}

		// 验证年龄是否为数字且不为空
		if (isNaN(age) || age.trim() === '') {
			alert('请输入有效的宠物年龄');
			return false;
		}

		// 验证物种是否为空
		if (species.trim() === '') {
			alert('请输入物种');
			return false;
		}

		// 验证类型是否为空
		if (type.trim() === '') {
			alert('请输入类型');
			return false;
		}

		// 如果所有验证都通过，返回 true 允许提交表单
		return true;
	}</script>
