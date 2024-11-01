
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="utf-8">
		<meta name="keywords" content="汪汪喵呜孤儿院,护佑流浪动物回家路,流浪猫领养计划,领养,动物保护,动物福利,中国犬只福利大奖,爱领养">
		<title>首页</title>
		
		<link rel="stylesheet" type="text/css" href="../css/semantic.min.css">
		<link rel="stylesheet" type="text/css" href="../css/frontend.css">
		<link rel="stylesheet" href="../css/layui.js">


		<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="../js/semantic.min.js"></script>
		<script  type="text/javascript" src="../js/jquery.bgswitcher.js"></script>
		<script type="text/javascript" src="../js/frontend.js"></script>
		
				
		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script async src="../js/d6fdf2faf6c944b99fdf8a32e72fab48.js"></script>
		<script>
		  window.dataLayer = window.dataLayer || [];
		  function gtag(){dataLayer.push(arguments);}
		  gtag('js', new Date());
		
		  gtag('config', 'UA-20409328-1');
		</script>
		<style>
			body {
				background-image: url(../images/pet.jpg);
				background-position: center center;
				background-size: cover;
				width: 960px;
				margin: 0 auto;
			}
				 /* 设置表格边框样式和间距 */
			 #data-table {
				 border-collapse: collapse;
				 color: #0f0f10;
				 width: 100%;
			 }

			/* 设置表头和表格单元格的背景色和字体样式 */
			#data-table th, #data-table td {
				padding: 8px;
				color: #0f0f10;
				text-align: left;
				border-bottom: 1px solid #ddd;
				font-family: Arial, sans-serif;
			}

			/* 设置表头背景色和字体加粗 */
			#data-table th {
				background-color: #f2f2f2;
				font-weight: bold;
			}

			/* 设置奇数行的背景色 */
			#data-table tbody tr:nth-child(odd) {
				background-color: #f9f9f9;
			}

			/* 设置鼠标悬停时的背景色 */
			#data-table tbody tr:hover {
				background-color: #f5f5f5;
			}
			.pet{
				width: 300px;
			}
			.segment {
				background-color: green;
				width: 1100px;
			}
		</style>

	</head>

	<body>
	<script src="../css/layui.js"></script>
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
    	
    	<div id="carousel"><div></div></div>

<div id="main">

    <div class="segment">
	    <div class="wrap">
		    <div class="title white" style="display: flex; justify-content: space-between;"><span>领养推荐</span><a href="index4.jsp" style="color: white; font-size: 14px; font-weight: 800;">>>>更多</a></div>
		<%--	<table id="data-table">
				<thead>
				<tr>
					<th>名字</th>
					<th>图片</th>
					<th>年龄</th>
					<th>性别</th>
					<th>品种</th>
					<th>体型</th>
				</tr>
				</thead>
				<tbody>

				<c:forEach items="${sessionScope.kss1}" var="tuijiandomain">
					<tr>
						<td >${tuijiandomain.name}</td>
						<td><img src="data:image/jpeg;base64,${tuijiandomain.photo}" alt="图片" width=50px height="50px"></td>
						<td>${tuijiandomain.age}</td>
						<td>${tuijiandomain.sex}</td>
						<td>${tuijiandomain.species}</td>
						<td>${tuijiandomain.modelnumber}</td>
					</tr>
				</c:forEach>


				</tbody>
			</table>--%>
			<div>
				<c:forEach items="${sessionScope.kss1}" var="tuijiandomain">
					<div class="pet" style="cursor: pointer;">
						<div class="ui fluid image">
							<img src="data:image/jpeg;base64,${tuijiandomain.photo}" height="300px" width="300px" alt="图片">
						</div>
						<div class="info">
							<div class="name">${tuijiandomain.name}</div>
							<div class="extra">
								<span>${tuijiandomain.age}岁</span><span>${tuijiandomain.species}</span><span>${tuijiandomain.modelnumber}</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>
    </div>
    
    <div class="segment" style="height: 300px;background-image: url(../images/partner-background.png);background-repeat: no-repeat;background-size: cover;background-position-x: center">
    </div>
    

    

</div>

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
		xhr.open("GET", "/tuijianList", true);
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
