<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${ check == 1 }">
		<script>
			alert("로그인 성공");
			location.href="${cp}/board/index";
		</script>
	</c:if>
	<c:if test="${ check == 0 }">
		<script>
			alert("로그인 실패");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>