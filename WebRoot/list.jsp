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
table div{
	padding: 5px;
}
</style>
<body>
	<div class="container">
		<h3>小学数学选择试题</h3>
		<input id="studentName" type="hidden" value="${studentName}"> 
		<table class="table">
			<!-- 将数据从作用域中取出，并且显示出来 -->
			<%-- <%
    			List<Book> books = (List<Book>)request.getAttribute("books");
    			for (Book book: books) {
    		%>
    			<tr>
    				<td><%=book.getId() %></td>
    				<td><%=book.getName() %></td>
    				<td><%=book.getAuthor() %></td>
    				<td><%=new DecimalFormat("￥#,###.00").format(book.getPrice())%></td>
    			</tr>
    		<%} %> --%>
    		
			<c:forEach var="obj" items="${list}" varStatus="status">
				<tr>
					<td >
						<div class="subName" data-id='${obj.subjectId}'><span>${status.index + 1}：</span>${obj.subjectName}</div> 
						<c:set var="array" value="${fn:split(obj.subjectOption,',')}"/> 
						<div class="subOption">
							<input type="radio" name='${obj.subjectId}' value="A"><span>A : ${array['0']}</span>
							<input type="radio" name='${obj.subjectId}' value="B"><span>B : ${array['1']}</span>
							<input type="radio" name='${obj.subjectId}' value="C"><span>C : ${array['2']}</span>
							<input type="radio" name='${obj.subjectId}' value="D"><span>D : ${array['3']}</span>
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div ><input type="button" value="交卷" onclick="handExam()" style="text-align:center;padding:10px 40px;width: 300px;margin: 0px 0px 40px 250px;"></div>
	</div>
</body>
<script type="text/javascript">
	function handExam(){
		var tempArr = [];
		var handExamFlag = true;
		var tempStr = "";
		$("table tr").each(function(){
			var subjectId = $(this).find(".subName").attr("data-id");
			var option = $(this).find(".subOption").find("input[type=radio]:checked").val();
			if (option == undefined) {
				handExamFlag = false;
			}
			if(tempStr == ""){
				tempStr = subjectId + ":" + option;
			}else{
				tempStr = tempStr + "," + subjectId + ":" + option;
			}
			console.log(tempStr);
		})
		var studentName = $("#studentName").val();
		if (handExamFlag) {
			/* $.ajax({
				type: "POST",
				url: "HandExam",
				data: {"tempStr":tempStr,"studentName":studentName},
				dataType: "json",
				success: function(data){
					
				}
			}); */
			location.href = "HandExam?tempStr=" + tempStr + "&studentName= " +studentName;
		}else{
			alert("请完成试题再交卷。");
		}
	}

</script>
</html>






