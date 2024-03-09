<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>后台首页</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="${ctx}/layui/css/layui.css" media="all" />
<link rel="stylesheet" href="${ctx}/css/font_eolqem241z66flxr.css"
	media="all" />
<link rel="stylesheet" href="${ctx}/css/main.css" media="all" />
<script type="text/javascript" src="${ctx}/js/echarts.js"></script>
<script>
	
<%--JS gloable varilible--%>
	var ctx = "${ctx}";
</script>
</head>
<body class="childrenBody" style="margin: 1%">
	<blockquote class="layui-elem-quote">
		<p>中石油GPS管理系统！</p>

		<p>
			V1.0
</br>
			
		</p>
	</blockquote>
	<fieldset class="layui-elem-field layui-field-title">
		<legend>数据统计</legend>
	</fieldset>
	<div>
		<table class="layui-table">
			<colgroup>
				<col width="150">
				<col width="200">
				<col>
			</colgroup>
			<thead>
				<tr>
					<th><strong>统计</strong></th>
					<th><strong>设备</strong></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>总数</td>
					<td class="userTotal"></td>
				</tr>
				<tr>
					<td>今日</td>
					<td class="usersToday"></td>
				</tr>
				<tr>
					<td>昨日</td>
					<td class="usersYestoday"></td>
				</tr>
				<tr>
					<td>本周</td>
					<td class="usersYearWeek"></td>
				</tr>
				<tr>
					<td>本月</td>
					<td class="usersMonth"></td>
				</tr>
			</tbody>
		</table>

	<!-- 事件线 -->
	<div>
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 30px;">
			<legend>更新历史纪录</legend>
		</fieldset>
		<ul class="layui-timeline">
			<li class="layui-timeline-item"><i
				class="layui-icon layui-timeline-axis"></i>
				<div class="layui-timeline-content layui-text">
					<h3 class="layui-timeline-title">2020年11月15日</h3>
					<p>
						1.新增：无 <br>
						2.修改：无
						<i class="layui-icon"></i>
					</p>
				</div></li>
		</ul>
	</div>

	<div class="sysNotice col">
		<blockquote class="layui-elem-quote title">系统基本参数</blockquote>
		<table class="layui-table">
			<colgroup>
				<col width="150">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<td>当前版本</td>
					<td class="version"></td>
				</tr>
				<tr>
					<td>开发作者</td>
					<td class="author"></td>
				</tr>
				<tr>
					<td>网站首页</td>
					<td class="homePage"></td>
				</tr>
				<tr>
					<td>服务器环境</td>
					<td class="server"></td>
				</tr>
				<tr>
					<td>数据库版本</td>
					<td class="dataBase"></td>
				</tr>
				<tr>
					<td>最大上传限制</td>
					<td class="maxUpload"></td>
				</tr>
			</tbody>
		</table>

	</div>
	</div>

	<script type="text/javascript" src="${ctx}/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx}/js/main.js"></script>

</body>
</html>