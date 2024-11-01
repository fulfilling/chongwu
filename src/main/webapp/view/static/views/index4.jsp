<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="utf-8">
		<meta name="keywords" content="汪汪喵呜孤儿院,护佑流浪动物回家路,流浪猫领养计划,领养,动物保护,动物福利,中国犬只福利大奖,爱领养">
		<title>宠物领养</title>
		
		<link rel="stylesheet" type="text/css" href="../css/semantic.min.css">
		<link rel="stylesheet" type="text/css" href="../css/frontend.css">

		<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="../js/semantic.min.js"></script>
		<script  type="text/javascript" src="../js/jquery.bgswitcher.js"></script>
		<script type="text/javascript" src="../js/frontend.js"></script>
		
				
		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script async src="js/e2f172bf1ab943109f821929bc0797c2.js"></script>
		<script>
		  window.dataLayer = window.dataLayer || [];
		  function gtag(){dataLayer.push(arguments);}
		  gtag('js', new Date());
		
		  gtag('config', 'UA-20409328-1');
		</script>
		<style>
			body {
				background-image: url(../images/img_2.png);
				background-position: center center;
				background-size: cover;
				width: 960px;
				margin: 0 auto;
			}
			#data-table {
				border-collapse: collapse;
				color: #0f0f10;
				width: 100%;
			}
			.segment {
				background-color: pink;
				width: 1100px;
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
		<div id="carousel"><div></div></div>
		<div id="main">
			<div class="segment">
				<div class="wrap">
				<h2>寻找你的新家庭成员</h2>

				<!-- 搜索和筛选表单 -->
				<form id="adopt-form" action="/lingyangList" method="post">
					<label>宠物年龄：</label><input type="number" name="age" placeholder="宠物年龄">
					<label>性别：</label><select name="sex">
					<option value="公">公</option>
					<option value="母">母</option>
				</select>
					<label>种类：</label><select name="species">
					<option value="狗">狗</option>
					<option value="猫">猫</option>
				</select>
					<label>体型：</label><select name="modelnumber">
					<option value="小型">小型</option>
					<option value="中型">中型</option>
					<option value="大型">大型</option>
				</select>
					<button type="submit" >搜索</button>
				</form>
					<form id=form" action="/shouyangList" method="post">
				<table id="data-table">
					<thead>
					<tr>
						<th>ID</th>
						<th>名字</th>
						<th>图片</th>
						<th>年龄</th>
						<th>性别</th>
						<th>品种</th>
						<th>体型</th>
						<th><input type="text" id="ID" name="ID" value="<%=request.getSession().getAttribute("id")%>" readonly style="display: none;"></th>
					</tr>
					</thead>
					<c:forEach items="${sessionScope.kss2}" var="lingyangdomain">
						<form action="/shouyangList" method="post">
							<tr>
								<td>${lingyangdomain.id}</td>
								<td>${lingyangdomain.name}</td>
								<td><img src="data:image/jpeg;base64,${lingyangdomain.photo}" alt="图片" width="50px" height="50px"></td>
								<td>${lingyangdomain.age}</td>
								<td>${lingyangdomain.sex}</td>
								<td>${lingyangdomain.species}</td>
								<td>${lingyangdomain.modelnumber}</td>
								<td>
									<input type="hidden" name="petId" value="${lingyangdomain.id}">
									<button type="submit">收养</button>
								</td>
							</tr>
						</form>
					</c:forEach>
					</tbody>
				</table>
						</form>
			</div>
		</div>
		</div>
		<script>
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
				xhr.open("GET", "/lingyangList", true);
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
