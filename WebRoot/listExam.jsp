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
<title>网上考试结果</title>
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
table div{
	padding: 5px;
}
</style>
<body>
	<div class="container">
		<h2>网上考试结果</h2>
		<table class="table">
			<tr>
				<td >总分：${score}</td>
			</tr>
			<c:forEach var="obj" items="${listSubject}" varStatus="status">
				<tr>
					<td >
						<div class="subName" data-id='${obj.subjectId}'><span>${status.index + 1}：</span>${obj.subjectName}
							<c:forEach items="${mapSubject}" var="entry">
								<c:if test="${entry.key == obj.subjectId}">
									<c:if test="${entry.value == '1'}">
										<span style="color: green;margin-left: 20px">√</span>
									</c:if>
									<c:if test="${entry.value != '1'}">
										<span style="color: red;margin-left: 20px">${entry.value}</span>
									</c:if>
								</c:if>
							</c:forEach> 
						</div>
						<c:set var="array" value="${fn:split(obj.subjectOption,',')}"/> 
						<div class="subOption">
							<c:forEach items="${oldCheckedMap}" var="entry">   
								<c:if test="${entry.key == obj.subjectId}">
									<c:if test="${entry.value == 'A'}">
										<input type="radio" name='${obj.subjectId}' value="A" checked="checked"><span>A : ${array['0']}</span>
									</c:if>
									<c:if test="${entry.value != 'A'}">
										<input type="radio" name='${obj.subjectId}' value="A"><span>A : ${array['0']}</span>
									</c:if>
									<c:if test="${entry.value == 'B'}">
										<input type="radio" name='${obj.subjectId}' value="B" checked="checked"><span>B : ${array['1']}</span>
									</c:if>
									<c:if test="${entry.value != 'B'}">
										<input type="radio" name='${obj.subjectId}' value="B"><span>B : ${array['1']}</span>
									</c:if>
									<c:if test="${entry.value == 'C'}">
										<input type="radio" name='${obj.subjectId}' value="C" checked="checked"><span>C : ${array['2']}</span>
									</c:if>
									<c:if test="${entry.value != 'C'}">
										<input type="radio" name='${obj.subjectId}' value="C"><span>C : ${array['2']}</span>
									</c:if>
									<c:if test="${entry.value == 'D'}">
										<input type="radio" name='${obj.subjectId}' value="D" checked="checked"><span>D : ${array['3']}</span>
									</c:if>
									<c:if test="${entry.value != 'D'}">
										<input type="radio" name='${obj.subjectId}' value="D"><span>D : ${array['3']}</span>
									</c:if>
								</c:if>
							</c:forEach> 
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div ><input type="button" value="查看成绩" onclick="btn2()" style="text-align:center;padding:10px 40px;width: 300px;margin: 0px 0px 40px 250px;"></div>
	</div>
</body>
<script type="text/javascript">
	function btn2() {
		location.href = "ListStudent";
	}

</script>
</html>






