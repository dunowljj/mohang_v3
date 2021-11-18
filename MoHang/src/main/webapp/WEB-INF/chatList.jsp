<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/chat.css" rel="stylesheet" type="text/css"/>
<script src="resources/js/jquery.js"></script>
<script src="resources/js/chat.js"></script>
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>발신자</td>
			<td>마지막메세지</td>
		</tr>
		<tr>
			<td>${chat.chat_num }</td>
			<td>${chat.chat_history }</td>
		</tr>

	</table>
</body>
</html>