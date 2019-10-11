<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
</head>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<style>
body {
	padding: 40px;
}

div {
	text-align: center;
}

input {
	margin: 10px;
	width: 300px;
	padding: 10px;
}
</style>
<body>
	<div>
		<input type="text" name="studentName" placeholder="请输入姓名">
	</div>
	<div>
		<input type="button" value="开始考试" onclick="btn1()">
	</div>
	<div>
		<input type="button" value="查看成绩" onclick="btn2()">
	</div>
</body>

<script type="text/javascript">
	function btn1() {
		var name = $("input[name='studentName']").val();
		if (name == "") {
			alert("请输入姓名");
			return;
		}
		location.href = "ExamAction?studentName=" + name;
	}
	function btn2() {
		location.href = "ListStudent";
	}
</script>

</html>
