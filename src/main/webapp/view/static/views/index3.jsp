<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
	<meta name="keywords" content="汪汪喵呜孤儿院,护佑流浪动物回家路,流浪猫领养计划,领养,动物保护,动物福利,中国犬只福利大奖,爱领养">
	<title>留言</title>

	<link rel="stylesheet" type="text/css" href="../css/semantic.min.css">
	<link rel="stylesheet" type="text/css" href="../css/frontend.css">

	<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="../js/semantic.min.js"></script>
	<script  type="text/javascript" src="../js/jquery.bgswitcher.js"></script>
	<script type="text/javascript" src="../js/frontend.js"></script>


	<!-- Global site tag (gtag.js) - Google Analytics -->
	<%--		<script async src="js/5ca511e3e6df4a8eb9c628a309fd91d3.js"></script>--%>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());

		gtag('config', 'UA-20409328-1');
		$(document).ready(function(){
			// 当表单提交时
			$('#message-form').submit(function(event){
				event.preventDefault(); // 阻止默认的表单提交行为

				// 获取表单数据
				var formData = $(this).serialize();

				// 发送 POST 请求以保存留言
				$.post('save_message.php', formData, function(response){
					// 清空表单
					$('#message-form')[0].reset();

					// 显示成功消息
					alert('留言提交成功！');

					// 刷新留言列表
					fetchMessages();
				});
			});

			// 加载页面时获取并显示留言
			fetchMessages();
		});

	</script>
	<style>
		.segment {
			background-color: #7BAE4F; /* 设置背景颜色为灰色 */
			padding-bottom: 100px;
		}


		#data-table {
			width: 90%;
			margin-left: 75px; /* 页面宽度的五分之一 */
			margin-right: 35px; /* 页面宽度的五分之一 */
			border-collapse: collapse;
			background-color: #ffffff;
			border: 1px solid #dddddd;
			box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		}

		#data-table th, #data-table td {
			padding: 12px 15px;
			text-align: left;
			border-bottom: 1px solid #dddddd;
		}

		#data-table th {
			background-color: #f2f2f2;
		}

		#data-table tbody tr:hover {
			background-color: #f5f5f5;
		}

		#data-table tbody tr:nth-child(even) {
			background-color: #f9f9f9;
		}
		.background {
			background-color: #7BAE4F; /* 设置背景色 */
			padding: 20px; /* 添加一些内边距 */
			text-align: center; /* 文本居中 */
		}

	</style>
</head>

<body>
<header>
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
	<div class="wrap center">
		<ul id="menu">
			<li><a href="index.jsp"><div>HOME</div><div>首页</div></a></li>

			<li><a href="index4.jsp"><div>ADOPT</div><div>宠物领养</div></a></li>
			<li><a href="index5.jsp"><div>DONATE</div><div>捐赠</div></a></li>
			<li><a href="index6.jsp"><div>INDIVIDUAL CENTER</div><div>个人中心</div></a></li>
			<li><a href="index3.jsp"><div>LEAVE A MESSAGE</div><div>留言</div></a></li></ul>
	</div>
</header>

<div id="carousel"><div style="background-image: url(../picture/about-us.jpg);"></div></div>

<div class="background">	<table id="data-table">
	<thead>
	<tr>
		<th>name</th>
		<th>message</th>

	</tr>
	</thead>
	<tbody>

	<c:forEach items="${sessionScope.kss3}" var="MessageDomain">
		<tr>
			<td >${MessageDomain.name}</td>
			<td>${MessageDomain.message}</td>
		</tr>
	</c:forEach>


	</tbody>
</table>

</div>
<div class="segment" style="padding-bottom: 100px;">
	<div class="wrap">
		<div class="title">留言板 / <span>Leave a Message</span></div>

		<!-- 留言表单 -->
		<form action="/message" class="ui form" method="post">
			<div class="field">
				<label for="name">姓名:</label>
				<div class="ui icon input">
					<input type="text" id="name" name="name" placeholder="请输入您的姓名" />
					<i class="user icon"></i>
				</div>
			</div>

			<div class="field">
				<label for="message">留言:</label>
				<textarea id="message" name="message" placeholder="请输入您的留言内容"></textarea>
			</div>

			<input type="submit" class="ui green button" value="提交" />
		</form>


		<!-- 显示留言 -->
		<div id="message-list">
			<!-- 留言将会在这里显示 -->
		</div>
	</div>
</div>
<div class="segment" style="height: 300px;background-image: url(../images/partner-background.png);background-repeat: no-repeat;background-size: cover;background-position-x: center"></div>
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
		xhr.open("GET", "/message", true);
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


</script>

</body>
</html>
