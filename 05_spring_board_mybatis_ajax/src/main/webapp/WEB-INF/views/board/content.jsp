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
	<table border="1">
		<tr>
			<td colspan="2">
				<c:if test="${ board.boardType eq 0 }">일반</c:if>
				<c:if test="${ board.boardType eq 1 }">자유</c:if>
				<c:if test="${ board.boardType eq 2 }">Q&nsd;A</c:if>
				<c:if test="${ board.boardType eq 3 }">익명</c:if>
				게시판
			</td>
		</tr>
		<tr>
			<td>게시글 번호</td>
			<td>${ board.boardNo }</td>
		</tr>
		<tr>
			<td>게시글 제목</td>
			<td>${ board.title }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${ board.writer }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea rows="10" cols="30" readonly>${ board.content }</textarea>
			</td>
		</tr>
	</table>
</body>
</html>