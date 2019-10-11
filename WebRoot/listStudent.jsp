<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>网上考试试题</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
</head>
<style>
h3 {
	text-align: center;
}
table {
	width: 100%;
	padding: 10px 200px;
}
table td {
	padding: 10px;
}
table th {
	padding: 10px 10px 10px 30px;
	text-align: left;
}
table div{
	padding: 5px;
}
</style>
<body>
	<div class="container">
		<h3>数学考试成绩</h3>
		<table class="table">
			<c:forEach var="obj" items="${list}">
				<tr>
					<th>学号</th>
					<th>姓名</th>
					<th>成绩</th>
				</tr>
				<tr>
					<td>${obj.studentId}</td>
					<td>${obj.studentName}</td>
					<td>${obj.studentScore}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>